-- Flaky jobs in last 3 months
-- Counting runs of the `ci` workflow, executed on master and retried jobs from other branches.
-- Histogram is failure percentage for every day, descending (starts from current day).
-- Weekends are greyed out.
WITH report_configuration AS (
    SELECT
          date_trunc('day', CURRENT_TIMESTAMP - INTERVAL '3' MONTH) AS time_horizon
        , 60 AS display_job_name_length
)
, job_runs AS (
    SELECT
          jobs.run_id AS run_id
        , runs.created_at AS run_created_at
        , (jobs.run_id, jobs.name) AS task_id -- identifies job across retries
        , jobs.id AS job_id
        , jobs.name AS job_name
        , jobs.started_at AS job_started_at
        -- known possible conclusion values are "success, skipped, failure, cancelled"
        , jobs.conclusion = 'success'  AS job_successful
        , jobs.run_attempt AS job_run_attempt
        , runs.head_branch
        , format('https://github.com/%s/%s/actions/runs/%s/job/%s', jobs.owner, jobs.repo, jobs.run_id, jobs.id) AS job_link
    FROM runs
    JOIN jobs ON runs.owner = jobs.owner AND runs.repo = jobs.repo AND runs.id = jobs.run_id
    CROSS JOIN report_configuration rc
    WHERE true
    AND runs.owner = 'trinodb'
    AND runs.repo = 'trino'
    AND runs.name = 'ci' -- only CI workflow
    AND runs.created_at >= rc.time_horizon
    AND jobs.started_at >= rc.time_horizon
    AND jobs.conclusion IS NOT NULL -- ignore partially ingested information
    AND jobs.conclusion != 'skipped'
    AND jobs.conclusion != 'cancelled'
)
, analyzed_job_runs AS (
    -- When using "Re-run failed jobs", previously successful jobs appear as successful, which could lead to
    -- overoptimistic failure percentages. For analysis, take only first successful run.
    -- Take failed runs on master (assume all failures on master are flakes) and take all failures on PR build when 1+ retry succeeded.
    SELECT * FROM (
        SELECT
              *
            , (job_successful AND NOT lag(job_successful, 1, false) OVER (PARTITION BY task_id ORDER BY job_run_attempt)) AS is_first_success
            , max(job_successful) OVER (PARTITION BY task_id) succeeded_at_least_once
        FROM job_runs
    )
    WHERE is_first_success OR (NOT job_successful AND (head_branch = 'master' OR succeeded_at_least_once))
)
, flaky_stats_by_day AS (
    SELECT
          job_name
        , CAST(job_started_at AS date) day
        , count(*) FILTER (WHERE NOT job_successful) AS failures
        , count(*) AS runs
        , array_agg(job_link ORDER BY job_link) FILTER (WHERE NOT job_successful) AS failure_links
    FROM analyzed_job_runs
    GROUP BY job_name, CAST(job_started_at AS date)
)
, days AS (
    SELECT u.d AS day
    FROM (SELECT min(day) AS first_day, max(day) AS last_day FROM flaky_stats_by_day)
    CROSS JOIN UNNEST (sequence(first_day, last_day)) u(d)
)
, filtered_flaky_stats_by_day_without_gaps AS (
    SELECT
          day
        , job_name
        , failures
        , runs
        , (failures * 1e0 / runs) AS day_failure_ratio
        , slice(failure_links, 1, least(5, cardinality(failure_links))) AS some_failure_links
    FROM days
    CROSS JOIN (
        SELECT DISTINCT job_name
        FROM flaky_stats_by_day
        -- exclude job names with no failures
        WHERE failures > 0)
    LEFT OUTER JOIN flaky_stats_by_day USING (day, job_name)
)
SELECT
      IF(
        length(job_name) > display_job_name_length,
        substr(job_name, 1, display_job_name_length / 2) || ' … ' || substr(job_name, length(job_name) - (display_job_name_length / 2) - 3),
        job_name
      ) AS "Job Name"
    , round(sum(failures) * 100e0 / sum(runs), 1) AS "Fail %"
    , sum(failures) AS "Fails"
    , sum(runs) AS "Runs"
    , array_join(array_agg(
        CASE
            -- for weekends, if missing or zero, grey it out
            WHEN coalesce(day_failure_ratio, 0) = 0 AND day_of_week(day) IN (6,7) THEN '░'
            -- map [0.0, 1.0] to [1, 9]
            ELSE ARRAY[' ', '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█'][cast(coalesce(day_failure_ratio, 0) * 8 + 1 as int)]
        END
        ORDER BY day DESC), '') AS "Histogram chart"
    , array_join(transform(
       slice(flatten(array_agg(some_failure_links ORDER BY day DESC)), 1, least(15, cardinality(flatten(array_agg(some_failure_links))))),
       link -> format('"job"@%s ', link)), '') AS "Failure Links"
FROM filtered_flaky_stats_by_day_without_gaps
CROSS JOIN report_configuration rc
GROUP BY job_name, rc.display_job_name_length
ORDER BY "Fail %" DESC, "Runs" DESC, "Job Name"
;

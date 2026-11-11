-- Where runner time goes, by step
-- The steps of `ci` jobs that used the most runner time in the last 4 weeks, summed over all jobs that run them, as a share of the runner time of all `ci` jobs. Steps are recorded only for some runs since 2026-10-15, so this is a sample.
-- Steps other than the tests, like building, checking out, and setting up, are paid again in every job: making them faster saves time in every run.
WITH
job_runs AS (
    -- a re-run copies the jobs that passed in the earlier attempt, with the same times, so count them once
    SELECT DISTINCT
        j.run_id
      , j.name
      , j.started_at
      , j.completed_at
      , j.steps
    FROM jobs j
    JOIN memory.default.ci_runs r ON r.id = j.run_id
    WHERE j.owner = 'trinodb' AND j.repo = 'trino'
    AND j.started_at >= current_date - INTERVAL '27' DAY
    AND j.started_at < current_timestamp
    AND j.completed_at > j.started_at
    -- steps are recorded only for some runs since 2026-10-15
    AND cardinality(j.steps) > 0
    AND r.workflow = 'ci'
)
, step_runs AS (
    SELECT
        -- the same action is referenced by a local path, or by the repository and a commit
        regexp_replace(regexp_replace(s.name, '@[0-9a-f]{40}$', ''), '^Run (trinodb/trino/|\./)', 'Run ') AS step
      , to_milliseconds(s.completed_at - s.started_at) / 1000e0 AS seconds
    FROM job_runs j
    CROSS JOIN unnest(j.steps) AS s(status, conclusion, name, number, started_at, completed_at)
    WHERE s.completed_at >= s.started_at
)
SELECT
    step AS "Step"
  , format('%.0f%%', 100 * sum(seconds) / (SELECT sum(to_milliseconds(completed_at - started_at) / 1000e0) FROM job_runs)) AS "Share of runner time"
  , memory.default.human_duration(approx_percentile(seconds, 0.5)) AS "Median"
FROM step_runs
GROUP BY 1
ORDER BY sum(seconds) DESC
LIMIT 12
;

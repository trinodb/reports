-- Runner hours per week
-- What CI costs: the time all jobs of all workflows ran on GitHub runners, by what started them. In the bar, █ is pull requests, ▓ the merge queue, ▒ nightly runs, and ░ everything else. Re-runs are included, cancelled jobs count for the time they ran.
-- "Hours per merged PR" divides the runner hours of the week by the pull requests merged that week, so it also carries the cost of pull requests that were closed or are still open. The newest week is not complete, and job data covers only the last 2 months.
WITH
job_hours AS (
    -- a re-run copies the jobs that passed in the earlier attempt, with the same times, so count them once
    SELECT DISTINCT
        j.run_id
      , j.name
      , j.started_at
      , j.completed_at
      , r.trigger
    FROM jobs j
    JOIN memory.default.ci_runs r ON r.id = j.run_id
    WHERE j.owner = 'trinodb' AND j.repo = 'trino'
    AND j.started_at >= date_trunc('week', current_date) - INTERVAL '49' DAY
    AND j.started_at < current_timestamp
    AND j.completed_at > j.started_at
)
, weekly AS (
    SELECT
        date_trunc('week', CAST(started_at AS date)) AS week
      , sum(to_milliseconds(completed_at - started_at)) / 3600e3 AS hours
      , sum(to_milliseconds(completed_at - started_at)) FILTER (WHERE trigger = 'pull request') / 3600e3 AS pr_hours
      , sum(to_milliseconds(completed_at - started_at)) FILTER (WHERE trigger = 'merge queue') / 3600e3 AS mq_hours
      , sum(to_milliseconds(completed_at - started_at)) FILTER (WHERE trigger = 'scheduled') / 3600e3 AS scheduled_hours
    FROM job_hours
    GROUP BY 1
)
, merged AS (
    SELECT
        date_trunc('week', CAST(merged_at AS date)) AS week
      , count(*) AS merged_prs
    FROM memory.default.pull_requests
    WHERE merged_at >= date_trunc('week', current_date) - INTERVAL '49' DAY
    AND merged_at < current_timestamp
    GROUP BY 1
)
, bars AS (
    SELECT
        w.*
      , coalesce(m.merged_prs, 0) AS merged_prs
      , ARRAY[
            round(30 * pr_hours / max(hours) OVER ())
          , round(30 * (pr_hours + mq_hours) / max(hours) OVER ())
          , round(30 * (pr_hours + mq_hours + scheduled_hours) / max(hours) OVER ())
          , round(30 * hours / max(hours) OVER ())] AS ends
    FROM weekly w
    LEFT JOIN merged m ON m.week = w.week
)
SELECT
    week AS "Week"
  , CAST(round(hours) AS bigint) AS "Runner hours"
  , format('%.0f%%', 100 * pr_hours / hours) AS "Pull requests"
  , format('%.0f%%', 100 * mq_hours / hours) AS "Merge queue"
  , format('%.0f%%', 100 * scheduled_hours / hours) AS "Nightly"
  , merged_prs AS "Merged PRs"
  , CAST(round(hours / nullif(merged_prs, 0)) AS bigint) AS "Hours per merged PR"
  , rpad('', CAST(ends[1] AS integer), '█')
    || rpad('', CAST(ends[2] - ends[1] AS integer), '▓')
    || rpad('', CAST(ends[3] - ends[2] AS integer), '▒')
    || rpad('', CAST(ends[4] - ends[3] AS integer), '░') AS "Runner hours chart"
FROM bars
ORDER BY week DESC
;

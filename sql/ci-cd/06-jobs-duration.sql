-- Which jobs take the most runner time
-- The 30 jobs of the `ci` workflow that used the most runner time in the last 30 days, in all runs. Share is the job's part of the runner time of all `ci` jobs. Median and P90 are for runs of the job that passed.
-- Change compares the median of the last 7 days with the 23 days before. Each character of the chart is the median duration on one day, oldest on the left, on the scale of that row; a space is a day without runs. Making a job at the top shorter, or running it less often, saves the most.
WITH
job_runs AS (
    -- a re-run copies the jobs that passed in the earlier attempt, with the same times, so count them once
    SELECT DISTINCT
        j.run_id
      , j.name
      , j.started_at
      , j.completed_at
      , j.conclusion
    FROM jobs j
    JOIN memory.default.ci_runs r ON r.id = j.run_id
    WHERE j.owner = 'trinodb' AND j.repo = 'trino'
    AND j.started_at >= current_date - INTERVAL '29' DAY
    AND j.started_at < current_timestamp
    AND j.completed_at >= j.started_at
    AND r.workflow = 'ci'
)
, per_job AS (
    SELECT
        name
      , count(*) AS runs
      , count(*) FILTER (WHERE conclusion = 'success') AS passed
      , count(*) FILTER (WHERE conclusion = 'failure') AS failed
      , sum(to_milliseconds(completed_at - started_at)) / 1000e0 AS seconds
      , approx_percentile(to_milliseconds(completed_at - started_at) / 1000e0, 0.5) FILTER (WHERE conclusion = 'success') AS median_seconds
      , approx_percentile(to_milliseconds(completed_at - started_at) / 1000e0, 0.9) FILTER (WHERE conclusion = 'success') AS p90_seconds
      , approx_percentile(to_milliseconds(completed_at - started_at) / 1000e0, 0.5) FILTER (WHERE conclusion = 'success' AND started_at >= current_date - INTERVAL '6' DAY) AS last_week_median_seconds
      , approx_percentile(to_milliseconds(completed_at - started_at) / 1000e0, 0.5) FILTER (WHERE conclusion = 'success' AND started_at < current_date - INTERVAL '6' DAY) AS earlier_median_seconds
    FROM job_runs
    GROUP BY 1
)
, ranked AS (
    SELECT
        *
      , seconds / sum(seconds) OVER () AS share
    FROM per_job
    ORDER BY seconds DESC
    LIMIT 30
)
, daily AS (
    SELECT
        r.name
      , d.day
      , approx_percentile(to_milliseconds(j.completed_at - j.started_at) / 1000e0, 0.5) AS median_seconds
    FROM ranked r
    CROSS JOIN unnest(sequence(current_date - INTERVAL '29' DAY, current_date)) AS d(day)
    LEFT JOIN job_runs j ON j.name = r.name AND CAST(j.started_at AS date) = d.day AND j.conclusion = 'success'
    GROUP BY 1, 2
)
SELECT
    CASE WHEN length(r.name) > 40 THEN substr(r.name, 1, 21) || '...' || substr(r.name, length(r.name) - 15) ELSE r.name END AS "Job"
  , r.runs AS "Runs"
  , format('%.0f%%', 100e0 * r.passed / nullif(r.passed + r.failed, 0)) AS "Passed"
  , memory.default.human_duration(r.median_seconds) AS "Median"
  , memory.default.human_duration(r.p90_seconds) AS "P90"
  , CAST(round(r.seconds / 3600) AS bigint) AS "Hours"
  , format('%.1f%%', 100 * r.share) AS "Share"
  , memory.default.delta(r.last_week_median_seconds, r.earlier_median_seconds) AS "Change"
  , memory.default.sparkline(array_agg(d.median_seconds ORDER BY d.day)) AS "Median per day, 30 days chart"
FROM ranked r
JOIN daily d ON d.name = r.name
GROUP BY r.name, r.runs, r.passed, r.failed, r.median_seconds, r.p90_seconds, r.seconds, r.share, r.last_week_median_seconds, r.earlier_median_seconds
ORDER BY r.seconds DESC
;

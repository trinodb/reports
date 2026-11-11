-- Which jobs fail in the merge queue and nightly runs
-- Jobs that failed in the last 14 days in runs of master: the merge queue and the nightly scheduled run. These changes already passed their own checks, so a failure here points to a flaky test or a broken dependency, not to the change. Fix the top rows first.
-- Failure rate is failed / (passed + failed) runs of the job, re-runs included. One character of the chart is one day, oldest on the left; a dot is a day without failures. The `build-success` job, which only sums up the others, is left out.
WITH
job_runs AS (
    -- a re-run copies the jobs that passed in the earlier attempt, with the same times, so count them once
    SELECT DISTINCT
        j.run_id
      , j.name
      , j.started_at
      , j.conclusion
      , r.trigger
    FROM jobs j
    JOIN memory.default.ci_runs r ON r.id = j.run_id
    WHERE j.owner = 'trinodb' AND j.repo = 'trino'
    AND j.started_at >= current_date - INTERVAL '13' DAY
    AND j.started_at < current_timestamp
    AND j.conclusion IN ('success', 'failure')
    AND j.name != 'build-success'
    AND r.workflow = 'ci'
    AND r.trigger IN ('merge queue', 'scheduled')
)
, per_job AS (
    SELECT
        name
      , count(*) FILTER (WHERE conclusion = 'failure') AS failures
      , count(*) FILTER (WHERE conclusion = 'failure' AND trigger = 'merge queue') AS merge_queue_failures
      , count(*) FILTER (WHERE conclusion = 'failure' AND trigger = 'scheduled') AS scheduled_failures
      , count(*) AS job_runs
    FROM job_runs
    GROUP BY 1
    HAVING count(*) FILTER (WHERE conclusion = 'failure') > 0
)
, daily AS (
    SELECT
        p.name
      , d.day
      , count(j.name) AS failures
    FROM per_job p
    CROSS JOIN unnest(sequence(current_date - INTERVAL '13' DAY, current_date)) AS d(day)
    LEFT JOIN job_runs j ON j.name = p.name AND CAST(j.started_at AS date) = d.day AND j.conclusion = 'failure'
    GROUP BY 1, 2
)
SELECT
    CASE WHEN length(p.name) > 45 THEN substr(p.name, 1, 24) || '...' || substr(p.name, length(p.name) - 17) ELSE p.name END AS "Job"
  , p.failures AS "Failures"
  , p.merge_queue_failures AS "In merge queue"
  , p.scheduled_failures AS "In nightly"
  , IF(p.failures * 200 < p.job_runs, '<1%', format('%.0f%%', 100e0 * p.failures / p.job_runs)) AS "Failure rate"
  , memory.default.sparkline(array_agg(CAST(d.failures AS double) ORDER BY d.day)) AS "Failures per day chart"
FROM per_job p
JOIN daily d ON d.name = p.name
GROUP BY p.name, p.failures, p.merge_queue_failures, p.scheduled_failures, p.job_runs
ORDER BY p.failures DESC, p.failures * 1e0 / p.job_runs DESC, p.name
LIMIT 25
;

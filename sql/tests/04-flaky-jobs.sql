-- Flaky jobs
-- Jobs that failed in the last 30 days and then passed on the same commit, in a re-run or in another run. Rate is such failures of all the runs of the job, and Time lost the runner time of the failed attempts; few failures are retried on the same commit, so the real rates are higher.
-- Attempts where more than 4 jobs failed like this are outages, and are left out. One chart character is one day (oldest on the left, a dot for none); open the latest failures to find the flaky test or step.
WITH
ci_runs AS (
    -- runs started with a /test-with-secrets comment test a pull request, but have the head of master as their commit
    SELECT id, head_sha
    FROM memory.default.ci_runs
    WHERE workflow = 'ci'
    AND event <> 'repository_dispatch'
    AND created_at >= current_date - INTERVAL '31' DAY
)
, executions AS (
    -- a re-run copies the jobs it does not run again from the earlier attempt, with the same times, so count them once
    SELECT
        j.run_id
      , r.head_sha
      , j.name
      , j.started_at
      , j.completed_at
      , j.conclusion
      , min(j.id) AS job_id
      , min(j.run_attempt) AS run_attempt
    FROM jobs j
    JOIN ci_runs r ON r.id = j.run_id
    WHERE j.started_at >= current_date - INTERVAL '31' DAY
    AND j.conclusion IN ('success', 'failure')
    -- it fails when any other job fails
    AND j.name <> 'build-success'
    GROUP BY j.run_id, r.head_sha, j.name, j.started_at, j.completed_at, j.conclusion
)
, passed AS (
    SELECT DISTINCT head_sha, name
    FROM executions
    WHERE conclusion = 'success'
)
, recent_executions AS (
    SELECT
        e.*
      -- the name has the checked commit, so match on the name, but show one row for all commits
      , regexp_replace(e.name, '^check-commit \([0-9a-f]+\)$', 'check-commit') AS job_name
      , e.conclusion = 'failure' AND p.name IS NOT NULL AS failed_then_passed
    FROM executions e
    LEFT JOIN passed p ON p.head_sha = e.head_sha AND p.name = e.name
    WHERE e.started_at >= current_date - INTERVAL '29' DAY
)
, outages AS (
    -- when many jobs of one attempt fail and then pass, a service was down, and the jobs are not flaky
    SELECT run_id, run_attempt
    FROM recent_executions
    WHERE failed_then_passed
    GROUP BY run_id, run_attempt
    HAVING count(*) > 4
)
, classified_executions AS (
    SELECT e.*, e.failed_then_passed AND o.run_id IS NULL AS flaky
    FROM recent_executions e
    LEFT JOIN outages o ON o.run_id = e.run_id AND o.run_attempt = e.run_attempt
)
, flaky_jobs AS (
    SELECT
        job_name
      , count(*) AS executions
      , count(*) FILTER (WHERE flaky) AS flaky_failures
      , sum(to_milliseconds(completed_at - started_at) / 1000e0) FILTER (WHERE flaky) AS seconds_lost
    FROM classified_executions
    GROUP BY job_name
    HAVING count(*) FILTER (WHERE flaky) >= 2
)
, latest_failures AS (
    -- one link per run, because a run has a check-commit job for every commit
    SELECT job_name, slice(array_agg(link ORDER BY started_at DESC), 1, 2) AS links
    FROM (
        SELECT
            job_name
          , max(started_at) AS started_at
          , memory.default.link(format_datetime(max(started_at), 'MMM dd HH:mm'), format('https://github.com/trinodb/trino/actions/runs/%d/job/%d', run_id, max_by(job_id, started_at))) AS link
        FROM classified_executions
        WHERE flaky
        GROUP BY job_name, run_id
    )
    GROUP BY job_name
)
, daily AS (
    SELECT f.job_name, d.day, count(e.job_id) AS flaky_failures
    FROM flaky_jobs f
    CROSS JOIN UNNEST(sequence(current_date - INTERVAL '29' DAY, current_date, INTERVAL '1' DAY)) AS d(day)
    LEFT JOIN classified_executions e ON e.job_name = f.job_name AND e.flaky AND CAST(e.started_at AS date) = d.day
    GROUP BY f.job_name, d.day
)
SELECT
    if(length(f.job_name) > 40, substr(f.job_name, 1, 37) || '...', f.job_name) AS "Job"
  , f.flaky_failures AS "Flaky"
  , f.executions AS "Runs"
  , format('%.1f%%', 100e0 * f.flaky_failures / f.executions) AS "Rate"
  , memory.default.human_duration(f.seconds_lost) AS "Time lost"
  , memory.default.sparkline(array_agg(d.flaky_failures * 1e0 ORDER BY d.day), 3e0) AS "Per day chart"
  , memory.default.join_links(l.links, ' ') AS "Latest flaky failures"
FROM flaky_jobs f
JOIN latest_failures l ON l.job_name = f.job_name
JOIN daily d ON d.job_name = f.job_name
GROUP BY f.job_name, f.flaky_failures, f.executions, f.seconds_lost, l.links
ORDER BY f.flaky_failures DESC, f.seconds_lost DESC
LIMIT 30
;

-- How long jobs wait for a runner
-- Time from when a job is queued until a runner starts it, by runner type, for jobs of all workflows in the last 4 weeks (wait times are recorded only for some runs since 2026-10-15). P90: one job in ten waits longer.
-- If waits grow, CI has reached the most jobs it can run at once: see the peaks in "When CI is busy".
WITH
waits AS (
    SELECT
        array_join(labels, ', ') AS runner
      , to_milliseconds(started_at - created_at) / 1000e0 AS seconds
    FROM jobs
    WHERE owner = 'trinodb' AND repo = 'trino'
    AND started_at >= current_date - INTERVAL '28' DAY
    AND started_at < current_timestamp
    AND conclusion != 'skipped'
    AND runner_name IS NOT NULL
    -- a re-run copies the jobs that passed in the earlier attempt, with their old start time
    AND started_at >= created_at
)
SELECT
    runner AS "Runner type"
  , count(*) AS "Jobs"
  , memory.default.human_duration(approx_percentile(seconds, 0.5)) AS "Median wait"
  , memory.default.human_duration(approx_percentile(seconds, 0.9)) AS "P90 wait"
  , memory.default.human_duration(max(seconds)) AS "Longest wait"
  , count(*) FILTER (WHERE seconds > 60) AS "Waited over a minute"
FROM waits
GROUP BY 1
ORDER BY 2 DESC
;

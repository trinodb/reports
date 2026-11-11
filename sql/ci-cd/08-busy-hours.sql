-- When CI is busy
-- How many jobs of all workflows run at the same time, by weekday and hour of the day (UTC), on average over the last 4 weeks. The darkest cells, █, have at least three quarters of the jobs of the busiest hour. Peak is the most jobs running at the same moment on that weekday.
-- So far, the number of running jobs has not gone above 500, and it stays at 500 for minutes when it gets there, so 500 looks like the most jobs that can run at once: then new jobs wait for a runner. Pushing many changes at the busiest hours makes this more likely.
WITH
job_runs AS (
    -- a re-run copies the jobs that passed in the earlier attempt, with the same times, so count them once
    SELECT DISTINCT
        run_id
      , name
      , started_at
      , completed_at
    FROM jobs
    WHERE owner = 'trinodb' AND repo = 'trino'
    AND started_at >= current_date - INTERVAL '28' DAY
    AND started_at < current_date
    AND completed_at > started_at
)
, hourly AS (
    SELECT
        day_of_week(h.hour) AS weekday
      , hour(h.hour) AS hour
      , sum(to_milliseconds(least(j.completed_at, h.hour + INTERVAL '1' HOUR) - greatest(j.started_at, h.hour))) / 3600e3 AS job_hours
    FROM job_runs j
    CROSS JOIN unnest(sequence(date_trunc('hour', j.started_at), date_trunc('hour', j.completed_at), INTERVAL '1' HOUR)) AS h(hour)
    GROUP BY 1, 2
)
, grid AS (
    -- the last 4 weeks have each weekday 4 times
    SELECT
        w.weekday
      , h.hour
      , coalesce(hourly.job_hours, 0) / 4 AS running_jobs
      , max(coalesce(hourly.job_hours, 0) / 4) OVER () AS max_running_jobs
    FROM unnest(sequence(1, 7)) AS w(weekday)
    CROSS JOIN unnest(sequence(0, 23)) AS h(hour)
    LEFT JOIN hourly ON hourly.weekday = w.weekday AND hourly.hour = h.hour
)
, changes AS (
    SELECT started_at AS at, 1 AS change FROM job_runs
    UNION ALL
    SELECT completed_at AS at, -1 AS change FROM job_runs
)
, running AS (
    SELECT
        at
      , sum(change) OVER (ORDER BY at, change ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_jobs
    FROM changes
)
, peaks AS (
    SELECT
        day_of_week(at) AS weekday
      , max(running_jobs) AS peak_jobs
    FROM running
    GROUP BY 1
)
, rows AS (
    SELECT
        g.weekday
      , array_join(array_agg(memory.default.shade(g.running_jobs, g.max_running_jobs) ORDER BY g.hour), '') AS cells
      , avg(g.running_jobs) AS average_jobs
    FROM grid g
    GROUP BY 1
)
SELECT
    "Weekday"
  , "Hours of the day, UTC, chart"
  , "Average jobs running"
  , "Peak"
FROM (
    SELECT
        0 AS position
      , 'Hour' AS "Weekday"
      , '0     6     12    18    ' AS "Hours of the day, UTC, chart"
      , '' AS "Average jobs running"
      , '' AS "Peak"
    UNION ALL
    SELECT
        r.weekday AS position
      , format_datetime(date_add('day', r.weekday - 1, DATE '2024-01-01'), 'EEEE')
      , r.cells
      , lpad(CAST(CAST(round(r.average_jobs) AS bigint) AS varchar), 20, ' ')
      , lpad(CAST(p.peak_jobs AS varchar), 4, ' ')
    FROM rows r
    JOIN peaks p ON p.weekday = r.weekday
)
ORDER BY position
;

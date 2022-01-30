WITH job_duration AS (
  SELECT
    run_id
    , name
    , conclusion
    , date_diff('minute', started_at, completed_at) AS duration_minutes
  FROM jobs
  WHERE started_at > CURRENT_DATE - INTERVAL '30' DAY AND status = 'completed'
)
SELECT
  r.name
  , j.name
  , count(1) AS invocations
  , round(count(1) FILTER (WHERE j.conclusion = 'success') / CAST(count(1) AS double), 2) AS success_percent
  , min(duration_minutes) FILTER (WHERE j.conclusion = 'success') AS min_minutes
  , max(duration_minutes) FILTER (WHERE j.conclusion = 'success') AS max_minutes
  , round(avg(duration_minutes) FILTER (WHERE j.conclusion = 'success'), 2) AS avg_minutes
  , approx_percentile(duration_minutes, ARRAY[0.5, 0.75, 0.9, 0.99]) AS "%tile (50, 75, 90, 99)"
FROM job_duration j
JOIN runs r ON r.id = j.run_id
GROUP BY 1, 2
HAVING count(1) > 100
ORDER BY 1, 2
;

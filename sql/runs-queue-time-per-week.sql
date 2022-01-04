-- get avg queue and run time
WITH longest_jobs AS (
   SELECT
     run_id
     , min(started_at) AS started_at
     , max(completed_at) AS completed_at
     , max(completed_at) - min(started_at) AS duration
   FROM jobs
   GROUP BY 1
)
SELECT
   r.conclusion AS run_conclusion
   , date_trunc('week', created_at) AS week
   -- there's also runs.run_started_at but we don't have it scraped for whole data range
   , min(j.started_at - created_at) AS min_queue_duration
   , max(j.started_at - created_at) AS max_queue_duration
   , avg(j.started_at - created_at) AS avg_queue_duration
   , transform(approx_percentile(to_milliseconds(j.started_at - created_at), ARRAY[0.25, 0.5, 0.76, 0.9]), m -> parse_duration(cast(m as varchar) || 'ms')) AS queue_percentiles
   , min(duration) AS min_run_duration
   , max(duration) AS max_run_duration
   , avg(duration) AS avg_run_duration
   , transform(approx_percentile(to_milliseconds(duration), ARRAY[0.25, 0.5, 0.76, 0.9]), m -> parse_duration(cast(m as varchar) || 'ms')) AS run_percentiles
FROM runs r
JOIN longest_jobs j ON j.run_id = r.id
WHERE r.owner = 'trinodb' AND r.repo = 'trino' AND r.name = 'ci' AND r.conclusion = 'success'
GROUP BY 1, 2
ORDER BY 1, 2;

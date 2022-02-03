-- get avg queue and run time
WITH longest_jobs AS (
  SELECT
    run_id
    , min(started_at) AS started_at
    , max(completed_at) AS completed_at
    , max(completed_at) - min(started_at) AS duration
  FROM jobs
  GROUP BY 1
),
main AS (
  SELECT
    date_trunc('day', created_at) AS day
    , min(duration) AS min_dur
    , max(duration) AS max_dur
    , avg(duration) AS avg_dur
    , transform(approx_percentile(to_milliseconds(duration), ARRAY[0.75, 0.90, 0.95, 0.99]), m -> parse_duration(cast(m as varchar) || 'ms')) AS perc
  FROM runs r
  JOIN longest_jobs j ON j.run_id = r.id
  WHERE r.owner = 'trinodb' AND r.repo = 'trino' AND r.name = 'ci' AND r.conclusion = 'success' AND r.created_at > CURRENT_DATE - INTERVAL '14' DAY
  GROUP BY 1
  ORDER BY 1 DESC
)
SELECT
   day AS "Day"
   , bar(CAST(to_milliseconds(avg_dur) AS double) / to_milliseconds((SELECT max(avg_dur) FROM main)), 40, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Avg run dur chart"
   , avg_dur AS "Avg run dur"
   , max_dur AS "Max run dur"
   , min_dur AS "Min run dur"
   , perc AS "Run percentiles 75, 90, 95, 99"
FROM main;

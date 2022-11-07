-- Runs duration per day
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
    cast(created_at AS date) AS day
    , min(duration) AS min_dur
    , max(duration) AS max_dur
    , avg(duration) AS avg_dur
    , count(*) AS runs_count
    , approx_percentile(to_milliseconds(duration), ARRAY[0.75, 0.90, 0.95, 0.99]) AS perc
  FROM runs r
  JOIN longest_jobs j ON j.run_id = r.id
  WHERE r.owner = 'trinodb' AND r.repo = 'trino' AND r.name = 'ci' AND r.conclusion = 'success' AND r.created_at > CURRENT_DATE - INTERVAL '14' DAY
  GROUP BY 1
)
SELECT
   day AS "Day"
   , bar(CAST(perc[3] AS double) / max(perc[3]) OVER (), 40, rgb(0, 155, 0), rgb(255, 0, 0)) AS "P₉₅ run duration chart"
   , runs_count AS "Runs count"
   , transform(perc, m -> parse_duration(cast(m as varchar) || 'ms')) AS "Run percentiles 75, 90, 95, 99"
   , min_dur AS "Min run dur"
   , avg_dur AS "Avg run dur"
   , max_dur AS "Max run dur"
FROM main
ORDER BY 1 DESC
;

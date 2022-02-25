-- Runs cumulative job duration on master per day
WITH runs AS (
  SELECT
    r.id AS run_id
    , cast(r.created_at AS date) AS day
    , count(j.id) AS jobs_count
    , sum(j.completed_at - j.started_at) AS duration
  FROM runs r
  JOIN jobs j ON r.id = j.run_id
  WHERE r.owner = 'trinodb' AND r.repo = 'trino' AND r.name = 'ci'
  AND r.conclusion = 'success' AND r.created_at > CURRENT_DATE - INTERVAL '14' DAY
  AND r.head_branch = 'master'
  GROUP BY 1, 2
),
main AS (
  SELECT
    r.day
    , max(jobs_count) AS jobs_count
    , min(duration) AS min_dur
    , max(duration) AS max_dur
    , avg(duration) AS avg_dur
    , count(*) AS runs_count
    , approx_percentile(to_milliseconds(duration), ARRAY[0.75, 0.90, 0.95, 0.99]) AS perc
  FROM runs r
  GROUP BY r.day
  ORDER BY 1 DESC
)
SELECT
   day AS "Day"
   , bar(CAST(perc[3] AS double) / max(perc[3]) OVER (), 40, rgb(0, 155, 0), rgb(255, 0, 0)) AS "P₉₅ runs cumulative job duration"
   , runs_count AS "Runs count"
   , jobs_count AS "Max jobs count"
   , transform(perc, m -> parse_duration(cast(m as varchar) || 'ms')) AS "Runs job duration percentiles 75, 90, 95, 99"
   , min_dur AS "Min jobs dur"
   , avg_dur AS "Avg jobs dur"
   , max_dur AS "Max jobs dur"
FROM main;

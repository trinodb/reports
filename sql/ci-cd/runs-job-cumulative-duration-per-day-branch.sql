-- Runs cumulative job duration per week and branch
WITH runs AS (
  SELECT
    r.id AS run_id
    , r.head_branch
    , date_trunc('week', date(r.created_at)) AS week
    , count(j.id) AS jobs_count
    , sum(j.completed_at - j.started_at) AS duration
  FROM runs r
  JOIN jobs j ON r.id = j.run_id
  WHERE r.owner = 'trinodb' AND r.repo = 'trino' AND r.name = 'ci'
  AND r.created_at > CURRENT_DATE - INTERVAL '90' DAY
  GROUP BY 1, 2, 3
),
main AS (
  SELECT
    r.week
    , CASE r.head_branch
        WHEN 'master' THEN head_branch
        ELSE '[other]'
      END AS branch
    , max(jobs_count) AS jobs_count
    , min(duration) AS min_dur
    , max(duration) AS max_dur
    , avg(duration) AS avg_dur
    , count(*) AS runs_count
    , approx_percentile(to_milliseconds(duration), ARRAY[0.50, 0.90, 0.95, 0.99]) AS perc
  FROM runs r
  GROUP BY 1, 2
)
SELECT
   branch AS "Branch"
   , week AS "Week"
   , bar(CAST(perc[1] AS double) / max(perc[1]) OVER (), 40, rgb(0, 155, 0), rgb(255, 0, 0)) AS "P50 runs cumulative job duration"
   , bar(CAST(perc[3] AS double) / max(perc[3]) OVER (), 40, rgb(0, 155, 0), rgb(255, 0, 0)) AS "P95 runs cumulative job duration"
   , runs_count AS "Runs count"
   , jobs_count AS "Max jobs count"
   , transform(perc, m -> parse_duration(cast(m as varchar) || 'ms')) AS "Runs job duration percentiles 50, 90, 95, 99"
   , min_dur AS "Min jobs dur"
   , avg_dur AS "Avg jobs dur"
   , max_dur AS "Max jobs dur"
FROM main
ORDER BY 1, 2 DESC
;

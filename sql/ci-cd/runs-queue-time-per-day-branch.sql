-- Runs queue time per week and branch
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
    date_trunc('week', date(created_at)) AS week
    , CASE r.head_branch
        WHEN 'master' THEN head_branch
        ELSE '[other]'
      END AS branch
    -- there's also runs.run_started_at but we don't have it scraped for whole data range
    , min(j.started_at - created_at) AS min_dur
    , max(j.started_at - created_at) AS max_dur
    , avg(j.started_at - created_at) AS avg_dur
    , count(*) AS runs_count
    , approx_percentile(to_milliseconds(j.started_at - created_at), ARRAY[0.75, 0.90, 0.95, 0.99]) AS perc
  FROM runs r
  JOIN longest_jobs j ON j.run_id = r.id
  WHERE r.owner = 'trinodb' AND r.repo = 'trino' AND r.name = 'ci'
  AND r.created_at > CURRENT_DATE - INTERVAL '90' DAY
  GROUP BY 1, 2
)
SELECT
   branch AS "Branch"
   , week AS "Week"
   , bar(CAST(perc[3] AS double) / max(perc[3]) OVER (), 40, rgb(0, 155, 0), rgb(255, 0, 0)) AS "P₉₅ queue duration "
   , runs_count AS "Runs count"
   --, transform(perc, m -> parse_duration(cast(m as varchar) || 'ms')) AS "Queue percentiles 75, 90, 95, 99"
   --, min_dur AS "Min queue dur"
   --, avg_dur AS "Avg queue dur"
   --, max_dur AS "Max queue dur"
FROM main
ORDER BY 1, 2 DESC
;

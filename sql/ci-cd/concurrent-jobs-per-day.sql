-- Max concurrent jobs per day
WITH minutes AS (
  SELECT date_add('minute', -minutes.minute, date_add('day', -days_ago.nr, current_timestamp)) AS minute
  FROM unnest(sequence(0, 13)) AS days_ago(nr)
  CROSS JOIN unnest(sequence(0, 24 * 60 - 1)) AS minutes(minute)
),
overlapping_jobs AS (
  SELECT
    minutes.minute
    , count(j.id) AS concurrent_jobs_count
    , count(distinct r.id) AS concurrent_runs_count
  FROM minutes
  -- exclude jobs that ran for 0 seconds, most likely immediately cancelled, but we don't want to exclude all cancelled jobs
  JOIN jobs j ON minutes.minute BETWEEN j.started_at AND j.completed_at AND j.started_at != j.completed_at
  JOIN runs r ON r.id = j.run_id AND r.owner = 'trinodb' AND r.repo = 'trino' AND r.name = 'ci'
  GROUP BY 1
),
main AS (
  SELECT
    cast(minute AS date) AS day
    , max(concurrent_jobs_count) AS max_concurrent_jobs_count
    , max(concurrent_runs_count) AS max_concurrent_runs_count
  FROM overlapping_jobs
  GROUP BY 1
)
SELECT
   day AS "Day"
   , bar(CAST(max_concurrent_jobs_count AS double) / max(max_concurrent_jobs_count) OVER (), 40, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Max concurrent jobs count chart"
   , max_concurrent_jobs_count AS "Max concurrent jobs count"
   , max_concurrent_runs_count AS "Max concurrent runs count"
FROM main
ORDER BY 1;

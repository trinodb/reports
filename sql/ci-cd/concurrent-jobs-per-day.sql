-- Max concurrent jobs per day
WITH overlapping_jobs AS (
  SELECT
    cast(r1.created_at AS date) AS day
    , r1.id AS run_id
    , j1.id AS job_id
    , count(j2.id) AS concurrent_jobs_count
  FROM runs r1
  LEFT JOIN runs r2 ON (r1.owner, r1.repo, r1.name, cast(r1.created_at as date)) = (r2.owner, r2.repo, r2.name, cast(r2.created_at as date))
  JOIN jobs j1 ON j1.run_id = r1.id
  LEFT JOIN jobs j2 ON j2.run_id = r2.id AND j2.id != j1.id AND j2.completed_at > j1.started_at AND j2.started_at <= j1.completed_at
  -- exclude jobs that ran for 0 seconds, most likely immediately cancelled, but we don't want to exclude all cancelled jobs
  AND j2.started_at != j2.completed_at
  WHERE r1.owner = 'trinodb' AND r1.repo = 'trino' AND r1.name = 'ci'
  AND r1.created_at > CURRENT_DATE - INTERVAL '14' DAY
  GROUP BY 1, 2, 3
),
main AS (
  SELECT
    day
    , count(distinct run_id) AS runs_count
    , count(*) AS jobs_count
    , max(concurrent_jobs_count) AS max_concurrent_jobs_count
    , max_by(job_id, concurrent_jobs_count) AS max_concurrent_job
  FROM overlapping_jobs
  GROUP BY 1
)
SELECT
   day AS "Day"
   , jobs_count AS "Jobs count"
   , runs_count AS "Runs count"
   , bar(CAST(max_concurrent_jobs_count AS double) / max(max_concurrent_jobs_count) OVER (), 40, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Max concurrent jobs count chart"
   , max_concurrent_jobs_count AS "Max concurrent jobs count"
   , max_concurrent_job AS "Max concurrent job"
FROM main
ORDER BY 1;

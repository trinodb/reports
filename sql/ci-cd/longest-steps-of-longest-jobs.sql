WITH
  longest_job_names AS (
   SELECT name
   FROM
     jobs
   WHERE ((owner = 'trinodb') AND (repo = 'trino'))
   GROUP BY 1
   ORDER BY sum((completed_at - started_at)) DESC
   LIMIT 10
)
SELECT
  s.name step_name
, j.name job_name
, sum((s.completed_at - s.started_at)) step_sum_duration
, min((s.completed_at - s.started_at)) step_min_duration
, max((s.completed_at - s.started_at)) step_max_duration
, avg((s.completed_at - s.started_at)) step_avg_duration
, count(*) step_execution_count
FROM steps s
INNER JOIN jobs j ON (s.job_id = j.id)
WHERE s.owner = 'trinodb' AND s.repo = 'trino' AND j.name IN (SELECT name FROM longest_job_names)
GROUP BY 1, 2
ORDER BY step_sum_duration DESC
LIMIT 10
;

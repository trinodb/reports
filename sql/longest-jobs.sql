SELECT
  name
, conclusion
, count(id) execution_count
, min((completed_at - started_at)) min_duration
, avg((completed_at - started_at)) avg_duration
, max((completed_at - started_at)) max_duration
, sum((completed_at - started_at)) sum_duration
FROM
  jobs
WHERE owner = 'trinodb' AND repo = 'trino'
GROUP BY 1, 2
ORDER BY sum_duration DESC
LIMIT 10
;

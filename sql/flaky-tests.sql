WITH retried_jobs AS (
    SELECT run_id
        , name
        , count(DISTINCT run_attempt) AS attempts_count
        , count(*) FILTER (WHERE (conclusion = 'success')) success_count
        , count(*) FILTER (WHERE (conclusion = 'failure')) failure_count
    FROM jobs
    WHERE name NOT LIKE 'Test Report%'
    GROUP BY 1, 2
    HAVING count(DISTINCT run_attempt) > 1
),
retried_jobs_ratio AS (
    SELECT
      *
      , round(((CAST(j.failure_count AS double) / CAST((j.success_count + j.failure_count) AS double)) * 100), 2) fail_percent
    FROM retried_jobs j
)
SELECT format_datetime(runs.created_at, 'Y:ww') year_week
     , j.name
     , avg(j.fail_percent) AS avg_fail_percent
     , max(j.fail_percent) AS max_fail_percent
     , array_agg(j.run_id) AS run_ids
FROM retried_jobs_ratio j
         JOIN runs ON j.run_id = runs.id
GROUP BY 1, 2
ORDER BY 1, 3 DESC, 2;

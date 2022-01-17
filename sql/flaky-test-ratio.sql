WITH conclusion_counts AS (
    SELECT run_id
        , name
        , count(*) FILTER (WHERE (conclusion = 'success')) success_count
        , count(*) FILTER (WHERE (conclusion = 'failure')) failure_count
    FROM jobs
    WHERE name NOT LIKE 'Test Report%'
    GROUP BY 1, 2
)
SELECT format_datetime(runs.created_at, 'Y:ww') year_week
     , round(((CAST(cc.failure_count AS double) / CAST((cc.success_count + cc.failure_count) AS double)) * 100), 2) flaky_ratio_percent
     , cc.name
     , cc.success_count
     , cc.failure_count
     , cc.run_id
     , runs.created_at
FROM conclusion_counts cc
         JOIN runs ON cc.run_id = runs.id
WHERE cc.success_count > 0
  AND cc.failure_count > 0
GROUP BY 1, 3, 4, 5, 6, 7
ORDER BY 1, 2 DESC, 3, 7
;

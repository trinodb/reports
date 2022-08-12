-- Flaky test classes in last 30 days
WITH
-- workflow invocations (runs)
suites AS (
    SELECT *
    FROM check_suites
    WHERE owner = 'trinodb' AND repo = 'trino'
        AND head_branch = 'master'
        AND created_at > CURRENT_DATE - INTERVAL '30' DAY
)
-- jobs within workflow
, runs AS (
    SELECT cr.id, cr.repo, s.head_branch, cr.name, cr.check_suite_id, cr.started_at
    FROM check_runs cr JOIN suites s ON cr.check_suite_id = s.id
)
SELECT
    regexp_replace(cra.title, '[ .].*') AS test_class_name
  , count(DISTINCT r.check_suite_id) AS failed_runs
  , CAST(count(DISTINCT r.check_suite_id) * 100.0 / (SELECT count(*) FROM suites) AS decimal(4,1)) AS "% runs"
  , count(*) AS failed_methods
  , max(r.started_at) AS last_occurrence_at
FROM check_run_annotations cra
JOIN runs r ON cra.check_run_id = r.id
WHERE cra.annotation_level = 'failure'
    -- for tests failures uploded as GitHub annotations, the "title" is "TestClass > testMethodName (additional info)?"
    AND cra.title LIKE 'Test%'
GROUP BY 1
ORDER BY failed_runs DESC
;

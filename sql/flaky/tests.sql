-- Flaky tests in last 30 days
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
    SELECT cr.id, cr.repo, s.head_branch, cr.name
    FROM check_runs cr JOIN suites s ON cr.check_suite_id = s.id
)
SELECT
    cra.title AS test_name
  , count(*) AS count
  , CAST(count(*) * 100.0 / (SELECT count(*) FROM suites) AS decimal(4,1)) AS "%"
  , array_agg(DISTINCT substring(cra.message, 1, least(5000, coalesce(nullif(strpos(cra.message, U&'\000a'), 0), length(cra.message))))) messages
FROM check_run_annotations cra
WHERE cra.annotation_level = 'failure'
  -- for tests failures uploded as GitHub annotations, the "title" is "TestClass > testMethodName (additional info)?"
  AND cra.title LIKE 'Test%'
GROUP BY cra.title
ORDER BY count DESC
;

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
    SELECT cr.id, cr.repo, s.head_branch, cr.name, cr.completed_at
    FROM check_runs cr
    JOIN suites s ON cr.check_suite_id = s.id
)
SELECT
    -- escape markdown special characters with a single backslash
    regexp_replace(a.title, '([._\\`*{}\[\]\(\)<>:|"''#$])', '\\$1') AS "Test name"
  , count(*) AS "Count"
  , CAST(count(*) * 100.0 / (SELECT count(*) FROM suites) AS decimal(4,1)) AS "%"
  , min(r.completed_at) AS "First seen at"
  , max(r.completed_at) AS "Last seen at"
  , array_agg(DISTINCT replace(regexp_replace(substring(a.message, 1, least(5000, coalesce(nullif(strpos(a.message, U&'\000a'), 0), length(a.message)))), '([._\\`*{}\[\]\(\)<>:|"''#$])', '\\$1'), chr(10), '<br/>')) "Messages"
FROM check_run_annotations a
JOIN runs r ON r.id = a.check_run_id
WHERE a.annotation_level = 'failure'
  -- for tests failures uploded as GitHub annotations, the "title" is "TestClass > testMethodName (additional info)?"
  AND a.title LIKE 'Test%'
GROUP BY a.title
ORDER BY count DESC
;

-- Failure causes
-- Job failure causes in last 7 days on the master branch, with more than one occurrence,
-- excluding 'Process completed with exit code 1.'.
-- Based on GitHub Action annotations, includes regular and product tests.
WITH
runs AS (
    SELECT *
    FROM check_suites
    WHERE owner = 'trinodb' AND repo = 'trino'
        AND head_branch = 'master'
        AND created_at > CURRENT_DATE - INTERVAL '7' DAY
)
, jobs AS (
    SELECT r.id AS run_id, cr.id AS job_id, cr.completed_at, cr.details_url
    FROM check_runs cr
    JOIN runs r ON cr.check_suite_id = r.id
)
, annotations AS (
  SELECT
      j.run_id
    , j.job_id
    , a.title
    , replace(substring(a.message, 1, least(5000, coalesce(nullif(strpos(a.message, U&'\000a'), 0), length(a.message)))), chr(10), '<br/>') AS message
    , j.completed_at AS job_completed_at
    , j.details_url AS job_details_url
  FROM check_run_annotations a
  JOIN jobs j ON j.job_id = a.check_run_id
  WHERE a.annotation_level = 'failure'
  AND a.message != 'Process completed with exit code 1.'
)
SELECT
    title AS "Test name"
  , message AS "Message"
  , count(*) AS "Test failures"
  , count(DISTINCT run_id) AS "Run failures"
  , CAST(count(DISTINCT run_id) * 100.0 / (SELECT count(*) FROM runs) AS decimal(4,1)) AS "% of runs"
  , min(job_completed_at) AS "First seen at"
  , max(job_completed_at) AS "Last seen at"
  , array_join(transform(
    slice(array_agg(job_details_url ORDER BY job_details_url), 1, 5),
    link -> format('"job"@%s ', link)), '') AS "Failure Links"
FROM annotations
GROUP BY title, message
HAVING count(*) > 1
ORDER BY "Test failures" DESC
;

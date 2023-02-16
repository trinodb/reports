-- Flaky jobs per week
WITH
retried_jobs AS (
  SELECT
      run_id
    , name
    , count(DISTINCT run_attempt) AS attempts_count
    , count(*) FILTER (WHERE (conclusion = 'success')) success_count
    , count(*) FILTER (WHERE (conclusion = 'failure')) failure_count
  FROM jobs
  WHERE owner = 'trinodb' AND repo = 'trino'
  AND name NOT LIKE 'Test Report%'
  GROUP BY 1, 2
  HAVING count(*) FILTER (WHERE (conclusion = 'success')) != 0
    AND count(*) FILTER (WHERE (conclusion = 'failure')) != 0
)
, flaky_runs AS (
  SELECT
      CAST(date_trunc('week', r.created_at) AS date) week
    , j.name
    , j.success_count
    , j.failure_count
  FROM retried_jobs j
  JOIN runs r ON j.run_id = r.id
  WHERE r.created_at > CURRENT_DATE - INTERVAL '40' DAY
    AND r.name = 'ci'
  UNION ALL
  SELECT
      CAST(date_trunc('week', r.created_at) AS date) week
    , j.name
    , count() FILTER (WHERE j.conclusion = 'success') AS success_count
    , count() FILTER (WHERE j.conclusion = 'failure' AND jp.conclusion IS NOT DISTINCT FROM 'success') AS failure_count
  FROM runs r
  JOIN jobs j ON j.run_id = r.id AND j.name NOT LIKE 'Test Report%'
  LEFT JOIN pulls p ON p.merge_commit_sha = r.head_sha
  LEFT JOIN runs rp ON rp.head_sha = p.head_sha AND rp.name = r.name
  -- join with PR run jobs, because there are so many flaky tests that PRs are being merged with failures
  LEFT JOIN jobs jp ON jp.run_id = rp.id AND jp.name = j.name
  WHERE r.owner = 'trinodb' AND r.repo = 'trino'
    AND r.created_at > CURRENT_DATE - INTERVAL '40' DAY
    AND r.name = 'ci' AND r.head_branch = 'master'
  GROUP BY 1, 2
  HAVING count() FILTER (WHERE j.conclusion = 'failure' AND jp.conclusion IS NOT DISTINCT FROM 'success') != 0
  ORDER BY 1 DESC
)
SELECT
  week AS "Week"
  , name AS "Job name"
  , round(((CAST(sum(failure_count) AS double) / CAST(sum(success_count + failure_count) AS double)) * 100), 2) AS "Fail percent"
  , sum(failure_count) AS "Failure count"
  , sum(success_count) AS "Success count"
FROM flaky_runs
GROUP BY 1, 2
ORDER BY 1 DESC, 3 DESC, 2
;

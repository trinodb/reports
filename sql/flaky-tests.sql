WITH retried_jobs AS (
  SELECT run_id
    , name
    , count(DISTINCT run_attempt) AS attempts_count
    , count(*) FILTER (WHERE (conclusion = 'success')) success_count
    , count(*) FILTER (WHERE (conclusion = 'failure')) failure_count
  FROM jobs
  WHERE name NOT LIKE 'Test Report%'
  GROUP BY 1, 2
  HAVING count(*) FILTER (WHERE (conclusion = 'success')) != 0
    AND count(*) FILTER (WHERE (conclusion = 'failure')) != 0
),
flaky_runs AS (
  SELECT format_datetime(r.created_at, 'Y:ww') year_week
    , j.name
    , j.success_count
    , j.failure_count
    , j.run_id
  FROM retried_jobs j
  JOIN runs r ON j.run_id = r.id
  WHERE r.created_at > CURRENT_DATE - INTERVAL '40' DAY
    AND r.name = 'ci'
  UNION ALL
  SELECT format_datetime(r.created_at, 'Y:ww') year_week
    , j.name
    , 0 AS success_count
    , 1 AS failure_count
    , j.run_id
  FROM runs r
  JOIN pulls p ON p.merge_commit_sha = r.head_sha
  JOIN runs rp ON rp.head_sha = p.head_sha
  JOIN jobs j ON j.run_id = r.id
  -- join with PR run jobs, because there are so many flaky tests that PRs are being merged with failures
  JOIN jobs jp ON jp.run_id = rp.id AND jp.name = j.name
  WHERE r.created_at > CURRENT_DATE - INTERVAL '40' DAY
    AND r.name = 'ci' AND r.head_branch = 'master' AND r.conclusion = 'failure' AND rp.name = 'ci'
    AND j.name NOT LIKE 'Test Report%' AND j.conclusion = 'failure'
    AND jp.name NOT LIKE 'Test Report%' AND jp.conclusion = 'success'
  ORDER BY 1 DESC
)
SELECT
  year_week
  , name
  , sum(failure_count) AS failure_count
  , round(((CAST(sum(failure_count) AS double) / CAST(sum(success_count + failure_count) AS double)) * 100), 2) fail_percent
  , array_agg('https://github.com/trinodb/trino/actions/runs/' || CAST(run_id AS VARCHAR)) AS runs
FROM flaky_runs
GROUP BY 1, 2
ORDER BY 1 DESC, 3 DESC, 2;

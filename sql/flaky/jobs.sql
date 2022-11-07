-- Flaky jobs in last 3 months
-- Counting runs of the `ci` workflow, executed on master and retried jobs from other branches.
WITH
retried_jobs AS (
  SELECT
      run_id
    , name
    , count(DISTINCT run_attempt) AS attempts_num
    , count(*) FILTER (WHERE (conclusion = 'success')) success_num
    , count(*) FILTER (WHERE (conclusion = 'failure')) failure_num
  FROM jobs
  WHERE name NOT LIKE 'Test Report%'
  GROUP BY 1, 2
  HAVING count(*) FILTER (WHERE (conclusion = 'success')) != 0
    AND count(*) FILTER (WHERE (conclusion = 'failure')) != 0
)
, flaky_runs AS (
  SELECT
      CAST(r.created_at AS date) AS run_date
    , j.name
    , j.success_num
    , j.failure_num
  FROM retried_jobs j
  JOIN runs r ON j.run_id = r.id
  WHERE r.created_at > CURRENT_DATE - INTERVAL '90' DAY
    AND r.name = 'ci'
  UNION ALL
  SELECT
      CAST(r.created_at AS date) AS run_date
    , j.name
    , count() FILTER (WHERE j.conclusion = 'success') AS success_num
    , count() FILTER (WHERE j.conclusion = 'failure' AND jp.conclusion IS NOT DISTINCT FROM 'success') AS failure_num
  FROM runs r
  JOIN jobs j ON j.run_id = r.id AND j.name NOT LIKE 'Test Report%'
  LEFT JOIN pulls p ON p.merge_commit_sha = r.head_sha
  LEFT JOIN runs rp ON rp.head_sha = p.head_sha AND rp.name = r.name
  -- join with PR run jobs, because there are so many flaky tests that PRs are being merged with failures
  LEFT JOIN jobs jp ON jp.run_id = rp.id AND jp.name = j.name
  WHERE r.created_at > CURRENT_DATE - INTERVAL '90' DAY
    AND r.name = 'ci' AND r.head_branch = 'master'
  GROUP BY 1, 2
  HAVING count() FILTER (WHERE j.conclusion = 'failure' AND jp.conclusion IS NOT DISTINCT FROM 'success') != 0
  ORDER BY 1 DESC
)
, by_day AS (
    SELECT
        dates.date
      , all_jobs.name
      , CAST(sum(failure_num) AS double) / CAST(sum(success_num + failure_num) AS double) AS fail_pct
      , sum(failure_num) AS failure_num
      , sum(success_num) AS success_num
    FROM unnest(sequence(CURRENT_DATE - INTERVAL '90' DAY, CURRENT_DATE)) AS dates(date)
    CROSS JOIN (SELECT DISTINCT name FROM flaky_runs) AS all_jobs
    LEFT JOIN flaky_runs r ON r.run_date = dates.date AND r.name = all_jobs.name
    GROUP BY 1, 2
)
SELECT
    name AS "Job name"
  , round(((CAST(sum(failure_num) AS double) / CAST(sum(success_num + failure_num) AS double)) * 100), 2) AS "Fail percent"
  , sum(failure_num) AS "Failure count"
  , sum(success_num) AS "Success count"
  , array_join(transform(
        array_agg(coalesce(fail_pct, 0) ORDER BY date),
        -- map [0.0, 1.0] to [1, 9]
        d -> ARRAY[' ', '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█'][cast(d * 8 + 1 as int)]
    ), '') AS "Histogram chart"
FROM by_day
GROUP BY 1
ORDER BY 1
;

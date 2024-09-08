-- CI workflow failures per day
WITH
runs AS (
  SELECT
      r.id
    , r.created_at
    , r.head_branch
    , r.conclusion
    , j.name AS job_name
  FROM runs r
  LEFT JOIN jobs j ON j.run_id = r.id AND j.conclusion != 'success'
  WHERE r.owner = 'trinodb' AND r.repo = 'trino' AND r.name = 'ci' AND r.created_at >= CURRENT_DATE - INTERVAL '30' DAY
)
SELECT
    date(date_trunc('day', created_at)) AS day
  , count(DISTINCT id) FILTER (WHERE head_branch = 'master') AS num_runs
  , count(DISTINCT id) FILTER (WHERE head_branch = 'master' AND conclusion = 'success') AS num_success
  , round(count(DISTINCT id) FILTER (WHERE head_branch = 'master' AND conclusion = 'success') / CAST(count(DISTINCT id) FILTER (WHERE head_branch = 'master') AS double), 2) AS rate_success
  , array_sort(
     transform(
        transform(
          map_entries(approx_most_frequent(5, job_name, 1000) FILTER (WHERE head_branch = 'master')),
          r -> cast(r AS row(key varchar, value bigint))
        ),
        r -> row(r.value, r.key)
      )
      --(x, y) -> least(greatest(cast(y AS row(key varchar, value double)).value - cast(x AS row(key varchar, value double)).value, -1), 1)
    ) AS top5_failing_jobs
  , count(DISTINCT id) AS num_all_runs
  , count(DISTINCT id) FILTER (WHERE conclusion = 'success') AS num_all_success
  , round(count(DISTINCT id) FILTER (WHERE conclusion = 'success') / CAST(count(DISTINCT id) AS double), 2) AS rate_all_success
FROM runs
GROUP BY 1
ORDER BY 1 DESC
;

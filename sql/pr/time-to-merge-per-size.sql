-- Time to merge per PR size
WITH
latest_pull_stats AS (
    -- the table has a row for every version of the statistics of a pull request
    SELECT *, row_number() OVER (PARTITION BY owner, repo, pull_number ORDER BY updated_at DESC) AS rownum
    FROM pull_stats
)
, ttm_per_size AS (
    SELECT
        p.merged_at - p.created_at AS time_to_merge
      , s.additions + s.deletions AS size
    FROM pulls p
    JOIN latest_pull_stats s ON (s.owner, s.repo, s.pull_number) = (p.owner, p.repo, p.number) AND s.rownum = 1
    WHERE p.owner = 'trinodb' AND p.repo = 'trino'
)
, histogram AS (
    SELECT
        size AS key
      , width_bucket(size, ARRAY[0, 1, 2, 5, 10, 20, 50, 100, 200, 500, 1000, 10000]) AS bucket
      , time_to_merge AS value
    FROM ttm_per_size
)
, grouped AS (
    SELECT
        bucket
      , element_at(ARRAY['0 (only path renames)', '1 to 2', '2 to 5', '5 to 10', '10 to 20', '20 to 50', '50 to 100', '100 to 200', '200 to 500', '500 to 1,000', '1,000 to 10,000', 'over 10,000'], bucket) AS range
      , avg(value) AS value
      , sum(value) AS sum_value
      , count(*) AS num_prs
      , approx_percentile(to_milliseconds(value) / (1000.0 * 3600.0 * 24.0), ARRAY[0.5, 0.95, 0.99]) AS perc
    FROM histogram
    GROUP BY bucket
    ORDER BY bucket
)
, chart AS (
    SELECT
        bucket
      , range
      , num_prs
      , value
      , bar(num_prs / CAST(max(num_prs) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS num_prs_chart
      , bar(to_milliseconds(value) / CAST(to_milliseconds(max(value) OVER ()) AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS value_chart
      , transform(perc, d -> format('%.2f', d)) AS perc
    FROM grouped
    UNION ALL
    SELECT
        NULL
      , 'Total'
      , count(*)
      , avg(value)
      , ''
      , ''
      , transform(
          approx_percentile(to_milliseconds(value) / (1000.0 * 3600.0 * 24.0), ARRAY[0.5, 0.95, 0.99]),
          d -> format('%.2f', d)
        )
    FROM histogram
)
SELECT
    range AS "PR size (added + deleted lines)"
  , num_prs AS "Number of PRs"
  , value AS "Avg time to merge"
  , num_prs_chart AS "Number of PRs chart"
  , value_chart AS "Avg TTM chart"
  , perc AS "Days to merge percentiles 50, 95, 99"
FROM chart
ORDER BY bucket
;

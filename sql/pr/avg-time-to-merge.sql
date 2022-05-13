-- Average time to merge a PR with open PRs
WITH
prs_in_month AS (
    SELECT
        months.month
      , least(months.month + interval '1' month - interval '1' day, p.merged_at) - p.created_at AS ttm
    FROM unnest(sequence(date '2019-01-01', current_date, interval '1' month)) AS months(month)
    JOIN unique_pulls p ON months.month BETWEEN date_trunc('month', date(p.created_at)) AND date_trunc('month', date(p.merged_at))
    WHERE owner = 'trinodb' AND repo = 'trino' AND merged_at IS NOT NULL
)
, grouped AS (
    SELECT
        p.month
      , sum(p.ttm) AS total_time_to_merge
      , count(p.ttm) AS num_merged
      , sum(p.ttm) / count(p.ttm) AS avg_time_to_merge
      , approx_percentile(to_milliseconds(p.ttm) / (1000.0 * 3600.0 * 24.0), ARRAY[0.5, 0.95, 0.99]) AS perc
    FROM prs_in_month p
    GROUP BY 1
)
, prs_in_3months AS (
    SELECT
        months.month
      , least(months.month + interval '1' month - interval '1' day, p.merged_at) - p.created_at AS ttm
    FROM unnest(sequence(date '2019-01-01', current_date, interval '1' month)) AS months(month)
    JOIN unique_pulls p ON months.month BETWEEN date_trunc('month', date(p.created_at)) AND date_trunc('month', date(p.merged_at)) + interval '2' month
    WHERE owner = 'trinodb' AND repo = 'trino' AND merged_at IS NOT NULL
)
, grouped_3months AS (
    SELECT
        p.month
      , sum(p.ttm) AS total_time_to_merge
      , count(p.ttm) AS num_merged
      , sum(p.ttm) / count(p.ttm) AS avg_time_to_merge
      , approx_percentile(to_milliseconds(p.ttm) / (1000.0 * 3600.0 * 24.0), ARRAY[0.5, 0.95, 0.99]) AS perc
    FROM prs_in_3months p
    GROUP BY 1
)
SELECT
    g.month AS "Month"
  , g.num_merged "Number of PRs"
  , bar(to_milliseconds(g.avg_time_to_merge) / CAST(max(to_milliseconds(g.avg_time_to_merge)) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Avg TTM chart"
  , g.avg_time_to_merge AS "Avg TTM"
  , g3.num_merged "Number of PRs over 3 months"
  , bar(to_milliseconds(g3.avg_time_to_merge) / CAST(max(to_milliseconds(g3.avg_time_to_merge)) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Avg TTM over 3 months chart"
  , g3.avg_time_to_merge AS "Avg TTM over 3 months"
  , transform(g.perc, d -> format('%.2f', d)) AS "Days to merge percentiles 50, 95, 99"
FROM grouped g
JOIN grouped_3months g3 ON g.month = g3.month
ORDER BY g.month DESC
;

-- Average time to merge per create month
WITH
per_month AS (
    SELECT
        date_trunc('month', date(p.created_at)) AS month_created
      , sum(p.merged_at - p.created_at) AS total_time_to_merge
      , count(p.merged_at - p.created_at) AS num_merged
      , sum(p.merged_at - p.created_at) / count(p.merged_at - p.created_at) AS avg_time_to_merge
      , approx_percentile(to_milliseconds(p.merged_at - p.created_at) / (1000.0 * 3600.0 * 24.0), ARRAY[0.5, 0.95, 0.99]) AS perc
    FROM unique_pulls p
    WHERE owner = 'trinodb' AND repo = 'trino'
    GROUP BY 1
)
SELECT
    month_created AS "Created in month"
  , num_merged "Merged PRs"
  , bar(to_milliseconds(avg_time_to_merge) / CAST(max(to_milliseconds(avg_time_to_merge)) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Avg TTM chart"
  , avg_time_to_merge AS "Avg TTM"
  , sum(total_time_to_merge) OVER w / sum(num_merged) OVER w AS "3 month avg TTM"
  , transform(perc, d -> format('%.2f', d)) AS "Days to merge percentiles 50, 95, 99"
FROM per_month
WINDOW w AS (ORDER BY month_created ROWS BETWEEN 3 PRECEDING AND CURRENT ROW)
ORDER BY month_created DESC
;

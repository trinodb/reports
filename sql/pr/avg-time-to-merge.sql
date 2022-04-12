-- Average time to merge a PR
WITH
last_reviews AS (
    SELECT pull_number AS number, max(submitted_at) AS submitted_at
    FROM reviews
    WHERE owner = 'trinodb' AND repo = 'trino'
    GROUP BY 1
)
, per_month AS (
    SELECT
        date_trunc('month', date(p.merged_at)) AS month_merged
      , sum(p.merged_at - p.created_at) AS total_time_to_merge
      , count(p.merged_at - p.created_at) AS num_merged
      , sum(p.merged_at - p.created_at) / count(p.merged_at - p.created_at) AS avg_time_to_merge
      , approx_percentile(round(to_milliseconds(p.merged_at - p.created_at) / (1000.0 * 3600.0 * 24.0), 2), ARRAY[0.5, 0.95, 0.99]) AS perc
      , sum(p.merged_at - r.submitted_at) / count(p.merged_at - r.submitted_at) AS avg_reviewed_time_to_merge
    FROM unique_pulls p
    LEFT JOIN last_reviews r ON p.number = r.number
    WHERE owner = 'trinodb' AND repo = 'trino'
    GROUP BY 1
)
SELECT
    month_merged AS "Merged in month"
  , num_merged "Merged PRs"
  , bar(to_milliseconds(avg_time_to_merge) / CAST(max(to_milliseconds(avg_time_to_merge)) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Avg TTM chart"
  , avg_time_to_merge AS "Avg TTM"
  , avg_reviewed_time_to_merge AS "Avg TTM after last review"
  , sum(total_time_to_merge) OVER w / sum(num_merged) OVER w AS "3 month avg TTM"
  , perc AS "Day percentiles 50, 95, 99"
FROM per_month
WHERE month_merged IS NOT NULL
WINDOW w AS (ORDER BY month_merged ROWS BETWEEN 3 PRECEDING AND CURRENT ROW)
ORDER BY month_merged DESC
;

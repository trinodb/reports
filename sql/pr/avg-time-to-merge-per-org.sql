-- Average time to merge a PR
WITH
per_month_org AS (
    SELECT
        date_trunc('month', date(p.merged_at)) AS month_merged
      , coalesce(m.org, 'unaffiliated') AS org
      , sum(p.merged_at - p.created_at) AS total_time_to_merge
      , count(p.merged_at - p.created_at) AS num_merged
      , sum(p.merged_at - p.created_at) / count(p.merged_at - p.created_at) AS avg_time_to_merge
      , approx_percentile(round(to_milliseconds(p.merged_at - p.created_at) / (1000.0 * 3600.0 * 24.0), 2), ARRAY[0.5, 0.95, 0.99]) AS perc
    FROM unique_pulls p
    LEFT JOIN members m ON m.login = p.user_login
    WHERE owner = 'trinodb' AND repo = 'trino'
    GROUP BY 1, 2
)
SELECT
    month_merged AS "Merged in month"
  , org "Org"
  , num_merged "Merged PRs"
  , bar(to_milliseconds(avg_time_to_merge) / CAST(max(to_milliseconds(avg_time_to_merge)) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Avg TTM chart"
  , bar(perc[1] / CAST(max(perc[1]) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "P50 TTM chart"
  , bar(perc[2] / CAST(max(perc[2]) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "P95 TTM chart"
  , bar(perc[3] / CAST(max(perc[3]) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "P99 TTM chart"
  , avg_time_to_merge AS "Avg TTM"
  , sum(total_time_to_merge) OVER w / sum(num_merged) OVER w AS "3 month avg TTM"
  , perc AS "Day percentiles 50, 95, 99"
FROM per_month_org
WHERE month_merged IS NOT NULL
WINDOW w AS (ORDER BY month_merged ROWS BETWEEN 3 PRECEDING AND CURRENT ROW)
ORDER BY org, month_merged DESC
;

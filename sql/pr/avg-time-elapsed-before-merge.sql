-- Average time to merge a PR
WITH monthly_data AS (
    SELECT
        date_trunc('month', date(merged_at)) as month_merged,
        sum(merged_at - created_at) as total_time_to_merge,
        count(merged_at - created_at) as num_merged,
        approx_percentile(to_milliseconds(merged_at - created_at) / (1000.0 * 3600.0 * 24.0), ARRAY[0.5, 0.75, 0.9, 0.99]) AS perc
    FROM unique_pulls
    WHERE owner = 'trinodb' AND repo = 'trino'
    GROUP BY 1
    ORDER BY 1 DESC)
SELECT
    month_merged,
    num_merged,
    bar(to_milliseconds(total_time_to_merge) / CAST(max(to_milliseconds(total_time_to_merge)) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Duration ratio chart",
    total_time_to_merge / num_merged as avg_time_to_merge,
    sum(total_time_to_merge) OVER w / sum(num_merged) OVER w as rolling_average,
    perc AS "Day percentiles 50, 75, 90, 99"
FROM monthly_data
WHERE month_merged IS NOT NULL
WINDOW w AS (ORDER BY month_merged ROWS BETWEEN 3 PRECEDING AND CURRENT ROW)
ORDER BY month_merged DESC
;
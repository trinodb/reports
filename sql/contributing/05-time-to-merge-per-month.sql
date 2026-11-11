-- Time to merge per month
-- Pull requests of people merged in each of the last 24 months, newest first, and how long they were open. The median is the typical wait; 90% of pull requests were merged within the time in the next column, so only 1 in 10 waited longer.
-- First pull requests are those of authors with no merged pull request before. They usually wait much longer, so the last two columns show them on their own.
WITH
months AS (
    SELECT month
    FROM unnest(sequence(date_trunc('month', current_date) - INTERVAL '23' MONTH, date_trunc('month', current_date), INTERVAL '1' MONTH)) AS t(month)
)
, merged AS (
    SELECT
        date_trunc('month', merged_at) AS month
      , author_cohort = 'no merged PRs yet' AS first_pr
      , to_unixtime(merged_at) - to_unixtime(created_at) AS merge_seconds
    FROM memory.default.pull_requests
    WHERE NOT author_is_bot AND state = 'merged'
      AND merged_at >= date_trunc('month', current_date) - INTERVAL '23' MONTH
)
SELECT
    format('%d-%02d', year(m.month), month(m.month)) || if(m.month = date_trunc('month', current_date), ' (so far)', '') AS "Month"
  , count(p.merge_seconds) AS "Merged"
  , memory.default.human_duration(approx_percentile(p.merge_seconds, 0.5)) AS "Median time to merge"
  , memory.default.human_duration(approx_percentile(p.merge_seconds, 0.9)) AS "90% merged within"
  , count(p.merge_seconds) FILTER (WHERE p.first_pr) AS "Merged first PRs"
  , memory.default.human_duration(approx_percentile(p.merge_seconds, 0.5) FILTER (WHERE p.first_pr)) AS "Median for first PRs"
FROM months m
LEFT JOIN merged p ON p.month = m.month
GROUP BY m.month
ORDER BY m.month DESC
;

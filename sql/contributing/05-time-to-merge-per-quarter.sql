-- Time to merge per quarter
-- Pull requests of people merged in each quarter since 2019, newest first, and how long they were open, on a log scale: ─ spans 80% of them, ▒ the middle half, and █ is the median. 90% were merged within the time in the third column, so only 1 in 10 waited longer.
-- First pull requests are those of authors with no merged pull request before. They usually wait much longer, so the last two columns show them on their own.
WITH
quarters AS (
    SELECT quarter
    FROM unnest(sequence(DATE '2019-01-01', date_trunc('quarter', current_date), INTERVAL '3' MONTH)) AS t(quarter)
)
, merged AS (
    SELECT
        date_trunc('quarter', merged_at) AS quarter
      , author_cohort = 'no merged PRs yet' AS first_pr
      , to_unixtime(merged_at) - to_unixtime(created_at) AS merge_seconds
    FROM memory.default.pull_requests
    WHERE NOT author_is_bot AND state = 'merged'
)
, per_quarter AS (
    SELECT
        q.quarter
      , count(p.merge_seconds) AS merged
      , approx_percentile(p.merge_seconds, ARRAY[0.1, 0.25, 0.5, 0.75, 0.9]) AS percentiles
      , count(p.merge_seconds) FILTER (WHERE p.first_pr) AS merged_first_prs
      , approx_percentile(p.merge_seconds, 0.5) FILTER (WHERE p.first_pr) AS first_pr_median
    FROM quarters q
    LEFT JOIN merged p ON p.quarter = q.quarter
    GROUP BY q.quarter
)
SELECT
    format('%d-Q%d', year(quarter), quarter(quarter)) || if(quarter = date_trunc('quarter', current_date), ' so far', '') AS "Quarter"
  , merged AS "Merged"
  , memory.default.human_duration(percentiles[3]) AS "Median"
  , memory.default.human_duration(percentiles[5]) AS "90% within"
  -- the chart's column title is its axis, as drawn by log_position for a width of 50
  , memory.default.boxplot(percentiles[1], percentiles[2], percentiles[3], percentiles[4], percentiles[5], 50) AS "1m             1h          1d     1w    30d     1y"
  , merged_first_prs AS "First PRs"
  , coalesce(memory.default.human_duration(first_pr_median), '') AS "Median for first PRs"
FROM per_quarter
ORDER BY quarter DESC
;

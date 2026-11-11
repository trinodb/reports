-- Reviews per merged pull request
-- How many people reviewed each pull request merged in the month, how many were merged without a review by a person, and how fast reviewers responded to authors' updates in the month (median and P90, as in the section above).
-- A rising share merged without a review means changes go in unchecked; a single reviewer on most pull requests means one person carries each change. Bots' pull requests and bot reviews are not counted. The current month is not complete.
WITH
merged AS (
    SELECT date_trunc('month', merged_at) AS month, cardinality(reviewers) AS reviewers
    FROM memory.default.pull_requests
    WHERE state = 'merged' AND NOT author_is_bot
      AND merged_at >= date_trunc('month', current_date) - INTERVAL '11' MONTH
)
, coverage AS (
    SELECT
        month
      , count(*) AS merged
      , count(*) FILTER (WHERE reviewers = 0) AS no_reviewer
      , count(*) FILTER (WHERE reviewers = 1) AS one_reviewer
      , count(*) FILTER (WHERE reviewers = 2) AS two_reviewers
      , count(*) FILTER (WHERE reviewers >= 3) AS more_reviewers
      , approx_percentile(reviewers, 0.5) AS median_reviewers
    FROM merged
    GROUP BY month
)
, speed AS (
    SELECT
        date_trunc('month', responded_at) AS month
      , approx_percentile(response_seconds, 0.5) AS median_response
      , approx_percentile(response_seconds, 0.9) AS p90_response
    FROM memory.default.reviewer_responses
    GROUP BY 1
)
-- printed as a chart, so that the bars line up
SELECT
    format_datetime(c.month, 'yyyy-MM') AS "Month"
  , c.merged AS "Merged"
  , format('%.0f%%', c.no_reviewer * 100e0 / c.merged) AS "No review"
  , format('%.0f%%', c.one_reviewer * 100e0 / c.merged) AS "1 reviewer"
  , format('%.0f%%', c.two_reviewers * 100e0 / c.merged) AS "2"
  , format('%.0f%%', c.more_reviewers * 100e0 / c.merged) AS "3 or more"
  , memory.default.stacked(ARRAY[c.no_reviewer * 1e0, c.one_reviewer * 1e0, c.two_reviewers * 1e0, c.more_reviewers * 1e0], '·▒▓█', 30) AS "None ·, 1 ▒, 2 ▓, 3+ █"
  , memory.default.human_duration(s.median_response) AS "Median response"
  , memory.default.human_duration(s.p90_response) AS "P90 response"
FROM coverage c
LEFT JOIN speed s ON s.month = c.month
ORDER BY c.month DESC
;

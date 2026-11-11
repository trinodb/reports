-- How concentrated is reviewing?
-- Share of reviews done by the 5 and the 10 busiest reviewers per quarter, and how many people did half of all reviews. One review is one person reviewing one pull request in the quarter, however many comments they left. Bots and authors replying in their own pull requests are not counted.
-- When a few people do most reviews, the project stalls when they are away, and they burn out: if the shares grow, ask regular contributors to review more in their areas. The current quarter is not complete.
WITH
pairs AS (
    SELECT DISTINCT date_trunc('quarter', event_at) AS quarter, actor, number
    FROM memory.default.pull_request_events
    WHERE kind = 'review' AND NOT by_author AND NOT by_bot
      AND event_at >= date_trunc('quarter', current_date) - INTERVAL '21' MONTH
)
, per_reviewer AS (
    SELECT quarter, actor, count(*) AS reviews
    FROM pairs
    GROUP BY quarter, actor
)
, ranked AS (
    SELECT
        quarter
      , reviews
      , row_number() OVER (PARTITION BY quarter ORDER BY reviews DESC, actor) AS reviewer_rank
      , sum(reviews) OVER (PARTITION BY quarter ORDER BY reviews DESC, actor) AS running_reviews
      , sum(reviews) OVER (PARTITION BY quarter) AS total_reviews
    FROM per_reviewer
)
, quarters AS (
    SELECT
        quarter
      , count(*) AS reviewers
      , max(total_reviews) AS reviews
      , sum(reviews) FILTER (WHERE reviewer_rank <= 5) AS top_5
      , sum(reviews) FILTER (WHERE reviewer_rank > 5 AND reviewer_rank <= 10) AS next_5
      , sum(reviews) FILTER (WHERE reviewer_rank > 10) AS rest
      , min(reviewer_rank) FILTER (WHERE running_reviews * 2 >= total_reviews) AS half_reviewers
    FROM ranked
    GROUP BY quarter
)
-- printed as a chart, so that the bars line up
SELECT
    format('%d Q%d', year(quarter), quarter(quarter)) AS "Quarter"
  , reviewers AS "Reviewers"
  , reviews AS "Reviews"
  , format('%.0f%%', top_5 * 100e0 / reviews) AS "Top 5"
  , format('%.0f%%', (top_5 + next_5) * 100e0 / reviews) AS "Top 10"
  , half_reviewers AS "Half done by"
  , memory.default.stacked(ARRAY[top_5 * 1e0, coalesce(next_5, 0) * 1e0, coalesce(rest, 0) * 1e0], '█▓░', 40) AS "Top 5 █, next 5 ▓, everyone else ░"
FROM quarters
ORDER BY quarter DESC
;

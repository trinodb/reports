-- How fast do authors answer reviews?
-- After a review or comment from another person, how long until the author answered with a comment, a review, or a new commit, in the last 12 months. The cumulative columns are the share of answers given within that time, on first pull requests and on the pull requests of everyone else.
-- This is the pace reviewers are used to: most authors answer within a day. An answer within a day or two keeps the review fresh for your reviewer, and after 21 days without activity the stale bot marks the pull request. Reviews never answered, like an approval followed by the merge, are not counted.
WITH
events AS (
    SELECT
        e.number
      , e.event_at
      , e.kind
      , e.by_author
      , p.author_cohort = 'no merged PRs yet' AS first_pr
    FROM memory.default.pull_request_events e
    JOIN memory.default.pull_requests p ON p.number = e.number
    WHERE NOT p.author_is_bot AND NOT e.by_bot
      AND e.kind != 'opened'
      AND e.event_at >= current_date - INTERVAL '12' MONTH
)
, answers AS (
    SELECT first_pr, answer_seconds
    FROM events MATCH_RECOGNIZE (
        PARTITION BY number
        ORDER BY event_at, by_author, kind
        MEASURES
            first(R.first_pr) AS first_pr
          , to_unixtime(first(A.event_at)) - to_unixtime(first(R.event_at)) AS answer_seconds
        ONE ROW PER MATCH
        AFTER MATCH SKIP PAST LAST ROW
        PATTERN (R+ A+)
        DEFINE
            R AS NOT R.by_author
          , A AS A.by_author
    )
)
, limits AS (
    SELECT *
    FROM (
        VALUES
            (1, 'within 1 hour', -infinity(), 3600e0)
          , (2, '1 to 4 hours', 3600e0, 4 * 3600e0)
          , (3, '4 hours to 1 day', 4 * 3600e0, 86400e0)
          , (4, '1 to 2 days', 86400e0, 2 * 86400e0)
          , (5, '2 days to 1 week', 2 * 86400e0, 7 * 86400e0)
          , (6, '1 to 2 weeks', 7 * 86400e0, 14 * 86400e0)
          , (7, '2 weeks to 30 days', 14 * 86400e0, 30 * 86400e0)
          , (8, 'over 30 days', 30 * 86400e0, infinity())
    ) AS t(rank, label, from_seconds, to_seconds)
)
, buckets AS (
    SELECT
        l.rank
      , l.label
      , count(a.answer_seconds) FILTER (WHERE a.first_pr) AS first_prs
      , count(a.answer_seconds) FILTER (WHERE NOT a.first_pr) AS other_prs
    FROM limits l
    LEFT JOIN answers a ON a.answer_seconds > l.from_seconds AND a.answer_seconds <= l.to_seconds
    GROUP BY l.rank, l.label
)
SELECT
    label AS "Author answered"
  , first_prs AS "First PRs"
  , format('%.0f%%', sum(first_prs) OVER (ORDER BY rank) * 100e0 / sum(first_prs) OVER ()) AS "First PRs, cumulative"
  , other_prs AS "Others"
  , format('%.0f%%', sum(other_prs) OVER (ORDER BY rank) * 100e0 / sum(other_prs) OVER ()) AS "Others, cumulative"
FROM buckets
ORDER BY rank
;

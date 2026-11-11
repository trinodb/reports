-- How fast do reviewers respond?
-- Time from an author's update (opening the pull request, a push, or a reply) to the next review, comment, or merge by someone who reviews in this project, for responses in the last 12 months. Cumulative shows the share of updates answered within that time.
-- Authors who wait days for each round lose context and interest; if the share answered within a day drops, review more often in smaller sessions. Updates still without a response are not counted; they are in the lists above. Draft periods count as waiting, because the data has no record of them.
WITH
responses AS (
    SELECT response_seconds AS seconds
    FROM memory.default.reviewer_responses
    WHERE responded_at >= current_timestamp - INTERVAL '12' MONTH
)
, buckets AS (
    SELECT
        b.bucket
      , b.label
      , count(r.seconds) AS responses
    FROM (
        VALUES
            (1, 'under 1 hour', 0, 3600)
          , (2, '1 to 4 hours', 3600, 4 * 3600)
          , (3, '4 to 24 hours', 4 * 3600, 86400)
          , (4, '1 to 2 days', 86400, 2 * 86400)
          , (5, '2 to 4 days', 2 * 86400, 4 * 86400)
          , (6, '4 to 7 days', 4 * 86400, 7 * 86400)
          , (7, '1 to 2 weeks', 7 * 86400, 14 * 86400)
          , (8, '2 to 4 weeks', 14 * 86400, 28 * 86400)
          , (9, '4 weeks to 3 months', 28 * 86400, 91 * 86400)
          , (10, 'over 3 months', 91 * 86400, 2147483647)
    ) AS b(bucket, label, from_seconds, to_seconds)
    LEFT JOIN responses r ON r.seconds >= b.from_seconds AND r.seconds < b.to_seconds
    GROUP BY b.bucket, b.label
)
-- printed as a chart, so that the bars line up
SELECT
    label AS "Response time"
  , responses AS "Responses"
  , format('%.0f%%', responses * 100e0 / sum(responses) OVER ()) AS "Share"
  , format('%.0f%%', sum(responses) OVER (ORDER BY bucket) * 100e0 / sum(responses) OVER ()) AS "Cumulative"
  , memory.default.hbar(responses, max(responses) OVER (), 40) AS "Histogram"
FROM buckets
ORDER BY bucket
;

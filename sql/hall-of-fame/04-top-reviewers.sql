-- Top reviewers of the last 12 months
-- People who reviewed the most pull requests of other people in the last 12 months. A pull request counts once, no matter how many reviews it got, so many small reviews don't count more than one thorough one; comments outside of a review don't count. The change is the move in rank against the 12 months before. Bots are not counted.
WITH
now_utc AS (
    SELECT CAST(now() AT TIME ZONE 'UTC' AS timestamp(6)) AS ts
)
, counts AS (
    SELECT
        e.actor AS login
      , count(DISTINCT e.number) FILTER (WHERE e.event_at >= n.ts - interval '1' year) AS current_count
      , count(DISTINCT e.number) FILTER (WHERE e.event_at < n.ts - interval '1' year) AS previous_count
    FROM memory.default.pull_request_events e
    JOIN memory.default.pull_requests p ON p.number = e.number
    CROSS JOIN now_utc n
    WHERE e.kind = 'review' AND NOT e.by_author AND NOT e.by_bot AND NOT p.author_is_bot
      AND e.event_at >= n.ts - interval '2' year AND e.event_at < n.ts
    GROUP BY e.actor
)
, ranked AS (
    SELECT
        login
      , current_count
      , rank() OVER (ORDER BY current_count DESC) AS current_rank
      , if(previous_count > 0, rank() OVER (ORDER BY previous_count DESC)) AS previous_rank
    FROM counts
)
SELECT
    current_rank AS "Rank"
  , CASE
        WHEN previous_rank IS NULL THEN 'new'
        WHEN previous_rank > current_rank THEN format('▲ %d', previous_rank - current_rank)
        WHEN previous_rank < current_rank THEN format('▼ %d', current_rank - previous_rank)
        ELSE '='
    END AS "Change"
  , current_count AS "Reviewed pull requests"
  -- a chart, so the bars line up
  , memory.default.hbar(current_count, max(current_count) OVER (), 30) AS " "
  , memory.default.user_link(login) AS "Person"
FROM ranked
WHERE current_count > 0
ORDER BY current_count DESC, login
LIMIT 20;

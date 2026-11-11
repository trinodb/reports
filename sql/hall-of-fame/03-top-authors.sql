-- Top authors of the last 12 months
-- People with the most merged pull requests in the last 12 months. The change is the move in rank against the 12 months before (▲ 3 means 3 places up), and new means no pull request was merged then. Bots are not counted.
WITH
now_utc AS (
    SELECT CAST(now() AT TIME ZONE 'UTC' AS timestamp(6)) AS ts
)
, counts AS (
    SELECT
        p.author AS login
      , count(*) FILTER (WHERE p.merged_at >= n.ts - interval '1' year) AS current_count
      , count(*) FILTER (WHERE p.merged_at < n.ts - interval '1' year) AS previous_count
    FROM memory.default.pull_requests p
    CROSS JOIN now_utc n
    WHERE p.state = 'merged' AND NOT p.author_is_bot
      AND p.merged_at >= n.ts - interval '2' year AND p.merged_at < n.ts
    GROUP BY p.author
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
  , current_count AS "Merged pull requests"
  -- a chart, so the bars line up
  , memory.default.hbar(current_count, max(current_count) OVER (), 30) AS " "
  , memory.default.user_link(login) AS "Person"
FROM ranked
WHERE current_count > 0
ORDER BY current_count DESC, login
LIMIT 20;

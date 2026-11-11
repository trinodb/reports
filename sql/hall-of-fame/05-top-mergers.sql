-- Top mergers of the last 12 months
-- Maintainers who merged the most pull requests of other people in the last 12 months. Merging your own pull request doesn't count, and neither do updates opened by bots, like dependency bumps. The change is the move in rank against the 12 months before.
WITH
now_utc AS (
    SELECT CAST(now() AT TIME ZONE 'UTC' AS timestamp(6)) AS ts
)
, merges AS (
    -- pull requests are rebased onto master, so the commits of one pull request share the committer and the commit time
    SELECT DISTINCT
        c.committer_login AS login
      , c.author_login
      , c.committer_date
    FROM commits c
    CROSS JOIN now_utc n
    WHERE c.owner = 'trinodb' AND c.repo = 'trino'
      AND c.committer_login != c.author_login
      AND NOT memory.default.is_bot(c.committer_login)
      AND NOT memory.default.is_bot(c.author_login)
      AND c.committer_date >= n.ts - interval '2' year AND c.committer_date < n.ts
)
, counts AS (
    SELECT
        m.login
      , count(*) FILTER (WHERE m.committer_date >= n.ts - interval '1' year) AS current_count
      , count(*) FILTER (WHERE m.committer_date < n.ts - interval '1' year) AS previous_count
    FROM merges m
    CROSS JOIN now_utc n
    GROUP BY m.login
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

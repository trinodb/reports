-- Who merges whose work
-- The authors and maintainers who most often work as a pair: how many of the author's pull requests the maintainer merged in the last 12 months, and what share of the author's pull requests merged by someone else that is.
-- A long-standing pair often means a mentor, or the go-to maintainer for an area. Bots are not counted.
WITH
merges AS (
    -- pull requests are rebased onto master, so the commits of one pull request share the committer and the commit time
    SELECT DISTINCT
        author_login AS author
      , committer_login AS merger
      , committer_date
    FROM commits
    WHERE owner = 'trinodb' AND repo = 'trino'
      AND committer_login != author_login
      AND NOT memory.default.is_bot(committer_login)
      AND NOT memory.default.is_bot(author_login)
)
, pairs AS (
    SELECT
        author
      , merger
      , count(*) FILTER (WHERE committer_date >= CAST(now() AT TIME ZONE 'UTC' AS timestamp(6)) - interval '1' year) AS last_year
      , count(*) AS all_time
      , min(committer_date) AS first_merged_at
    FROM merges
    GROUP BY author, merger
)
, shares AS (
    SELECT
        *
      , CAST(last_year AS double) / sum(last_year) OVER (PARTITION BY author) AS author_share
    FROM pairs
)
SELECT
    memory.default.user_link(author) AS "Author"
  , memory.default.user_link(merger) AS "Merged by"
  , last_year AS "Merged in the last 12 months"
  , format('%d%%', CAST(round(author_share * 100) AS bigint)) AS "Share of the author's merges"
  , all_time AS "All time"
  , format_datetime(first_merged_at, 'yyyy') AS "Pair since"
FROM shares
WHERE last_year > 0
ORDER BY last_year DESC, author, merger
LIMIT 20;

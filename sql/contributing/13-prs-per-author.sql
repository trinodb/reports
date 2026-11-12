-- How many pull requests do people open?
-- People who opened pull requests in the last 12 months, by how many they opened. Most open only one or two, while a few regular contributors open most of the pull requests. Got one merged is the share of these authors with at least one of them merged.
-- If you plan a bigger change, start with a small one to learn how the review works, and open an issue or ask in the #core-dev channel on the Trino Slack before the large one.
WITH
authors AS (
    SELECT
        author
      , count(*) AS prs
      , count(*) FILTER (WHERE state = 'merged') AS merged
    FROM memory.default.pull_requests
    WHERE NOT author_is_bot
      AND created_at >= current_date - INTERVAL '12' MONTH
    GROUP BY author
)
, buckets AS (
    SELECT *
    FROM (
        VALUES
            (1, '1', 1, 1)
          , (2, '2', 2, 2)
          , (3, '3 to 4', 3, 4)
          , (4, '5 to 9', 5, 9)
          , (5, '10 to 19', 10, 19)
          , (6, '20 to 49', 20, 49)
          , (7, '50 or more', 50, 1000000)
    ) AS t(rank, label, min_prs, max_prs)
)
, grouped AS (
    SELECT
        b.rank
      , b.label
      , count(a.author) AS authors
      , coalesce(sum(a.prs), 0) AS prs
      , count(a.author) FILTER (WHERE a.merged > 0) AS with_merged
    FROM buckets b
    LEFT JOIN authors a ON a.prs BETWEEN b.min_prs AND b.max_prs
    GROUP BY b.rank, b.label
)
SELECT
    label AS "Pull requests per author"
  , authors AS "Authors"
  , format('%.0f%%', authors * 100e0 / sum(authors) OVER ()) AS "Of authors"
  , memory.default.hbar(authors, max(authors) OVER (), 20) AS "Authors chart"
  , prs AS "Pull requests"
  , format('%.0f%%', prs * 100e0 / sum(prs) OVER ()) AS "Of pull requests"
  , memory.default.hbar(prs, max(prs) OVER (), 20) AS "Pull requests chart"
  , if(authors > 0, format('%.0f%%', with_merged * 100e0 / authors), '') AS "Got one merged"
FROM grouped
ORDER BY rank
;

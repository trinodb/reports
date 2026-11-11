-- Welcome
-- People whose first pull request was merged in the last 30 days, newest first. If you see someone you know, say thanks, and point them to the next thing to work on.
WITH
first_merged AS (
    SELECT
        author
      , number
      , title
      , created_at
      , merged_at
      , merged_by
      , row_number() OVER (PARTITION BY author ORDER BY merged_at) AS merged_rank
    FROM memory.default.pull_requests
    WHERE state = 'merged' AND NOT author_is_bot
)
, welcomed AS (
    SELECT *
    FROM first_merged
    WHERE merged_rank = 1
      AND merged_at >= CAST(now() AT TIME ZONE 'UTC' AS timestamp(6)) - interval '30' day
)
, mergers AS (
    -- the merged_by column is mostly empty, so take the committer of the author's commits rebased on master just before the merge
    SELECT
        w.number
      , max_by(c.committer_login, c.committer_date) AS committer
    FROM welcomed w
    JOIN commits c ON c.author_login = w.author
      AND c.committer_date BETWEEN w.merged_at - interval '1' day AND w.merged_at + interval '10' minute
    WHERE c.owner = 'trinodb' AND c.repo = 'trino'
      AND c.committer_login != w.author
    GROUP BY w.number
)
SELECT
    format_datetime(w.merged_at, 'yyyy-MM-dd') AS "Merged on"
  , memory.default.user_link(w.author) AS "Person"
  , memory.default.pr_link(w.number) AS "Pull request"
  , replace(w.title, chr(10), ' ') AS "Title"
  , memory.default.human_duration(to_unixtime(w.merged_at) - to_unixtime(w.created_at)) AS "Time to merge"
  , CASE
        WHEN coalesce(w.merged_by, m.committer) IS NULL THEN ''
        ELSE memory.default.user_link(coalesce(w.merged_by, m.committer))
    END AS "Merged by"
FROM welcomed w
LEFT JOIN mergers m ON m.number = w.number
ORDER BY w.merged_at DESC, w.number DESC;

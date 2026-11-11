-- Milestones
-- People whose 10th, 25th, 50th, 100th, 250th, 500th, or 1000th pull request was merged in the last 90 days, with the pull request that reached it. The first merged pull request is in the Welcome table above.
WITH
merged AS (
    SELECT
        author
      , number
      , merged_at
      , row_number() OVER (PARTITION BY author ORDER BY merged_at, number) AS merged_count
    FROM memory.default.pull_requests
    WHERE state = 'merged' AND NOT author_is_bot
)
SELECT
    format_datetime(m.merged_at, 'yyyy-MM-dd') AS "Reached on"
  , m.merged_count AS "Merged pull requests"
  , memory.default.user_link(m.author) AS "Person"
  , memory.default.pr_link(m.number) AS "Pull request"
  , format_datetime(c.first_merged_at, 'yyyy-MM-dd') AS "First merged on"
FROM merged m
JOIN memory.default.contributors c ON c.login = m.author
WHERE m.merged_count IN (10, 25, 50, 100, 250, 500, 1000)
  AND m.merged_at >= CAST(now() AT TIME ZONE 'UTC' AS timestamp(6)) - interval '90' day
ORDER BY m.merged_count DESC, m.merged_at DESC;

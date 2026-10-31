-- Top 10 most commented PRs
WITH
latest_pull_stats AS (
    -- the table has a row for every version of the statistics of a pull request
    SELECT *, row_number() OVER (PARTITION BY owner, repo, pull_number ORDER BY updated_at DESC) AS rownum
    FROM pull_stats
)
, reviews AS (
    SELECT pull_number, count(*)
    FROM reviews
    WHERE body != ‘’
    GROUP BY pull_number
)
SELECT
      s.pull_number
    , s.comments + s.review_comments + r.reviews AS all_comments
    , s.closed_at - s.created_at AS age
    , s.comments
    , s.review_comments
    , s.commits
    , s.additions
    , s.deletions
    , s.changed_files
    , s.closed_at
    , s.merged_at
FROM latest_pull_stats s
JOIN reviews r ON r.pull_number = s.pull_number
WHERE s.rownum = 1
ORDER BY all_comments DESC
LIMIT 10
;

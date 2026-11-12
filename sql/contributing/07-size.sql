-- Do smaller pull requests merge faster?
-- Pull requests opened by people in the 12 months before the last 30 days, by size and by whether the author had a merged pull request before. Size is added plus deleted lines: XS under 10, S under 100, M under 500, L under 1000, XL 1000 or more. Drafts and pull requests without a signed CLA are not counted.
-- Larger changes wait longer for the merge and are merged less often, most clearly for first pull requests of 100 changed lines or more (M and larger). If you are new, start with a small change, and split a large one into pull requests that can be reviewed one by one.
WITH
pull_requests AS (
    SELECT
        if(author_cohort = 'no merged PRs yet', 'first PRs', 'authors with merged PRs') AS author_group
      , size
      , size_rank
      , state
      , to_unixtime(responded_at) - to_unixtime(created_at) AS response_seconds
      , to_unixtime(merged_at) - to_unixtime(created_at) AS merge_seconds
    FROM memory.default.pull_requests
    WHERE NOT author_is_bot AND NOT draft
      AND contains(labels, 'cla-signed')
      AND created_at >= current_date - INTERVAL '12' MONTH
      AND created_at < current_date - INTERVAL '30' DAY
)
SELECT
    author_group AS "Author"
  , size AS "Size"
  , count(*) AS "Pull requests"
  , format('%.0f%%', count(*) FILTER (WHERE state = 'merged') * 100e0 / count(*)) AS "Merged"
  , memory.default.human_duration(approx_percentile(response_seconds, 0.5)) AS "Median time to first response"
  , memory.default.human_duration(approx_percentile(merge_seconds, 0.5)) AS "Median time to merge"
  , memory.default.human_duration(approx_percentile(merge_seconds, 0.9)) AS "90% merged within"
FROM pull_requests
GROUP BY author_group, size, size_rank
ORDER BY author_group = 'first PRs' DESC, size_rank
;

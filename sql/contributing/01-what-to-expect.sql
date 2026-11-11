-- What to expect when you open a pull request
-- Pull requests opened by people in the 6 full months before this one, by how many pull requests their author had merged before. If this is your first pull request, read the first row: it is what happened to others like you. Drafts are not counted.
-- A response is the first review or comment from another person, or the merge. No response means the pull request was closed, or is still open, without one. The time to merge counts only merged pull requests. Many first pull requests are never merged because the CLA is not signed: see the next report.
WITH
pull_requests AS (
    SELECT *
    FROM memory.default.pull_requests
    WHERE NOT author_is_bot AND NOT draft
      AND created_at >= date_trunc('month', current_date) - INTERVAL '6' MONTH
      AND created_at < date_trunc('month', current_date)
)
SELECT
    author_cohort AS "Author experience"
  , count(*) AS "Pull requests"
  , format('%.0f%%', count(*) FILTER (WHERE state = 'merged') * 100e0 / count(*)) AS "Merged"
  , format('%.0f%%', count(*) FILTER (WHERE state = 'closed') * 100e0 / count(*)) AS "Closed without merging"
  , format('%.0f%%', count(*) FILTER (WHERE state = 'open') * 100e0 / count(*)) AS "Still open"
  , format('%.0f%%', count(*) FILTER (WHERE responded_at IS NULL) * 100e0 / count(*)) AS "No response"
  , memory.default.human_duration(approx_percentile(to_unixtime(responded_at) - to_unixtime(created_at), 0.5)) AS "Median time to first response"
  , memory.default.human_duration(approx_percentile(to_unixtime(merged_at) - to_unixtime(created_at), 0.5)) AS "Median time to merge"
  , memory.default.human_duration(approx_percentile(to_unixtime(merged_at) - to_unixtime(created_at), 0.9)) AS "90% merged within"
FROM pull_requests
GROUP BY author_cohort, author_cohort_rank
ORDER BY author_cohort_rank
;

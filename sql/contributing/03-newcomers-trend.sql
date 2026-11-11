-- Is it getting better for newcomers?
-- Pull requests opened by people with no merged pull request yet, per quarter, newest first. The columns after "CLA signed" count only pull requests with a signed CLA, because the others are never merged. Closed as stale means closed by the stale bot. Drafts are not counted.
-- The last two quarters are not final: many of their pull requests are still open, so fewer are merged yet, and the medians count only the ones answered or merged so far. Compare a quarter with the same quarter a year before.
WITH
pull_requests AS (
    SELECT
        *
      , date_trunc('quarter', created_at) AS quarter
    FROM memory.default.pull_requests
    WHERE NOT author_is_bot AND NOT draft
      AND author_cohort = 'no merged PRs yet'
      AND created_at >= date_trunc('quarter', current_date) - INTERVAL '21' MONTH
)
, quarters AS (
    SELECT
        quarter
      , count(*) AS prs
      , count(*) FILTER (WHERE contains(labels, 'cla-signed')) AS signed
      , count(*) FILTER (WHERE contains(labels, 'cla-signed') AND state = 'merged') AS merged
      , count(*) FILTER (WHERE contains(labels, 'cla-signed') AND state = 'open') AS still_open
      , count(*) FILTER (WHERE contains(labels, 'cla-signed') AND closed_by_stale_bot) AS closed_stale
      , count(*) FILTER (WHERE contains(labels, 'cla-signed') AND responded_at IS NULL) AS no_response
      , approx_percentile(to_unixtime(responded_at) - to_unixtime(created_at), 0.5) FILTER (WHERE contains(labels, 'cla-signed')) AS median_response
      , approx_percentile(to_unixtime(merged_at) - to_unixtime(created_at), 0.5) FILTER (WHERE contains(labels, 'cla-signed')) AS median_merge
    FROM pull_requests
    GROUP BY quarter
)
SELECT
    format('%d-Q%d', year(quarter), quarter(quarter)) || if(quarter = date_trunc('quarter', current_date), ' (so far)', '') AS "Quarter"
  , prs AS "Pull requests"
  , format('%.0f%%', signed * 100e0 / prs) AS "CLA signed"
  , format('%.0f%%', merged * 100e0 / signed) AS "Merged"
  , format('%.0f%%', still_open * 100e0 / signed) AS "Still open"
  , format('%.0f%%', closed_stale * 100e0 / signed) AS "Closed as stale"
  , format('%.0f%%', no_response * 100e0 / signed) AS "No response"
  , memory.default.human_duration(median_response) AS "Median time to first response"
  , memory.default.human_duration(median_merge) AS "Median time to merge"
FROM quarters
ORDER BY quarter DESC
;

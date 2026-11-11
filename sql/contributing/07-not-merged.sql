-- What happens to pull requests that are not merged?
-- Pull requests opened by people in the 12 months before the last 30 days that were not merged, by the experience of their author. █ Stale: closed by the stale bot, which marks a pull request after 21 days without activity, and closes it 21 days later. ▒ Closed by its author or a maintainer. ░ Still open. Drafts are not counted.
-- No CLA and No response count the not merged pull requests without a signed CLA, and without any review or comment from another person. To keep yours from going stale, reply to reviews, push fixes, and ask for help in the #core-dev channel on the Trino Slack.
WITH
pull_requests AS (
    SELECT *
    FROM memory.default.pull_requests
    WHERE NOT author_is_bot AND NOT draft
      AND created_at >= current_date - INTERVAL '12' MONTH
      AND created_at < current_date - INTERVAL '30' DAY
)
, cohorts AS (
    SELECT
        author_cohort
      , author_cohort_rank
      , count(*) AS prs
      , count(*) FILTER (WHERE state != 'merged') AS not_merged
      , count(*) FILTER (WHERE closed_by_stale_bot) AS closed_stale
      , count(*) FILTER (WHERE state = 'closed' AND NOT closed_by_stale_bot) AS closed_other
      , count(*) FILTER (WHERE state = 'open') AS still_open
      , count(*) FILTER (WHERE state != 'merged' AND NOT contains(labels, 'cla-signed')) AS no_cla
      , count(*) FILTER (WHERE state != 'merged' AND first_response_at IS NULL) AS no_response
    FROM pull_requests
    GROUP BY author_cohort, author_cohort_rank
)
SELECT
    author_cohort AS "Author experience"
  , not_merged AS "Not merged"
  , format('%.0f%%', not_merged * 100e0 / prs) AS "Of all PRs"
  , memory.default.stacked(CAST(ARRAY[closed_stale, closed_other, still_open] AS array(double)), '█▒░', 30) AS "█ stale, ▒ closed, ░ open chart"
  , format('%.0f%%', closed_stale * 100e0 / not_merged) AS "Stale"
  , format('%.0f%%', closed_other * 100e0 / not_merged) AS "Closed"
  , format('%.0f%%', still_open * 100e0 / not_merged) AS "Open"
  , format('%.0f%%', no_cla * 100e0 / not_merged) AS "No CLA"
  , format('%.0f%%', no_response * 100e0 / not_merged) AS "No response"
FROM cohorts
ORDER BY author_cohort_rank
;

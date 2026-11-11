-- Sign the CLA first
-- Pull requests opened in the last 12 months by people with no merged pull request yet, by whether the cla-signed label was added. It is added once every author of the commits signed the [Contributor License Agreement](https://github.com/trinodb/cla).
-- Pull requests without a signed CLA are never merged, and most get no response from a person. Sign it before you ask for a review. Drafts are not counted.
WITH
pull_requests AS (
    SELECT *
    FROM memory.default.pull_requests
    WHERE NOT author_is_bot AND NOT draft
      AND author_cohort = 'no merged PRs yet'
      AND created_at >= current_date - INTERVAL '12' MONTH
)
SELECT
    if(contains(labels, 'cla-signed'), 'signed', 'not signed') AS "CLA"
  , count(*) AS "Pull requests"
  , format('%.0f%%', count(*) FILTER (WHERE state = 'merged') * 100e0 / count(*)) AS "Merged"
  , format('%.0f%%', count(*) FILTER (WHERE state = 'closed') * 100e0 / count(*)) AS "Closed without merging"
  , format('%.0f%%', count(*) FILTER (WHERE state = 'open') * 100e0 / count(*)) AS "Still open"
  , format('%.0f%%', count(*) FILTER (WHERE responded_at IS NULL) * 100e0 / count(*)) AS "No response"
FROM pull_requests
GROUP BY contains(labels, 'cla-signed')
ORDER BY contains(labels, 'cla-signed') DESC
;

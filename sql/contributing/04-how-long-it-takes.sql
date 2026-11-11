-- How long until a response, and until the merge?
-- The share of pull requests that got their first response from another person, or were merged, within the time in the first column. For pull requests opened by people in the 12 months before the last 30 days, so each one had at least a month. Drafts and pull requests without a signed CLA are not counted.
-- Read a row like this: within 1 day, this share of first pull requests got a response. The last row is the share that ever got one. If yours waits longer than most, ask for a review in the #core-dev channel on the Trino Slack.
WITH
pull_requests AS (
    SELECT
        if(author_cohort = 'no merged PRs yet', 'newcomer', 'other') AS author_group
      , to_unixtime(responded_at) - to_unixtime(created_at) AS response_seconds
      , to_unixtime(merged_at) - to_unixtime(created_at) AS merge_seconds
    FROM memory.default.pull_requests
    WHERE NOT author_is_bot AND NOT draft
      AND contains(labels, 'cla-signed')
      AND created_at >= current_date - INTERVAL '12' MONTH
      AND created_at < current_date - INTERVAL '30' DAY
)
, limits AS (
    SELECT *
    FROM (
        VALUES
            (1, 'within 1 hour', 3600e0)
          , (2, 'within 4 hours', 4 * 3600e0)
          , (3, 'within 1 day', 86400e0)
          , (4, 'within 2 days', 2 * 86400e0)
          , (5, 'within 1 week', 7 * 86400e0)
          , (6, 'within 2 weeks', 14 * 86400e0)
          , (7, 'within 30 days', 30 * 86400e0)
          , (8, 'within 90 days', 90 * 86400e0)
          , (9, 'ever, so far', infinity())
    ) AS t(rank, label, seconds)
)
SELECT
    l.label AS "Time since opened"
  , format('%.0f%%', count(*) FILTER (WHERE p.author_group = 'newcomer' AND p.response_seconds <= l.seconds) * 100e0 / count(*) FILTER (WHERE p.author_group = 'newcomer')) AS "Responded: first PRs"
  , format('%.0f%%', count(*) FILTER (WHERE p.author_group = 'other' AND p.response_seconds <= l.seconds) * 100e0 / count(*) FILTER (WHERE p.author_group = 'other')) AS "Responded: others"
  , format('%.0f%%', count(*) FILTER (WHERE p.author_group = 'newcomer' AND p.merge_seconds <= l.seconds) * 100e0 / count(*) FILTER (WHERE p.author_group = 'newcomer')) AS "Merged: first PRs"
  , format('%.0f%%', count(*) FILTER (WHERE p.author_group = 'other' AND p.merge_seconds <= l.seconds) * 100e0 / count(*) FILTER (WHERE p.author_group = 'other')) AS "Merged: others"
FROM limits l
CROSS JOIN pull_requests p
GROUP BY l.rank, l.label
ORDER BY l.rank
;

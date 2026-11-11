-- Where is review help needed?
-- Areas by the labels that a workflow adds from the changed paths, like a connector, docs, or ui. Changes only to the engine, the build, or CI get no label, and changes to more than 3 areas at once, like to all connectors, are counted as many areas. Open counts the open pull requests now, and those without any review or comment from another person yet. The other columns are for pull requests opened in the 12 months before the last 30 days. Drafts, bots and pull requests without a signed CLA are not counted.
-- Reviewers: the areas on top have the most pull requests that nobody answered yet. Contributors: compare the median times to see where to expect a longer wait, and ask for a review in the #core-dev channel on the Trino Slack if yours waits longer.
WITH
pull_requests AS (
    SELECT *
    FROM memory.default.pull_requests
    WHERE NOT author_is_bot AND NOT draft
      AND contains(labels, 'cla-signed')
      AND (state = 'open' OR created_at >= current_date - INTERVAL '12' MONTH)
)
, area_prs AS (
    SELECT p.*, area
    FROM pull_requests p
    -- a change to many connectors at once would be the typical pull request of every small connector
    CROSS JOIN unnest(CASE
        WHEN cardinality(p.area_labels) = 0 THEN ARRAY['(no area label)']
        WHEN cardinality(p.area_labels) > 3 THEN ARRAY['(many areas)']
        ELSE p.area_labels
    END) AS t(area)
)
, stats AS (
    SELECT
        area
      , count(*) FILTER (WHERE state = 'open') AS open_now
      , count(*) FILTER (WHERE state = 'open' AND responded_at IS NULL) AS open_without_response
      , count(*) FILTER (WHERE in_period) AS prs
      , count(*) FILTER (WHERE in_period AND state = 'merged') AS merged
      , count(*) FILTER (WHERE in_period AND responded_at IS NULL) AS no_response
      , approx_percentile(to_unixtime(responded_at) - to_unixtime(created_at), 0.5) FILTER (WHERE in_period) AS median_response
      , approx_percentile(to_unixtime(merged_at) - to_unixtime(created_at), 0.5) FILTER (WHERE in_period) AS median_merge
    FROM (
        SELECT
            *
          , created_at >= current_date - INTERVAL '12' MONTH AND created_at < current_date - INTERVAL '30' DAY AS in_period
        FROM area_prs
    )
    GROUP BY area
)
SELECT
    area AS "Area"
  , open_now AS "Open"
  , open_without_response AS "Open without response"
  , prs AS "Opened in 12 months"
  , format('%.0f%%', merged * 100e0 / prs) AS "Merged"
  , format('%.0f%%', no_response * 100e0 / prs) AS "No response"
  , memory.default.human_duration(median_response) AS "Median time to first response"
  , memory.default.human_duration(median_merge) AS "Median time to merge"
FROM stats
WHERE prs >= 10
ORDER BY open_without_response DESC, median_response DESC
LIMIT 25
;

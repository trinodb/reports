-- Where is the focus?
-- Pull requests opened by people in the last 12 full months, by area: the labels that a workflow adds from the changed paths, like a connector, docs, or ui. Changes only to the engine, the build, or CI get no label, and changes to more than 3 areas at once, like to all connectors, are counted as many areas. One pull request can be in up to 3 areas, so the shares add up to more than 100%.
-- The chart has one character per month, oldest on the left, and each row has its own scale. This is what the project works on now; the next report shows the modules where merged code changes, including the engine.
WITH
months AS (
    SELECT month
    FROM unnest(sequence(date_trunc('month', current_date) - INTERVAL '12' MONTH, date_trunc('month', current_date) - INTERVAL '1' MONTH, INTERVAL '1' MONTH)) AS t(month)
)
, pull_requests AS (
    SELECT
        number
      , author
      , created_at
      , date_trunc('month', created_at) AS month
      , area_labels
    FROM memory.default.pull_requests
    WHERE NOT author_is_bot
      AND created_at >= date_trunc('month', current_date) - INTERVAL '12' MONTH
      AND created_at < date_trunc('month', current_date)
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
, totals AS (
    SELECT
        area
      , count(*) AS prs
      , count(DISTINCT author) AS authors
    FROM area_prs
    GROUP BY area
)
, monthly AS (
    SELECT a.area, m.month, count(p.number) AS prs
    FROM totals a
    CROSS JOIN months m
    LEFT JOIN area_prs p ON p.area = a.area AND p.month = m.month
    GROUP BY a.area, m.month
)
SELECT
    t.area AS "Area"
  , t.prs AS "PRs"
  , format('%.0f%%', t.prs * 100e0 / (SELECT count(*) FROM pull_requests)) AS "Share"
  , t.authors AS "Authors"
  , memory.default.sparkline(array_agg(CAST(m.prs AS double) ORDER BY m.month)) AS "Per month chart"
FROM totals t
JOIN monthly m ON m.area = t.area
WHERE t.prs > 0
GROUP BY t.area, t.prs, t.authors
ORDER BY t.prs DESC
LIMIT 25
;

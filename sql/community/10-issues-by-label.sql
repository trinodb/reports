-- Which areas get the most issues?
-- Issues by label: open now, and opened and closed in the last 12 months, with the change of the backlog. An issue with many labels counts for each of them, and the last row shows the issues without a label.
-- A label with a growing backlog needs an owner. Labels like good first issue are a place to start for new contributors.
WITH
issues_only AS (
    -- the table has pull requests too, and only some of them have pull_request_url set
    SELECT
        i.number
      , i.state
      , i.created_at
      , if(i.state = 'closed', i.closed_at) AS closed_at
      -- label names; rows saved by an older sync have whole label objects instead
      , array_distinct(filter(
            transform(coalesce(i.labels, ARRAY[]), label -> if(label LIKE '{%', json_extract_scalar(label, '$.name'), label)),
            label -> label IS NOT NULL AND label != '')) AS labels
    FROM issues i
    WHERE i.owner = 'trinodb' AND i.repo = 'trino'
      AND i.pull_request_url IS NULL
      AND NOT EXISTS (SELECT 1 FROM pulls p WHERE (p.owner, p.repo, p.number) = (i.owner, i.repo, i.number))
      AND (i.state = 'open' OR i.created_at >= current_date - INTERVAL '1' YEAR OR i.closed_at >= current_date - INTERVAL '1' YEAR)
)
, labelled AS (
    SELECT i.number, i.state, i.created_at, i.closed_at, l.label
    FROM issues_only i
    CROSS JOIN unnest(i.labels) AS l (label)
)
, per_label AS (
    SELECT
        label
      , count(*) FILTER (WHERE state = 'open') AS open_issues
      , count(*) FILTER (WHERE created_at >= current_date - INTERVAL '1' YEAR) AS opened
      , count(*) FILTER (WHERE closed_at >= current_date - INTERVAL '1' YEAR) AS closed
    FROM labelled
    GROUP BY label
)
, top_labels AS (
    SELECT label, open_issues, opened, closed, 1 AS row_group
    FROM per_label
    ORDER BY open_issues DESC, opened DESC, label
    LIMIT 25
)
, without_label AS (
    SELECT
        'No label' AS label
      , count(*) FILTER (WHERE state = 'open') AS open_issues
      , count(*) FILTER (WHERE created_at >= current_date - INTERVAL '1' YEAR) AS opened
      , count(*) FILTER (WHERE closed_at >= current_date - INTERVAL '1' YEAR) AS closed
      , 2 AS row_group
    FROM issues_only
    WHERE cardinality(labels) = 0
)
, all_rows AS (
    SELECT * FROM top_labels
    UNION ALL
    SELECT * FROM without_label
)
SELECT
    label AS "Label"
  , open_issues AS "Open"
  , opened AS "Opened in 12 months"
  , closed AS "Closed in 12 months"
  , CASE
        WHEN opened > closed THEN format('▲ +%d', opened - closed)
        WHEN opened < closed THEN format('▼ %d', opened - closed)
        ELSE '= 0'
    END AS "Backlog change"
FROM all_rows
ORDER BY row_group, open_issues DESC, opened DESC, label
;

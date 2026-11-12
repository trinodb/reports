-- Are issues handled as fast as they come in?
-- Issues, not pull requests, opened and closed in each quarter since 2019, newest first, and the issues open at the end of the quarter. In the chart, opened issues grow to the left, and closed ones to the right, so the backlog grows when the left part is longer.
-- A backlog that keeps growing needs triage: close what is fixed or can't be reproduced, and label the rest.
WITH
issues_only AS (
    -- the table has pull requests too, and only some of them have pull_request_url set
    SELECT
        i.number
      , i.created_at
      -- reopened issues keep the time they were closed before
      , if(i.state = 'closed', i.closed_at) AS closed_at
    FROM issues i
    WHERE i.owner = 'trinodb' AND i.repo = 'trino'
      AND i.pull_request_url IS NULL
      AND NOT EXISTS (SELECT 1 FROM pulls p WHERE (p.owner, p.repo, p.number) = (i.owner, i.repo, i.number))
)
, quarters AS (
    SELECT quarter
    FROM unnest(sequence(DATE '2019-01-01', date_trunc('quarter', current_date), INTERVAL '3' MONTH)) AS t(quarter)
)
, per_quarter AS (
    SELECT
        q.quarter
      , count_if(date_trunc('quarter', i.created_at) = q.quarter) AS opened
      , count_if(date_trunc('quarter', i.closed_at) = q.quarter) AS closed
      , count_if(i.created_at < q.quarter + INTERVAL '3' MONTH AND (i.closed_at IS NULL OR i.closed_at >= q.quarter + INTERVAL '3' MONTH)) AS open_issues
    FROM quarters q
    CROSS JOIN issues_only i
    GROUP BY q.quarter
)
SELECT
    format('%d-Q%d', year(quarter), quarter(quarter)) || if(quarter = date_trunc('quarter', current_date), ' so far', '') AS "Quarter"
  , opened AS "Opened"
  , closed AS "Closed"
  , CASE
        WHEN opened > closed THEN format('▲ +%d', opened - closed)
        WHEN opened < closed THEN format('▼ %d', opened - closed)
        ELSE '= 0'
    END AS "Backlog change"
  , open_issues AS "Open at the end"
  , lpad(memory.default.hbar(opened, greatest(max(opened) OVER (), max(closed) OVER ()), 30), 30, ' ') || '│' || rpad(memory.default.hbar(closed, greatest(max(opened) OVER (), max(closed) OVER ()), 30), 30, ' ') AS "Opened ◀ chart ▶ Closed"
FROM per_quarter
ORDER BY quarter DESC
;

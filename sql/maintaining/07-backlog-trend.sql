-- Is the backlog growing?
-- Pull requests opened, merged, and closed without merging per month, and how many were open at the end of the month. When the net change stays above zero, the project gets more pull requests than it can review: look at what waits on reviewers above.
-- Closed by the stale bot is part of closed. Bots' pull requests are not counted. The current month is not complete.
WITH
months AS (
    SELECT month, month + INTERVAL '1' MONTH AS month_end
    FROM unnest(sequence(date_trunc('month', current_date) - INTERVAL '23' MONTH, date_trunc('month', current_date), INTERVAL '1' MONTH)) AS m(month)
)
, prs AS (
    SELECT number, state, created_at, coalesce(merged_at, closed_at) AS closed_at, closed_by_stale_bot
    FROM memory.default.pull_requests
    WHERE NOT author_is_bot
)
, counted AS (
    SELECT
        m.month
      , count(*) FILTER (WHERE p.created_at >= m.month AND p.created_at < m.month_end) AS opened
      , count(*) FILTER (WHERE p.state = 'merged' AND p.closed_at >= m.month AND p.closed_at < m.month_end) AS merged
      , count(*) FILTER (WHERE p.state = 'closed' AND p.closed_at >= m.month AND p.closed_at < m.month_end) AS closed
      , count(*) FILTER (WHERE p.state = 'closed' AND p.closed_at >= m.month AND p.closed_at < m.month_end AND p.closed_by_stale_bot) AS closed_by_stale_bot
      -- open at the end of the month: opened before it ends, and not closed or closed after it ends
      , count(*) FILTER (WHERE p.created_at < m.month_end AND (p.closed_at IS NULL OR p.closed_at >= m.month_end)) AS open_at_end
    FROM months m
    CROSS JOIN prs p
    GROUP BY m.month
)
-- printed as a chart, so that the bars line up
SELECT
    format_datetime(month, 'yyyy-MM') AS "Month"
  , opened AS "Opened"
  , merged AS "Merged"
  , closed AS "Closed"
  , closed_by_stale_bot AS "By stale bot"
  , CASE
        WHEN opened - merged - closed > 0 THEN format('▲ +%d', opened - merged - closed)
        WHEN opened - merged - closed < 0 THEN format('▼ %d', opened - merged - closed)
        ELSE '= 0'
    END AS "Net change"
  , open_at_end AS "Open at end"
  , memory.default.hbar(open_at_end, max(open_at_end) OVER (), 40) AS "Open at the end of the month"
FROM counted
ORDER BY month DESC
;

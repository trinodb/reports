-- Are issues handled as fast as they come in?
-- Issues, not pull requests, opened and closed per month, and the issues open at the end of the month; ▲ means the backlog grew. The last two columns are for issues opened by users, not maintainers or bots: the median wait for a first comment from another person, and the share with none yet.
-- A backlog that keeps growing needs triage: close what is fixed or can't be reproduced, and label the rest.
WITH
issues_only AS (
    -- the table has pull requests too, and only some of them have pull_request_url set
    SELECT
        i.number
      , i.user_login
      , i.created_at
      -- reopened issues keep the time they were closed before
      , if(i.state = 'closed', i.closed_at) AS closed_at
      , NOT memory.default.is_bot(i.user_login) AND coalesce(ct.role, 'newcomer') != 'maintainer' AS by_user
    FROM issues i
    LEFT JOIN memory.default.contributors ct ON ct.login = i.user_login
    WHERE i.owner = 'trinodb' AND i.repo = 'trino'
      AND i.pull_request_url IS NULL
      AND NOT EXISTS (SELECT 1 FROM pulls p WHERE (p.owner, p.repo, p.number) = (i.owner, i.repo, i.number))
)
, first_responses AS (
    SELECT i.number, min(c.created_at) AS first_response_at
    FROM issues_only i
    JOIN issue_comments c ON c.owner = 'trinodb' AND c.repo = 'trino' AND c.issue_number = i.number
    WHERE c.user_login != i.user_login AND NOT memory.default.is_bot(c.user_login)
    GROUP BY i.number
)
, months AS (
    SELECT month
    FROM unnest(sequence(date_trunc('month', current_date) - INTERVAL '23' MONTH, date_trunc('month', current_date), INTERVAL '1' MONTH)) AS m (month)
)
, opened AS (
    SELECT
        date_trunc('month', i.created_at) AS month
      , count(*) AS opened
      , count(*) FILTER (WHERE i.by_user) AS opened_by_users
      , approx_percentile(to_milliseconds(r.first_response_at - i.created_at) / 1000e0, 0.5) FILTER (WHERE i.by_user) AS median_response_seconds
      , count(*) FILTER (WHERE i.by_user AND r.first_response_at IS NULL) AS without_response
    FROM issues_only i
    LEFT JOIN first_responses r ON r.number = i.number
    WHERE i.created_at >= date_trunc('month', current_date) - INTERVAL '23' MONTH
    GROUP BY 1
)
, closed AS (
    SELECT date_trunc('month', closed_at) AS month, count(*) AS closed
    FROM issues_only
    WHERE closed_at >= date_trunc('month', current_date) - INTERVAL '23' MONTH
    GROUP BY 1
)
, open_at_end AS (
    SELECT m.month, count(i.number) AS open_issues
    FROM months m
    LEFT JOIN issues_only i ON i.created_at < m.month + INTERVAL '1' MONTH AND (i.closed_at IS NULL OR i.closed_at >= m.month + INTERVAL '1' MONTH)
    GROUP BY m.month
)
, per_month AS (
    SELECT
        m.month
      , coalesce(o.opened, 0) AS opened
      , coalesce(c.closed, 0) AS closed
      , e.open_issues
      , coalesce(o.opened_by_users, 0) AS opened_by_users
      , o.median_response_seconds
      , coalesce(o.without_response, 0) AS without_response
    FROM months m
    LEFT JOIN opened o ON o.month = m.month
    LEFT JOIN closed c ON c.month = m.month
    JOIN open_at_end e ON e.month = m.month
)
SELECT
    format('%s%s', date_format(month, '%Y-%m'), if(month = date_trunc('month', current_date), ' so far', '')) AS "Month"
  , opened AS "Opened"
  , closed AS "Closed"
  , CASE
        WHEN opened > closed THEN format('▲ +%d', opened - closed)
        WHEN opened < closed THEN format('▼ %d', opened - closed)
        ELSE '= 0'
    END AS "Backlog change"
  , open_issues AS "Open at month end"
  , coalesce(memory.default.human_duration(median_response_seconds), '') AS "Median wait for a response"
  , if(opened_by_users > 0, format('%.0f%%', without_response * 100e0 / opened_by_users), '') AS "No response yet"
FROM per_month
ORDER BY month DESC
;

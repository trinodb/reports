-- Activity per repository
-- Pull requests and issues of people in the clients and tools of Trino in the last 12 months, what is open now, and the median time until another person commented or reviewed a pull request. Pull requests of bots, like dependency updates, are counted on their own.
-- A repository with many open pull requests or issues, or a slow first response, needs more maintainers; ask for help in #dev on Slack.
WITH
months AS (
    SELECT month
    FROM unnest(sequence(date_trunc('month', current_date) - INTERVAL '23' MONTH, date_trunc('month', current_date), INTERVAL '1' MONTH)) AS t(month)
)
, repositories AS (
    SELECT DISTINCT repo
    FROM memory.default.repository_pull_requests
)
, pull_requests AS (
    SELECT
        repo
      , count(*) FILTER (WHERE NOT author_is_bot AND created_at >= current_date - INTERVAL '12' MONTH) AS opened
      , count(*) FILTER (WHERE NOT author_is_bot AND merged_at >= current_date - INTERVAL '12' MONTH) AS merged
      , count(*) FILTER (WHERE author_is_bot AND created_at >= current_date - INTERVAL '12' MONTH) AS opened_by_bots
      , count(*) FILTER (WHERE state = 'open' AND NOT author_is_bot) AS open_now
      , count(*) FILTER (WHERE state = 'open' AND author_is_bot) AS open_by_bots
      , approx_percentile(to_unixtime(first_response_at) - to_unixtime(created_at), 0.5)
            FILTER (WHERE NOT author_is_bot AND created_at >= current_date - INTERVAL '12' MONTH) AS median_response_seconds
    FROM memory.default.repository_pull_requests
    GROUP BY repo
)
, issues AS (
    SELECT
        repo
      , count(*) FILTER (WHERE NOT author_is_bot AND created_at >= current_date - INTERVAL '12' MONTH) AS opened
      , count(*) FILTER (WHERE state = 'open') AS open_now
    FROM memory.default.repository_issues
    GROUP BY repo
)
, people AS (
    SELECT repo, count(DISTINCT login) AS people
    FROM (
        SELECT repo, author AS login, created_at AS at FROM memory.default.repository_pull_requests
        UNION ALL
        SELECT repo, author, created_at FROM memory.default.repository_issues
        UNION ALL
        SELECT repo, user_login, created_at FROM issue_comments WHERE owner = 'trinodb' AND repo != 'trino'
        UNION ALL
        SELECT repo, user_login, submitted_at FROM reviews WHERE owner = 'trinodb' AND repo != 'trino'
    )
    WHERE at >= current_date - INTERVAL '12' MONTH AND NOT memory.default.is_bot(login)
    GROUP BY repo
)
, per_month AS (
    SELECT r.repo, m.month, count(p.number) AS opened
    FROM repositories r
    CROSS JOIN months m
    LEFT JOIN memory.default.repository_pull_requests p ON p.repo = r.repo AND NOT p.author_is_bot AND date_trunc('month', p.created_at) = m.month
    GROUP BY r.repo, m.month
)
, trends AS (
    SELECT repo, array_agg(opened * 1e0 ORDER BY month) AS opened
    FROM per_month
    GROUP BY repo
)
SELECT
    r.repo AS "Repository"
  , coalesce(pe.people, 0) AS "People"
  , p.opened AS "PRs"
  , p.merged AS "Merged"
  , coalesce(memory.default.human_duration(p.median_response_seconds), '') AS "First response"
  , p.open_now AS "Open PRs"
  , coalesce(i.opened, 0) AS "Issues"
  , coalesce(i.open_now, 0) AS "Open issues"
  , format('%d / %d', p.opened_by_bots, p.open_by_bots) AS "Bot PRs / open"
  , memory.default.sparkline(t.opened) AS "PRs per month, 24 months chart"
FROM repositories r
JOIN pull_requests p ON p.repo = r.repo
LEFT JOIN issues i ON i.repo = r.repo
LEFT JOIN people pe ON pe.repo = r.repo
JOIN trends t ON t.repo = r.repo
ORDER BY p.opened + coalesce(i.opened, 0) DESC
;

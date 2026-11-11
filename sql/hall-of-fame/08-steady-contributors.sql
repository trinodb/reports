-- Steady contributors
-- The people active in the most of the last 24 months, where active means they had a pull request merged or reviewed one of someone else. One mark is one month, oldest on the left, and its height is the number of merged and reviewed pull requests in the month, on the scale of each row; a dot is a month without either.
-- Steady, long-term work keeps the project going, even when it never tops a ranking. Bots are not counted.
WITH
months AS (
    SELECT month
    FROM unnest(sequence(date_trunc('month', current_date) - interval '23' month, date_trunc('month', current_date), interval '1' month)) AS t(month)
)
, activity AS (
    SELECT author AS login, CAST(date_trunc('month', merged_at) AS date) AS month, number
    FROM memory.default.pull_requests
    WHERE state = 'merged' AND NOT author_is_bot
    UNION ALL
    SELECT e.actor, CAST(date_trunc('month', e.event_at) AS date), e.number
    FROM memory.default.pull_request_events e
    WHERE e.kind = 'review' AND NOT e.by_author AND NOT e.by_bot
)
, monthly AS (
    SELECT login, month, count(DISTINCT number) AS prs
    FROM activity
    WHERE month >= (SELECT min(month) FROM months)
    GROUP BY login, month
)
, people AS (
    SELECT
        login
      , count(*) AS active_months
      , sum(prs) AS prs
    FROM monthly
    GROUP BY login
    ORDER BY active_months DESC, prs DESC
    LIMIT 20
)
SELECT
    p.active_months AS "Months active"
  , p.prs AS "Merged or reviewed"
  -- a chart of one mark per month
  , memory.default.sparkline(array_agg(CAST(coalesce(m.prs, 0) AS double) ORDER BY mo.month)) AS "Last 24 months"
  , memory.default.user_link(p.login) AS "Person"
FROM people p
CROSS JOIN months mo
LEFT JOIN monthly m ON m.login = p.login AND m.month = mo.month
GROUP BY p.login, p.active_months, p.prs
ORDER BY p.active_months DESC, p.prs DESC, p.login;

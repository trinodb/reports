-- Is the community growing?
-- People, not bots, who were active in the repository, by what they did. The chart has one character per month for the last 24 full months, each row on its own scale, and the numbers compare the last 90 days and the last 12 months with the period before.
-- When authors grow faster than reviewers, pull requests wait longer, so reviewing is the most useful help.
WITH
issues_only AS (
    -- the table has pull requests too, and only some of them have pull_request_url set
    SELECT i.number, i.user_login, i.created_at
    FROM issues i
    WHERE i.owner = 'trinodb' AND i.repo = 'trino'
      AND i.pull_request_url IS NULL
      AND NOT EXISTS (SELECT 1 FROM pulls p WHERE (p.owner, p.repo, p.number) = (i.owner, i.repo, i.number))
)
, activity AS (
    SELECT author AS login, created_at AS event_at, 'Opened a pull request' AS kind
    FROM memory.default.pull_requests
    UNION ALL
    SELECT actor, event_at, 'Reviewed a pull request'
    FROM memory.default.pull_request_events
    WHERE kind = 'review' AND NOT by_author
    UNION ALL
    SELECT user_login, created_at, 'Commented on an issue or pull request'
    FROM issue_comments
    WHERE owner = 'trinodb' AND repo = 'trino'
    UNION ALL
    SELECT user_login, created_at, 'Opened an issue'
    FROM issues_only
)
, people_activity AS (
    SELECT login, event_at, kind, min(event_at) OVER (PARTITION BY login) AS first_event_at
    FROM activity
    WHERE login IS NOT NULL AND NOT memory.default.is_bot(login)
)
, recent_activity AS (
    -- every action counts for its own row and for the row of any action, and the first action of a person for the row of newcomers
    SELECT DISTINCT k.kind, a.login, date_trunc('day', a.event_at) AS day
    FROM people_activity a
    CROSS JOIN unnest(ARRAY[a.kind, 'Did any of these', if(a.event_at = a.first_event_at, 'Was active for the first time')]) AS k (kind)
    WHERE k.kind IS NOT NULL
      AND a.event_at >= least(date_trunc('month', current_date) - INTERVAL '24' MONTH, current_date - INTERVAL '2' YEAR)
)
, kinds (kind, kind_rank) AS (
    VALUES
        ('Did any of these', 1)
      , ('Opened a pull request', 2)
      , ('Reviewed a pull request', 3)
      , ('Commented on an issue or pull request', 4)
      , ('Opened an issue', 5)
      , ('Was active for the first time', 6)
)
, months AS (
    SELECT month
    FROM unnest(sequence(date_trunc('month', current_date) - INTERVAL '24' MONTH, date_trunc('month', current_date) - INTERVAL '1' MONTH, INTERVAL '1' MONTH)) AS m (month)
)
, people_per_month AS (
    SELECT kind, date_trunc('month', day) AS month, count(DISTINCT login) AS people
    FROM recent_activity
    GROUP BY kind, date_trunc('month', day)
)
, monthly_chart AS (
    SELECT k.kind, memory.default.sparkline(array_agg(CAST(coalesce(p.people, 0) AS double) ORDER BY m.month)) AS chart
    FROM kinds k
    CROSS JOIN months m
    LEFT JOIN people_per_month p ON p.kind = k.kind AND p.month = m.month
    GROUP BY k.kind
)
, periods AS (
    SELECT
        kind
      , login
      , bool_or(day >= current_date - INTERVAL '90' DAY) AS in_last_90_days
      , bool_or(day >= current_date - INTERVAL '180' DAY AND day < current_date - INTERVAL '90' DAY) AS in_previous_90_days
      , bool_or(day >= current_date - INTERVAL '1' YEAR) AS in_last_year
      , bool_or(day >= current_date - INTERVAL '2' YEAR AND day < current_date - INTERVAL '1' YEAR) AS in_previous_year
    FROM recent_activity
    GROUP BY kind, login
)
, totals AS (
    SELECT
        kind
      , count_if(in_last_90_days) AS last_90_days
      , count_if(in_previous_90_days) AS previous_90_days
      , count_if(in_last_year) AS last_year
      , count_if(in_previous_year) AS previous_year
    FROM periods
    GROUP BY kind
)
SELECT
    k.kind AS "People who"
  , c.chart AS "Per month, 24 months chart"
  , t.last_90_days AS "Last 90 days"
  , memory.default.delta(t.last_90_days, t.previous_90_days) AS "vs previous 90"
  , t.last_year AS "Last 12 months"
  , memory.default.delta(t.last_year, t.previous_year) AS "vs previous 12"
FROM kinds k
JOIN monthly_chart c ON c.kind = k.kind
JOIN totals t ON t.kind = k.kind
ORDER BY k.kind_rank
;

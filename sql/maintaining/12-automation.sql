-- What bots do
-- Pull requests opened by bots, and reviews and comments bots wrote in pull requests, in the last 12 months. Bots are counted nowhere else on this page. Use it to judge the load of dependency updates and how many bot comments authors and reviewers have to read.
-- Activity is the number of pull requests, reviews, and comments per month, one character per month, oldest first, scaled to each bot's busiest month. Time to merge is the median of merged pull requests.
WITH
months AS (
    SELECT month
    FROM unnest(sequence(date_trunc('month', current_date) - INTERVAL '11' MONTH, date_trunc('month', current_date), INTERVAL '1' MONTH)) AS m(month)
)
, opened AS (
    SELECT author AS bot, created_at AS event_at, state, merged_at, 'opened' AS kind
    FROM memory.default.pull_requests
    WHERE author_is_bot
      AND created_at >= date_trunc('month', current_date) - INTERVAL '11' MONTH
)
, actions AS (
    SELECT bot, event_at, kind FROM opened
    UNION ALL
    SELECT actor, event_at, kind
    FROM memory.default.pull_request_events
    WHERE by_bot AND kind IN ('review', 'comment')
      AND event_at >= date_trunc('month', current_date) - INTERVAL '11' MONTH
)
, per_bot AS (
    SELECT
        a.bot
      , count(*) FILTER (WHERE a.kind = 'opened') AS opened
      , count(*) FILTER (WHERE a.kind = 'review') AS reviews
      , count(*) FILTER (WHERE a.kind = 'comment') AS comments
      , count(*) AS actions
    FROM actions a
    GROUP BY a.bot
)
, per_bot_prs AS (
    SELECT
        bot
      , count(*) FILTER (WHERE state = 'merged') AS merged
      , count(*) FILTER (WHERE state = 'closed') AS closed
      , count(*) FILTER (WHERE state = 'open') AS still_open
      , approx_percentile(to_milliseconds(merged_at - event_at) / 1000e0, 0.5) FILTER (WHERE state = 'merged') AS median_time_to_merge
    FROM opened
    GROUP BY bot
)
, monthly AS (
    SELECT b.bot, m.month, count(a.bot) AS actions
    FROM per_bot b
    CROSS JOIN months m
    LEFT JOIN actions a ON a.bot = b.bot AND date_trunc('month', a.event_at) = m.month
    GROUP BY b.bot, m.month
)
, activity AS (
    SELECT bot, memory.default.sparkline(array_agg(actions * 1e0 ORDER BY month)) AS activity
    FROM monthly
    GROUP BY bot
)
-- printed as a chart, so that the sparklines line up
SELECT
    b.bot AS "Bot"
  , b.opened AS "PRs opened"
  , coalesce(p.merged, 0) AS "Merged"
  , coalesce(p.closed, 0) AS "Closed"
  , coalesce(p.still_open, 0) AS "Open"
  , coalesce(memory.default.human_duration(p.median_time_to_merge), '') AS "Time to merge"
  , b.reviews AS "Reviews"
  , b.comments AS "Comments"
  , a.activity AS "Activity, 12 months"
FROM per_bot b
LEFT JOIN per_bot_prs p ON p.bot = b.bot
JOIN activity a ON a.bot = b.bot
ORDER BY b.actions DESC
;

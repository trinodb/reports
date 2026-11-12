-- When is the Slack community awake?
-- Messages and replies posted by people, not bots, in the archived channels in the last 12 full months, by the day of the week and the hour in UTC. Darker cells have more messages.
-- Ask when the cells are dark to get a quick answer; the next report shows where people live.
WITH
channels AS (
    -- a row for every version of a channel, so the synced channels are found by their name, like the sync does
    SELECT id
    FROM trinocicd.slack.channels
    WHERE name IN ('announcements', 'python', 'kubernetes', 'iceberg', 'delta-lake', 'trino-gateway', 'trino-gateway-dev', 'core-dev', 'dev', 'troubleshooting', 'beginner')
    GROUP BY id
)
, bots AS (
    SELECT id
    FROM trinocicd.slack.users
    GROUP BY id
    HAVING bool_or(is_bot) OR id = 'USLACKBOT'
)
, last_month AS (
    -- the month of the newest saved message isn't complete
    SELECT date_trunc('month', CAST(max(ts) AT TIME ZONE 'UTC' AS date)) AS month
    FROM trinocicd.slack.messages
)
, posts AS (
    -- top-level messages; replies broadcast to the channel are in the replies too
    SELECT channel, user, ts
    FROM trinocicd.slack.messages
    WHERE (subtype IS NULL OR subtype IN ('file_share', 'me_message'))
      AND (thread_ts IS NULL OR thread_ts = ts)
    UNION ALL
    -- the replies table has the parent messages of threads too
    SELECT channel, user, ts
    FROM trinocicd.slack.replies
    WHERE (subtype IS NULL OR subtype IN ('file_share', 'me_message', 'thread_broadcast'))
      AND ts > thread_ts
)
, cells AS (
    SELECT
        day_of_week(p.ts AT TIME ZONE 'UTC') AS weekday
      , hour(p.ts AT TIME ZONE 'UTC') AS hour
      , count(*) AS messages
    FROM posts p
    CROSS JOIN last_month l
    WHERE p.channel IN (SELECT id FROM channels)
      AND p.user IS NOT NULL
      AND p.user NOT IN (SELECT id FROM bots)
      AND p.ts >= with_timezone(CAST(l.month - INTERVAL '12' MONTH AS timestamp), 'UTC')
      AND p.ts < with_timezone(CAST(l.month AS timestamp), 'UTC')
    GROUP BY 1, 2
)
, grid AS (
    SELECT d.weekday, h.hour, coalesce(c.messages, 0) AS messages
    FROM unnest(sequence(1, 7)) AS d (weekday)
    CROSS JOIN unnest(sequence(0, 23)) AS h (hour)
    LEFT JOIN cells c ON c.weekday = d.weekday AND c.hour = h.hour
)
, days AS (
    SELECT
        weekday
      , array_agg(messages ORDER BY hour) AS per_hour
      , sum(messages) AS messages
      , max(max(messages)) OVER () AS max_messages
    FROM grid
    GROUP BY weekday
)
-- the hours are drawn as a chart, two characters per hour, so the page prints them in a monospace font
SELECT
    element_at(ARRAY['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'], weekday) AS "Day"
  , array_join(transform(per_hour, v -> rpad('', 2, memory.default.shade(v, max_messages))), '') AS "00    03    06    09    12    15    18    21    "
  , messages AS "Messages"
  , format('%02d:00', array_position(per_hour, array_max(per_hour)) - 1) AS "Busiest hour"
FROM days
ORDER BY weekday
;

-- How active is Slack?
-- Messages and replies by people, not bots, in the archived Slack channels, and how many people posted them. The charts have one character per week for the last 26 full weeks, each row on its own scale, and the numbers compare the last 13 weeks with the 13 before.
-- Joining or leaving a channel isn't counted as a message. A channel that gets quieter may need someone to watch it.
WITH
channels AS (
    -- a row for every version of a channel, so the synced channels are found by their name, like the sync does
    SELECT id, min(name) AS name
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
, last_week AS (
    -- the sync runs on Mondays, so the current week is never complete
    SELECT date_trunc('week', CAST(max(ts) AT TIME ZONE 'UTC' AS date)) - INTERVAL '7' DAY AS week
    FROM trinocicd.slack.messages
)
, weeks AS (
    SELECT w.week
    FROM last_week l
    CROSS JOIN unnest(sequence(l.week - INTERVAL '175' DAY, l.week, INTERVAL '7' DAY)) AS w (week)
)
, people_posts AS (
    SELECT g.channel, p.user, date_trunc('week', CAST(p.ts AT TIME ZONE 'UTC' AS date)) AS week
    FROM posts p
    JOIN channels c ON c.id = p.channel
    CROSS JOIN unnest(ARRAY[c.name, 'All channels']) AS g (channel)
    WHERE p.user IS NOT NULL
      AND p.user NOT IN (SELECT id FROM bots)
      AND p.ts > (SELECT max(ts) FROM trinocicd.slack.messages) - INTERVAL '200' DAY
)
, recent_posts AS (
    SELECT p.*
    FROM people_posts p
    CROSS JOIN last_week l
    WHERE p.week BETWEEN l.week - INTERVAL '175' DAY AND l.week
)
, per_week AS (
    SELECT channel, week, count(*) AS messages, count(DISTINCT user) AS people
    FROM recent_posts
    GROUP BY channel, week
)
, per_period AS (
    SELECT
        p.channel
      , count(*) FILTER (WHERE p.week > l.week - INTERVAL '91' DAY) AS messages
      , count(*) FILTER (WHERE p.week <= l.week - INTERVAL '91' DAY) AS previous_messages
      , count(DISTINCT p.user) FILTER (WHERE p.week > l.week - INTERVAL '91' DAY) AS people
      , count(DISTINCT p.user) FILTER (WHERE p.week <= l.week - INTERVAL '91' DAY) AS previous_people
    FROM recent_posts p
    CROSS JOIN last_week l
    GROUP BY p.channel
)
, all_channels AS (
    SELECT name AS channel FROM channels
    UNION ALL
    SELECT 'All channels'
)
, charts AS (
    SELECT
        c.channel
      , memory.default.sparkline(array_agg(CAST(coalesce(w.messages, 0) AS double) ORDER BY ws.week)) AS messages_chart
      , memory.default.sparkline(array_agg(CAST(coalesce(w.people, 0) AS double) ORDER BY ws.week)) AS people_chart
    FROM all_channels c
    CROSS JOIN weeks ws
    LEFT JOIN per_week w ON w.channel = c.channel AND w.week = ws.week
    GROUP BY c.channel
)
SELECT
    c.channel AS "Channel"
  , c.messages_chart AS "Messages per week chart"
  , coalesce(p.messages, 0) AS "Messages"
  , memory.default.delta(p.messages, p.previous_messages) AS "Change"
  , c.people_chart AS "People per week"
  , coalesce(p.people, 0) AS "People"
  , memory.default.delta(p.people, p.previous_people) AS "Change"
FROM charts c
LEFT JOIN per_period p ON p.channel = c.channel
ORDER BY c.channel != 'All channels', coalesce(p.messages, 0) DESC, c.channel
;

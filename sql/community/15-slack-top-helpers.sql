-- Who helps others on Slack?
-- People who replied in the most threads that someone else started in the archived channels in the last 90 days, and in how many of them they replied first, by the name shown in Slack. Accounts with the same full name are counted as one person. Bots and deactivated accounts aren't listed.
-- Thank them, and if you know the answer to a question in troubleshooting or beginner, join them.
WITH
channels AS (
    -- a row for every version of a channel, so the synced channels are found by their name, like the sync does
    SELECT id, min(name) AS name
    FROM trinocicd.slack.channels
    WHERE name IN ('announcements', 'python', 'kubernetes', 'iceberg', 'delta-lake', 'trino-gateway', 'trino-gateway-dev', 'core-dev', 'dev', 'troubleshooting', 'beginner')
    GROUP BY id
)
, users AS (
    -- a row for every version of a user; the newest one has the current name
    SELECT
        id
      , bool_or(is_bot) OR id = 'USLACKBOT' AS is_bot
      , max_by(deleted, coalesce(updated, from_unixtime(0))) AS deleted
      , max_by(coalesce(nullif(display_name, ''), nullif(real_name, '')), coalesce(updated, from_unixtime(0))) AS shown_name
      , max_by(lower(trim(real_name)), coalesce(updated, from_unixtime(0))) AS real_name
      , max(updated) AS updated
    FROM trinocicd.slack.users
    GROUP BY id
)
, people AS (
    -- some people switched to a new account, so accounts with the same full name are one person; a single word, like
    -- a first name, is too common to tell people apart
    SELECT
        id
      , is_bot
      , deleted
      , if(strpos(real_name, ' ') > 0, real_name, id) AS person
    FROM users
)
, since AS (
    SELECT max(ts) - INTERVAL '90' DAY AS since
    FROM trinocicd.slack.messages
)
, threads AS (
    SELECT m.channel, c.name AS channel_name, m.ts AS thread_ts, u.person AS starter
    FROM trinocicd.slack.messages m
    JOIN channels c ON c.id = m.channel
    JOIN people u ON u.id = m.user
    CROSS JOIN since s
    WHERE (m.thread_ts IS NULL OR m.thread_ts = m.ts)
      AND m.ts >= s.since
      AND NOT u.is_bot
)
, helped AS (
    SELECT
        u.person
      , t.channel_name
      , t.thread_ts
      , min(r.ts) AS replied_at
    FROM threads t
    JOIN trinocicd.slack.replies r ON r.channel = t.channel AND r.thread_ts = t.thread_ts AND r.ts > r.thread_ts
    JOIN people u ON u.id = r.user
    WHERE (r.subtype IS NULL OR r.subtype IN ('file_share', 'me_message', 'thread_broadcast'))
      AND u.person != t.starter
      AND NOT u.is_bot
    GROUP BY u.person, t.channel_name, t.thread_ts
)
, first_helpers AS (
    SELECT person, channel_name, thread_ts, replied_at = min(replied_at) OVER (PARTITION BY channel_name, thread_ts) AS replied_first
    FROM helped
)
, per_helper AS (
    SELECT
        h.person
      , count(*) AS threads
      , count(*) FILTER (WHERE h.replied_first) AS first_replies
      , count(*) FILTER (WHERE h.channel_name IN ('troubleshooting', 'beginner')) AS questions
    FROM first_helpers h
    GROUP BY h.person
)
, per_channel AS (
    SELECT person, channel_name, count(*) AS threads, row_number() OVER (PARTITION BY person ORDER BY count(*) DESC, channel_name) AS channel_rank
    FROM helped
    GROUP BY person, channel_name
)
, names AS (
    -- the name of the account changed last
    SELECT p.person, max_by(u.shown_name, coalesce(u.updated, from_unixtime(0))) AS shown_name
    FROM people p
    JOIN users u ON u.id = p.id
    WHERE NOT p.is_bot AND NOT coalesce(p.deleted, false) AND u.shown_name IS NOT NULL
    GROUP BY p.person
)
SELECT
    n.shown_name AS "Name"
  , p.threads AS "Threads"
  , p.first_replies AS "Replied first"
  , p.questions AS "In troubleshooting or beginner"
  , array_join(array_agg(c.channel_name ORDER BY c.channel_rank) FILTER (WHERE c.channel_rank <= 3), ', ') AS "Channels"
FROM per_helper p
JOIN names n ON n.person = p.person
JOIN per_channel c ON c.person = p.person
GROUP BY p.person, n.shown_name, p.threads, p.first_replies, p.questions
ORDER BY p.threads DESC, p.first_replies DESC, n.shown_name
LIMIT 15
;

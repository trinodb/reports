-- Are questions on Slack answered?
-- Questions are messages that start a conversation, posted by people, not bots, in the last 12 full months. Answered is the share with a reply in the thread from another person, and the median wait is until the first one; all channels means all archived channels except announcements.
-- An older sync saved the replies until August 2026, and missed some of them, so older months can show fewer answers than there were.
WITH
channels AS (
    -- a row for every version of a channel, so the synced channels are found by their name, like the sync does
    SELECT id, min(name) AS name
    FROM trinocicd.slack.channels
    WHERE name IN ('python', 'kubernetes', 'iceberg', 'delta-lake', 'trino-gateway', 'trino-gateway-dev', 'core-dev', 'dev', 'troubleshooting', 'beginner')
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
    SELECT date_trunc('month', CAST(max(ts) AT TIME ZONE 'UTC' AS date)) - INTERVAL '1' MONTH AS month
    FROM trinocicd.slack.messages
)
, questions AS (
    SELECT m.channel, c.name, m.user, m.ts, date_trunc('month', CAST(m.ts AT TIME ZONE 'UTC' AS date)) AS month
    FROM trinocicd.slack.messages m
    JOIN channels c ON c.id = m.channel
    CROSS JOIN last_month l
    WHERE (m.subtype IS NULL OR m.subtype IN ('file_share', 'me_message'))
      AND (m.thread_ts IS NULL OR m.thread_ts = m.ts)
      AND m.user IS NOT NULL
      AND m.user NOT IN (SELECT id FROM bots)
      AND m.ts >= with_timezone(CAST(l.month - INTERVAL '11' MONTH AS timestamp), 'UTC')
      AND m.ts < with_timezone(CAST(l.month + INTERVAL '1' MONTH AS timestamp), 'UTC')
)
, answers AS (
    SELECT
        q.channel
      , q.name
      , q.month
      , q.ts
      , min(r.ts) FILTER (WHERE r.user != q.user AND r.user NOT IN (SELECT id FROM bots)) AS first_reply_at
    FROM questions q
    LEFT JOIN trinocicd.slack.replies r ON r.channel = q.channel AND r.thread_ts = q.ts AND r.ts > r.thread_ts
        AND (r.subtype IS NULL OR r.subtype IN ('file_share', 'me_message', 'thread_broadcast'))
    GROUP BY q.channel, q.name, q.month, q.ts
)
, waits AS (
    SELECT name, month, first_reply_at, to_milliseconds(first_reply_at - ts) / 1000e0 AS wait_seconds
    FROM answers
)
, per_month AS (
    SELECT
        month
      , count(*) FILTER (WHERE name = 'troubleshooting') AS troubleshooting_questions
      , count(first_reply_at) FILTER (WHERE name = 'troubleshooting') AS troubleshooting_answered
      , approx_percentile(wait_seconds, 0.5) FILTER (WHERE name = 'troubleshooting') AS troubleshooting_wait
      , count(*) FILTER (WHERE name = 'beginner') AS beginner_questions
      , count(first_reply_at) FILTER (WHERE name = 'beginner') AS beginner_answered
      , approx_percentile(wait_seconds, 0.5) FILTER (WHERE name = 'beginner') AS beginner_wait
      , count(*) AS all_questions
      , count(first_reply_at) AS all_answered
      , approx_percentile(wait_seconds, 0.5) AS all_wait
    FROM waits
    GROUP BY month
)
, months AS (
    SELECT m.month
    FROM last_month l
    CROSS JOIN unnest(sequence(l.month - INTERVAL '11' MONTH, l.month, INTERVAL '1' MONTH)) AS m (month)
)
SELECT
    date_format(m.month, '%Y-%m') AS "Month"
  , coalesce(p.troubleshooting_questions, 0) AS "Questions in troubleshooting"
  , if(p.troubleshooting_questions > 0, format('%.0f%%', p.troubleshooting_answered * 100e0 / p.troubleshooting_questions), '') AS "Answered"
  , coalesce(memory.default.human_duration(p.troubleshooting_wait), '') AS "Median wait"
  , coalesce(p.beginner_questions, 0) AS "Questions in beginner"
  , if(p.beginner_questions > 0, format('%.0f%%', p.beginner_answered * 100e0 / p.beginner_questions), '') AS "Answered"
  , coalesce(memory.default.human_duration(p.beginner_wait), '') AS "Median wait"
  , coalesce(p.all_questions, 0) AS "Questions in all channels"
  , if(p.all_questions > 0, format('%.0f%%', p.all_answered * 100e0 / p.all_questions), '') AS "Answered"
  , coalesce(memory.default.human_duration(p.all_wait), '') AS "Median wait"
FROM months m
LEFT JOIN per_month p ON p.month = m.month
ORDER BY m.month DESC
;

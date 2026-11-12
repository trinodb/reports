-- Slack questions without an answer
-- Messages that start a conversation in troubleshooting and beginner, by people, not bots, per week for the last 13 full weeks: █ got a reply from another person, ░ got none.
-- Look through these channels for questions without a reply in their thread: even a link to the documentation or a hint where to look helps.
WITH
channels AS (
    -- a row for every version of a channel, so the synced channels are found by their name, like the sync does
    SELECT id, min(name) AS name
    FROM trinocicd.slack.channels
    WHERE name IN ('troubleshooting', 'beginner')
    GROUP BY id
)
, bots AS (
    SELECT id
    FROM trinocicd.slack.users
    GROUP BY id
    HAVING bool_or(is_bot) OR id = 'USLACKBOT'
)
, last_week AS (
    -- the sync runs on Mondays, so the current week is never complete
    SELECT date_trunc('week', CAST(max(ts) AT TIME ZONE 'UTC' AS date)) - INTERVAL '7' DAY AS week
    FROM trinocicd.slack.messages
)
, questions AS (
    SELECT m.channel, c.name, m.user, m.ts, date_trunc('week', CAST(m.ts AT TIME ZONE 'UTC' AS date)) AS week
    FROM trinocicd.slack.messages m
    JOIN channels c ON c.id = m.channel
    CROSS JOIN last_week l
    WHERE (m.subtype IS NULL OR m.subtype IN ('file_share', 'me_message'))
      AND (m.thread_ts IS NULL OR m.thread_ts = m.ts)
      AND m.user IS NOT NULL
      AND m.user NOT IN (SELECT id FROM bots)
      AND m.ts >= with_timezone(CAST(l.week - INTERVAL '84' DAY AS timestamp), 'UTC')
      AND m.ts < with_timezone(CAST(l.week + INTERVAL '7' DAY AS timestamp), 'UTC')
)
, answers AS (
    SELECT
        q.name
      , q.week
      , q.ts
      , count(r.ts) FILTER (WHERE r.user != q.user AND r.user NOT IN (SELECT id FROM bots)) > 0 AS answered
    FROM questions q
    LEFT JOIN trinocicd.slack.replies r ON r.channel = q.channel AND r.thread_ts = q.ts AND r.ts > r.thread_ts
        AND (r.subtype IS NULL OR r.subtype IN ('file_share', 'me_message', 'thread_broadcast'))
    GROUP BY q.name, q.week, q.ts
)
, per_week AS (
    SELECT
        week
      , count(*) AS questions
      , count(*) FILTER (WHERE answered) AS answered
      , count(*) FILTER (WHERE NOT answered AND name = 'troubleshooting') AS troubleshooting_unanswered
      , count(*) FILTER (WHERE NOT answered AND name = 'beginner') AS beginner_unanswered
    FROM answers
    GROUP BY week
)
, weeks AS (
    SELECT w.week
    FROM last_week l
    CROSS JOIN unnest(sequence(l.week - INTERVAL '84' DAY, l.week, INTERVAL '7' DAY)) AS w (week)
)
SELECT
    date_format(w.week, '%Y-%m-%d') AS "Week of"
  , coalesce(p.questions, 0) AS "Questions"
  , coalesce(p.questions - p.answered, 0) AS "No reply"
  , if(p.questions > 0, format('%.0f%%', (p.questions - p.answered) * 100e0 / p.questions), '') AS "Share"
  , memory.default.stacked(ARRAY[p.answered * 1e0, (p.questions - p.answered) * 1e0], '█░', 30) AS "Replied or not chart"
  , coalesce(p.troubleshooting_unanswered, 0) AS "No reply in troubleshooting"
  , coalesce(p.beginner_unanswered, 0) AS "No reply in beginner"
FROM weeks w
LEFT JOIN per_week p ON p.week = w.week
ORDER BY w.week DESC
;

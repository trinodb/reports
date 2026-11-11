-- Where do people on Slack live?
-- People, not bots, who posted in the archived channels in the last 12 full months, by the region of the time zone set in their Slack profile, with the most common time zones and their offsets from UTC.
-- Read it with the hours above: a question asked in the working hours of a large region gets an answer sooner.
WITH
channels AS (
    -- a row for every version of a channel, so the synced channels are found by their name, like the sync does
    SELECT id
    FROM trinocicd.slack.channels
    WHERE name IN ('announcements', 'python', 'kubernetes', 'iceberg', 'delta-lake', 'trino-gateway', 'trino-gateway-dev', 'core-dev', 'dev', 'troubleshooting', 'beginner')
    GROUP BY id
)
, users AS (
    -- a row for every version of a user; the newest one has the current time zone
    SELECT
        id
      , bool_or(is_bot) OR id = 'USLACKBOT' AS is_bot
      , max_by(tz, coalesce(updated, from_unixtime(0))) AS tz
      , max_by(tz_offset, coalesce(updated, from_unixtime(0))) AS tz_offset
    FROM trinocicd.slack.users
    GROUP BY id
)
, last_month AS (
    -- the month of the newest saved message isn't complete
    SELECT date_trunc('month', CAST(max(ts) AT TIME ZONE 'UTC' AS date)) AS month
    FROM trinocicd.slack.messages
)
, posts AS (
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
, active_people AS (
    SELECT DISTINCT
        u.id
      , u.tz
      , u.tz_offset
      , CASE split_part(u.tz, '/', 1)
            WHEN 'America' THEN 'Americas'
            WHEN 'Europe' THEN 'Europe'
            WHEN 'Asia' THEN 'Asia'
            WHEN 'Africa' THEN 'Africa'
            WHEN 'Australia' THEN 'Oceania'
            WHEN 'Pacific' THEN 'Oceania'
            WHEN '' THEN 'Not set'
            ELSE coalesce(split_part(u.tz, '/', 1), 'Not set')
        END AS region
    FROM posts p
    JOIN users u ON u.id = p.user
    CROSS JOIN last_month l
    WHERE p.channel IN (SELECT id FROM channels)
      AND NOT u.is_bot
      AND p.ts >= with_timezone(CAST(l.month - INTERVAL '12' MONTH AS timestamp), 'UTC')
      AND p.ts < with_timezone(CAST(l.month AS timestamp), 'UTC')
)
, time_zones AS (
    SELECT region, tz, count(*) AS people, row_number() OVER (PARTITION BY region ORDER BY count(*) DESC, tz) AS tz_rank
    FROM active_people
    WHERE tz IS NOT NULL
    GROUP BY region, tz
)
, regions AS (
    SELECT
        region
      , count(*) AS people
      , min(tz_offset) AS min_offset
      , max(tz_offset) AS max_offset
    FROM active_people
    GROUP BY region
)
, offsets AS (
    SELECT
        region
      , people
      , min_offset = max_offset AS single_offset
      -- like UTC-7 or UTC+5:30
      , transform(ARRAY[min_offset, max_offset], o -> concat(if(o < 0, '-', '+'), CAST(abs(o) / 3600 AS varchar), if(abs(o) % 3600 > 0, format(':%02d', abs(o) % 3600 / 60), ''))) AS labels
    FROM regions
)
SELECT
    r.region AS "Region"
  , r.people AS "People"
  , format('%.0f%%', r.people * 100e0 / sum(r.people) OVER ()) AS "Share"
  , memory.default.hbar(r.people, max(r.people) OVER (), 30) AS "People chart"
  , CASE
        WHEN r.single_offset IS NULL THEN ''
        WHEN r.single_offset THEN 'UTC' || r.labels[1]
        ELSE format('UTC%s to %s', r.labels[1], r.labels[2])
    END AS "Offsets"
  , coalesce(array_join(array_agg(t.tz ORDER BY t.tz_rank) FILTER (WHERE t.tz_rank <= 3), ', '), '') AS "Most common time zones"
FROM offsets r
LEFT JOIN time_zones t ON t.region = r.region
GROUP BY r.region, r.people, r.single_offset, r.labels
ORDER BY r.region = 'Not set', r.people DESC
;

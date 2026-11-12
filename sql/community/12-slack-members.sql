-- Who joins the Slack channels?
-- People, not bots or deactivated accounts, in every archived channel now, and how many joined and left it in the last 12 full months. The charts have one character per month, oldest on the left, with joins and leaves of a channel on the same scale.
-- The weekly sync sees a member join or leave only on its next run, so the times are accurate to a week.
WITH
channels AS (
    -- a row for every version of a channel, so the synced channels are found by their name, like the sync does
    SELECT id, min(name) AS name
    FROM trinocicd.slack.channels
    WHERE name IN ('announcements', 'python', 'kubernetes', 'iceberg', 'delta-lake', 'trino-gateway', 'trino-gateway-dev', 'core-dev', 'dev', 'troubleshooting', 'beginner')
    GROUP BY id
)
, users AS (
    -- a row for every version of a user
    SELECT id, bool_or(is_bot) OR id = 'USLACKBOT' AS is_bot, max_by(deleted, coalesce(updated, from_unixtime(0))) AS deleted
    FROM trinocicd.slack.users
    GROUP BY id
)
, last_month AS (
    -- the month of the newest saved message isn't complete
    SELECT date_trunc('month', CAST(max(ts) AT TIME ZONE 'UTC' AS date)) - INTERVAL '1' MONTH AS month
    FROM trinocicd.slack.messages
)
, months AS (
    SELECT m.month
    FROM last_month l
    CROSS JOIN unnest(sequence(l.month - INTERVAL '11' MONTH, l.month, INTERVAL '1' MONTH)) AS m (month)
)
, people_members AS (
    SELECT c.name AS channel, m.member, m.joined_at, m.removed_at
    FROM trinocicd.slack.channel_members m
    JOIN channels c ON c.id = m.channel
    LEFT JOIN users u ON u.id = m.member
    WHERE NOT coalesce(u.is_bot, false)
)
, current_members AS (
    -- a row is added when a member joins, and another one, with the same joined_at, when they leave
    SELECT channel, member, removed_at IS NULL AS is_member
    FROM (
        SELECT channel, member, removed_at, row_number() OVER (PARTITION BY channel, member ORDER BY joined_at DESC, removed_at ASC NULLS LAST) AS row_num
        FROM people_members
    )
    WHERE row_num = 1
)
, sizes AS (
    SELECT m.channel, count(*) FILTER (WHERE m.is_member AND NOT coalesce(u.deleted, false)) AS members
    FROM current_members m
    LEFT JOIN users u ON u.id = m.member
    GROUP BY m.channel
)
, events AS (
    SELECT channel, date_trunc('month', CAST(joined_at AS date)) AS month, 'joined' AS kind
    FROM people_members
    WHERE removed_at IS NULL
    UNION ALL
    SELECT channel, date_trunc('month', CAST(removed_at AS date)), 'left'
    FROM people_members
    WHERE removed_at IS NOT NULL
)
, per_month AS (
    SELECT
        c.name AS channel
      , m.month
      , count(e.kind) FILTER (WHERE e.kind = 'joined') AS joined
      , count(e.kind) FILTER (WHERE e.kind = 'left') AS left_channel
    FROM channels c
    CROSS JOIN months m
    LEFT JOIN events e ON e.channel = c.name AND e.month = m.month
    GROUP BY c.name, m.month
)
, per_channel AS (
    SELECT
        channel
      , sum(joined) AS joined
      , sum(left_channel) AS left_channel
      , array_agg(CAST(joined AS double) ORDER BY month) AS joined_per_month
      , array_agg(CAST(left_channel AS double) ORDER BY month) AS left_per_month
      , greatest(max(joined), max(left_channel)) AS max_per_month
    FROM per_month
    GROUP BY channel
)
SELECT
    p.channel AS "Channel"
  , coalesce(s.members, 0) AS "Members now"
  , p.joined AS "Joined"
  , p.left_channel AS "Left"
  , CASE
        WHEN p.joined > p.left_channel THEN format('▲ +%d', p.joined - p.left_channel)
        WHEN p.joined < p.left_channel THEN format('▼ %d', p.joined - p.left_channel)
        ELSE '= 0'
    END AS "Change"
  , memory.default.sparkline(p.joined_per_month, p.max_per_month) AS "Joined per month chart"
  , memory.default.sparkline(p.left_per_month, p.max_per_month) AS "Left per month"
FROM per_channel p
LEFT JOIN sizes s ON s.channel = p.channel
ORDER BY coalesce(s.members, 0) DESC, p.channel
;

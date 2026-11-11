-- Members who joined or left the synced channels since the previous sync.
INSERT INTO trinocicd.slack.channel_members (channel, member, joined_at, removed_at, source)
WITH synced_channels AS (
    SELECT DISTINCT id
    FROM trinocicd.slack.channels
    WHERE name IN ('announcements', 'python', 'kubernetes', 'iceberg', 'delta-lake', 'trino-gateway', 'trino-gateway-dev', 'core-dev', 'dev', 'troubleshooting', 'beginner')
),
versions AS (
    -- a removal has the same joined_at as the row it removes, so it comes first
    SELECT channel, member, joined_at, removed_at, row_number() OVER (PARTITION BY channel, member ORDER BY joined_at DESC, removed_at ASC NULLS LAST) AS row_num
    FROM trinocicd.slack.channel_members
    WHERE channel IN (SELECT id FROM synced_channels)
),
saved AS (
    SELECT channel, member, joined_at, removed_at
    FROM versions
    WHERE row_num = 1
),
fetched AS (
    SELECT DISTINCT channel, value AS member
    FROM slack.default.channel_members
    WHERE channel IN (SELECT id FROM synced_channels)
)
-- a single join, so the members are read from Slack only once
SELECT
    coalesce(f.channel, s.channel),
    coalesce(f.member, s.member),
    if(f.member IS NOT NULL, CAST(current_timestamp AS timestamp(6)), s.joined_at),
    if(f.member IS NULL, CAST(current_timestamp AS timestamp(6))),
    'sync'
FROM fetched f
FULL JOIN saved s ON s.channel = f.channel AND s.member = f.member
WHERE (f.member IS NOT NULL AND (s.member IS NULL OR s.removed_at IS NOT NULL))
    OR (f.member IS NULL AND s.removed_at IS NULL)

-- The history of members of the synced channels. Safe to repeat, rows that are already saved are skipped.
INSERT INTO trinocicd.slack.channel_members (channel, member, joined_at, removed_at, source)
WITH versions AS (
    SELECT DISTINCT channel, member, joined_at, removed_at, source
    FROM legacyslack.slack.channel_members
)
SELECT v.*
FROM versions v
WHERE NOT EXISTS (
    SELECT 1
    FROM trinocicd.slack.channel_members m
    WHERE m.channel = v.channel
        AND m.member = v.member
        AND m.joined_at = v.joined_at
        AND m.removed_at IS NOT DISTINCT FROM v.removed_at
)

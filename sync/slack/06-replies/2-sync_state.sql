-- Marks the threads read in this batch.
INSERT INTO trinocicd.slack.sync_state (step, channel, parent_ts, version, checked_at)
WITH synced_channels AS (
    SELECT DISTINCT id
    FROM trinocicd.slack.channels
    WHERE name IN ('announcements', 'python', 'kubernetes', 'iceberg', 'delta-lake', 'trino-gateway', 'trino-gateway-dev', 'core-dev', 'dev', 'troubleshooting', 'beginner')
),
parents AS (
    SELECT channel, ts AS parent_ts, format('%d/%s', reply_count, coalesce(CAST(latest_reply AS varchar), '')) AS version
    FROM trinocicd.slack.messages
    -- only threads read by the messages step, which sets latest_reply, because reading a deleted thread fails,
    -- and the backfilled ones could have been deleted since the old sync read them
    WHERE channel IN (SELECT id FROM synced_channels) AND reply_count > 0 AND latest_reply IS NOT NULL
        AND ts > current_timestamp - INTERVAL '90' DAY
),
checked AS (
    SELECT channel, parent_ts, max_by(version, checked_at) AS version
    FROM trinocicd.slack.sync_state
    WHERE step = 'replies'
    GROUP BY channel, parent_ts
),
changed AS (
    SELECT p.channel, p.parent_ts, p.version
    FROM parents p
    LEFT JOIN checked c ON c.channel = p.channel AND c.parent_ts = p.parent_ts
    WHERE c.parent_ts IS NULL OR c.version <> p.version
),
-- threads of a single channel, because the connector requests every combination of the channels and the threads
batch AS (
    SELECT channel, parent_ts, version
    FROM changed
    WHERE channel = (SELECT min(channel) FROM changed)
    ORDER BY parent_ts
    LIMIT 30
)
SELECT 'replies', channel, parent_ts, version, CAST(current_timestamp AS timestamp(6))
FROM batch

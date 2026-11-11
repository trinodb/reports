-- Replies of threads from the last 90 days, read again when their number or their latest reply changes.
-- loop: batches
MERGE INTO trinocicd.slack.replies t
USING (
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
    ),
    fetched AS (
        SELECT
            type,
            subtype,
            coalesce(hidden, false) AS hidden,
            channel,
            user,
            text,
            CAST(from_unixtime_nanos(thread_ts * 1000000000) AS timestamp(6) with time zone) AS thread_ts,
            coalesce(reply_count, 0) AS reply_count,
            coalesce(subscribed, false) AS subscribed,
            CAST(from_unixtime_nanos(last_read * 1000000000) AS timestamp(6) with time zone) AS last_read,
            coalesce(unread_count, 0) AS unread_count,
            parent_user_id,
            CAST(from_unixtime_nanos(ts * 1000000000) AS timestamp(6) with time zone) AS ts,
            edited.user AS edited_user,
            CAST(from_unixtime_nanos(edited.ts * 1000000000) AS timestamp(6) with time zone) AS edited_ts,
            CAST(from_unixtime_nanos(deleted_ts * 1000000000) AS timestamp(6) with time zone) AS deleted_ts,
            CAST(from_unixtime_nanos(event_ts * 1000000000) AS timestamp(6) with time zone) AS event_ts,
            coalesce(is_starred, false) AS is_starred,
            coalesce(pinned_to, ARRAY[]) AS pinned_to,
            map_from_entries(transform(coalesce(reactions, ARRAY[]), reaction -> ROW(reaction.name, reaction.count))) AS reactions,
            CAST(from_unixtime_nanos(latest_reply * 1000000000) AS timestamp(6) with time zone) AS latest_reply,
            row_number() OVER (PARTITION BY channel, ts) AS row_num
        FROM slack.default.replies
        -- Slack identifies a thread by the ts of its parent message, with microseconds
        WHERE channel IN (SELECT channel FROM batch)
            AND ts_req IN (
                SELECT format('%d.%s', CAST(to_unixtime(date_trunc('second', parent_ts)) AS bigint), substr(CAST(CAST(parent_ts AS timestamp(6)) AS varchar), 21, 6))
                FROM batch
            )
    )
    SELECT *
    FROM fetched
    WHERE row_num = 1
) s
ON t.channel = s.channel AND t.ts = s.ts
WHEN MATCHED AND (
    t.subtype IS DISTINCT FROM s.subtype
    OR t.hidden IS DISTINCT FROM s.hidden
    OR t.text IS DISTINCT FROM s.text
    OR t.reply_count IS DISTINCT FROM s.reply_count
    OR t.edited_ts IS DISTINCT FROM s.edited_ts
    OR t.reactions IS DISTINCT FROM s.reactions
    OR t.latest_reply IS DISTINCT FROM s.latest_reply
) THEN UPDATE SET
    type = s.type,
    subtype = s.subtype,
    hidden = s.hidden,
    user = s.user,
    text = s.text,
    thread_ts = s.thread_ts,
    reply_count = s.reply_count,
    subscribed = s.subscribed,
    last_read = s.last_read,
    unread_count = s.unread_count,
    parent_user_id = s.parent_user_id,
    edited_user = s.edited_user,
    edited_ts = s.edited_ts,
    deleted_ts = s.deleted_ts,
    event_ts = s.event_ts,
    is_starred = s.is_starred,
    pinned_to = s.pinned_to,
    reactions = s.reactions,
    latest_reply = s.latest_reply
WHEN NOT MATCHED THEN INSERT (
    type,
    subtype,
    hidden,
    channel,
    user,
    text,
    thread_ts,
    reply_count,
    subscribed,
    last_read,
    unread_count,
    parent_user_id,
    ts,
    edited_user,
    edited_ts,
    deleted_ts,
    event_ts,
    is_starred,
    pinned_to,
    reactions,
    latest_reply
)
VALUES (
    s.type,
    s.subtype,
    s.hidden,
    s.channel,
    s.user,
    s.text,
    s.thread_ts,
    s.reply_count,
    s.subscribed,
    s.last_read,
    s.unread_count,
    s.parent_user_id,
    s.ts,
    s.edited_user,
    s.edited_ts,
    s.deleted_ts,
    s.event_ts,
    s.is_starred,
    s.pinned_to,
    s.reactions,
    s.latest_reply
)

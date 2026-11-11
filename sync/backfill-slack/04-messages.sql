-- trino-rest saved missing values as empty strings and as timestamps at the Unix epoch, so they're replaced with NULL, like the sync saves them.
-- Safe to repeat, messages that are already saved are skipped.
MERGE INTO trinocicd.slack.messages t
USING (
    WITH versions AS (
        SELECT
            nullif(type, '') AS type,
            nullif(subtype, '') AS subtype,
            hidden,
            nullif(channel, '') AS channel,
            nullif(user, '') AS user,
            nullif(text, '') AS text,
            nullif(thread_ts, from_unixtime(0, 'UTC')) AS thread_ts,
            reply_count,
            subscribed,
            nullif(last_read, from_unixtime(0, 'UTC')) AS last_read,
            unread_count,
            nullif(parent_user_id, '') AS parent_user_id,
            ts,
            nullif(edited_user, '') AS edited_user,
            nullif(edited_ts, from_unixtime(0, 'UTC')) AS edited_ts,
            nullif(deleted_ts, from_unixtime(0, 'UTC')) AS deleted_ts,
            nullif(event_ts, from_unixtime(0, 'UTC')) AS event_ts,
            is_starred,
            pinned_to,
            reactions,
            row_number() OVER (PARTITION BY channel, ts) AS row_num
        FROM legacyslack.slack.messages
    )
    SELECT *
    FROM versions
    WHERE row_num = 1
) s
ON t.channel = s.channel AND t.ts = s.ts
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
    reactions
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
    s.reactions
)

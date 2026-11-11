-- Messages of threads, including their parent messages, one row for every message, identified by channel and ts.
CREATE TABLE IF NOT EXISTS trinocicd.slack.replies (
    type varchar,
    subtype varchar,
    hidden boolean,
    channel varchar,
    user varchar,
    text varchar,
    thread_ts timestamp(6) with time zone,
    reply_count integer,
    subscribed boolean,
    last_read timestamp(6) with time zone,
    unread_count integer,
    parent_user_id varchar,
    ts timestamp(6) with time zone,
    edited_user varchar,
    edited_ts timestamp(6) with time zone,
    deleted_ts timestamp(6) with time zone,
    event_ts timestamp(6) with time zone,
    is_starred boolean,
    pinned_to array(varchar),
    reactions map(varchar, integer),
    latest_reply timestamp(6) with time zone
);

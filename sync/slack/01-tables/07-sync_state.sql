-- Versions of threads whose replies were read, so a thread is read again only when it changes.
CREATE TABLE IF NOT EXISTS trinocicd.slack.sync_state (
    step varchar,
    channel varchar,
    parent_ts timestamp(6) with time zone,
    version varchar,
    checked_at timestamp(6)
);

CREATE TABLE IF NOT EXISTS trinocicd.github.sync_state (
    step varchar,
    owner varchar,
    repo varchar,
    parent_id bigint,
    version varchar,
    checked_at timestamp(6)
);

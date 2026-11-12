CREATE TABLE IF NOT EXISTS trinocicd.github.sync_state (
    step varchar,
    owner varchar,
    repo varchar,
    parent_id bigint,
    version varchar,
    checked_at timestamp(6)
)
-- every step reads only its own rows, which aren't many compared to the ones of CI steps
WITH (partitioning = ARRAY['step']);

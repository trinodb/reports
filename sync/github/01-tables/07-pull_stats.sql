CREATE TABLE IF NOT EXISTS trinocicd.github.pull_stats (
    owner varchar,
    repo varchar,
    pull_number bigint,
    comments bigint,
    review_comments bigint,
    commits bigint,
    additions bigint,
    deletions bigint,
    changed_files bigint,
    merged boolean,
    mergeable_state varchar,
    merged_by_id bigint,
    merged_by_login varchar,
    created_at timestamp(6),
    updated_at timestamp(6),
    closed_at timestamp(6),
    merged_at timestamp(6)
);

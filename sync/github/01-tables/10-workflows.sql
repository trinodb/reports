CREATE TABLE IF NOT EXISTS trinocicd.github.workflows (
    owner varchar,
    repo varchar,
    id bigint,
    node_id varchar,
    name varchar,
    path varchar,
    state varchar,
    created_at timestamp(6),
    updated_at timestamp(6),
    url varchar,
    html_url varchar,
    badge_url varchar
);

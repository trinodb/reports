CREATE TABLE IF NOT EXISTS trinocicd.github.issue_comments (
    owner varchar,
    repo varchar,
    id bigint,
    node_id varchar,
    url varchar,
    html_url varchar,
    body varchar,
    user_id bigint,
    user_login varchar,
    created_at timestamp(6),
    updated_at timestamp(6),
    issue_url varchar,
    issue_number bigint,
    author_association varchar,
    reactions_total_count bigint,
    app_id bigint,
    app_slug varchar
);

CREATE TABLE IF NOT EXISTS trinocicd.github.reviews (
    owner varchar,
    repo varchar,
    id bigint,
    node_id varchar,
    pull_number bigint,
    user_id bigint,
    user_login varchar,
    body varchar,
    state varchar,
    html_url varchar,
    submitted_at timestamp(6),
    commit_id varchar,
    author_association varchar
);

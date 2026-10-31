CREATE TABLE IF NOT EXISTS trinocicd.github.check_suites (
    owner varchar,
    repo varchar,
    id bigint,
    node_id varchar,
    head_branch varchar,
    head_sha varchar,
    status varchar,
    conclusion varchar,
    url varchar,
    before varchar,
    after varchar,
    app_id bigint,
    app_slug varchar,
    pull_request_numbers array(bigint),
    created_at timestamp(6),
    updated_at timestamp(6),
    latest_check_runs_count bigint
);

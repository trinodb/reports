-- Check suites of completed workflow runs from the last 15 days, at least 2 hours old, so they're completed.
-- GitHub fails with a server error when reading older check suites.
-- loop: batches
MERGE INTO trinocicd.github.check_suites t
USING (
    WITH parents AS (
        SELECT check_suite_id AS parent_id, CAST(max(run_attempt) AS varchar) AS version
        FROM trinocicd.github.runs
        WHERE owner = 'trinodb' AND repo = 'trino' AND check_suite_id IS NOT NULL
            AND created_at > current_timestamp - INTERVAL '15' DAY
            AND created_at < current_timestamp - INTERVAL '2' HOUR
        GROUP BY check_suite_id
    ),
    checked AS (
        SELECT parent_id, max_by(version, checked_at) AS version
        FROM trinocicd.github.sync_state
        WHERE step = 'check_suites' AND owner = 'trinodb' AND repo = 'trino'
        GROUP BY parent_id
    ),
    batch AS (
        SELECT p.parent_id, p.version
        FROM parents p
        LEFT JOIN checked c ON c.parent_id = p.parent_id
        WHERE c.parent_id IS NULL OR c.version <> p.version
        ORDER BY p.parent_id
        LIMIT 30
    ),
    fetched AS (
        SELECT
            owner,
            repo,
            id,
            node_id,
            head_branch,
            head_sha,
            status,
            conclusion,
            url,
            before,
            after,
            app.id AS app_id,
            app.slug AS app_slug,
            transform(pull_requests, pull -> pull.number) AS pull_request_numbers,
            created_at,
            updated_at,
            latest_check_runs_count,
            row_number() OVER (PARTITION BY id) AS row_num
        FROM github.default.repos_check_suites
        WHERE owner = 'trinodb' AND repo = 'trino'
            AND check_suite_id IN (SELECT parent_id FROM batch)
    )
    SELECT *
    FROM fetched
    WHERE row_num = 1
) s
ON t.id = s.id
WHEN MATCHED AND s.updated_at > t.updated_at THEN UPDATE SET
    owner = s.owner,
    repo = s.repo,
    id = s.id,
    node_id = s.node_id,
    head_branch = s.head_branch,
    head_sha = s.head_sha,
    status = s.status,
    conclusion = s.conclusion,
    url = s.url,
    before = s.before,
    after = s.after,
    app_id = s.app_id,
    app_slug = s.app_slug,
    pull_request_numbers = s.pull_request_numbers,
    created_at = s.created_at,
    updated_at = s.updated_at,
    latest_check_runs_count = s.latest_check_runs_count
WHEN NOT MATCHED THEN INSERT (
    owner,
    repo,
    id,
    node_id,
    head_branch,
    head_sha,
    status,
    conclusion,
    url,
    before,
    after,
    app_id,
    app_slug,
    pull_request_numbers,
    created_at,
    updated_at,
    latest_check_runs_count
)
VALUES (
    s.owner,
    s.repo,
    s.id,
    s.node_id,
    s.head_branch,
    s.head_sha,
    s.status,
    s.conclusion,
    s.url,
    s.before,
    s.after,
    s.app_id,
    s.app_slug,
    s.pull_request_numbers,
    s.created_at,
    s.updated_at,
    s.latest_check_runs_count
);

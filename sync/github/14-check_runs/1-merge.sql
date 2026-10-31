-- Check runs of check suites of completed workflow runs from the last 2 months, at least 2 hours old, so they're completed.
-- loop: batches
MERGE INTO trinocicd.github.check_runs t
USING (
    WITH parents AS (
        SELECT check_suite_id AS parent_id, CAST(max(run_attempt) AS varchar) AS version
        FROM trinocicd.github.runs
        WHERE owner = 'trinodb' AND repo = 'trino' AND check_suite_id IS NOT NULL
            AND created_at > current_timestamp - INTERVAL '2' MONTH
            AND created_at < current_timestamp - INTERVAL '2' HOUR
        GROUP BY check_suite_id
    ),
    checked AS (
        SELECT parent_id, max_by(version, checked_at) AS version
        FROM trinocicd.github.sync_state
        WHERE step = 'check_runs' AND owner = 'trinodb' AND repo = 'trino'
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
            check_suite_id,
            head_sha,
            node_id,
            external_id,
            url,
            html_url,
            details_url,
            status,
            conclusion,
            started_at,
            completed_at,
            output.title AS output_title,
            output.summary AS output_summary,
            output.text AS output_text,
            output.annotations_count AS annotations_count,
            name,
            app.id AS app_id,
            app.slug AS app_slug,
            transform(pull_requests, pull -> pull.number) AS pull_request_numbers,
            row_number() OVER (PARTITION BY id) AS row_num
        FROM github.default.repos_check_suites_check_runs
        WHERE owner = 'trinodb' AND repo = 'trino' AND filter = 'all' AND per_page = 100
            AND check_suite_id IN (SELECT parent_id FROM batch)
    )
    SELECT *
    FROM fetched
    WHERE row_num = 1
) s
ON t.id = s.id
WHEN MATCHED AND (s.status <> t.status OR s.conclusion IS DISTINCT FROM t.conclusion) THEN UPDATE SET
    owner = s.owner,
    repo = s.repo,
    id = s.id,
    check_suite_id = s.check_suite_id,
    head_sha = s.head_sha,
    node_id = s.node_id,
    external_id = s.external_id,
    url = s.url,
    html_url = s.html_url,
    details_url = s.details_url,
    status = s.status,
    conclusion = s.conclusion,
    started_at = s.started_at,
    completed_at = s.completed_at,
    output_title = s.output_title,
    output_summary = s.output_summary,
    output_text = s.output_text,
    annotations_count = s.annotations_count,
    name = s.name,
    app_id = s.app_id,
    app_slug = s.app_slug,
    pull_request_numbers = s.pull_request_numbers
WHEN NOT MATCHED THEN INSERT (
    owner,
    repo,
    id,
    check_suite_id,
    head_sha,
    node_id,
    external_id,
    url,
    html_url,
    details_url,
    status,
    conclusion,
    started_at,
    completed_at,
    output_title,
    output_summary,
    output_text,
    annotations_count,
    name,
    app_id,
    app_slug,
    pull_request_numbers
)
VALUES (
    s.owner,
    s.repo,
    s.id,
    s.check_suite_id,
    s.head_sha,
    s.node_id,
    s.external_id,
    s.url,
    s.html_url,
    s.details_url,
    s.status,
    s.conclusion,
    s.started_at,
    s.completed_at,
    s.output_title,
    s.output_summary,
    s.output_text,
    s.annotations_count,
    s.name,
    s.app_id,
    s.app_slug,
    s.pull_request_numbers
);

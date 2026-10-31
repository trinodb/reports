-- Jobs of all attempts of completed workflow runs from the last 2 months,
-- read again when a run has a new attempt.
-- loop: batches
MERGE INTO trinocicd.github.jobs t
USING (
    WITH parents AS (
        SELECT id AS parent_id, CAST(max(run_attempt) AS varchar) AS version
        FROM trinocicd.github.runs
        WHERE owner = 'trinodb' AND repo = 'trino' AND created_at > current_timestamp - INTERVAL '2' MONTH
        GROUP BY id
    ),
    checked AS (
        SELECT parent_id, max_by(version, checked_at) AS version
        FROM trinocicd.github.sync_state
        WHERE step = 'jobs' AND owner = 'trinodb' AND repo = 'trino'
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
            run_id,
            run_attempt,
            node_id,
            head_sha,
            head_branch,
            workflow_name,
            status,
            conclusion,
            created_at,
            started_at,
            completed_at,
            name,
            steps,
            labels,
            runner_id,
            runner_name,
            runner_group_name,
            row_number() OVER (PARTITION BY id) AS row_num
        FROM github.default.repos_actions_runs_jobs
        -- 50 per page, because with 100, GitHub takes over 9 seconds to list jobs of a run with about 200 jobs,
        -- and often fails with 502 Server Error, while 50 take under 3 seconds
        WHERE owner = 'trinodb' AND repo = 'trino' AND filter = 'all' AND per_page = 50
            AND run_id IN (SELECT parent_id FROM batch)
    )
    SELECT *
    FROM fetched
    WHERE row_num = 1
) s
ON t.id = s.id
WHEN NOT MATCHED THEN INSERT (
    owner,
    repo,
    id,
    run_id,
    run_attempt,
    node_id,
    head_sha,
    head_branch,
    workflow_name,
    status,
    conclusion,
    created_at,
    started_at,
    completed_at,
    name,
    steps,
    labels,
    runner_id,
    runner_name,
    runner_group_name
)
VALUES (
    s.owner,
    s.repo,
    s.id,
    s.run_id,
    s.run_attempt,
    s.node_id,
    s.head_sha,
    s.head_branch,
    s.workflow_name,
    s.status,
    s.conclusion,
    s.created_at,
    s.started_at,
    s.completed_at,
    s.name,
    s.steps,
    s.labels,
    s.runner_id,
    s.runner_name,
    s.runner_group_name
);

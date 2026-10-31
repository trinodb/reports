-- Completed workflow runs, so they don't have to be updated later. Every attempt is saved separately.
-- The endpoint has no parameter to read only recent runs, and returns the newest first,
-- so read pages until two pages in a row have no new runs, because runs don't complete in the order they started.
-- loop: pages
-- stop-after: 2
-- parameters: page
MERGE INTO trinocicd.github.runs t
USING (
    WITH fetched AS (
        SELECT
            owner,
            repo,
            id,
            name,
            node_id,
            check_suite_id,
            check_suite_node_id,
            head_branch,
            head_sha,
            path,
            run_number,
            run_attempt,
            event,
            status,
            conclusion,
            workflow_id,
            display_title,
            actor.id AS actor_id,
            actor.login AS actor_login,
            triggering_actor.login AS triggering_actor_login,
            transform(pull_requests, pull -> pull.number) AS pull_request_numbers,
            created_at,
            updated_at,
            run_started_at,
            row_number() OVER (PARTITION BY id, run_attempt) AS row_num
        FROM github.default.repos_actions_runs
        -- conclusion isn't a parameter, so Trino filters the rows; with the status parameter,
        -- GitHub returns at most 1000 runs, which a sync falling behind by a day would exceed
        WHERE owner = 'trinodb' AND repo = 'trino' AND conclusion IS NOT NULL AND per_page = 100 AND page = ?
    )
    SELECT *
    FROM fetched
    WHERE row_num = 1
) s
ON t.id = s.id AND t.run_attempt = s.run_attempt
WHEN NOT MATCHED THEN INSERT (
    owner,
    repo,
    id,
    name,
    node_id,
    check_suite_id,
    check_suite_node_id,
    head_branch,
    head_sha,
    path,
    run_number,
    run_attempt,
    event,
    status,
    conclusion,
    workflow_id,
    display_title,
    actor_id,
    actor_login,
    triggering_actor_login,
    pull_request_numbers,
    created_at,
    updated_at,
    run_started_at
)
VALUES (
    s.owner,
    s.repo,
    s.id,
    s.name,
    s.node_id,
    s.check_suite_id,
    s.check_suite_node_id,
    s.head_branch,
    s.head_sha,
    s.path,
    s.run_number,
    s.run_attempt,
    s.event,
    s.status,
    s.conclusion,
    s.workflow_id,
    s.display_title,
    s.actor_id,
    s.actor_login,
    s.triggering_actor_login,
    s.pull_request_numbers,
    s.created_at,
    s.updated_at,
    s.run_started_at
);

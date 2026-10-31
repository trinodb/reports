-- Every attempt of workflow runs, updated before the cutoff.
-- Safe to repeat, rows that already exist are skipped.
-- parameters: cutoff
MERGE INTO trinocicd.github.runs t
USING (
    WITH versions AS (
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
            CAST(NULL AS varchar) AS path,
            run_number,
            CAST(run_attempt AS bigint) AS run_attempt,
            event,
            status,
            conclusion,
            workflow_id,
            CAST(NULL AS varchar) AS display_title,
            CAST(NULL AS bigint) AS actor_id,
            CAST(NULL AS varchar) AS actor_login,
            CAST(NULL AS varchar) AS triggering_actor_login,
            CAST(NULL AS array(bigint)) AS pull_request_numbers,
            CAST(created_at AS timestamp(6)) AS created_at,
            CAST(updated_at AS timestamp(6)) AS updated_at,
            CAST(run_started_at AS timestamp(6)) AS run_started_at,
            row_number() OVER (PARTITION BY id, run_attempt ORDER BY updated_at DESC) AS row_num
        FROM legacy.v2.runs o
        WHERE owner = 'trinodb' AND repo = 'trino'
            AND updated_at < coalesce(CAST(? AS timestamp(6)), TIMESTAMP '9999-12-31 00:00:00')
    )
    SELECT owner, repo, id, name, node_id, check_suite_id, check_suite_node_id, head_branch, head_sha, path, run_number, run_attempt, event, status, conclusion, workflow_id, display_title, actor_id, actor_login, triggering_actor_login, pull_request_numbers, created_at, updated_at, run_started_at
    FROM versions
    WHERE row_num = 1
) s
ON t.id = s.id AND t.run_attempt = s.run_attempt
WHEN NOT MATCHED THEN INSERT (owner, repo, id, name, node_id, check_suite_id, check_suite_node_id, head_branch, head_sha, path, run_number, run_attempt, event, status, conclusion, workflow_id, display_title, actor_id, actor_login, triggering_actor_login, pull_request_numbers, created_at, updated_at, run_started_at)
VALUES (s.owner, s.repo, s.id, s.name, s.node_id, s.check_suite_id, s.check_suite_node_id, s.head_branch, s.head_sha, s.path, s.run_number, s.run_attempt, s.event, s.status, s.conclusion, s.workflow_id, s.display_title, s.actor_id, s.actor_login, s.triggering_actor_login, s.pull_request_numbers, s.created_at, s.updated_at, s.run_started_at);

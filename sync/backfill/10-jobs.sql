-- Jobs of all attempts of workflow runs created before the cutoff, including attempts missing from runs.
-- Safe to repeat, rows that already exist are skipped.
-- parameters: cutoff
MERGE INTO trinocicd.github.jobs t
USING (
    WITH newer_runs AS (
        SELECT id
        FROM legacy.v2.runs
        WHERE owner = 'trinodb' AND repo = 'trino' AND id IS NOT NULL AND created_at >= coalesce(CAST(? AS timestamp(6)), TIMESTAMP '9999-12-31 00:00:00')
    ),
    versions AS (
        SELECT
            owner,
            repo,
            id,
            run_id,
            CAST(run_attempt AS bigint) AS run_attempt,
            node_id,
            head_sha,
            CAST(NULL AS varchar) AS head_branch,
            CAST(NULL AS varchar) AS workflow_name,
            status,
            conclusion,
            CAST(NULL AS timestamp(6)) AS created_at,
            CAST(CASE WHEN started_at > TIMESTAMP '1970-01-01' THEN started_at END AS timestamp(6)) AS started_at,
            CAST(CASE WHEN completed_at > TIMESTAMP '1970-01-01' THEN completed_at END AS timestamp(6)) AS completed_at,
            name,
            CAST(NULL AS array(row("status" varchar, "conclusion" varchar, "name" varchar, "number" bigint, "started_at" timestamp(6), "completed_at" timestamp(6)))) AS steps,
            CAST(NULL AS array(varchar)) AS labels,
            CAST(NULL AS bigint) AS runner_id,
            CAST(NULL AS varchar) AS runner_name,
            CAST(NULL AS varchar) AS runner_group_name,
            row_number() OVER (PARTITION BY id ORDER BY completed_at DESC) AS row_num
        FROM legacy.v2.jobs o
        WHERE owner = 'trinodb' AND repo = 'trino'
            AND run_id NOT IN (SELECT id FROM newer_runs)
    )
    SELECT owner, repo, id, run_id, run_attempt, node_id, head_sha, head_branch, workflow_name, status, conclusion, created_at, started_at, completed_at, name, steps, labels, runner_id, runner_name, runner_group_name
    FROM versions
    WHERE row_num = 1
) s
ON t.id = s.id
WHEN NOT MATCHED THEN INSERT (owner, repo, id, run_id, run_attempt, node_id, head_sha, head_branch, workflow_name, status, conclusion, created_at, started_at, completed_at, name, steps, labels, runner_id, runner_name, runner_group_name)
VALUES (s.owner, s.repo, s.id, s.run_id, s.run_attempt, s.node_id, s.head_sha, s.head_branch, s.workflow_name, s.status, s.conclusion, s.created_at, s.started_at, s.completed_at, s.name, s.steps, s.labels, s.runner_id, s.runner_name, s.runner_group_name);

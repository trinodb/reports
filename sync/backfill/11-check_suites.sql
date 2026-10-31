-- Check suites created before the cutoff, including ones of runs missing from runs.
-- Safe to repeat, rows that already exist are skipped.
-- parameters: cutoff
MERGE INTO trinocicd.github.check_suites t
USING (
    WITH versions AS (
        SELECT
            owner,
            repo,
            id,
            CAST(NULL AS varchar) AS node_id,
            head_branch,
            head_sha,
            status,
            conclusion,
            url,
            CAST(nullif(before, '') AS varchar) AS before,
            CAST(nullif(after, '') AS varchar) AS after,
            app_id,
            app_slug,
            pull_request_numbers,
            CAST(created_at AS timestamp(6)) AS created_at,
            CAST(updated_at AS timestamp(6)) AS updated_at,
            latest_check_runs_count,
            row_number() OVER (PARTITION BY id ORDER BY updated_at DESC) AS row_num
        FROM legacy.v2.check_suites o
        WHERE owner = 'trinodb' AND repo = 'trino'
            AND created_at < coalesce(CAST(? AS timestamp(6)), TIMESTAMP '9999-12-31 00:00:00')
    )
    SELECT owner, repo, id, node_id, head_branch, head_sha, status, conclusion, url, before, after, app_id, app_slug, pull_request_numbers, created_at, updated_at, latest_check_runs_count
    FROM versions
    WHERE row_num = 1
) s
ON t.id = s.id
WHEN NOT MATCHED THEN INSERT (owner, repo, id, node_id, head_branch, head_sha, status, conclusion, url, before, after, app_id, app_slug, pull_request_numbers, created_at, updated_at, latest_check_runs_count)
VALUES (s.owner, s.repo, s.id, s.node_id, s.head_branch, s.head_sha, s.status, s.conclusion, s.url, s.before, s.after, s.app_id, s.app_slug, s.pull_request_numbers, s.created_at, s.updated_at, s.latest_check_runs_count);

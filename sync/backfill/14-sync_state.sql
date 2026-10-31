-- Marks the parents of backfilled children as already read, with their current version, like the batch steps do,
-- so the first sync doesn't read the children of every backfilled parent again.
-- Workflow runs, check suites, and check runs are only marked when the old tables have their children,
-- so the sync reads children the old sync missed, if they're recent enough for the steps to read them.
-- Safe to repeat, parents that are already marked are skipped.
INSERT INTO trinocicd.github.sync_state (step, owner, repo, parent_id, version, checked_at)
WITH suites_with_check_runs AS (
    SELECT check_suite_id
    FROM trinocicd.github.check_runs
    WHERE owner = 'trinodb' AND repo = 'trino' AND check_suite_id IS NOT NULL
),
check_runs_with_annotations AS (
    SELECT check_run_id
    FROM trinocicd.github.check_run_annotations
    WHERE owner = 'trinodb' AND repo = 'trino' AND check_run_id IS NOT NULL
),
parents AS (
    SELECT s.step, number AS parent_id, CAST(updated_at AS varchar) AS version
    FROM trinocicd.github.pulls
    CROSS JOIN (VALUES 'pull_commits', 'pull_stats', 'reviews') AS s(step)
    WHERE owner = 'trinodb' AND repo = 'trino'
    UNION ALL
    -- the version is the newest attempt with jobs, so runs with jobs of only some attempts are read again
    SELECT 'jobs', run_id, CAST(max(run_attempt) AS varchar)
    FROM trinocicd.github.jobs
    WHERE owner = 'trinodb' AND repo = 'trino'
    GROUP BY run_id
    UNION ALL
    SELECT s.step, check_suite_id, CAST(max(run_attempt) AS varchar)
    FROM trinocicd.github.runs
    CROSS JOIN (VALUES 'check_suites', 'check_runs') AS s(step)
    WHERE owner = 'trinodb' AND repo = 'trino' AND check_suite_id IS NOT NULL
        AND check_suite_id IN (SELECT check_suite_id FROM suites_with_check_runs)
    GROUP BY s.step, check_suite_id
    UNION ALL
    SELECT 'check_run_annotations', id, CAST(annotations_count AS varchar)
    FROM trinocicd.github.check_runs
    WHERE owner = 'trinodb' AND repo = 'trino' AND annotations_count > 0
        AND id IN (SELECT check_run_id FROM check_runs_with_annotations)
),
marked AS (
    SELECT step, parent_id
    FROM trinocicd.github.sync_state
    WHERE owner = 'trinodb' AND repo = 'trino'
)
SELECT p.step, 'trinodb', 'trino', p.parent_id, p.version, CAST(current_timestamp AS timestamp(6))
FROM parents p
WHERE NOT EXISTS (
    SELECT 1
    FROM marked m
    WHERE m.step = p.step AND m.parent_id = p.parent_id
);

-- Marks the parents read in this batch.
INSERT INTO trinocicd.github.sync_state (step, owner, repo, parent_id, version, checked_at)
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
)
SELECT 'jobs', 'trinodb', 'trino', parent_id, version, CAST(current_timestamp AS timestamp(6))
FROM batch;

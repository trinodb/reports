-- Marks the parents read in this batch.
INSERT INTO trinocicd.github.sync_state (step, owner, repo, parent_id, version, checked_at)
WITH parents AS (
    SELECT pull_number AS parent_id, CAST(max(updated_at) AS varchar) AS version
    FROM trinocicd.github.pull_stats
    WHERE owner = 'trinodb' AND repo = 'trino' AND merged_at IS NOT NULL AND merged IS NULL
    GROUP BY pull_number
),
checked AS (
    SELECT parent_id, max_by(version, checked_at) AS version
    FROM trinocicd.github.sync_state
    WHERE step = 'pull_merged_by' AND owner = 'trinodb' AND repo = 'trino'
    GROUP BY parent_id
),
recently_checked AS (
    SELECT count(*) AS parents
    FROM trinocicd.github.sync_state
    WHERE step = 'pull_merged_by' AND owner = 'trinodb' AND repo = 'trino' AND checked_at > current_timestamp - INTERVAL '1' HOUR
),
batch AS (
    SELECT p.parent_id, p.version
    FROM parents p
    LEFT JOIN checked c ON c.parent_id = p.parent_id
    WHERE c.parent_id IS NULL AND (SELECT parents FROM recently_checked) < 1200
    ORDER BY p.parent_id DESC
    LIMIT 30
)
SELECT 'pull_merged_by', 'trinodb', 'trino', parent_id, version, CAST(current_timestamp AS timestamp(6))
FROM batch;

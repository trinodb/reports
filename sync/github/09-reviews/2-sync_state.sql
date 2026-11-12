-- Marks the parents read in this batch.
-- parameters: owner, repo, owner, repo, owner, repo
INSERT INTO trinocicd.github.sync_state (step, owner, repo, parent_id, version, checked_at)
WITH parents AS (
    SELECT number AS parent_id, CAST(updated_at AS varchar) AS version
    FROM trinocicd.github.pulls
    WHERE owner = ? AND repo = ?
),
checked AS (
    SELECT parent_id, max_by(version, checked_at) AS version
    FROM trinocicd.github.sync_state
    WHERE step = 'reviews' AND owner = ? AND repo = ?
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
SELECT 'reviews', ?, ?, parent_id, version, CAST(current_timestamp AS timestamp(6))
FROM batch;

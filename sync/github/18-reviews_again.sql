-- trino-rest missed the reviews of about half of the pull requests, and the copy of its tables marked all of them as
-- read, so the reviews step reads them only when they change. This marks pull requests opened before the copy with
-- a version they never have, once, newest first, at most 1,200 in a sync, so the reviews step of the next sync reads
-- them again, and saves their real version. It waits until the ones marked before are read, so they don't pile up
-- when the reviews step fails. When all are marked, it adds no rows.
INSERT INTO trinocicd.github.sync_state (step, owner, repo, parent_id, version, checked_at)
WITH checked AS (
    SELECT parent_id, max_by(version, checked_at) AS version, count_if(version = 'read again') AS marked
    FROM trinocicd.github.sync_state
    WHERE step = 'reviews' AND owner = 'trinodb' AND repo = 'trino'
    GROUP BY parent_id
)
SELECT 'reviews', 'trinodb', 'trino', p.number, 'read again', CAST(current_timestamp AS timestamp(6))
FROM trinocicd.github.pulls p
LEFT JOIN checked c ON c.parent_id = p.number
WHERE p.owner = 'trinodb' AND p.repo = 'trino' AND p.created_at < TIMESTAMP '2026-11-12'
    AND coalesce(c.marked, 0) = 0
    AND NOT EXISTS (SELECT 1 FROM checked WHERE version = 'read again')
ORDER BY p.number DESC
LIMIT 1200;

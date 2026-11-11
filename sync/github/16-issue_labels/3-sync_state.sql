-- Moves the cursor to the last issue with labels among the next 1,000 ones, so it never passes issues this batch
-- didn't read, like when GitHub returned issues missing in the table. Issues before it still without labels weren't
-- returned by GitHub, like deleted ones, and are skipped. Without any issues left to read, the cursor stays, and the loop stops.
INSERT INTO trinocicd.github.sync_state (step, owner, repo, parent_id, version, checked_at)
WITH cursor AS (
    SELECT coalesce(max(CAST(version AS timestamp(6))), TIMESTAMP '2000-01-01') AS updated_at
    FROM trinocicd.github.sync_state
    WHERE step = 'issue_labels' AND owner = 'trinodb' AND repo = 'trino'
),
next AS (
    SELECT updated_at, labels
    FROM trinocicd.github.issues
    WHERE owner = 'trinodb' AND repo = 'trino' AND updated_at >= (SELECT updated_at FROM cursor)
    ORDER BY updated_at
    LIMIT 1000
)
SELECT 'issue_labels', 'trinodb', 'trino', CAST(NULL AS bigint), CAST(max(updated_at) AS varchar), CAST(current_timestamp AS timestamp(6))
FROM next
WHERE labels IS NOT NULL
HAVING max(updated_at) > (SELECT updated_at FROM cursor)
    AND EXISTS (
        SELECT 1
        FROM trinocicd.github.issues
        WHERE owner = 'trinodb' AND repo = 'trino' AND labels IS NULL AND updated_at >= (SELECT updated_at FROM cursor));

-- Marks the parents read in this batch.
INSERT INTO trinocicd.github.sync_state (step, owner, repo, parent_id, version, checked_at)
WITH people AS (
    -- the newest login, because people can change it
    SELECT user_id AS parent_id, max_by(user_login, at) AS login
    FROM (
        SELECT user_id, user_login, created_at AS at
        FROM trinocicd.github.pulls
        WHERE owner = 'trinodb' AND repo = 'trino' AND created_at >= current_timestamp - INTERVAL '2' YEAR
        UNION ALL
        SELECT user_id, user_login, submitted_at
        FROM trinocicd.github.reviews
        WHERE owner = 'trinodb' AND repo = 'trino' AND submitted_at >= current_timestamp - INTERVAL '2' YEAR
    )
    WHERE user_id IS NOT NULL AND user_login NOT LIKE '%[bot]'
    GROUP BY user_id
),
checked AS (
    SELECT parent_id, max_by(version, checked_at) AS version
    FROM trinocicd.github.sync_state
    WHERE step = 'users' AND owner = 'trinodb' AND repo = 'trino'
    GROUP BY parent_id
),
batch AS (
    SELECT p.parent_id, p.login, CAST(date_trunc('quarter', current_date) AS varchar) AS version
    FROM people p
    LEFT JOIN checked c ON c.parent_id = p.parent_id
    WHERE c.version IS NULL OR c.version != CAST(date_trunc('quarter', current_date) AS varchar)
    ORDER BY p.parent_id
    LIMIT 30
)
SELECT 'users', 'trinodb', 'trino', parent_id, version, CAST(current_timestamp AS timestamp(6))
FROM batch;

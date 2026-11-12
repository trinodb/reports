-- Profiles of people who opened or reviewed pull requests in the last 2 years, for their company and location, which
-- they can change at any time, so they're read again every quarter. GitHub doesn't return deleted accounts, which keep
-- their last profile.
-- loop: batches
MERGE INTO trinocicd.github.users t
USING (
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
    ),
    fetched AS (
        SELECT
            id,
            login,
            name,
            company,
            location,
            CAST(created_at AS timestamp(6)) AS created_at,
            CAST(updated_at AS timestamp(6)) AS updated_at,
            row_number() OVER (PARTITION BY id) AS row_num
        FROM github.default.users
        WHERE username IN (SELECT login FROM batch)
    )
    SELECT *
    FROM fetched
    WHERE row_num = 1
) s
ON t.id = s.id
WHEN MATCHED THEN UPDATE SET
    login = s.login,
    name = s.name,
    company = s.company,
    location = s.location,
    created_at = s.created_at,
    updated_at = s.updated_at
WHEN NOT MATCHED THEN INSERT (id, login, name, company, location, created_at, updated_at)
VALUES (s.id, s.login, s.name, s.company, s.location, s.created_at, s.updated_at);

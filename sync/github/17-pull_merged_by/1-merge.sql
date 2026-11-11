-- Who merged pull requests, missing in their statistics copied from trino-rest, which are the only ones without merged.
-- They're read once, newest first, at most 1,200 an hour, so other workflows sharing the rate limit can still make requests.
-- All versions of the statistics after the merge get the same value, since it can't change.
-- loop: batches
MERGE INTO trinocicd.github.pull_stats t
USING (
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
    ),
    fetched AS (
        SELECT
            owner,
            repo,
            pull_number,
            merged_by.id AS merged_by_id,
            merged_by.login AS merged_by_login,
            row_number() OVER (PARTITION BY pull_number) AS row_num
        FROM github.default.repos_pulls
        WHERE owner = 'trinodb' AND repo = 'trino'
            AND pull_number IN (SELECT parent_id FROM batch)
    )
    SELECT *
    FROM fetched
    WHERE row_num = 1
) s
ON t.owner = s.owner AND t.repo = s.repo AND t.pull_number = s.pull_number
WHEN MATCHED AND t.merged_at IS NOT NULL AND t.merged_by_login IS NULL THEN UPDATE SET
    merged_by_id = s.merged_by_id,
    merged_by_login = s.merged_by_login;

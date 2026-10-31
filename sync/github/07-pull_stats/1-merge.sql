-- Statistics of pull requests, like the number of changed lines, which are only returned when reading a single
-- pull request. Read for every version of a pull request, identified by the time it was last updated.
-- loop: batches
MERGE INTO trinocicd.github.pull_stats t
USING (
    WITH parents AS (
        SELECT number AS parent_id, CAST(updated_at AS varchar) AS version
        FROM trinocicd.github.pulls
        WHERE owner = 'trinodb' AND repo = 'trino'
    ),
    checked AS (
        SELECT parent_id, max_by(version, checked_at) AS version
        FROM trinocicd.github.sync_state
        WHERE step = 'pull_stats' AND owner = 'trinodb' AND repo = 'trino'
        GROUP BY parent_id
    ),
    batch AS (
        SELECT p.parent_id, p.version
        FROM parents p
        LEFT JOIN checked c ON c.parent_id = p.parent_id
        WHERE c.parent_id IS NULL OR c.version <> p.version
        ORDER BY p.parent_id
        LIMIT 30
    ),
    fetched AS (
        SELECT
            owner,
            repo,
            pull_number,
            comments,
            review_comments,
            commits,
            additions,
            deletions,
            changed_files,
            merged,
            mergeable_state,
            merged_by.id AS merged_by_id,
            merged_by.login AS merged_by_login,
            created_at,
            updated_at,
            closed_at,
            merged_at,
            row_number() OVER (PARTITION BY pull_number, updated_at) AS row_num
        FROM github.default.repos_pulls
        WHERE owner = 'trinodb' AND repo = 'trino'
            AND pull_number IN (SELECT parent_id FROM batch)
    )
    SELECT *
    FROM fetched
    WHERE row_num = 1
) s
ON t.owner = s.owner AND t.repo = s.repo AND t.pull_number = s.pull_number AND t.updated_at = s.updated_at
WHEN NOT MATCHED THEN INSERT (
    owner,
    repo,
    pull_number,
    comments,
    review_comments,
    commits,
    additions,
    deletions,
    changed_files,
    merged,
    mergeable_state,
    merged_by_id,
    merged_by_login,
    created_at,
    updated_at,
    closed_at,
    merged_at
)
VALUES (
    s.owner,
    s.repo,
    s.pull_number,
    s.comments,
    s.review_comments,
    s.commits,
    s.additions,
    s.deletions,
    s.changed_files,
    s.merged,
    s.mergeable_state,
    s.merged_by_id,
    s.merged_by_login,
    s.created_at,
    s.updated_at,
    s.closed_at,
    s.merged_at
);

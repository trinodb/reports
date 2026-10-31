-- Every version of pull request statistics, from before the cutoff.
-- Safe to repeat, rows that already exist are skipped.
-- parameters: cutoff
MERGE INTO trinocicd.github.pull_stats t
USING (
    WITH versions AS (
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
            CAST(NULL AS boolean) AS merged,
            CAST(NULL AS varchar) AS mergeable_state,
            CAST(NULL AS bigint) AS merged_by_id,
            CAST(NULL AS varchar) AS merged_by_login,
            CAST(created_at AS timestamp(6)) AS created_at,
            CAST(updated_at AS timestamp(6)) AS updated_at,
            CAST(closed_at AS timestamp(6)) AS closed_at,
            CAST(merged_at AS timestamp(6)) AS merged_at,
            row_number() OVER (PARTITION BY pull_number, updated_at ORDER BY updated_at DESC) AS row_num
        FROM legacy.v2.pull_stats o
        WHERE owner = 'trinodb' AND repo = 'trino'
            AND updated_at < coalesce(CAST(? AS timestamp(6)), TIMESTAMP '9999-12-31 00:00:00')
    )
    SELECT owner, repo, pull_number, comments, review_comments, commits, additions, deletions, changed_files, merged, mergeable_state, merged_by_id, merged_by_login, created_at, updated_at, closed_at, merged_at
    FROM versions
    WHERE row_num = 1
) s
ON t.owner = s.owner AND t.repo = s.repo AND t.pull_number = s.pull_number AND t.updated_at = s.updated_at
WHEN NOT MATCHED THEN INSERT (owner, repo, pull_number, comments, review_comments, commits, additions, deletions, changed_files, merged, mergeable_state, merged_by_id, merged_by_login, created_at, updated_at, closed_at, merged_at)
VALUES (s.owner, s.repo, s.pull_number, s.comments, s.review_comments, s.commits, s.additions, s.deletions, s.changed_files, s.merged, s.mergeable_state, s.merged_by_id, s.merged_by_login, s.created_at, s.updated_at, s.closed_at, s.merged_at);

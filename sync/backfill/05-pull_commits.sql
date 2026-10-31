-- Commits of pull requests, from before the cutoff.
-- Safe to repeat, rows that already exist are skipped.
-- parameters: cutoff
MERGE INTO trinocicd.github.pull_commits t
USING (
    WITH versions AS (
        SELECT
            owner,
            repo,
            sha,
            pull_number,
            commit_message,
            commit_tree_sha,
            commit_comment_count,
            commit_verified,
            commit_verification_reason,
            author_name,
            author_email,
            CAST(author_date AS timestamp(6)) AS author_date,
            CAST(nullif(author_id, 0) AS bigint) AS author_id,
            CAST(nullif(author_login, '') AS varchar) AS author_login,
            committer_name,
            committer_email,
            CAST(committer_date AS timestamp(6)) AS committer_date,
            CAST(nullif(committer_id, 0) AS bigint) AS committer_id,
            CAST(nullif(committer_login, '') AS varchar) AS committer_login,
            parent_shas,
            row_number() OVER (PARTITION BY pull_number, sha ORDER BY committer_date DESC) AS row_num
        FROM legacy.v2.pull_commits o
        WHERE owner = 'trinodb' AND repo = 'trino'
            AND committer_date < coalesce(CAST(? AS timestamp(6)), TIMESTAMP '9999-12-31 00:00:00')
    )
    SELECT owner, repo, sha, pull_number, commit_message, commit_tree_sha, commit_comment_count, commit_verified, commit_verification_reason, author_name, author_email, author_date, author_id, author_login, committer_name, committer_email, committer_date, committer_id, committer_login, parent_shas
    FROM versions
    WHERE row_num = 1
) s
ON t.owner = s.owner AND t.repo = s.repo AND t.pull_number = s.pull_number AND t.sha = s.sha
WHEN NOT MATCHED THEN INSERT (owner, repo, sha, pull_number, commit_message, commit_tree_sha, commit_comment_count, commit_verified, commit_verification_reason, author_name, author_email, author_date, author_id, author_login, committer_name, committer_email, committer_date, committer_id, committer_login, parent_shas)
VALUES (s.owner, s.repo, s.sha, s.pull_number, s.commit_message, s.commit_tree_sha, s.commit_comment_count, s.commit_verified, s.commit_verification_reason, s.author_name, s.author_email, s.author_date, s.author_id, s.author_login, s.committer_name, s.committer_email, s.committer_date, s.committer_id, s.committer_login, s.parent_shas);

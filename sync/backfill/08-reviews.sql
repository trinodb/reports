-- Reviews submitted before the cutoff.
-- Safe to repeat, rows that already exist are skipped.
-- parameters: cutoff
MERGE INTO trinocicd.github.reviews t
USING (
    WITH versions AS (
        SELECT
            owner,
            repo,
            id,
            CAST(NULL AS varchar) AS node_id,
            pull_number,
            user_id,
            user_login,
            body,
            state,
            CAST(NULL AS varchar) AS html_url,
            CAST(submitted_at AS timestamp(6)) AS submitted_at,
            commit_id,
            author_association,
            row_number() OVER (PARTITION BY id ORDER BY submitted_at DESC) AS row_num
        FROM legacy.v2.reviews o
        WHERE owner = 'trinodb' AND repo = 'trino'
            AND submitted_at < coalesce(CAST(? AS timestamp(6)), TIMESTAMP '9999-12-31 00:00:00')
    )
    SELECT owner, repo, id, node_id, pull_number, user_id, user_login, body, state, html_url, submitted_at, commit_id, author_association
    FROM versions
    WHERE row_num = 1
) s
ON t.id = s.id
WHEN NOT MATCHED THEN INSERT (owner, repo, id, node_id, pull_number, user_id, user_login, body, state, html_url, submitted_at, commit_id, author_association)
VALUES (s.owner, s.repo, s.id, s.node_id, s.pull_number, s.user_id, s.user_login, s.body, s.state, s.html_url, s.submitted_at, s.commit_id, s.author_association);

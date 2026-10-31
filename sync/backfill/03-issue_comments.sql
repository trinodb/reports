-- The newest version of every issue comment, from before the cutoff.
-- Safe to repeat, rows that already exist are skipped.
-- parameters: cutoff
MERGE INTO trinocicd.github.issue_comments t
USING (
    WITH versions AS (
        SELECT
            owner,
            repo,
            id,
            node_id,
            url,
            html_url,
            body,
            user_id,
            user_login,
            CAST(created_at AS timestamp(6)) AS created_at,
            CAST(updated_at AS timestamp(6)) AS updated_at,
            issue_url,
            CAST(regexp_extract(issue_url, '/issues/(\d+)$', 1) AS bigint) AS issue_number,
            author_association,
            CAST(reactions_total_count AS bigint) AS reactions_total_count,
            CAST(nullif(app_id, 0) AS bigint) AS app_id,
            CAST(nullif(app_slug, '') AS varchar) AS app_slug,
            row_number() OVER (PARTITION BY id ORDER BY updated_at DESC) AS row_num
        FROM legacy.v2.issue_comments o
        WHERE owner = 'trinodb' AND repo = 'trino'
            AND updated_at < coalesce(CAST(? AS timestamp(6)), TIMESTAMP '9999-12-31 00:00:00')
    )
    SELECT owner, repo, id, node_id, url, html_url, body, user_id, user_login, created_at, updated_at, issue_url, issue_number, author_association, reactions_total_count, app_id, app_slug
    FROM versions
    WHERE row_num = 1
) s
ON t.id = s.id
WHEN NOT MATCHED THEN INSERT (owner, repo, id, node_id, url, html_url, body, user_id, user_login, created_at, updated_at, issue_url, issue_number, author_association, reactions_total_count, app_id, app_slug)
VALUES (s.owner, s.repo, s.id, s.node_id, s.url, s.html_url, s.body, s.user_id, s.user_login, s.created_at, s.updated_at, s.issue_url, s.issue_number, s.author_association, s.reactions_total_count, s.app_id, s.app_slug);

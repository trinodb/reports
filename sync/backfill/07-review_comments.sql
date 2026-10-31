-- The newest version of every review comment, from before the cutoff.
-- Safe to repeat, rows that already exist are skipped.
-- parameters: cutoff
MERGE INTO trinocicd.github.review_comments t
USING (
    WITH versions AS (
        SELECT
            owner,
            repo,
            id,
            CAST(NULL AS varchar) AS node_id,
            CAST(NULL AS varchar) AS url,
            CAST(NULL AS varchar) AS html_url,
            pull_request_review_id,
            diff_hunk,
            path,
            CAST(nullif(position, 0) AS bigint) AS position,
            CAST(nullif(original_position, 0) AS bigint) AS original_position,
            commit_id,
            original_commit_id,
            CAST(nullif(in_reply_to_id, 0) AS bigint) AS in_reply_to_id,
            user_id,
            user_login,
            body,
            CAST(created_at AS timestamp(6)) AS created_at,
            CAST(updated_at AS timestamp(6)) AS updated_at,
            pull_request_url,
            CAST(regexp_extract(pull_request_url, '/pulls/(\d+)$', 1) AS bigint) AS pull_number,
            author_association,
            CAST(nullif(start_line, 0) AS bigint) AS start_line,
            CAST(nullif(original_start_line, 0) AS bigint) AS original_start_line,
            start_side,
            CAST(nullif(line, 0) AS bigint) AS line,
            CAST(nullif(original_line, 0) AS bigint) AS original_line,
            side,
            CAST(NULL AS varchar) AS subject_type,
            CAST(NULL AS bigint) AS reactions_total_count,
            row_number() OVER (PARTITION BY id ORDER BY updated_at DESC) AS row_num
        FROM legacy.v2.review_comments o
        WHERE owner = 'trinodb' AND repo = 'trino'
            AND updated_at < coalesce(CAST(? AS timestamp(6)), TIMESTAMP '9999-12-31 00:00:00')
    )
    SELECT owner, repo, id, node_id, url, html_url, pull_request_review_id, diff_hunk, path, position, original_position, commit_id, original_commit_id, in_reply_to_id, user_id, user_login, body, created_at, updated_at, pull_request_url, pull_number, author_association, start_line, original_start_line, start_side, line, original_line, side, subject_type, reactions_total_count
    FROM versions
    WHERE row_num = 1
) s
ON t.id = s.id
WHEN NOT MATCHED THEN INSERT (owner, repo, id, node_id, url, html_url, pull_request_review_id, diff_hunk, path, position, original_position, commit_id, original_commit_id, in_reply_to_id, user_id, user_login, body, created_at, updated_at, pull_request_url, pull_number, author_association, start_line, original_start_line, start_side, line, original_line, side, subject_type, reactions_total_count)
VALUES (s.owner, s.repo, s.id, s.node_id, s.url, s.html_url, s.pull_request_review_id, s.diff_hunk, s.path, s.position, s.original_position, s.commit_id, s.original_commit_id, s.in_reply_to_id, s.user_id, s.user_login, s.body, s.created_at, s.updated_at, s.pull_request_url, s.pull_number, s.author_association, s.start_line, s.original_start_line, s.start_side, s.line, s.original_line, s.side, s.subject_type, s.reactions_total_count);

-- The newest version of every pull request, from before the cutoff.
-- Safe to repeat, rows that already exist are skipped.
-- parameters: cutoff
MERGE INTO trinocicd.github.pulls t
USING (
    WITH versions AS (
        SELECT
            owner,
            repo,
            id,
            node_id,
            url,
            html_url,
            number,
            state,
            locked,
            title,
            user_id,
            user_login,
            body,
            label_names,
            milestone_id,
            milestone_title,
            active_lock_reason,
            CAST(created_at AS timestamp(6)) AS created_at,
            CAST(updated_at AS timestamp(6)) AS updated_at,
            CAST(closed_at AS timestamp(6)) AS closed_at,
            CAST(merged_at AS timestamp(6)) AS merged_at,
            merge_commit_sha,
            assignee_id,
            assignee_login,
            CAST(NULL AS array(varchar)) AS assignee_logins,
            requested_reviewer_logins,
            head_ref,
            head_sha,
            base_ref,
            base_sha,
            author_association,
            draft,
            auto_merge_method,
            row_number() OVER (PARTITION BY id ORDER BY updated_at DESC) AS row_num
        FROM legacy.v2.pulls o
        WHERE owner = 'trinodb' AND repo = 'trino'
            AND updated_at < coalesce(CAST(? AS timestamp(6)), TIMESTAMP '9999-12-31 00:00:00')
    )
    SELECT owner, repo, id, node_id, url, html_url, number, state, locked, title, user_id, user_login, body, label_names, milestone_id, milestone_title, active_lock_reason, created_at, updated_at, closed_at, merged_at, merge_commit_sha, assignee_id, assignee_login, assignee_logins, requested_reviewer_logins, head_ref, head_sha, base_ref, base_sha, author_association, draft, auto_merge_method
    FROM versions
    WHERE row_num = 1
) s
ON t.id = s.id
WHEN NOT MATCHED THEN INSERT (owner, repo, id, node_id, url, html_url, number, state, locked, title, user_id, user_login, body, label_names, milestone_id, milestone_title, active_lock_reason, created_at, updated_at, closed_at, merged_at, merge_commit_sha, assignee_id, assignee_login, assignee_logins, requested_reviewer_logins, head_ref, head_sha, base_ref, base_sha, author_association, draft, auto_merge_method)
VALUES (s.owner, s.repo, s.id, s.node_id, s.url, s.html_url, s.number, s.state, s.locked, s.title, s.user_id, s.user_login, s.body, s.label_names, s.milestone_id, s.milestone_title, s.active_lock_reason, s.created_at, s.updated_at, s.closed_at, s.merged_at, s.merge_commit_sha, s.assignee_id, s.assignee_login, s.assignee_logins, s.requested_reviewer_logins, s.head_ref, s.head_sha, s.base_ref, s.base_sha, s.author_association, s.draft, s.auto_merge_method);

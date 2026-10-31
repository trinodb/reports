-- The newest version of every issue, from before the cutoff.
-- Safe to repeat, rows that already exist are skipped.
-- parameters: cutoff
MERGE INTO trinocicd.github.issues t
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
            CAST(NULL AS varchar) AS state_reason,
            title,
            body,
            user_id,
            user_login,
            CAST(NULL AS array(varchar)) AS labels,
            assignee_id,
            assignee_login,
            CAST(NULL AS array(varchar)) AS assignee_logins,
            milestone_id,
            milestone_title,
            locked,
            active_lock_reason,
            comments,
            CAST(NULL AS varchar) AS pull_request_url,
            CAST(NULL AS timestamp(6)) AS pull_request_merged_at,
            CAST(closed_at AS timestamp(6)) AS closed_at,
            CAST(created_at AS timestamp(6)) AS created_at,
            CAST(updated_at AS timestamp(6)) AS updated_at,
            closed_by_id,
            closed_by_login,
            author_association,
            draft,
            CAST(reactions_total_count AS bigint) AS reactions_total_count,
            CAST(NULL AS varchar) AS type_name,
            row_number() OVER (PARTITION BY id ORDER BY updated_at DESC) AS row_num
        FROM legacy.v2.issues o
        WHERE owner = 'trinodb' AND repo = 'trino'
            AND updated_at < coalesce(CAST(? AS timestamp(6)), TIMESTAMP '9999-12-31 00:00:00')
    )
    SELECT owner, repo, id, node_id, url, html_url, number, state, state_reason, title, body, user_id, user_login, labels, assignee_id, assignee_login, assignee_logins, milestone_id, milestone_title, locked, active_lock_reason, comments, pull_request_url, pull_request_merged_at, closed_at, created_at, updated_at, closed_by_id, closed_by_login, author_association, draft, reactions_total_count, type_name
    FROM versions
    WHERE row_num = 1
) s
ON t.id = s.id
WHEN NOT MATCHED THEN INSERT (owner, repo, id, node_id, url, html_url, number, state, state_reason, title, body, user_id, user_login, labels, assignee_id, assignee_login, assignee_logins, milestone_id, milestone_title, locked, active_lock_reason, comments, pull_request_url, pull_request_merged_at, closed_at, created_at, updated_at, closed_by_id, closed_by_login, author_association, draft, reactions_total_count, type_name)
VALUES (s.owner, s.repo, s.id, s.node_id, s.url, s.html_url, s.number, s.state, s.state_reason, s.title, s.body, s.user_id, s.user_login, s.labels, s.assignee_id, s.assignee_login, s.assignee_logins, s.milestone_id, s.milestone_title, s.locked, s.active_lock_reason, s.comments, s.pull_request_url, s.pull_request_merged_at, s.closed_at, s.created_at, s.updated_at, s.closed_by_id, s.closed_by_login, s.author_association, s.draft, s.reactions_total_count, s.type_name);

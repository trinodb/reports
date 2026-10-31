-- V2: compares rows of the old tables with the ones read by the new sync, in the window between the cutoff
-- of the backfill and the last old sync before the new one started. Rows of the new tables updated after that
-- are counted as changed later. Parameters, replaced by verify.sh: cutoff, until.

-- commits
WITH l AS (
    SELECT sha, commit_message, commit_tree_sha, commit_comment_count, commit_verified, commit_verification_reason, author_name, author_email, author_date, author_id, author_login, committer_name, committer_email, committer_date, committer_id, committer_login, parent_shas
    FROM (
        SELECT sha, commit_message, commit_tree_sha, commit_comment_count, commit_verified, commit_verification_reason, author_name, author_email, author_date, author_id, author_login, committer_name, committer_email, committer_date, committer_id, committer_login, parent_shas, row_number() OVER (PARTITION BY sha ORDER BY committer_date DESC) AS row_num
        FROM legacy.v2.commits
        WHERE owner = 'trinodb' AND repo = 'trino' AND committer_date >= TIMESTAMP '${cutoff}' AND committer_date < TIMESTAMP '${until}'
    )
    WHERE row_num = 1
),
r AS (
    SELECT sha, commit_message, commit_tree_sha, commit_comment_count, commit_verified, commit_verification_reason, author_name, author_email, author_date, author_id, author_login, committer_name, committer_email, committer_date, committer_id, committer_login, parent_shas
    FROM trinocicd.github.commits
    WHERE owner = 'trinodb' AND repo = 'trino' AND committer_date >= TIMESTAMP '${cutoff}'
),
joined AS (
    SELECT
        l.sha IS NOT NULL AS in_left,
        r.sha IS NOT NULL AS in_right,
        coalesce(r.committer_date >= TIMESTAMP '${until}', false) AS changed_later,
        filter(ARRAY[
            IF(l.commit_message IS DISTINCT FROM r.commit_message, 'commit_message'),
            IF(l.commit_tree_sha IS DISTINCT FROM r.commit_tree_sha, 'commit_tree_sha'),
            IF(l.commit_comment_count IS DISTINCT FROM r.commit_comment_count, 'commit_comment_count'),
            IF(l.commit_verified IS DISTINCT FROM r.commit_verified, 'commit_verified'),
            IF(l.commit_verification_reason IS DISTINCT FROM r.commit_verification_reason, 'commit_verification_reason'),
            IF(l.author_name IS DISTINCT FROM r.author_name, 'author_name'),
            IF(l.author_email IS DISTINCT FROM r.author_email, 'author_email'),
            IF(l.author_date IS DISTINCT FROM r.author_date, 'author_date'),
            IF(l.author_id IS DISTINCT FROM r.author_id, 'author_id'),
            IF(l.author_login IS DISTINCT FROM r.author_login, 'author_login'),
            IF(l.committer_name IS DISTINCT FROM r.committer_name, 'committer_name'),
            IF(l.committer_email IS DISTINCT FROM r.committer_email, 'committer_email'),
            IF(l.committer_date IS DISTINCT FROM r.committer_date, 'committer_date'),
            IF(l.committer_id IS DISTINCT FROM r.committer_id, 'committer_id'),
            IF(l.committer_login IS DISTINCT FROM r.committer_login, 'committer_login'),
            IF(l.parent_shas IS DISTINCT FROM r.parent_shas, 'parent_shas')
        ], c -> c IS NOT NULL) AS differing
    FROM l
    FULL JOIN r ON l.sha = r.sha
)
SELECT
    'commits' AS "table",
    count(*) FILTER (WHERE in_left) AS "legacy rows",
    count(*) FILTER (WHERE in_right) AS "new rows",
    count(*) FILTER (WHERE NOT in_right) AS "only legacy",
    count(*) FILTER (WHERE NOT in_left AND NOT changed_later) AS "only new",
    count(*) FILTER (WHERE in_left AND in_right AND changed_later) AS "changed later",
    count(*) FILTER (WHERE in_left AND in_right AND NOT changed_later AND cardinality(differing) > 0) AS "differing rows",
    array_join(array_sort(array_distinct(flatten(array_agg(differing) FILTER (WHERE in_left AND in_right AND NOT changed_later)))), ', ') AS "differing columns"
FROM joined;

-- issues
WITH l AS (
    SELECT id, number, state, title, body, user_id, user_login, assignee_id, assignee_login, milestone_id, milestone_title, locked, active_lock_reason, comments, closed_at, created_at, updated_at, closed_by_id, closed_by_login, author_association, draft, reactions_total_count
    FROM (
        SELECT id, number, state, title, body, user_id, user_login, assignee_id, assignee_login, milestone_id, milestone_title, locked, active_lock_reason, comments, closed_at, created_at, updated_at, closed_by_id, closed_by_login, author_association, draft, reactions_total_count, row_number() OVER (PARTITION BY id ORDER BY updated_at DESC) AS row_num
        FROM legacy.v2.issues
        WHERE owner = 'trinodb' AND repo = 'trino' AND updated_at >= TIMESTAMP '${cutoff}' AND updated_at < TIMESTAMP '${until}'
    )
    WHERE row_num = 1
),
r AS (
    SELECT id, number, state, title, body, user_id, user_login, assignee_id, assignee_login, milestone_id, milestone_title, locked, active_lock_reason, comments, closed_at, created_at, updated_at, closed_by_id, closed_by_login, author_association, draft, reactions_total_count
    FROM trinocicd.github.issues
    WHERE owner = 'trinodb' AND repo = 'trino' AND updated_at >= TIMESTAMP '${cutoff}'
),
joined AS (
    SELECT
        l.id IS NOT NULL AS in_left,
        r.id IS NOT NULL AS in_right,
        coalesce(r.updated_at >= TIMESTAMP '${until}', false) AS changed_later,
        filter(ARRAY[
            IF(l.number IS DISTINCT FROM r.number, 'number'),
            IF(l.state IS DISTINCT FROM r.state, 'state'),
            IF(l.title IS DISTINCT FROM r.title, 'title'),
            IF(l.body IS DISTINCT FROM r.body, 'body'),
            IF(l.user_id IS DISTINCT FROM r.user_id, 'user_id'),
            IF(l.user_login IS DISTINCT FROM r.user_login, 'user_login'),
            IF(l.assignee_id IS DISTINCT FROM r.assignee_id, 'assignee_id'),
            IF(l.assignee_login IS DISTINCT FROM r.assignee_login, 'assignee_login'),
            IF(l.milestone_id IS DISTINCT FROM r.milestone_id, 'milestone_id'),
            IF(l.milestone_title IS DISTINCT FROM r.milestone_title, 'milestone_title'),
            IF(l.locked IS DISTINCT FROM r.locked, 'locked'),
            IF(l.active_lock_reason IS DISTINCT FROM r.active_lock_reason, 'active_lock_reason'),
            IF(l.comments IS DISTINCT FROM r.comments, 'comments'),
            IF(l.closed_at IS DISTINCT FROM r.closed_at, 'closed_at'),
            IF(l.created_at IS DISTINCT FROM r.created_at, 'created_at'),
            IF(l.updated_at IS DISTINCT FROM r.updated_at, 'updated_at'),
            IF(l.closed_by_id IS DISTINCT FROM r.closed_by_id, 'closed_by_id'),
            IF(l.closed_by_login IS DISTINCT FROM r.closed_by_login, 'closed_by_login'),
            IF(l.author_association IS DISTINCT FROM r.author_association, 'author_association'),
            IF(l.draft IS DISTINCT FROM r.draft, 'draft'),
            IF(l.reactions_total_count IS DISTINCT FROM r.reactions_total_count, 'reactions_total_count')
        ], c -> c IS NOT NULL) AS differing
    FROM l
    FULL JOIN r ON l.id = r.id
)
SELECT
    'issues' AS "table",
    count(*) FILTER (WHERE in_left) AS "legacy rows",
    count(*) FILTER (WHERE in_right) AS "new rows",
    count(*) FILTER (WHERE NOT in_right) AS "only legacy",
    count(*) FILTER (WHERE NOT in_left AND NOT changed_later) AS "only new",
    count(*) FILTER (WHERE in_left AND in_right AND changed_later) AS "changed later",
    count(*) FILTER (WHERE in_left AND in_right AND NOT changed_later AND cardinality(differing) > 0) AS "differing rows",
    array_join(array_sort(array_distinct(flatten(array_agg(differing) FILTER (WHERE in_left AND in_right AND NOT changed_later)))), ', ') AS "differing columns"
FROM joined;

-- issue_comments
WITH l AS (
    SELECT id, body, user_id, user_login, created_at, updated_at, issue_url, author_association, reactions_total_count, issue_number
    FROM (
        SELECT id, body, user_id, user_login, created_at, updated_at, issue_url, author_association, reactions_total_count, issue_number, row_number() OVER (PARTITION BY id ORDER BY updated_at DESC) AS row_num
        FROM legacy.v2.issue_comments
        WHERE owner = 'trinodb' AND repo = 'trino' AND updated_at >= TIMESTAMP '${cutoff}' AND updated_at < TIMESTAMP '${until}'
    )
    WHERE row_num = 1
),
r AS (
    SELECT id, body, user_id, user_login, created_at, updated_at, issue_url, author_association, reactions_total_count, issue_number
    FROM trinocicd.github.issue_comments
    WHERE owner = 'trinodb' AND repo = 'trino' AND updated_at >= TIMESTAMP '${cutoff}'
),
joined AS (
    SELECT
        l.id IS NOT NULL AS in_left,
        r.id IS NOT NULL AS in_right,
        coalesce(r.updated_at >= TIMESTAMP '${until}', false) AS changed_later,
        filter(ARRAY[
            IF(l.body IS DISTINCT FROM r.body, 'body'),
            IF(l.user_id IS DISTINCT FROM r.user_id, 'user_id'),
            IF(l.user_login IS DISTINCT FROM r.user_login, 'user_login'),
            IF(l.created_at IS DISTINCT FROM r.created_at, 'created_at'),
            IF(l.updated_at IS DISTINCT FROM r.updated_at, 'updated_at'),
            IF(l.issue_url IS DISTINCT FROM r.issue_url, 'issue_url'),
            IF(l.author_association IS DISTINCT FROM r.author_association, 'author_association'),
            IF(l.reactions_total_count IS DISTINCT FROM r.reactions_total_count, 'reactions_total_count'),
            IF(l.issue_number IS DISTINCT FROM r.issue_number, 'issue_number')
        ], c -> c IS NOT NULL) AS differing
    FROM l
    FULL JOIN r ON l.id = r.id
)
SELECT
    'issue_comments' AS "table",
    count(*) FILTER (WHERE in_left) AS "legacy rows",
    count(*) FILTER (WHERE in_right) AS "new rows",
    count(*) FILTER (WHERE NOT in_right) AS "only legacy",
    count(*) FILTER (WHERE NOT in_left AND NOT changed_later) AS "only new",
    count(*) FILTER (WHERE in_left AND in_right AND changed_later) AS "changed later",
    count(*) FILTER (WHERE in_left AND in_right AND NOT changed_later AND cardinality(differing) > 0) AS "differing rows",
    array_join(array_sort(array_distinct(flatten(array_agg(differing) FILTER (WHERE in_left AND in_right AND NOT changed_later)))), ', ') AS "differing columns"
FROM joined;

-- pulls
WITH l AS (
    SELECT id, number, state, locked, title, user_id, user_login, body, label_names, milestone_id, milestone_title, active_lock_reason, created_at, updated_at, closed_at, merged_at, merge_commit_sha, assignee_id, assignee_login, requested_reviewer_logins, head_ref, head_sha, base_ref, base_sha, author_association, draft, auto_merge_method
    FROM (
        SELECT id, number, state, locked, title, user_id, user_login, body, label_names, milestone_id, milestone_title, active_lock_reason, created_at, updated_at, closed_at, merged_at, merge_commit_sha, assignee_id, assignee_login, requested_reviewer_logins, head_ref, head_sha, base_ref, base_sha, author_association, draft, auto_merge_method, row_number() OVER (PARTITION BY id ORDER BY updated_at DESC) AS row_num
        FROM legacy.v2.pulls
        WHERE owner = 'trinodb' AND repo = 'trino' AND updated_at >= TIMESTAMP '${cutoff}' AND updated_at < TIMESTAMP '${until}'
    )
    WHERE row_num = 1
),
r AS (
    SELECT id, number, state, locked, title, user_id, user_login, body, label_names, milestone_id, milestone_title, active_lock_reason, created_at, updated_at, closed_at, merged_at, merge_commit_sha, assignee_id, assignee_login, requested_reviewer_logins, head_ref, head_sha, base_ref, base_sha, author_association, draft, auto_merge_method
    FROM trinocicd.github.pulls
    WHERE owner = 'trinodb' AND repo = 'trino' AND updated_at >= TIMESTAMP '${cutoff}'
),
joined AS (
    SELECT
        l.id IS NOT NULL AS in_left,
        r.id IS NOT NULL AS in_right,
        coalesce(r.updated_at >= TIMESTAMP '${until}', false) AS changed_later,
        filter(ARRAY[
            IF(l.number IS DISTINCT FROM r.number, 'number'),
            IF(l.state IS DISTINCT FROM r.state, 'state'),
            IF(l.locked IS DISTINCT FROM r.locked, 'locked'),
            IF(l.title IS DISTINCT FROM r.title, 'title'),
            IF(l.user_id IS DISTINCT FROM r.user_id, 'user_id'),
            IF(l.user_login IS DISTINCT FROM r.user_login, 'user_login'),
            IF(l.body IS DISTINCT FROM r.body, 'body'),
            IF(l.label_names IS DISTINCT FROM r.label_names, 'label_names'),
            IF(l.milestone_id IS DISTINCT FROM r.milestone_id, 'milestone_id'),
            IF(l.milestone_title IS DISTINCT FROM r.milestone_title, 'milestone_title'),
            IF(l.active_lock_reason IS DISTINCT FROM r.active_lock_reason, 'active_lock_reason'),
            IF(l.created_at IS DISTINCT FROM r.created_at, 'created_at'),
            IF(l.updated_at IS DISTINCT FROM r.updated_at, 'updated_at'),
            IF(l.closed_at IS DISTINCT FROM r.closed_at, 'closed_at'),
            IF(l.merged_at IS DISTINCT FROM r.merged_at, 'merged_at'),
            IF(l.merge_commit_sha IS DISTINCT FROM r.merge_commit_sha, 'merge_commit_sha'),
            IF(l.assignee_id IS DISTINCT FROM r.assignee_id, 'assignee_id'),
            IF(l.assignee_login IS DISTINCT FROM r.assignee_login, 'assignee_login'),
            IF(l.requested_reviewer_logins IS DISTINCT FROM r.requested_reviewer_logins, 'requested_reviewer_logins'),
            IF(l.head_ref IS DISTINCT FROM r.head_ref, 'head_ref'),
            IF(l.head_sha IS DISTINCT FROM r.head_sha, 'head_sha'),
            IF(l.base_ref IS DISTINCT FROM r.base_ref, 'base_ref'),
            IF(l.base_sha IS DISTINCT FROM r.base_sha, 'base_sha'),
            IF(l.author_association IS DISTINCT FROM r.author_association, 'author_association'),
            IF(l.draft IS DISTINCT FROM r.draft, 'draft'),
            IF(l.auto_merge_method IS DISTINCT FROM r.auto_merge_method, 'auto_merge_method')
        ], c -> c IS NOT NULL) AS differing
    FROM l
    FULL JOIN r ON l.id = r.id
)
SELECT
    'pulls' AS "table",
    count(*) FILTER (WHERE in_left) AS "legacy rows",
    count(*) FILTER (WHERE in_right) AS "new rows",
    count(*) FILTER (WHERE NOT in_right) AS "only legacy",
    count(*) FILTER (WHERE NOT in_left AND NOT changed_later) AS "only new",
    count(*) FILTER (WHERE in_left AND in_right AND changed_later) AS "changed later",
    count(*) FILTER (WHERE in_left AND in_right AND NOT changed_later AND cardinality(differing) > 0) AS "differing rows",
    array_join(array_sort(array_distinct(flatten(array_agg(differing) FILTER (WHERE in_left AND in_right AND NOT changed_later)))), ', ') AS "differing columns"
FROM joined;

-- pull_commits
WITH l AS (
    SELECT pull_number, sha, commit_message, author_name, author_email, author_date, author_login, committer_name, committer_email, committer_date, committer_login, parent_shas
    FROM (
        SELECT pull_number, sha, commit_message, author_name, author_email, author_date, author_login, committer_name, committer_email, committer_date, committer_login, parent_shas, row_number() OVER (PARTITION BY pull_number, sha ORDER BY committer_date DESC) AS row_num
        FROM legacy.v2.pull_commits
        WHERE owner = 'trinodb' AND repo = 'trino' AND committer_date >= TIMESTAMP '${cutoff}' AND committer_date < TIMESTAMP '${until}'
    )
    WHERE row_num = 1
),
r AS (
    SELECT pull_number, sha, commit_message, author_name, author_email, author_date, author_login, committer_name, committer_email, committer_date, committer_login, parent_shas
    FROM trinocicd.github.pull_commits
    WHERE owner = 'trinodb' AND repo = 'trino' AND committer_date >= TIMESTAMP '${cutoff}'
),
joined AS (
    SELECT
        l.pull_number IS NOT NULL AS in_left,
        r.pull_number IS NOT NULL AS in_right,
        coalesce(r.committer_date >= TIMESTAMP '${until}', false) AS changed_later,
        filter(ARRAY[
            IF(l.commit_message IS DISTINCT FROM r.commit_message, 'commit_message'),
            IF(l.author_name IS DISTINCT FROM r.author_name, 'author_name'),
            IF(l.author_email IS DISTINCT FROM r.author_email, 'author_email'),
            IF(l.author_date IS DISTINCT FROM r.author_date, 'author_date'),
            IF(l.author_login IS DISTINCT FROM r.author_login, 'author_login'),
            IF(l.committer_name IS DISTINCT FROM r.committer_name, 'committer_name'),
            IF(l.committer_email IS DISTINCT FROM r.committer_email, 'committer_email'),
            IF(l.committer_date IS DISTINCT FROM r.committer_date, 'committer_date'),
            IF(l.committer_login IS DISTINCT FROM r.committer_login, 'committer_login'),
            IF(l.parent_shas IS DISTINCT FROM r.parent_shas, 'parent_shas')
        ], c -> c IS NOT NULL) AS differing
    FROM l
    FULL JOIN r ON l.pull_number = r.pull_number AND l.sha = r.sha
)
SELECT
    'pull_commits' AS "table",
    count(*) FILTER (WHERE in_left) AS "legacy rows",
    count(*) FILTER (WHERE in_right) AS "new rows",
    count(*) FILTER (WHERE NOT in_right) AS "only legacy",
    count(*) FILTER (WHERE NOT in_left AND NOT changed_later) AS "only new",
    count(*) FILTER (WHERE in_left AND in_right AND changed_later) AS "changed later",
    count(*) FILTER (WHERE in_left AND in_right AND NOT changed_later AND cardinality(differing) > 0) AS "differing rows",
    array_join(array_sort(array_distinct(flatten(array_agg(differing) FILTER (WHERE in_left AND in_right AND NOT changed_later)))), ', ') AS "differing columns"
FROM joined;

-- pull_stats
WITH l AS (
    SELECT pull_number, updated_at, comments, review_comments, commits, additions, deletions, changed_files, created_at, closed_at, merged_at
    FROM (
        SELECT pull_number, updated_at, comments, review_comments, commits, additions, deletions, changed_files, created_at, closed_at, merged_at, row_number() OVER (PARTITION BY pull_number, updated_at ORDER BY updated_at DESC) AS row_num
        FROM legacy.v2.pull_stats
        WHERE owner = 'trinodb' AND repo = 'trino' AND updated_at >= TIMESTAMP '${cutoff}' AND updated_at < TIMESTAMP '${until}'
    )
    WHERE row_num = 1
),
r AS (
    SELECT pull_number, updated_at, comments, review_comments, commits, additions, deletions, changed_files, created_at, closed_at, merged_at
    FROM trinocicd.github.pull_stats
    WHERE owner = 'trinodb' AND repo = 'trino' AND updated_at >= TIMESTAMP '${cutoff}'
),
joined AS (
    SELECT
        l.pull_number IS NOT NULL AS in_left,
        r.pull_number IS NOT NULL AS in_right,
        coalesce(r.updated_at >= TIMESTAMP '${until}', false) AS changed_later,
        filter(ARRAY[
            IF(l.comments IS DISTINCT FROM r.comments, 'comments'),
            IF(l.review_comments IS DISTINCT FROM r.review_comments, 'review_comments'),
            IF(l.commits IS DISTINCT FROM r.commits, 'commits'),
            IF(l.additions IS DISTINCT FROM r.additions, 'additions'),
            IF(l.deletions IS DISTINCT FROM r.deletions, 'deletions'),
            IF(l.changed_files IS DISTINCT FROM r.changed_files, 'changed_files'),
            IF(l.created_at IS DISTINCT FROM r.created_at, 'created_at'),
            IF(l.closed_at IS DISTINCT FROM r.closed_at, 'closed_at'),
            IF(l.merged_at IS DISTINCT FROM r.merged_at, 'merged_at')
        ], c -> c IS NOT NULL) AS differing
    FROM l
    FULL JOIN r ON l.pull_number = r.pull_number AND l.updated_at = r.updated_at
)
SELECT
    'pull_stats' AS "table",
    count(*) FILTER (WHERE in_left) AS "legacy rows",
    count(*) FILTER (WHERE in_right) AS "new rows",
    count(*) FILTER (WHERE NOT in_right) AS "only legacy",
    count(*) FILTER (WHERE NOT in_left AND NOT changed_later) AS "only new",
    count(*) FILTER (WHERE in_left AND in_right AND changed_later) AS "changed later",
    count(*) FILTER (WHERE in_left AND in_right AND NOT changed_later AND cardinality(differing) > 0) AS "differing rows",
    array_join(array_sort(array_distinct(flatten(array_agg(differing) FILTER (WHERE in_left AND in_right AND NOT changed_later)))), ', ') AS "differing columns"
FROM joined;

-- review_comments
WITH l AS (
    SELECT id, pull_number, pull_request_review_id, diff_hunk, path, position, original_position, commit_id, original_commit_id, in_reply_to_id, user_id, user_login, body, created_at, updated_at, author_association, start_line, original_start_line, start_side, line, original_line, side
    FROM (
        SELECT id, pull_number, pull_request_review_id, diff_hunk, path, position, original_position, commit_id, original_commit_id, in_reply_to_id, user_id, user_login, body, created_at, updated_at, author_association, start_line, original_start_line, start_side, line, original_line, side, row_number() OVER (PARTITION BY id ORDER BY updated_at DESC) AS row_num
        FROM legacy.v2.review_comments
        WHERE owner = 'trinodb' AND repo = 'trino' AND updated_at >= TIMESTAMP '${cutoff}' AND updated_at < TIMESTAMP '${until}'
    )
    WHERE row_num = 1
),
r AS (
    SELECT id, pull_number, pull_request_review_id, diff_hunk, path, position, original_position, commit_id, original_commit_id, in_reply_to_id, user_id, user_login, body, created_at, updated_at, author_association, start_line, original_start_line, start_side, line, original_line, side
    FROM trinocicd.github.review_comments
    WHERE owner = 'trinodb' AND repo = 'trino' AND updated_at >= TIMESTAMP '${cutoff}'
),
joined AS (
    SELECT
        l.id IS NOT NULL AS in_left,
        r.id IS NOT NULL AS in_right,
        coalesce(r.updated_at >= TIMESTAMP '${until}', false) AS changed_later,
        filter(ARRAY[
            IF(l.pull_number IS DISTINCT FROM r.pull_number, 'pull_number'),
            IF(l.pull_request_review_id IS DISTINCT FROM r.pull_request_review_id, 'pull_request_review_id'),
            IF(l.diff_hunk IS DISTINCT FROM r.diff_hunk, 'diff_hunk'),
            IF(l.path IS DISTINCT FROM r.path, 'path'),
            IF(l.position IS DISTINCT FROM r.position, 'position'),
            IF(l.original_position IS DISTINCT FROM r.original_position, 'original_position'),
            IF(l.commit_id IS DISTINCT FROM r.commit_id, 'commit_id'),
            IF(l.original_commit_id IS DISTINCT FROM r.original_commit_id, 'original_commit_id'),
            IF(l.in_reply_to_id IS DISTINCT FROM r.in_reply_to_id, 'in_reply_to_id'),
            IF(l.user_id IS DISTINCT FROM r.user_id, 'user_id'),
            IF(l.user_login IS DISTINCT FROM r.user_login, 'user_login'),
            IF(l.body IS DISTINCT FROM r.body, 'body'),
            IF(l.created_at IS DISTINCT FROM r.created_at, 'created_at'),
            IF(l.updated_at IS DISTINCT FROM r.updated_at, 'updated_at'),
            IF(l.author_association IS DISTINCT FROM r.author_association, 'author_association'),
            IF(l.start_line IS DISTINCT FROM r.start_line, 'start_line'),
            IF(l.original_start_line IS DISTINCT FROM r.original_start_line, 'original_start_line'),
            IF(l.start_side IS DISTINCT FROM r.start_side, 'start_side'),
            IF(l.line IS DISTINCT FROM r.line, 'line'),
            IF(l.original_line IS DISTINCT FROM r.original_line, 'original_line'),
            IF(l.side IS DISTINCT FROM r.side, 'side')
        ], c -> c IS NOT NULL) AS differing
    FROM l
    FULL JOIN r ON l.id = r.id
)
SELECT
    'review_comments' AS "table",
    count(*) FILTER (WHERE in_left) AS "legacy rows",
    count(*) FILTER (WHERE in_right) AS "new rows",
    count(*) FILTER (WHERE NOT in_right) AS "only legacy",
    count(*) FILTER (WHERE NOT in_left AND NOT changed_later) AS "only new",
    count(*) FILTER (WHERE in_left AND in_right AND changed_later) AS "changed later",
    count(*) FILTER (WHERE in_left AND in_right AND NOT changed_later AND cardinality(differing) > 0) AS "differing rows",
    array_join(array_sort(array_distinct(flatten(array_agg(differing) FILTER (WHERE in_left AND in_right AND NOT changed_later)))), ', ') AS "differing columns"
FROM joined;

-- reviews
WITH l AS (
    SELECT id, pull_number, user_id, user_login, body, state, submitted_at, commit_id, author_association
    FROM (
        SELECT id, pull_number, user_id, user_login, body, state, submitted_at, commit_id, author_association, row_number() OVER (PARTITION BY id ORDER BY submitted_at DESC) AS row_num
        FROM legacy.v2.reviews
        WHERE owner = 'trinodb' AND repo = 'trino' AND submitted_at >= TIMESTAMP '${cutoff}' AND submitted_at < TIMESTAMP '${until}'
    )
    WHERE row_num = 1
),
r AS (
    SELECT id, pull_number, user_id, user_login, body, state, submitted_at, commit_id, author_association
    FROM trinocicd.github.reviews
    WHERE owner = 'trinodb' AND repo = 'trino' AND submitted_at >= TIMESTAMP '${cutoff}'
),
joined AS (
    SELECT
        l.id IS NOT NULL AS in_left,
        r.id IS NOT NULL AS in_right,
        coalesce(r.submitted_at >= TIMESTAMP '${until}', false) AS changed_later,
        filter(ARRAY[
            IF(l.pull_number IS DISTINCT FROM r.pull_number, 'pull_number'),
            IF(l.user_id IS DISTINCT FROM r.user_id, 'user_id'),
            IF(l.user_login IS DISTINCT FROM r.user_login, 'user_login'),
            IF(l.body IS DISTINCT FROM r.body, 'body'),
            IF(l.state IS DISTINCT FROM r.state, 'state'),
            IF(l.submitted_at IS DISTINCT FROM r.submitted_at, 'submitted_at'),
            IF(l.commit_id IS DISTINCT FROM r.commit_id, 'commit_id'),
            IF(l.author_association IS DISTINCT FROM r.author_association, 'author_association')
        ], c -> c IS NOT NULL) AS differing
    FROM l
    FULL JOIN r ON l.id = r.id
)
SELECT
    'reviews' AS "table",
    count(*) FILTER (WHERE in_left) AS "legacy rows",
    count(*) FILTER (WHERE in_right) AS "new rows",
    count(*) FILTER (WHERE NOT in_right) AS "only legacy",
    count(*) FILTER (WHERE NOT in_left AND NOT changed_later) AS "only new",
    count(*) FILTER (WHERE in_left AND in_right AND changed_later) AS "changed later",
    count(*) FILTER (WHERE in_left AND in_right AND NOT changed_later AND cardinality(differing) > 0) AS "differing rows",
    array_join(array_sort(array_distinct(flatten(array_agg(differing) FILTER (WHERE in_left AND in_right AND NOT changed_later)))), ', ') AS "differing columns"
FROM joined;

-- runs
WITH l AS (
    SELECT id, run_attempt, name, node_id, check_suite_id, check_suite_node_id, head_branch, head_sha, run_number, event, status, conclusion, workflow_id, created_at, updated_at, run_started_at
    FROM (
        SELECT id, run_attempt, name, node_id, check_suite_id, check_suite_node_id, head_branch, head_sha, run_number, event, status, conclusion, workflow_id, created_at, updated_at, run_started_at, row_number() OVER (PARTITION BY id, run_attempt ORDER BY updated_at DESC) AS row_num
        FROM legacy.v2.runs
        WHERE owner = 'trinodb' AND repo = 'trino' AND updated_at >= TIMESTAMP '${cutoff}' AND updated_at < TIMESTAMP '${until}'
    )
    WHERE row_num = 1
),
r AS (
    SELECT id, run_attempt, name, node_id, check_suite_id, check_suite_node_id, head_branch, head_sha, run_number, event, status, conclusion, workflow_id, created_at, updated_at, run_started_at
    FROM trinocicd.github.runs
    WHERE owner = 'trinodb' AND repo = 'trino' AND updated_at >= TIMESTAMP '${cutoff}'
),
joined AS (
    SELECT
        l.id IS NOT NULL AS in_left,
        r.id IS NOT NULL AS in_right,
        coalesce(r.updated_at >= TIMESTAMP '${until}', false) AS changed_later,
        filter(ARRAY[
            IF(l.name IS DISTINCT FROM r.name, 'name'),
            IF(l.node_id IS DISTINCT FROM r.node_id, 'node_id'),
            IF(l.check_suite_id IS DISTINCT FROM r.check_suite_id, 'check_suite_id'),
            IF(l.check_suite_node_id IS DISTINCT FROM r.check_suite_node_id, 'check_suite_node_id'),
            IF(l.head_branch IS DISTINCT FROM r.head_branch, 'head_branch'),
            IF(l.head_sha IS DISTINCT FROM r.head_sha, 'head_sha'),
            IF(l.run_number IS DISTINCT FROM r.run_number, 'run_number'),
            IF(l.event IS DISTINCT FROM r.event, 'event'),
            IF(l.status IS DISTINCT FROM r.status, 'status'),
            IF(l.conclusion IS DISTINCT FROM r.conclusion, 'conclusion'),
            IF(l.workflow_id IS DISTINCT FROM r.workflow_id, 'workflow_id'),
            IF(l.created_at IS DISTINCT FROM r.created_at, 'created_at'),
            IF(l.updated_at IS DISTINCT FROM r.updated_at, 'updated_at'),
            IF(l.run_started_at IS DISTINCT FROM r.run_started_at, 'run_started_at')
        ], c -> c IS NOT NULL) AS differing
    FROM l
    FULL JOIN r ON l.id = r.id AND l.run_attempt = r.run_attempt
)
SELECT
    'runs' AS "table",
    count(*) FILTER (WHERE in_left) AS "legacy rows",
    count(*) FILTER (WHERE in_right) AS "new rows",
    count(*) FILTER (WHERE NOT in_right) AS "only legacy",
    count(*) FILTER (WHERE NOT in_left AND NOT changed_later) AS "only new",
    count(*) FILTER (WHERE in_left AND in_right AND changed_later) AS "changed later",
    count(*) FILTER (WHERE in_left AND in_right AND NOT changed_later AND cardinality(differing) > 0) AS "differing rows",
    array_join(array_sort(array_distinct(flatten(array_agg(differing) FILTER (WHERE in_left AND in_right AND NOT changed_later)))), ', ') AS "differing columns"
FROM joined;

-- jobs
WITH l AS (
    SELECT id, run_id, run_attempt, node_id, head_sha, status, conclusion, started_at, completed_at, name
    FROM (
        SELECT id, run_id, run_attempt, node_id, head_sha, status, conclusion, started_at, completed_at, name, row_number() OVER (PARTITION BY id ORDER BY completed_at DESC) AS row_num
        FROM legacy.v2.jobs
        WHERE owner = 'trinodb' AND repo = 'trino' AND run_id IN (SELECT id FROM trinocicd.github.runs WHERE owner = 'trinodb' AND repo = 'trino' AND created_at >= TIMESTAMP '${cutoff}' AND created_at < TIMESTAMP '${until}' - INTERVAL '2' HOUR)
    )
    WHERE row_num = 1
),
r AS (
    SELECT id, run_id, run_attempt, node_id, head_sha, status, conclusion, started_at, completed_at, name
    FROM trinocicd.github.jobs
    WHERE owner = 'trinodb' AND repo = 'trino' AND run_id IN (SELECT id FROM trinocicd.github.runs WHERE owner = 'trinodb' AND repo = 'trino' AND created_at >= TIMESTAMP '${cutoff}' AND created_at < TIMESTAMP '${until}' - INTERVAL '2' HOUR)
),
joined AS (
    SELECT
        l.id IS NOT NULL AS in_left,
        r.id IS NOT NULL AS in_right,
        coalesce(false, false) AS changed_later,
        filter(ARRAY[
            IF(l.run_id IS DISTINCT FROM r.run_id, 'run_id'),
            IF(l.run_attempt IS DISTINCT FROM r.run_attempt, 'run_attempt'),
            IF(l.node_id IS DISTINCT FROM r.node_id, 'node_id'),
            IF(l.head_sha IS DISTINCT FROM r.head_sha, 'head_sha'),
            IF(l.status IS DISTINCT FROM r.status, 'status'),
            IF(l.conclusion IS DISTINCT FROM r.conclusion, 'conclusion'),
            IF(l.started_at IS DISTINCT FROM r.started_at, 'started_at'),
            IF(l.completed_at IS DISTINCT FROM r.completed_at, 'completed_at'),
            IF(l.name IS DISTINCT FROM r.name, 'name')
        ], c -> c IS NOT NULL) AS differing
    FROM l
    FULL JOIN r ON l.id = r.id
)
SELECT
    'jobs' AS "table",
    count(*) FILTER (WHERE in_left) AS "legacy rows",
    count(*) FILTER (WHERE in_right) AS "new rows",
    count(*) FILTER (WHERE NOT in_right) AS "only legacy",
    count(*) FILTER (WHERE NOT in_left AND NOT changed_later) AS "only new",
    count(*) FILTER (WHERE in_left AND in_right AND changed_later) AS "changed later",
    count(*) FILTER (WHERE in_left AND in_right AND NOT changed_later AND cardinality(differing) > 0) AS "differing rows",
    array_join(array_sort(array_distinct(flatten(array_agg(differing) FILTER (WHERE in_left AND in_right AND NOT changed_later)))), ', ') AS "differing columns"
FROM joined;

-- check_suites
WITH l AS (
    SELECT id, head_branch, head_sha, status, conclusion, before, after, app_id, app_slug, pull_request_numbers, created_at, latest_check_runs_count
    FROM (
        SELECT id, head_branch, head_sha, status, conclusion, before, after, app_id, app_slug, pull_request_numbers, created_at, latest_check_runs_count, row_number() OVER (PARTITION BY id ORDER BY updated_at DESC) AS row_num
        FROM legacy.v2.check_suites
        WHERE owner = 'trinodb' AND repo = 'trino' AND id IN (SELECT check_suite_id FROM trinocicd.github.runs WHERE owner = 'trinodb' AND repo = 'trino' AND created_at >= TIMESTAMP '${cutoff}' AND created_at < TIMESTAMP '${until}' - INTERVAL '2' HOUR)
    )
    WHERE row_num = 1
),
r AS (
    SELECT id, head_branch, head_sha, status, conclusion, before, after, app_id, app_slug, pull_request_numbers, created_at, latest_check_runs_count
    FROM trinocicd.github.check_suites
    WHERE owner = 'trinodb' AND repo = 'trino' AND id IN (SELECT check_suite_id FROM trinocicd.github.runs WHERE owner = 'trinodb' AND repo = 'trino' AND created_at >= TIMESTAMP '${cutoff}' AND created_at < TIMESTAMP '${until}' - INTERVAL '2' HOUR)
),
joined AS (
    SELECT
        l.id IS NOT NULL AS in_left,
        r.id IS NOT NULL AS in_right,
        coalesce(false, false) AS changed_later,
        filter(ARRAY[
            IF(l.head_branch IS DISTINCT FROM r.head_branch, 'head_branch'),
            IF(l.head_sha IS DISTINCT FROM r.head_sha, 'head_sha'),
            IF(l.status IS DISTINCT FROM r.status, 'status'),
            IF(l.conclusion IS DISTINCT FROM r.conclusion, 'conclusion'),
            IF(l.before IS DISTINCT FROM r.before, 'before'),
            IF(l.after IS DISTINCT FROM r.after, 'after'),
            IF(l.app_id IS DISTINCT FROM r.app_id, 'app_id'),
            IF(l.app_slug IS DISTINCT FROM r.app_slug, 'app_slug'),
            IF(l.pull_request_numbers IS DISTINCT FROM r.pull_request_numbers, 'pull_request_numbers'),
            IF(l.created_at IS DISTINCT FROM r.created_at, 'created_at'),
            IF(l.latest_check_runs_count IS DISTINCT FROM r.latest_check_runs_count, 'latest_check_runs_count')
        ], c -> c IS NOT NULL) AS differing
    FROM l
    FULL JOIN r ON l.id = r.id
)
SELECT
    'check_suites' AS "table",
    count(*) FILTER (WHERE in_left) AS "legacy rows",
    count(*) FILTER (WHERE in_right) AS "new rows",
    count(*) FILTER (WHERE NOT in_right) AS "only legacy",
    count(*) FILTER (WHERE NOT in_left AND NOT changed_later) AS "only new",
    count(*) FILTER (WHERE in_left AND in_right AND changed_later) AS "changed later",
    count(*) FILTER (WHERE in_left AND in_right AND NOT changed_later AND cardinality(differing) > 0) AS "differing rows",
    array_join(array_sort(array_distinct(flatten(array_agg(differing) FILTER (WHERE in_left AND in_right AND NOT changed_later)))), ', ') AS "differing columns"
FROM joined;

-- check_runs
WITH l AS (
    SELECT id, check_suite_id, head_sha, external_id, status, conclusion, started_at, completed_at, output_title, output_summary, annotations_count, name, app_id, app_slug
    FROM (
        SELECT id, check_suite_id, head_sha, external_id, status, conclusion, started_at, completed_at, output_title, output_summary, annotations_count, name, app_id, app_slug, row_number() OVER (PARTITION BY id ORDER BY completed_at DESC) AS row_num
        FROM legacy.v2.check_runs
        WHERE owner = 'trinodb' AND repo = 'trino' AND check_suite_id IN (SELECT check_suite_id FROM trinocicd.github.runs WHERE owner = 'trinodb' AND repo = 'trino' AND created_at >= TIMESTAMP '${cutoff}' AND created_at < TIMESTAMP '${until}' - INTERVAL '2' HOUR)
    )
    WHERE row_num = 1
),
r AS (
    SELECT id, check_suite_id, head_sha, external_id, status, conclusion, started_at, completed_at, output_title, output_summary, annotations_count, name, app_id, app_slug
    FROM trinocicd.github.check_runs
    WHERE owner = 'trinodb' AND repo = 'trino' AND check_suite_id IN (SELECT check_suite_id FROM trinocicd.github.runs WHERE owner = 'trinodb' AND repo = 'trino' AND created_at >= TIMESTAMP '${cutoff}' AND created_at < TIMESTAMP '${until}' - INTERVAL '2' HOUR)
),
joined AS (
    SELECT
        l.id IS NOT NULL AS in_left,
        r.id IS NOT NULL AS in_right,
        coalesce(false, false) AS changed_later,
        filter(ARRAY[
            IF(l.check_suite_id IS DISTINCT FROM r.check_suite_id, 'check_suite_id'),
            IF(l.head_sha IS DISTINCT FROM r.head_sha, 'head_sha'),
            IF(l.external_id IS DISTINCT FROM r.external_id, 'external_id'),
            IF(l.status IS DISTINCT FROM r.status, 'status'),
            IF(l.conclusion IS DISTINCT FROM r.conclusion, 'conclusion'),
            IF(l.started_at IS DISTINCT FROM r.started_at, 'started_at'),
            IF(l.completed_at IS DISTINCT FROM r.completed_at, 'completed_at'),
            IF(l.output_title IS DISTINCT FROM r.output_title, 'output_title'),
            IF(l.output_summary IS DISTINCT FROM r.output_summary, 'output_summary'),
            IF(l.annotations_count IS DISTINCT FROM r.annotations_count, 'annotations_count'),
            IF(l.name IS DISTINCT FROM r.name, 'name'),
            IF(l.app_id IS DISTINCT FROM r.app_id, 'app_id'),
            IF(l.app_slug IS DISTINCT FROM r.app_slug, 'app_slug')
        ], c -> c IS NOT NULL) AS differing
    FROM l
    FULL JOIN r ON l.id = r.id
)
SELECT
    'check_runs' AS "table",
    count(*) FILTER (WHERE in_left) AS "legacy rows",
    count(*) FILTER (WHERE in_right) AS "new rows",
    count(*) FILTER (WHERE NOT in_right) AS "only legacy",
    count(*) FILTER (WHERE NOT in_left AND NOT changed_later) AS "only new",
    count(*) FILTER (WHERE in_left AND in_right AND changed_later) AS "changed later",
    count(*) FILTER (WHERE in_left AND in_right AND NOT changed_later AND cardinality(differing) > 0) AS "differing rows",
    array_join(array_sort(array_distinct(flatten(array_agg(differing) FILTER (WHERE in_left AND in_right AND NOT changed_later)))), ', ') AS "differing columns"
FROM joined;

-- check_run_annotations
WITH l AS (
    SELECT DISTINCT check_run_id, path, start_line, end_line, title, message
    FROM legacy.v2.check_run_annotations
    WHERE owner = 'trinodb' AND repo = 'trino' AND check_run_id IN (SELECT id FROM trinocicd.github.check_runs WHERE check_suite_id IN (SELECT check_suite_id FROM trinocicd.github.runs WHERE owner = 'trinodb' AND repo = 'trino' AND created_at >= TIMESTAMP '${cutoff}' AND created_at < TIMESTAMP '${until}' - INTERVAL '2' HOUR))
),
r AS (
    SELECT DISTINCT check_run_id, path, start_line, end_line, title, message
    FROM trinocicd.github.check_run_annotations
    WHERE owner = 'trinodb' AND repo = 'trino' AND check_run_id IN (SELECT id FROM trinocicd.github.check_runs WHERE check_suite_id IN (SELECT check_suite_id FROM trinocicd.github.runs WHERE owner = 'trinodb' AND repo = 'trino' AND created_at >= TIMESTAMP '${cutoff}' AND created_at < TIMESTAMP '${until}' - INTERVAL '2' HOUR))
),
joined AS (
    SELECT
        l.check_run_id IS NOT NULL AS in_left,
        r.check_run_id IS NOT NULL AS in_right,
        coalesce(false, false) AS changed_later,
        filter(ARRAY[
            
        ], c -> c IS NOT NULL) AS differing
    FROM l
    FULL JOIN r ON l.check_run_id IS NOT DISTINCT FROM r.check_run_id AND l.path IS NOT DISTINCT FROM r.path AND l.start_line IS NOT DISTINCT FROM r.start_line AND l.end_line IS NOT DISTINCT FROM r.end_line AND l.title IS NOT DISTINCT FROM r.title AND l.message IS NOT DISTINCT FROM r.message
)
SELECT
    'check_run_annotations' AS "table",
    count(*) FILTER (WHERE in_left) AS "legacy rows",
    count(*) FILTER (WHERE in_right) AS "new rows",
    count(*) FILTER (WHERE NOT in_right) AS "only legacy",
    count(*) FILTER (WHERE NOT in_left AND NOT changed_later) AS "only new",
    count(*) FILTER (WHERE in_left AND in_right AND changed_later) AS "changed later",
    count(*) FILTER (WHERE in_left AND in_right AND NOT changed_later AND cardinality(differing) > 0) AS "differing rows",
    array_join(array_sort(array_distinct(flatten(array_agg(differing) FILTER (WHERE in_left AND in_right AND NOT changed_later)))), ', ') AS "differing columns"
FROM joined;

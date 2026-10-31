-- V1: compares the same data read with the trino-rest and the OpenAPI connectors.
-- Pull requests are not compared, because trino-rest 0.178 fails with a NullPointerException in Pull.toRow
-- when reading some of them. V2 compares them with the old tables instead.
-- Parameters, replaced by verify.sh: run_ids, pull_numbers, since.

-- runs: the newest 300
WITH l AS (
    SELECT
        id,
        run_attempt,
        name,
        node_id,
        check_suite_id,
        check_suite_node_id,
        head_branch,
        head_sha,
        run_number,
        event,
        status,
        conclusion,
        workflow_id,
        CAST(created_at AS timestamp(3)) AS created_at,
        CAST(updated_at AS timestamp(3)) AS updated_at,
        CAST(run_started_at AS timestamp(3)) AS run_started_at
    FROM rest.default.runs
    WHERE owner = 'trinodb' AND repo = 'trino'
    ORDER BY created_at DESC
    LIMIT 300
),
r AS (
    SELECT
        id,
        run_attempt,
        name,
        node_id,
        check_suite_id,
        check_suite_node_id,
        head_branch,
        head_sha,
        run_number,
        event,
        status,
        conclusion,
        workflow_id,
        CAST(created_at AS timestamp(3)) AS created_at,
        CAST(updated_at AS timestamp(3)) AS updated_at,
        CAST(run_started_at AS timestamp(3)) AS run_started_at
    FROM github.default.repos_actions_runs
    WHERE owner = 'trinodb' AND repo = 'trino' AND per_page = 100 AND page IN (1, 2, 3)
),
joined AS (
    SELECT
        l.id IS NOT NULL AS in_left,
        r.id IS NOT NULL AS in_right,
        coalesce(false, false) AS changed_later,
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
    'runs: the newest 300' AS "table",
    count(*) FILTER (WHERE in_left) AS "rest rows",
    count(*) FILTER (WHERE in_right) AS "openapi rows",
    count(*) FILTER (WHERE NOT in_right) AS "only rest",
    count(*) FILTER (WHERE NOT in_left AND NOT changed_later) AS "only openapi",
    count(*) FILTER (WHERE in_left AND in_right AND changed_later) AS "changed later",
    count(*) FILTER (WHERE in_left AND in_right AND NOT changed_later AND cardinality(differing) > 0) AS "differing rows",
    array_join(array_sort(array_distinct(flatten(array_agg(differing) FILTER (WHERE in_left AND in_right AND NOT changed_later)))), ', ') AS "differing columns"
FROM joined;

-- jobs: of 5 completed runs
WITH l AS (
    SELECT
        id,
        run_id,
        run_attempt,
        node_id,
        head_sha,
        status,
        conclusion,
        CAST(started_at AS timestamp(3)) AS started_at,
        CAST(completed_at AS timestamp(3)) AS completed_at,
        name,
        steps_count
    FROM rest.default.jobs
    WHERE owner = 'trinodb' AND repo = 'trino' AND run_id IN (${run_ids})
),
r AS (
    SELECT
        id,
        run_id,
        run_attempt,
        node_id,
        head_sha,
        status,
        conclusion,
        CAST(started_at AS timestamp(3)) AS started_at,
        CAST(completed_at AS timestamp(3)) AS completed_at,
        name,
        CAST(cardinality(steps) AS integer) AS steps_count
    FROM github.default.repos_actions_runs_jobs
    WHERE owner = 'trinodb' AND repo = 'trino' AND run_id IN (${run_ids}) AND filter = 'all' AND per_page = 100
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
            IF(l.name IS DISTINCT FROM r.name, 'name'),
            IF(l.steps_count IS DISTINCT FROM r.steps_count, 'steps_count')
        ], c -> c IS NOT NULL) AS differing
    FROM l
    FULL JOIN r ON l.id = r.id
)
SELECT
    'jobs: of 5 completed runs' AS "table",
    count(*) FILTER (WHERE in_left) AS "rest rows",
    count(*) FILTER (WHERE in_right) AS "openapi rows",
    count(*) FILTER (WHERE NOT in_right) AS "only rest",
    count(*) FILTER (WHERE NOT in_left AND NOT changed_later) AS "only openapi",
    count(*) FILTER (WHERE in_left AND in_right AND changed_later) AS "changed later",
    count(*) FILTER (WHERE in_left AND in_right AND NOT changed_later AND cardinality(differing) > 0) AS "differing rows",
    array_join(array_sort(array_distinct(flatten(array_agg(differing) FILTER (WHERE in_left AND in_right AND NOT changed_later)))), ', ') AS "differing columns"
FROM joined;

-- issue_comments: updated since yesterday
WITH l AS (
    SELECT
        id,
        node_id,
        url,
        html_url,
        body,
        user_id,
        user_login,
        CAST(created_at AS timestamp(3)) AS created_at,
        CAST(updated_at AS timestamp(3)) AS updated_at,
        issue_url,
        author_association,
        reactions_total_count,
        app_id,
        app_slug
    FROM rest.default.issue_comments
    WHERE owner = 'trinodb' AND repo = 'trino' AND updated_at >= TIMESTAMP '${since}'
),
r AS (
    SELECT
        id,
        node_id,
        url,
        html_url,
        body,
        user.id AS user_id,
        user.login AS user_login,
        CAST(created_at AS timestamp(3)) AS created_at,
        CAST(updated_at AS timestamp(3)) AS updated_at,
        issue_url,
        author_association,
        reactions.total_count AS reactions_total_count,
        performed_via_github_app.id AS app_id,
        performed_via_github_app.slug AS app_slug
    FROM github.default.repos_owner_repo_issues_comments_comment_id
    WHERE owner = 'trinodb' AND repo = 'trino' AND per_page = 100 AND updated_at >= TIMESTAMP '${since}'
),
joined AS (
    SELECT
        l.id IS NOT NULL AS in_left,
        r.id IS NOT NULL AS in_right,
        coalesce(false, false) AS changed_later,
        filter(ARRAY[
            IF(l.node_id IS DISTINCT FROM r.node_id, 'node_id'),
            IF(l.url IS DISTINCT FROM r.url, 'url'),
            IF(l.html_url IS DISTINCT FROM r.html_url, 'html_url'),
            IF(l.body IS DISTINCT FROM r.body, 'body'),
            IF(l.user_id IS DISTINCT FROM r.user_id, 'user_id'),
            IF(l.user_login IS DISTINCT FROM r.user_login, 'user_login'),
            IF(l.created_at IS DISTINCT FROM r.created_at, 'created_at'),
            IF(l.updated_at IS DISTINCT FROM r.updated_at, 'updated_at'),
            IF(l.issue_url IS DISTINCT FROM r.issue_url, 'issue_url'),
            IF(l.author_association IS DISTINCT FROM r.author_association, 'author_association'),
            IF(l.reactions_total_count IS DISTINCT FROM r.reactions_total_count, 'reactions_total_count'),
            IF(l.app_id IS DISTINCT FROM r.app_id, 'app_id'),
            IF(l.app_slug IS DISTINCT FROM r.app_slug, 'app_slug')
        ], c -> c IS NOT NULL) AS differing
    FROM l
    FULL JOIN r ON l.id = r.id
)
SELECT
    'issue_comments: updated since yesterday' AS "table",
    count(*) FILTER (WHERE in_left) AS "rest rows",
    count(*) FILTER (WHERE in_right) AS "openapi rows",
    count(*) FILTER (WHERE NOT in_right) AS "only rest",
    count(*) FILTER (WHERE NOT in_left AND NOT changed_later) AS "only openapi",
    count(*) FILTER (WHERE in_left AND in_right AND changed_later) AS "changed later",
    count(*) FILTER (WHERE in_left AND in_right AND NOT changed_later AND cardinality(differing) > 0) AS "differing rows",
    array_join(array_sort(array_distinct(flatten(array_agg(differing) FILTER (WHERE in_left AND in_right AND NOT changed_later)))), ', ') AS "differing columns"
FROM joined;

-- reviews: of 5 pull requests
WITH l AS (
    SELECT
        id,
        pull_number,
        user_id,
        user_login,
        body,
        state,
        CAST(submitted_at AS timestamp(3)) AS submitted_at,
        commit_id,
        author_association
    FROM rest.default.reviews
    WHERE owner = 'trinodb' AND repo = 'trino' AND pull_number IN (${pull_numbers})
),
r AS (
    SELECT
        id,
        pull_number,
        user.id AS user_id,
        user.login AS user_login,
        body,
        state,
        CAST(submitted_at AS timestamp(3)) AS submitted_at,
        commit_id,
        author_association
    FROM github.default.repos_pulls_reviews
    WHERE owner = 'trinodb' AND repo = 'trino' AND pull_number IN (${pull_numbers}) AND per_page = 100
),
joined AS (
    SELECT
        l.id IS NOT NULL AS in_left,
        r.id IS NOT NULL AS in_right,
        coalesce(false, false) AS changed_later,
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
    'reviews: of 5 pull requests' AS "table",
    count(*) FILTER (WHERE in_left) AS "rest rows",
    count(*) FILTER (WHERE in_right) AS "openapi rows",
    count(*) FILTER (WHERE NOT in_right) AS "only rest",
    count(*) FILTER (WHERE NOT in_left AND NOT changed_later) AS "only openapi",
    count(*) FILTER (WHERE in_left AND in_right AND changed_later) AS "changed later",
    count(*) FILTER (WHERE in_left AND in_right AND NOT changed_later AND cardinality(differing) > 0) AS "differing rows",
    array_join(array_sort(array_distinct(flatten(array_agg(differing) FILTER (WHERE in_left AND in_right AND NOT changed_later)))), ', ') AS "differing columns"
FROM joined;

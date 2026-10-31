-- Workflows. There are few of them, so all are read every time.
MERGE INTO trinocicd.github.workflows t
USING (
    WITH fetched AS (
        SELECT
            owner,
            repo,
            id,
            node_id,
            name,
            path,
            state,
            created_at,
            updated_at,
            url,
            html_url,
            badge_url,
            row_number() OVER (PARTITION BY id ORDER BY updated_at DESC) AS row_num
        FROM github.default.repos_actions_workflows
        WHERE owner = 'trinodb' AND repo = 'trino' AND per_page = 100
    )
    SELECT *
    FROM fetched
    WHERE row_num = 1
) s
ON t.id = s.id
WHEN MATCHED AND s.updated_at > t.updated_at THEN UPDATE SET
    owner = s.owner,
    repo = s.repo,
    id = s.id,
    node_id = s.node_id,
    name = s.name,
    path = s.path,
    state = s.state,
    created_at = s.created_at,
    updated_at = s.updated_at,
    url = s.url,
    html_url = s.html_url,
    badge_url = s.badge_url
WHEN NOT MATCHED THEN INSERT (
    owner,
    repo,
    id,
    node_id,
    name,
    path,
    state,
    created_at,
    updated_at,
    url,
    html_url,
    badge_url
)
VALUES (
    s.owner,
    s.repo,
    s.id,
    s.node_id,
    s.name,
    s.path,
    s.state,
    s.created_at,
    s.updated_at,
    s.url,
    s.html_url,
    s.badge_url
);

-- Labels, types, reasons of the state, and links to pull requests of issues copied from trino-rest, which didn't save
-- them, so their labels are NULL.
-- They're read once, 1,000 at a time, from the least recently updated, starting from the cursor saved in sync_state.
-- Only the first 10 pages since the cursor are read, because GitHub rejects requests for later pages of large results,
-- like the 300th page of all issues.
-- Issues updated since they were saved are left to the issues step, so all their columns come from the same version.
-- loop: batches
MERGE INTO trinocicd.github.issues t
USING (
    WITH cursor AS (
        SELECT CAST(coalesce(max(CAST(version AS timestamp(6))), TIMESTAMP '2000-01-01') AS timestamp(3)) AS updated_at
        FROM trinocicd.github.sync_state
        WHERE step = 'issue_labels' AND owner = 'trinodb' AND repo = 'trino'
    ),
    pending AS (
        -- without any issues to read, the subquery returns NULL, so no request is sent
        SELECT c.updated_at
        FROM cursor c
        WHERE EXISTS (
            SELECT 1
            FROM trinocicd.github.issues i
            WHERE i.owner = 'trinodb' AND i.repo = 'trino' AND i.labels IS NULL AND i.updated_at >= c.updated_at)
    ),
    fetched AS (
        SELECT
            id,
            updated_at,
            transform(labels, label -> coalesce(json_extract_scalar(label, '$.name'), json_extract_scalar(label, '$'))) AS labels,
            type.name AS type_name,
            state_reason,
            pull_request.html_url AS pull_request_url,
            pull_request.merged_at AS pull_request_merged_at,
            row_number() OVER (PARTITION BY id ORDER BY updated_at DESC) AS row_num
        FROM github.default.repos_issues
        WHERE owner = 'trinodb' AND repo = 'trino' AND sort = 'updated' AND direction = 'asc' AND per_page = 100
            AND page IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
            AND updated_at >= (SELECT updated_at FROM pending)
    )
    SELECT *
    FROM fetched
    WHERE row_num = 1
) s
ON t.id = s.id
WHEN MATCHED AND t.labels IS NULL AND t.updated_at = s.updated_at THEN UPDATE SET
    labels = s.labels,
    type_name = s.type_name,
    state_reason = s.state_reason,
    pull_request_url = s.pull_request_url,
    pull_request_merged_at = s.pull_request_merged_at;

-- Annotations of check runs from the last 2 months that have any.
-- loop: batches
MERGE INTO trinocicd.github.check_run_annotations t
USING (
    WITH parents AS (
        SELECT id AS parent_id, CAST(annotations_count AS varchar) AS version
        FROM trinocicd.github.check_runs
        WHERE owner = 'trinodb' AND repo = 'trino' AND annotations_count > 0 AND started_at > current_timestamp - INTERVAL '2' MONTH
    ),
    checked AS (
        SELECT parent_id, max_by(version, checked_at) AS version
        FROM trinocicd.github.sync_state
        WHERE step = 'check_run_annotations' AND owner = 'trinodb' AND repo = 'trino'
        GROUP BY parent_id
    ),
    batch AS (
        SELECT p.parent_id, p.version
        FROM parents p
        LEFT JOIN checked c ON c.parent_id = p.parent_id
        WHERE c.parent_id IS NULL OR c.version <> p.version
        ORDER BY p.parent_id
        LIMIT 30
    ),
    fetched AS (
        SELECT
            owner,
            repo,
            check_run_id,
            path,
            start_line,
            end_line,
            start_column,
            end_column,
            annotation_level,
            title,
            replace(message, U&'\0000', ' ') AS message,
            replace(raw_details, U&'\0000', ' ') AS raw_details,
            blob_href,
            row_number() OVER (PARTITION BY check_run_id, path, start_line, end_line, start_column, end_column, title, message) AS row_num
        FROM github.default.repos_check_runs_annotations
        WHERE owner = 'trinodb' AND repo = 'trino' AND per_page = 100
            AND check_run_id IN (SELECT parent_id FROM batch)
    )
    SELECT *
    FROM fetched
    WHERE row_num = 1
) s
ON t.check_run_id = s.check_run_id AND t.path IS NOT DISTINCT FROM s.path AND t.start_line IS NOT DISTINCT FROM s.start_line AND t.end_line IS NOT DISTINCT FROM s.end_line AND t.start_column IS NOT DISTINCT FROM s.start_column AND t.end_column IS NOT DISTINCT FROM s.end_column AND t.title IS NOT DISTINCT FROM s.title AND t.message IS NOT DISTINCT FROM s.message
WHEN NOT MATCHED THEN INSERT (
    owner,
    repo,
    check_run_id,
    path,
    start_line,
    end_line,
    start_column,
    end_column,
    annotation_level,
    title,
    message,
    raw_details,
    blob_href
)
VALUES (
    s.owner,
    s.repo,
    s.check_run_id,
    s.path,
    s.start_line,
    s.end_line,
    s.start_column,
    s.end_column,
    s.annotation_level,
    s.title,
    s.message,
    s.raw_details,
    s.blob_href
);

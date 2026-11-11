-- Annotations of backfilled check runs, in batches of check runs,
-- since removing duplicates of all of them at once needs more memory than a GitHub runner has.
-- Safe to repeat, check runs that already have annotations are skipped.
-- loop: batches
MERGE INTO trinocicd.github.check_run_annotations t
USING (
    WITH copied_check_runs AS (
        SELECT id
        FROM trinocicd.github.check_runs
        WHERE owner = 'trinodb' AND repo = 'trino'
    ),
    batch AS (
        SELECT DISTINCT check_run_id
        FROM legacy.v2.check_run_annotations o
        WHERE owner = 'trinodb' AND repo = 'trino'
            AND check_run_id IN (SELECT id FROM copied_check_runs)
            AND NOT EXISTS (SELECT 1 FROM trinocicd.github.check_run_annotations a WHERE a.check_run_id = o.check_run_id)
        ORDER BY check_run_id
        LIMIT 100000
    ),
    versions AS (
        SELECT
            owner,
            repo,
            check_run_id,
            path,
            CAST(start_line AS bigint) AS start_line,
            CAST(end_line AS bigint) AS end_line,
            CAST(start_column AS bigint) AS start_column,
            CAST(end_column AS bigint) AS end_column,
            annotation_level,
            title,
            CAST(replace(message, U&'\0000', ' ') AS varchar) AS message,
            CAST(replace(raw_details, U&'\0000', ' ') AS varchar) AS raw_details,
            blob_href,
            row_number() OVER (PARTITION BY check_run_id, path, start_line, end_line, start_column, end_column, title, message ORDER BY check_run_id) AS row_num
        FROM legacy.v2.check_run_annotations o
        WHERE owner = 'trinodb' AND repo = 'trino'
            AND check_run_id IN (SELECT check_run_id FROM batch)
    )
    SELECT owner, repo, check_run_id, path, start_line, end_line, start_column, end_column, annotation_level, title, message, raw_details, blob_href
    FROM versions
    WHERE row_num = 1
) s
ON t.check_run_id = s.check_run_id AND t.path IS NOT DISTINCT FROM s.path AND t.start_line IS NOT DISTINCT FROM s.start_line AND t.end_line IS NOT DISTINCT FROM s.end_line AND t.start_column IS NOT DISTINCT FROM s.start_column AND t.end_column IS NOT DISTINCT FROM s.end_column AND t.title IS NOT DISTINCT FROM s.title AND t.message IS NOT DISTINCT FROM s.message
WHEN NOT MATCHED THEN INSERT (owner, repo, check_run_id, path, start_line, end_line, start_column, end_column, annotation_level, title, message, raw_details, blob_href)
VALUES (s.owner, s.repo, s.check_run_id, s.path, s.start_line, s.end_line, s.start_column, s.end_column, s.annotation_level, s.title, s.message, s.raw_details, s.blob_href);

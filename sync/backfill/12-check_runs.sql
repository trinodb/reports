-- Check runs of check suites created before the cutoff, including ones of suites missing from check_suites.
-- Safe to repeat, rows that already exist are skipped.
-- parameters: cutoff
MERGE INTO trinocicd.github.check_runs t
USING (
    WITH newer_check_suites AS (
        SELECT id
        FROM legacy.v2.check_suites
        WHERE owner = 'trinodb' AND repo = 'trino' AND id IS NOT NULL AND created_at >= coalesce(CAST(? AS timestamp(6)), TIMESTAMP '9999-12-31 00:00:00')
    ),
    versions AS (
        SELECT
            owner,
            repo,
            id,
            check_suite_id,
            head_sha,
            CAST(NULL AS varchar) AS node_id,
            external_id,
            url,
            html_url,
            details_url,
            status,
            conclusion,
            CAST(CASE WHEN started_at > TIMESTAMP '1970-01-01' THEN started_at END AS timestamp(6)) AS started_at,
            CAST(CASE WHEN completed_at > TIMESTAMP '1970-01-01' THEN completed_at END AS timestamp(6)) AS completed_at,
            CAST(nullif(output_title, '') AS varchar) AS output_title,
            CAST(nullif(output_summary, '') AS varchar) AS output_summary,
            CAST(nullif(output_text, '') AS varchar) AS output_text,
            annotations_count,
            name,
            app_id,
            app_slug,
            CAST(NULL AS array(bigint)) AS pull_request_numbers,
            row_number() OVER (PARTITION BY id ORDER BY completed_at DESC) AS row_num
        FROM legacy.v2.check_runs o
        WHERE owner = 'trinodb' AND repo = 'trino'
            AND check_suite_id NOT IN (SELECT id FROM newer_check_suites)
    )
    SELECT owner, repo, id, check_suite_id, head_sha, node_id, external_id, url, html_url, details_url, status, conclusion, started_at, completed_at, output_title, output_summary, output_text, annotations_count, name, app_id, app_slug, pull_request_numbers
    FROM versions
    WHERE row_num = 1
) s
ON t.id = s.id
WHEN NOT MATCHED THEN INSERT (owner, repo, id, check_suite_id, head_sha, node_id, external_id, url, html_url, details_url, status, conclusion, started_at, completed_at, output_title, output_summary, output_text, annotations_count, name, app_id, app_slug, pull_request_numbers)
VALUES (s.owner, s.repo, s.id, s.check_suite_id, s.head_sha, s.node_id, s.external_id, s.url, s.html_url, s.details_url, s.status, s.conclusion, s.started_at, s.completed_at, s.output_title, s.output_summary, s.output_text, s.annotations_count, s.name, s.app_id, s.app_slug, s.pull_request_numbers);

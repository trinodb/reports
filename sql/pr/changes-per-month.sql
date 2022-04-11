-- Changes per month
WITH
changes AS (
    SELECT
      date_trunc('month', date(c.commit_time AT TIME ZONE 'UTC')) AS month
    , count(distinct c.object_id) AS num_commits
    , count(*) FILTER (WHERE s.change_type = 'Add') AS added_files
    , count(*) FILTER (WHERE s.change_type = 'Copy') AS copied_files
    , count(*) FILTER (WHERE s.change_type = 'Delete') AS deleted_files
    , count(*) FILTER (WHERE s.change_type = 'Modify') AS modified_files
    , count(*) FILTER (WHERE s.change_type = 'Rename') AS renamed_files
    , sum(s.added_lines) AS added_lines
    , sum(s.deleted_lines) AS deleted_lines
    FROM git.default.commits c
    JOIN git.default.diff_stats s ON s.commit_id = c.object_id
    JOIN memory.default.idents ai ON ai.name = c.author_name OR CONTAINS(ai.extra_names, c.author_name)
    LEFT JOIN members m ON CONTAINS(ai.logins, m.login)
    WHERE c.commit_time > timestamp '2019-01-01 00:00:00'
    GROUP BY 1
)
SELECT
  a.month AS "Month"
, bar(a.num_commits / CAST(max(a.num_commits) OVER () AS double), 20, rgb(0, 155, 0), rgb(0, 155, 0)) AS "Commits count chart"
, bar(a.added_lines / CAST(max(a.added_lines) OVER () AS double), 20, rgb(0, 155, 0), rgb(0, 155, 0)) AS "Lines added chart"
, bar(a.deleted_lines / CAST(max(a.deleted_lines) OVER () AS double), 20, rgb(0, 155, 0), rgb(0, 155, 0)) AS "Lines deleted chart"
, a.num_commits AS "Commits count"
, a.added_lines AS "Lines added"
, a.deleted_lines AS "Lines deleted"
, a.added_files AS "Files added"
, a.copied_files AS "Files copied"
, a.deleted_files AS "Files deleted"
, a.modified_files AS "Files modified"
, a.renamed_files AS "Files renamed"
FROM changes a
ORDER BY 1 DESC
LIMIT 24;

-- Where does the code change?
-- Commits of people merged to the master branch in the last 12 full months, by the module they change, like core/trino-main or plugin/trino-iceberg. A commit changing several modules counts in each.
-- The chart has one character per month, oldest on the left, and each row has its own scale. If you change a module on top, others change it too: rebase often to find conflicts early.
WITH
master_commits AS (
    SELECT sha, author_login, date_trunc('month', committer_date) AS month
    FROM commits
    WHERE owner = 'trinodb' AND repo = 'trino'
      AND NOT memory.default.is_bot(author_login)
      AND committer_date >= date_trunc('month', current_date) - INTERVAL '12' MONTH
      AND committer_date < date_trunc('month', current_date)
)
, module_commits AS (
    SELECT
        -- modules are directories in core, plugin, lib, client, testing and service
        coalesce(
            regexp_extract(coalesce(d.path_name, d.old_path_name), '^((?:core|plugin|lib|client|testing|service)/[^/]+)/', 1),
            regexp_extract(coalesce(d.path_name, d.old_path_name), '^(docs)/', 1),
            '(build, CI, other)') AS module
      , c.sha
      , c.author_login
      , c.month
    FROM master_commits c
    -- added and deleted lines are not read, because computing them takes several times longer
    JOIN git.default.diff_stats d ON d.commit_id = c.sha
    GROUP BY 1, 2, 3, 4
)
, modules AS (
    SELECT
        module
      , count(*) AS commits
      , count(DISTINCT author_login) AS authors
      , histogram(month) AS commits_per_month
    FROM module_commits
    GROUP BY module
)
SELECT
    module AS "Module"
  , commits AS "Commits"
  , format('%.0f%%', commits * 100e0 / (SELECT count(*) FROM master_commits)) AS "Share"
  , authors AS "Authors"
  , memory.default.sparkline(transform(
        sequence(date_trunc('month', current_date) - INTERVAL '12' MONTH, date_trunc('month', current_date) - INTERVAL '1' MONTH, INTERVAL '1' MONTH),
        m -> CAST(coalesce(element_at(commits_per_month, m), 0) AS double))) AS "Per month chart"
FROM modules
ORDER BY commits DESC
LIMIT 25
;

-- Active Qualified Contributors
WITH
authors AS (
    SELECT
      date_trunc('month', date(c.commit_time AT TIME ZONE 'UTC')) AS month
    , ai.email
    , coalesce(m.org, '') AS org
    , count(*) AS num_commits
    FROM git.default.commits c
    JOIN memory.default.gh_idents ai ON ai.name = c.author_name OR CONTAINS(ai.extra_names, c.author_name)
    LEFT JOIN members m ON CONTAINS(ai.logins, m.login)
    GROUP BY 1, 2, 3
)
, qualified AS (
    SELECT
    *
    , sum(num_commits) OVER (PARTITION BY email ORDER BY month ROWS BETWEEN 12 PRECEDING AND CURRENT ROW) AS commits_last_year
    FROM authors
)
SELECT
    month AS "Month"
  , count(*) AS "Total contributors"
  , count(*) FILTER (WHERE org != 'starburstdata' AND commits_last_year >= 3) AS "Active contributors"
  , count(*) FILTER (WHERE org != 'starburstdata' AND commits_last_year < 3) AS "Potential contributors"
  --, array_agg(email) FILTER (WHERE org != 'starburstdata' AND commits_last_year < 3) AS "PC emails"
  , sum(num_commits) AS "Total commits"
  , sum(num_commits) FILTER (WHERE org != 'starburstdata' AND commits_last_year >= 3) AS "Commits by AC"
  , sum(num_commits) FILTER (WHERE org != 'starburstdata' AND commits_last_year < 3) AS "Commits by PC"
FROM qualified
GROUP BY 1
ORDER BY 1 DESC
;

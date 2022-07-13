-- Longest time without any review or comment
WITH
pulls_without_review AS (
    SELECT
      p.number
    , p.title
    , p.user_login
    , p.created_at
    FROM unique_pulls p
    LEFT JOIN reviews r ON p.number = r.pull_number
    LEFT JOIN unique_issue_comments c ON c.issue_url = p.issue_url AND c.user_login != 'cla-bot[bot]'
    WHERE p.owner = 'trinodb' AND p.repo = 'trino' AND p.state = 'open' AND NOT p.draft AND r.id IS NULL AND c.id IS NULL
)
, authors AS (
    SELECT
      date_trunc('month', date(c.commit_time AT TIME ZONE 'UTC')) AS month
    , ai.logins
    , COALESCE(m.org, '<untracked>') AS org
    , count(*) AS num_commits
    FROM git.default.commits c
    JOIN memory.default.gh_idents ai ON ai.name = c.author_name OR CONTAINS(ai.extra_names, c.author_name)
    LEFT JOIN members m ON CONTAINS(ai.logins, m.login)
    GROUP BY 1, 2, 3
)
, rolling AS (
    SELECT
    *
    , sum(num_commits) OVER (PARTITION BY logins ORDER BY month ROWS BETWEEN 12 PRECEDING AND CURRENT ROW) AS commits_last_year
    FROM authors
)
SELECT
  p.number
, p.title || ' @' || format('https://github.com/trinodb/trino/pull/%s', p.number) AS title
, day(CAST(current_timestamp AT TIME ZONE 'UTC' AS TIMESTAMP) - p.created_at) AS days_without_review
, COALESCE(a.commits_last_year, 0) AS author_commits_last_year
, COALESCE(a.org, '<unknown>') AS author_org
FROM pulls_without_review p
LEFT JOIN rolling a ON CONTAINS(a.logins, p.user_login) AND date_trunc('month', p.created_at) = a.month
ORDER BY days_without_review DESC
LIMIT 20
;

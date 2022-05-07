-- Mergers top 10 authors in last 12 months
WITH pairs AS (
    SELECT
        c.commit_time AT TIME ZONE 'UTC' AS commit_time
      , ai.name AS ai_name
      , ma.org AS ai_org
      , ci.name AS ci_name
      , mc.org AS ci_org
      , count(*) AS commits_in_pr
    FROM git.default.commits c
        JOIN memory.default.gh_idents ai ON ai.email = c.author_email OR CONTAINS(ai.extra_emails, c.author_email)
        JOIN memory.default.gh_idents ci ON ci.email = c.committer_email OR CONTAINS(ci.extra_emails, c.committer_email)
        LEFT JOIN members ma ON CONTAINS(ai.logins, ma.login)
        LEFT JOIN members mc ON CONTAINS(ci.logins, mc.login)
    WHERE ai.email != ci.email AND c.commit_time AT TIME ZONE 'UTC' > CURRENT_DATE - interval '1' year
    GROUP BY 1, 2, 3, 4, 5
)
, mergers AS (
    SELECT
        ci_name
      , ci_org
      , ai_name
      , ai_org
      , sum(commits_in_pr) AS commits
      , count(*) AS pull_requests
      , row_number() OVER (PARTITION BY ci_name ORDER BY sum(commits_in_pr) DESC) AS author_rank
    FROM pairs
    GROUP BY 1, 2, 3, 4
)
SELECT
    ci_name AS "Commiter name"
  , ci_org AS "Commiter org"
  , ai_name AS "Author name"
  , ai_org AS "Author org"
  , author_rank AS "Author rank"
  , bar(commits / CAST(max(commits) OVER (PARTITION BY ci_name) AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Commits chart"
  , commits AS "Number of commits"
  , pull_requests "Number of pull requests"
FROM mergers
WHERE author_rank < 11
ORDER BY ci_name, commits DESC, au_name
;

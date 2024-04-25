-- Longest running PRs
WITH
last_reviews AS (
    SELECT
        pull_number AS number
      , max(submitted_at) AS submitted_at
    FROM reviews
    WHERE owner = 'trinodb' AND repo = 'trino'
    GROUP BY 1
)
, last_commits AS (
  SELECT
      pull_number AS number
    , max(committer_date) AS committer_date
  FROM pull_commits
  GROUP BY 1
)
SELECT
  pulls.number
, format('"%s"@https://github.com/trinodb/trino/pull/%s ', pulls.title, pulls.number) AS title
, day(reviews.submitted_at - commits.committer_date) AS running_days
FROM unique_pulls pulls
JOIN last_reviews reviews ON pulls.number = reviews.number
JOIN last_commits commits ON pulls.number = commits.number
WHERE pulls.owner = 'trinodb' AND pulls.repo = 'trino' AND pulls.state = 'open' AND NOT pulls.draft
ORDER BY running_days DESC
LIMIT 20
;

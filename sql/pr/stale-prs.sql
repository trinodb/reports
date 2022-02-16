-- Stale PRs
SELECT
  pulls.number
, pulls.title
, pulls.updated_at
, current_timestamp - pulls.updated_at AS untouched_for
, max(reviews.submitted_at) - pulls.updated_at AS running_time
, current_timestamp - max(reviews.submitted_at) AS time_since_review
, current_timestamp - max(pull_commits.committer_date) AS time_since_push
FROM
  pulls
LEFT JOIN
  reviews ON pulls.number = reviews.pull_number
LEFT JOIN
  pull_commits ON pulls.number = pull_commits.pull_number
WHERE pulls.owner = 'trinodb' AND pulls.repo = 'trino' AND pulls.state = 'open' AND NOT pulls.draft
GROUP BY 1, 2, 3, 4
ORDER BY untouched_for DESC
LIMIT 20
;

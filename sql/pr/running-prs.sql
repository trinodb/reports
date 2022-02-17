-- Longest running PRs
SELECT
  pulls.number
, pulls.title
, pulls.updated_at
, max(reviews.submitted_at) - pulls.updated_at AS running_time
FROM
  pulls
LEFT JOIN
  reviews ON pulls.number = reviews.pull_number
WHERE pulls.owner = 'trinodb' AND pulls.repo = 'trino' AND pulls.state = 'open' AND NOT pulls.draft
GROUP BY 1, 2, 3
ORDER BY running_time DESC
LIMIT 20
;

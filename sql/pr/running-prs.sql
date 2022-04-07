-- Longest running PRs
SELECT
  pulls.number
, pulls.title
, max(reviews.submitted_at) - pulls.updated_at AS running_time
, format('<a href="https://github.com/trinodb/trino/pull/%s">link</a>', pulls.number) AS link
FROM
  unique_pulls pulls
JOIN
  reviews ON pulls.number = reviews.pull_number
WHERE pulls.owner = 'trinodb' AND pulls.repo = 'trino' AND pulls.state = 'open' AND NOT pulls.draft
GROUP BY 1, 2, pulls.updated_at, 4
ORDER BY running_time DESC
LIMIT 20
;

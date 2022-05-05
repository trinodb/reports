-- Longest running PRs
SELECT
  pulls.number
, pulls.title || ' @' || format('https://github.com/trinodb/trino/pull/%s', pulls.number) AS title
, day(max(reviews.submitted_at) - pulls.updated_at) AS running_days
FROM unique_pulls pulls
JOIN reviews ON pulls.number = reviews.pull_number
WHERE pulls.owner = 'trinodb' AND pulls.repo = 'trino' AND pulls.state = 'open' AND NOT pulls.draft
GROUP BY 1, 2, pulls.updated_at
ORDER BY running_days DESC
LIMIT 20
;

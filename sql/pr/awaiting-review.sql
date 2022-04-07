-- Longest time since review
SELECT
  pulls.number
, pulls.title
, current_timestamp - max(reviews.submitted_at) AS time_since_review
, format('<a href="https://github.com/trinodb/trino/pull/%s">link</a>', pulls.number) AS link
FROM
  unique_pulls
LEFT JOIN
  reviews ON pulls.number = reviews.pull_number
WHERE pulls.owner = 'trinodb' AND pulls.repo = 'trino' AND pulls.state = 'open' AND NOT pulls.draft
GROUP BY 1, 2, 4
ORDER BY time_since_review DESC
LIMIT 20
;

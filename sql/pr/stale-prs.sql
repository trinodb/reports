-- Stale PRs
SELECT
  pulls.number
, pulls.title || ' @' || format('https://github.com/trinodb/trino/pull/%s', pulls.number) AS title
, current_timestamp - pulls.updated_at AS untouched_for
FROM
  unique_pulls pulls
WHERE owner = 'trinodb' AND repo = 'trino' AND state = 'open' AND NOT draft
ORDER BY untouched_for DESC
LIMIT 20
;

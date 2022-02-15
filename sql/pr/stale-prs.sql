-- Stale PRs
SELECT
  number
, title
, updated_at
, current_timestamp - updated_at AS untouched_for
FROM
  pulls
WHERE owner = 'trinodb' AND repo = 'trino' AND state = 'open' AND NOT draft
ORDER BY untouched_for DESC
LIMIT 20
;

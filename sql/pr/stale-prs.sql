-- Stale PRs
SELECT
  p.number
, format('"%s"@https://github.com/trinodb/trino/pull/%s ', p.title, p.number) AS title
, day(CAST(current_timestamp AT TIME ZONE 'UTC' AS TIMESTAMP) - p.updated_at) AS days_since_updated
FROM pulls p
WHERE owner = 'trinodb' AND repo = 'trino' AND state = 'open' AND NOT draft
ORDER BY 3 DESC, 1
LIMIT 20
;

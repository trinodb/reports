-- Burndown chart
WITH open_prs AS (
  SELECT d.month, count(*) AS count
  FROM unique_pulls
  CROSS JOIN unnest(sequence(
        date_trunc('month', date(created_at)),
        date_trunc('month', date(coalesce(closed_at, current_date))),
        interval '1' month
  )) AS d(month)
  WHERE owner = 'trinodb' AND repo = 'trino'
  GROUP BY 1
),
new_prs AS (
  SELECT date_trunc('month', date(created_at)) AS month, count(*) AS count
  FROM unique_pulls
  WHERE owner = 'trinodb' AND repo = 'trino'
  GROUP BY 1
),
closed_prs AS (
  SELECT date_trunc('month', date(closed_at)) AS month, count(*) AS count
  FROM unique_pulls
  WHERE owner = 'trinodb' AND repo = 'trino'
  GROUP BY 1
),
open_issues AS (
  SELECT d.month, count(*) AS count
  FROM unique_issues
  CROSS JOIN unnest(sequence(
        date_trunc('month', date(created_at)),
        date_trunc('month', date(coalesce(closed_at, current_date))),
        interval '1' month
  )) AS d(month)
  WHERE owner = 'trinodb' AND repo = 'trino'
  GROUP BY 1
),
new_issues AS (
  SELECT date_trunc('month', date(created_at)) AS month, count(*) AS count
  FROM unique_issues
  WHERE owner = 'trinodb' AND repo = 'trino'
  GROUP BY 1
),
closed_issues AS (
  SELECT date_trunc('month', date(closed_at)) AS month, count(*) AS count
  FROM unique_issues
  WHERE owner = 'trinodb' AND repo = 'trino'
  GROUP BY 1
)
SELECT
  d.month AS "Month"
, bar(op.count / CAST(max(op.count) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Open PRs chart"
-- can't reverse a string with ansi escape codes so just swap the padding spaces
, regexp_replace(bar((cp.count - np.count) / CAST(max(abs(np.count - cp.count)) OVER () AS double), 10, rgb(0, 155, 0), rgb(0, 155, 0)), '([^\s]*)(\s*)', '$2$1')
  || bar((np.count - cp.count) / CAST(max(abs(np.count - cp.count)) OVER () AS double), 10, rgb(255, 0, 0), rgb(255, 0, 0))
  AS "PRs delta"
, bar(oi.count / CAST(max(oi.count) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Open issues chart"
, regexp_replace(bar((ci.count - ni.count) / CAST(max(abs(ni.count - ci.count)) OVER () AS double), 10, rgb(0, 155, 0), rgb(0, 155, 0)), '([^\s]*)(\s*)', '$2$1')
  || bar((ni.count - ci.count) / CAST(max(abs(ni.count - ci.count)) OVER () AS double), 10, rgb(255, 0, 0), rgb(255, 0, 0)) AS "Issues delta"
, op.count AS "Open PRs"
, np.count AS "New PRs"
, cp.count AS "Closed/merged PRs"
, oi.count AS "Open issues"
, ni.count AS "New issues"
, ci.count AS "Closed issues"
FROM
  unnest(sequence(date_trunc('month', current_date), date_trunc('month', current_date) - interval '3' year, interval '-1' month)) AS d(month)
LEFT JOIN open_prs op ON op.month = d.month
LEFT JOIN new_prs np ON np.month = d.month
LEFT JOIN closed_prs cp ON cp.month = d.month
LEFT JOIN open_issues oi ON oi.month = d.month
LEFT JOIN new_issues ni ON ni.month = d.month
LEFT JOIN closed_issues ci ON ci.month = d.month
;

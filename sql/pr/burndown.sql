-- Burndown chart
WITH open_prs AS (
  SELECT d.month, count(*) AS count
  FROM pulls
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
  FROM pulls
  WHERE owner = 'trinodb' AND repo = 'trino'
  GROUP BY 1
),
closed_prs AS (
  SELECT date_trunc('month', date(closed_at)) AS month, count(*) AS count
  FROM pulls
  WHERE owner = 'trinodb' AND repo = 'trino'
  GROUP BY 1
),
open_issues AS (
  SELECT d.month, count(*) AS count
  FROM issues
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
  FROM issues
  WHERE owner = 'trinodb' AND repo = 'trino'
  GROUP BY 1
),
closed_issues AS (
  SELECT date_trunc('month', date(closed_at)) AS month, count(*) AS count
  FROM issues
  WHERE owner = 'trinodb' AND repo = 'trino'
  GROUP BY 1
)
SELECT
  d.month AS "Month"
, bar(op.count / CAST(max(op.count) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Open PRs chart"
, bar(np.count / CAST(max(np.count) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "New PRs chart"
, bar(cp.count / CAST(max(cp.count) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Closed and merged PRs chart"
, bar(oi.count / CAST(max(oi.count) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Open issues chart"
, bar(ni.count / CAST(max(ni.count) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "New issues chart"
, bar(ci.count / CAST(max(ci.count) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Closed issues chart"
, op.count AS "Open PRs"
, np.count AS "New PRs"
, cp.count AS "Closed and merged PRs"
, oi.count AS "Open issues"
, ni.count AS "New issues"
, ci.count AS "Closed issues"
FROM
  unnest(sequence(date_trunc('month', current_date), date_trunc('month', current_date) - interval '1' year, interval '-1' month)) AS d(month)
LEFT JOIN open_prs op ON op.month = d.month
LEFT JOIN new_prs np ON np.month = d.month
LEFT JOIN closed_prs cp ON cp.month = d.month
LEFT JOIN open_issues oi ON oi.month = d.month
LEFT JOIN new_issues ni ON oi.month = d.month
LEFT JOIN closed_issues ci ON ci.month = d.month
;

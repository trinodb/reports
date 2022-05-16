-- Burndown over 3 months
WITH
pulls AS (
  SELECT *
  FROM unique_pulls
  WHERE owner = 'trinodb' AND repo = 'trino'
)
, issues AS (
  SELECT *
  FROM unique_issues
  WHERE owner = 'trinodb' AND repo = 'trino'
)
, time AS (
  SELECT
      d.time AS time_label
    , d.time - interval '3' month AS time_begin
    , d.time + interval '1' month - interval '1' day AS time_end
  FROM unnest(sequence(
        date_trunc('month', current_date),
        date_trunc('month', current_date) - interval '3' year,
        interval '-1' month)) AS d(time)
)
, new_prs AS (
  SELECT time_label, count(*) AS count
  FROM time t
  LEFT JOIN pulls p ON date(p.created_at) BETWEEN t.time_begin AND t.time_end
  GROUP BY 1
),
closed_prs AS (
  SELECT time_label, count(*) AS count
  FROM time t
  LEFT JOIN pulls p ON date(p.closed_at) BETWEEN t.time_begin AND t.time_end
  GROUP BY 1
),
new_issues AS (
  SELECT time_label, count(*) AS count
  FROM time t
  LEFT JOIN issues i ON date(i.created_at) BETWEEN t.time_begin AND t.time_end
  GROUP BY 1
),
closed_issues AS (
  SELECT time_label, count(*) AS count
  FROM time t
  LEFT JOIN issues i ON date(i.closed_at) BETWEEN t.time_begin AND t.time_end
  GROUP BY 1
)
SELECT
  t.time_label AS "Time"
-- can't reverse a string with ansi escape codes so just swap the padding spaces
, regexp_replace(bar((cp.count - np.count) / CAST(max(abs(np.count - cp.count)) OVER () AS double), 10, rgb(0, 155, 0), rgb(0, 155, 0)), '([^\s]*)(\s*)', '$2$1')
  || bar((np.count - cp.count) / CAST(max(abs(np.count - cp.count)) OVER () AS double), 10, rgb(255, 0, 0), rgb(255, 0, 0))
  AS "PRs delta"
, regexp_replace(bar((ci.count - ni.count) / CAST(max(abs(ni.count - ci.count)) OVER () AS double), 10, rgb(0, 155, 0), rgb(0, 155, 0)), '([^\s]*)(\s*)', '$2$1')
  || bar((ni.count - ci.count) / CAST(max(abs(ni.count - ci.count)) OVER () AS double), 10, rgb(255, 0, 0), rgb(255, 0, 0)) AS "Issues delta"
, np.count AS "New PRs"
, cp.count AS "Closed/merged PRs"
, ni.count AS "New issues"
, ci.count AS "Closed issues"
FROM
  time t
LEFT JOIN new_prs np ON np.time_label = t.time_label
LEFT JOIN closed_prs cp ON cp.time_label = t.time_label
LEFT JOIN new_issues ni ON ni.time_label = t.time_label
LEFT JOIN closed_issues ci ON ci.time_label = t.time_label
;

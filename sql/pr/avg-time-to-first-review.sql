-- Average time to first review
WITH
months AS (
    SELECT *
    FROM unnest(sequence(date '2019-01-01', current_date, interval '1' month)) AS months(month)
)
, first_reviews AS (
    SELECT
        p.number
      , p.created_at
      , min(r.submitted_at) AS reviewed_at
    FROM unique_pulls p
    JOIN reviews r ON (p.owner, p.repo, p.number) = (r.owner, r.repo, r.pull_number)
      AND p.user_login != r.user_login
    WHERE p.owner = 'trinodb' AND p.repo = 'trino'
    GROUP BY 1, 2
)
, reviewed_months AS (
    SELECT
        months.month
      , p.number
      , least(months.month + interval '1' month - interval '1' day, p.reviewed_at) - p.created_at AS ttfr
    FROM first_reviews p
    JOIN months ON months.month BETWEEN date_trunc('month', date(p.created_at)) AND date_trunc('month', date(p.reviewed_at))
)
, reviewed_3months AS (
    SELECT
        months.month
      , p.number
      , least(months.month + interval '1' month - interval '1' day, p.reviewed_at) - p.created_at AS ttfr
    FROM first_reviews p
    JOIN months ON months.month BETWEEN date_trunc('month', date(p.created_at)) AND date_trunc('month', date(p.reviewed_at)) + interval '2' month
)
, first_comment AS (
    SELECT
        p.number
      , p.created_at
      , min(c.created_at) AS commented_at
    FROM unique_pulls p
    JOIN unique_issue_comments c ON (p.owner, p.repo, p.issue_url) = (c.owner, c.repo, c.issue_url)
      AND c.user_login != p.user_login
      AND c.user_login != 'cla-bot[bot]'
    WHERE p.owner = 'trinodb' AND p.repo = 'trino'
    GROUP BY 1, 2
)
, commented_months AS (
    SELECT
        months.month
      , p.number
      , least(months.month + interval '1' month - interval '1' day, p.commented_at) - p.created_at as ttfc
    FROM first_comment p
    JOIN months ON months.month BETWEEN date_trunc('month', date(p.created_at)) AND date_trunc('month', date(p.commented_at))
)
, commented_3months AS (
    SELECT
        months.month
      , p.number
      , least(months.month + interval '1' month - interval '1' day, p.commented_at) - p.created_at as ttfc
    FROM first_comment p
    JOIN months ON months.month BETWEEN date_trunc('month', date(p.created_at)) AND date_trunc('month', date(p.commented_at)) + interval '2' month
)
, monthly_rollup AS (
    SELECT
        coalesce(r.month, c.month) AS month
      , count(coalesce(r.number, c.number)) as num_pulls
      , count(r.number) as num_reviews
      , count(c.number) as num_comments
      , avg(least(coalesce(r.ttfr, c.ttfc), coalesce(c.ttfc, r.ttfr))) as avg_ttfr
      , approx_percentile(to_milliseconds(least(coalesce(r.ttfr, c.ttfc), coalesce(c.ttfc, r.ttfr))) / (1000.0 * 3600.0 * 24.0), ARRAY[0.5, 0.75, 0.9, 0.99]) AS perc
    FROM reviewed_months r
    FULL OUTER JOIN commented_months c ON (r.month, r.number) = (c.month, c.number)
    GROUP BY 1
)
, monthly3_rollup AS (
    SELECT
        coalesce(r.month, c.month) AS month
      , count(coalesce(r.number, c.number)) as num_pulls
      , count(r.number) as num_reviews
      , count(c.number) as num_comments
      , avg(least(coalesce(r.ttfr, c.ttfc), coalesce(c.ttfc, r.ttfr))) as avg_ttfr
    FROM reviewed_3months r
    FULL OUTER JOIN commented_3months c ON (r.month, r.number) = (c.month, c.number)
    GROUP BY 1
)
SELECT
    m.month AS "Month"
  , m.num_pulls AS "Number of PRs"
  , bar(to_milliseconds(m.avg_ttfr) / CAST(max(to_milliseconds(m.avg_ttfr)) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Avg TTFR chart"
  , m.avg_ttfr AS "Avg TTFR"
  , m3.num_pulls AS "Number of PRs over 3 months"
  , bar(to_milliseconds(m3.avg_ttfr) / CAST(max(to_milliseconds(m3.avg_ttfr)) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Avg TTFR over 3 months chart"
  , m3.avg_ttfr AS "Avg TTFR over 3 months"
  , transform(m.perc, d -> format('%.2f', d)) AS "Days to review percentiles 50, 75, 90, 99"
FROM monthly_rollup m
JOIN monthly3_rollup m3 ON m.month = m3.month
ORDER BY 1 DESC
;

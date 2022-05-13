-- Time to first review in last 12 months
WITH
first_reviews AS (
    SELECT
        p.number
      , min(r.submitted_at) - p.created_at AS ttfr
    FROM unique_pulls p
    JOIN reviews r ON (p.owner, p.repo, p.number) = (r.owner, r.repo, r.pull_number)
      AND p.user_login != r.user_login
    WHERE p.owner = 'trinodb' AND p.repo = 'trino'
    GROUP BY p.number, p.created_at
    HAVING min(r.submitted_at) > CURRENT_DATE - interval '12' month
)
, first_comments AS (
    SELECT
        p.number
      , min(c.created_at) - p.created_at AS ttfc
    FROM unique_pulls p
    JOIN unique_issue_comments c ON (p.owner, p.repo, p.issue_url) = (c.owner, c.repo, c.issue_url)
      AND c.user_login != p.user_login
      AND c.user_login != 'cla-bot[bot]'
    WHERE p.owner = 'trinodb' AND p.repo = 'trino'
    GROUP BY p.number, p.created_at
    HAVING min(c.created_at) > CURRENT_DATE - interval '12' month
)
, pulls AS (
  SELECT
       coalesce(r.number, c.number) AS number
     , least(coalesce(r.ttfr, c.ttfc), coalesce(c.ttfc, r.ttfr)) AS ttfr
     , s.additions + s.deletions AS size
  FROM first_reviews r
  FULL OUTER JOIN first_comments c ON c.number = r.number
  LEFT JOIN unique_pull_stats s ON coalesce(r.number, c.number) = s.pull_number AND s.owner = 'trinodb' AND s.repo = 'trino'
)
, histogram AS (
    SELECT
          ttfr AS key
        , width_bucket(
            to_milliseconds(ttfr) / 60000.0,
            ARRAY[
                0,
                10,
                30,
                60,
                90,
                120,
                240,
                600,
                1440,
                2880,
                5760,
                14400,
                43200,
                129600]) AS bucket
        , count(*) AS value
        , sum(size) AS sum_size
    FROM pulls
    GROUP BY ttfr
)
, grouped AS (
    SELECT
          bucket
        , element_at(ARRAY[
            'up to 10 minutes',
            '10 to 30 minutes',
            '30 to 60 minutes',
            '1 to 1.5 hours',
            '1.5 to 2 hours',
            '2 to 4 hours',
            '4 to 10 hours',
            '10 to 24 hours',
            '1 to 2 days',
            '2 to 4 days',
            '4 to 10 days',
            '10 to 30 days',
            '30 to 90 days',
            'over 90 days'], bucket) AS range
        , sum(value) AS value
        , sum(sum_size) / sum(value) AS avg_size
    FROM histogram
    GROUP BY bucket
    ORDER BY bucket
)
SELECT
    range AS "Time to first review"
  , value AS "Number of PRs"
  , avg_size AS "Average PR size"
  , bar(value / CAST(max(value) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Chart"
FROM grouped
UNION ALL
SELECT
    'Total'
  , sum(value)
  , sum(sum_size) / sum(value)
  , ''
FROM histogram
ORDER BY if("Time to first review" = 'Total', 1, 0)
;

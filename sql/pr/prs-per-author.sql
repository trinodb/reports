-- PRs per author
WITH
prs_per_author AS (
    SELECT p.user_login, count(*) AS num_prs
    FROM pulls p
    WHERE owner = 'trinodb' AND repo = 'trino'
    GROUP BY 1
)
, histogram AS (
    SELECT
        num_prs AS key
        , width_bucket(num_prs, ARRAY[1, 2, 3, 4, 5, 10, 100, 1000]) AS bucket
        , count(*) AS value
    FROM prs_per_author
    GROUP BY num_prs
)
, grouped AS (
    SELECT
        bucket
        , element_at(ARRAY['1', '2', '3', '4', '5 to 10', '10 to 100', '100 to 1000', 'over 1000'], bucket) AS range
        , sum(value) AS value
    FROM histogram
    GROUP BY bucket
    ORDER BY bucket
)
, chart AS (
    SELECT
        bucket
      , range
      , value
      , bar(value / CAST(max(value) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS value_chart
    FROM grouped
    UNION ALL
    SELECT
        NULL
      , 'Total'
      , sum(value)
      , ''
    FROM histogram
)
SELECT
  range AS "Number of PRs per author"
  , value AS "Number of authors"
  , value_chart AS "Chart"
FROM chart
ORDER BY bucket
;

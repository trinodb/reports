-- Reviewers per PR
WITH
reviews_per_pr AS (
    SELECT r.pull_number, count(distinct r.user_login) AS num
    FROM reviews r
    JOIN unique_pulls p ON p.number = r.pull_number
    WHERE p.owner = 'trinodb' AND p.repo = 'trino'
    AND r.user_login != p.user_login
    GROUP BY 1
)
, histogram AS (
    SELECT
        num AS key
        , width_bucket(num, ARRAY[1, 2, 3, 4, 5, 10, 20]) AS bucket
        , count(*) AS value
    FROM reviews_per_pr
    GROUP BY num
)
, grouped AS (
    SELECT
        bucket
        , element_at(ARRAY['1', '2', '3', '4', '5 to 10', '10 to 20', 'over 20'], bucket) AS range
        , sum(value) AS value
    FROM histogram
    GROUP BY bucket
    ORDER BY bucket
)
SELECT
  range AS "Reviewers per PR"
  , value AS "Number of reviews"
  , bar(value / CAST(max(value) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Chart"
FROM grouped
;

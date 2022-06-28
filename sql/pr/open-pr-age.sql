-- Open PRs age
WITH
pulls AS (
  SELECT
    now() - p.created_at AS age
  FROM unique_pulls p
  WHERE p.owner = 'trinodb' AND p.repo = 'trino' AND p.closed_at IS NULL
)
, histogram AS (
    SELECT
        age AS key
        , width_bucket(
            to_milliseconds(age) / 60000.0,
            ARRAY[
            -- lower bound in minutes
                1440,
                2880,
                5760,
                14400,
                43200,
                129600,
                259200,
                525600,
                1051200]) AS bucket
        , count(*) AS value
    FROM pulls p
    GROUP BY age
)
, grouped AS (
    SELECT
        bucket
        , element_at(ARRAY[
            '1 to 2 days',
            '2 to 4 days',
            '4 to 10 days',
            '10 to 30 days',
            '1 to 3 months',
            '3 to 6 months',
            '6 to 12 months',
            '1 to 2 years',
            'over 2 year'], bucket) AS range
        , sum(value) AS value
    FROM histogram
    GROUP BY bucket
)
, chart AS (
    SELECT
      bucket
      , range
      , value
      , bar(value / CAST(max(value) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS value_chart
    FROM grouped
)
SELECT
  range AS "Age"
  , value AS "Number of PRs"
  , value_chart AS "Number of PRs chart"
FROM chart
ORDER BY bucket
;

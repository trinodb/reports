-- Time to merge in last 12 months
WITH
pulls AS (
  SELECT merged_at - created_at AS time_to_merge
  FROM unique_pulls
  WHERE owner = 'trinodb' AND repo = 'trino' AND merged_at > CURRENT_DATE - interval '12' month
)
, histogram AS (
    SELECT
        time_to_merge AS key
        , width_bucket(
            to_milliseconds(time_to_merge) / 60000.0,
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
    FROM pulls
    GROUP BY 1
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
    FROM histogram
    GROUP BY 1, 2
)
SELECT
  range AS "Time to merge"
  , value AS "Number of PRs"
  , bar(value / CAST(max(value) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Chart"
FROM grouped
ORDER BY bucket
;

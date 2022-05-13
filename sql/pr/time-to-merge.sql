-- Time to merge in last 12 months
WITH
pulls AS (
  SELECT
      p.owner
    , p.repo
    , p.number
    , p.issue_url
    , p.user_login
    , p.created_at
    , p.merged_at - p.created_at AS time_to_merge
    , s.additions + s.deletions AS size
  FROM unique_pulls p
  JOIN unique_pull_stats s ON (s.owner, s.repo, s.pull_number) = (p.owner, p.repo, p.number)
  WHERE p.owner = 'trinodb' AND p.repo = 'trino' AND p.merged_at > CURRENT_DATE - interval '12' month
)
, reviews AS (
  SELECT
      r.pull_number AS number
    , r.submitted_at AS event_at
    , r.user_login = p.user_login AS is_author
  FROM pulls p
  JOIN reviews r ON (p.owner, p.repo, p.number) = (r.owner, r.repo, r.pull_number)
)
, comments AS (
  SELECT
      p.number
    , pc.created_at AS event_at
    , pc.user_login = p.user_login AS is_author
  FROM pulls p
  JOIN unique_issue_comments pc ON pc.issue_url = p.issue_url
  WHERE pc.user_login != 'cla-bot[bot]'
)
, commits AS (
  SELECT
      c.pull_number AS number
    , c.committer_date AS event_at
    , c.author_login = p.user_login AS is_author
  FROM pulls p
  JOIN unique_pull_commits c ON (p.owner, p.repo, p.number) = (c.owner, c.repo, c.pull_number)
)
, events AS (
  SELECT number, created_at AS event_at, true AS is_author, 'created' AS event
  FROM pulls
  UNION ALL
  SELECT *, 'review' AS event FROM reviews
  UNION ALL
  SELECT *, 'comment' AS event FROM comments
  UNION ALL
  SELECT *, 'commit' AS event FROM commits
)
, review_rounds AS (
  SELECT number, count(flipped) AS rounds
  FROM (
    SELECT number, CASE WHEN is_author != lag(is_author) OVER (PARTITION BY number ORDER BY event_at) THEN 1 END AS flipped
    FROM events
  ) a
  GROUP BY 1
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
        , sum(size) AS sum_size
        , sum(rounds) AS sum_rounds
    FROM pulls p
    LEFT JOIN review_rounds r ON r.number = p.number
    GROUP BY time_to_merge
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
        , sum(sum_rounds) / sum(value) AS avg_rounds
    FROM histogram
    GROUP BY bucket
)
, chart AS (
    SELECT
      bucket
      , range
      , value
      , avg_size
      , avg_rounds
      , bar(value / CAST(max(value) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS value_chart
    FROM grouped
    UNION ALL
    SELECT
      NULL
      , 'Total'
      , sum(value)
      , sum(sum_size) / sum(value)
      , sum(sum_rounds) / sum(value)
      , ''
    FROM histogram
)
SELECT
  range AS "Time to merge"
  , value AS "Number of PRs"
  , avg_size AS "Average PR size"
  , avg_rounds AS "Average review rounds"
  , value_chart AS "Number of PRs chart"
FROM chart
ORDER BY bucket
;

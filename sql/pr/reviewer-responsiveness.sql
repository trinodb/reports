-- Responsiveness of reviewers
WITH
pulls AS (
  SELECT *
  FROM unique_pulls
  WHERE owner = 'trinodb' AND repo = 'trino'
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
, reviewer_events AS (
  SELECT number, response_time
  FROM events MATCH_RECOGNIZE (
    PARTITION BY number
    ORDER BY event_at
    MEASURES
        min(B.event_at) - min(A.event_at) AS response_time
    ONE ROW PER MATCH
    PATTERN (A+ B+)
    DEFINE
      A AS is_author
    , B AS NOT is_author
  )
)
-- uncomment for debugging
-- SELECT * FROM reviewer_events WHERE response_time < interval '10' minute LIMIT 10;
-- SELECT * FROM events WHERE number = 652 ORDER BY event_at;
, histogram AS (
    SELECT
        response_time AS key
        , width_bucket(
            to_milliseconds(response_time) / 60000.0,
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
    FROM reviewer_events
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
  range AS "Reviewwer response time"
  , value AS "Number of reviews"
  , bar(value / CAST(max(value) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Chart"
FROM grouped
ORDER BY bucket
;

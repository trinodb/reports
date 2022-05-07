-- Top 10 reviewers per year
WITH
reviews_not_replies AS (
    SELECT
        r.user_login
      , r.state
      , r.submitted_at
    FROM reviews r
    LEFT JOIN review_comments rc ON (r.owner, r.repo, r.id) = (rc.owner, rc.repo, rc.pull_request_review_id)
    WHERE coalesce(rc.in_reply_to_id, 0) = 0
    GROUP BY 1, 2, 3
)
, reviewers_per_year AS (
    SELECT
        year(r.submitted_at) AS year
      , ai.name
      , regexp_replace(ai.email, '(?<=.)[^@](?=[^@]*?@)|(?:(?<=@.)|(?!^)\G(?=[^@]*$)).(?=.*\.)', '*') AS email
      , count(*) AS reviews_count
      , count(*) FILTER (WHERE r.state = 'APPROVED') AS approved_count
      , count(*) FILTER (WHERE r.state = 'COMMENTED') AS commented_count
    FROM reviews_not_replies r
    JOIN memory.default.gh_idents ai ON CONTAINS(ai.logins, r.user_login)
    GROUP BY 1, 2, 3
)
, commenters_per_year AS (
    SELECT
        year(c.created_at) AS year
      , ai.name
      , regexp_replace(ai.email, '(?<=.)[^@](?=[^@]*?@)|(?:(?<=@.)|(?!^)\G(?=[^@]*$)).(?=.*\.)', '*') AS email
      , count(*) AS reviews_count
      , 0 AS approved_count
      , count(*) AS commented_count
    FROM unique_issue_comments c
    JOIN memory.default.gh_idents ai ON CONTAINS(ai.logins, c.user_login)
    WHERE c.html_url like 'https://github.com/trinodb/trino/pull/%'
    GROUP BY 1, 2, 3
)
, ranked_per_year AS (
    SELECT
        year
      , name
      , email
      , sum(reviews_count) AS reviews_count
      , sum(approved_count) AS approved_count
      , sum(commented_count) AS commented_count
      , row_number() OVER (PARTITION BY year ORDER BY sum(reviews_count) DESC) AS in_year_rank
    FROM (
        SELECT *
        FROM reviewers_per_year
        UNION ALL
        SELECT *
        FROM commenters_per_year
    ) a
    GROUP BY 1, 2, 3
)
SELECT
    year
  , name
  , email
  , reviews_count
  , approved_count
  , commented_count
FROM ranked_per_year
WHERE in_year_rank < 11
ORDER BY 1 DESC, 4 DESC, 2
;

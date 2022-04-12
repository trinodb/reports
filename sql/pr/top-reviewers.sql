-- Top 10 reviewers per year
WITH
reviewers_per_year AS (
    SELECT
        year(r.submitted_at) AS year
      , ai.name
      , regexp_replace(ai.email, '(?<=.)[^@](?=[^@]*?@)|(?:(?<=@.)|(?!^)\G(?=[^@]*$)).(?=.*\.)', '*') AS email
      , count(*) AS reviews_count
      , count(*) FILTER (WHERE r.state = 'APPROVED') AS approved_count
      , count(*) FILTER (WHERE r.state = 'COMMENTED') AS commented_count
    FROM reviews r
    JOIN memory.default.gh_idents ai ON CONTAINS(ai.logins, r.user_login)
    GROUP BY 1, 2, 3
)
, ranked_per_year AS (
    SELECT
        year
      , name
      , email
      , reviews_count
      , approved_count
      , commented_count
      , row_number() OVER (PARTITION BY year ORDER BY reviews_count DESC) AS in_year_rank
    FROM reviewers_per_year
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
ORDER BY 1 DESC, 4 DESC
;

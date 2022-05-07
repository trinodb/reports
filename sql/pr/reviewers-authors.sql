-- Reviewers top 10 authors in last 12 months
WITH pairs AS (
    SELECT
        r.submitted_at AS review_time
      , r.pull_number
      , ai.name AS ai_name
      , ma.org AS ai_org
      , ri.name AS ri_name
      , mr.org AS ri_org
      , count(*) AS comments
    FROM reviews r
    JOIN unique_pulls p ON (p.owner, p.repo, p.number) = (r.owner, r.repo, r.pull_number)
    JOIN memory.default.gh_idents ri ON CONTAINS(ri.logins, r.user_login)
    JOIN memory.default.gh_idents ai ON CONTAINS(ai.logins, p.user_login)
    LEFT JOIN review_comments rc ON (r.owner, r.repo, r.id) = (rc.owner, rc.repo, rc.pull_request_review_id)
    LEFT JOIN members ma ON CONTAINS(ai.logins, ma.login)
    LEFT JOIN members mr ON CONTAINS(ri.logins, mr.login)
    WHERE r.owner = 'trinodb' AND r.repo = 'trino'
    AND r.user_login != p.user_login AND r.submitted_at > CURRENT_DATE - interval '1' year
    GROUP BY 1, 2, 3, 4, 5, 6
)
, reviewers AS (
    SELECT
        ri_name
      , ri_org
      , ai_name
      , ai_org
      , sum(comments) AS comments
      , count(distinct pull_number) AS pull_requests
      , count(*) AS reviews
      , row_number() OVER (PARTITION BY ri_name ORDER BY sum(comments) DESC) AS author_rank
    FROM pairs
    GROUP BY 1, 2, 3, 4
)
SELECT
    ri_name AS "Reviewer name"
  , ri_org AS "Reviwer org"
  , ai_name AS "Author name"
  , ai_org AS "Author org"
  , author_rank AS "Author rank"
  , bar(comments / CAST(max(comments) OVER (PARTITION BY ri_name) AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Comments chart"
  , comments AS "Number of comments"
  , pull_requests AS "Number of pull requests"
  , reviews "Number of reviews"
FROM reviewers
WHERE author_rank < 11
ORDER BY ri_name, comments DESC, ai_name
;

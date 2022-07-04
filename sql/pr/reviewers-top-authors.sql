-- Reviewers top 10 authors in last 12 months
WITH
members AS (
    SELECT
        login
      , joined_at
      , removed_at
      , org AS team
    FROM all_members
    WHERE team_slug = '' AND org != 'trinodb'
    UNION ALL
    SELECT
        login
      , joined_at
      , removed_at
      , team_slug AS team
    FROM all_members
    WHERE team_slug NOT IN ('', 'infrastructure', 'contributors') AND org = 'trinodb'
)
, pulls AS (
    SELECT
        p.owner
      , p.repo
      , p.number
      , p.user_login
      , array_agg(DISTINCT coalesce(m.team, 'external') ORDER BY coalesce(m.team, 'external')) AS author_teams
    FROM unique_pulls p
    LEFT JOIN members m ON m.login = p.user_login AND p.created_at BETWEEN m.joined_at AND m.removed_at
    WHERE p.owner = 'trinodb' AND p.repo = 'trino'
    GROUP BY 1, 2, 3, 4
)
, pairs AS (
    SELECT
        r.submitted_at AS review_time
      , r.pull_number
      , ai.name AS ai_name
      , ri.name AS ri_name
      , count(*) AS comments
    FROM reviews r
    JOIN pulls p ON (p.owner, p.repo, p.number) = (r.owner, r.repo, r.pull_number)
    JOIN memory.default.gh_idents ri ON CONTAINS(ri.logins, r.user_login)
    JOIN memory.default.gh_idents ai ON CONTAINS(ai.logins, p.user_login)
    -- ignore responses
    JOIN review_comments rc ON (r.owner, r.repo, r.id) = (rc.owner, rc.repo, rc.pull_request_review_id) AND rc.in_reply_to_id = 0
    WHERE r.owner = 'trinodb' AND r.repo = 'trino'
    AND r.user_login != p.user_login AND r.submitted_at > CURRENT_DATE - interval '1' year
    GROUP BY 1, 2, 3, 4
)
, reviewers AS (
    SELECT
        ri_name
      , ai_name
      , sum(comments) AS comments
      , count(distinct pull_number) AS pull_requests
      , count(*) AS reviews
      , row_number() OVER (PARTITION BY ri_name ORDER BY sum(comments) DESC) AS author_rank
    FROM pairs
    GROUP BY 1, 2
)
SELECT
    ri_name AS "Reviewer name"
  , ai_name AS "Author name"
  , author_rank AS "Author rank"
  , bar(comments / CAST(max(comments) OVER (PARTITION BY ri_name) AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Comments chart"
  , comments AS "Number of comments"
  , pull_requests AS "Number of pull requests"
  , reviews "Number of reviews"
FROM reviewers
WHERE author_rank < 11
ORDER BY ri_name, comments DESC, ai_name
;

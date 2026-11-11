
-- this is not a report, just a setup
-- one row for everyone who opened a pull request, reviewed one, or merged one, with a role derived from
-- what they did, because the author association saved from the GitHub API depends on who reads it

DROP TABLE IF EXISTS memory.default.contributors;

CREATE TABLE memory.default.contributors AS
WITH
authors AS (
    SELECT
        author AS login
      , count(*) AS prs
      , count(*) FILTER (WHERE state = 'merged') AS merged_prs
      , min(created_at) AS first_pr_at
      , max(created_at) AS last_pr_at
      , min(merged_at) AS first_merged_at
    FROM memory.default.pull_requests
    GROUP BY author
)
, reviewers AS (
    SELECT
        actor AS login
      , count(*) AS reviews
      , count(DISTINCT number) AS reviewed_prs
      , min(event_at) AS first_review_at
      , max(event_at) AS last_review_at
    FROM memory.default.pull_request_events
    WHERE kind = 'review' AND NOT by_author
    GROUP BY actor
)
, mergers AS (
    -- commits on master with a committer other than their author are merged by the committer
    SELECT
        committer_login AS login
      , count(*) AS merged_commits_last_year
    FROM commits
    WHERE owner = 'trinodb' AND repo = 'trino'
      AND committer_login != author_login
      AND committer_date >= current_date - interval '1' year
    GROUP BY committer_login
)
, logins AS (
    SELECT login FROM authors
    UNION
    SELECT login FROM reviewers
    UNION
    SELECT login FROM mergers
)
SELECT
    l.login
  , memory.default.is_bot(l.login) AS is_bot
  , coalesce(a.prs, 0) AS prs
  , coalesce(a.merged_prs, 0) AS merged_prs
  , a.first_pr_at
  , a.last_pr_at
  , a.first_merged_at
  , coalesce(r.reviews, 0) AS reviews
  , coalesce(r.reviewed_prs, 0) AS reviewed_prs
  , r.first_review_at
  , r.last_review_at
  , coalesce(m.merged_commits_last_year, 0) AS merged_commits_last_year
  -- merged commits of other people in the last year
  , coalesce(m.merged_commits_last_year, 0) > 0 AND NOT memory.default.is_bot(l.login) AS can_merge
  , CASE
        WHEN memory.default.is_bot(l.login) THEN 'bot'
        WHEN coalesce(m.merged_commits_last_year, 0) > 0 THEN 'maintainer'
        WHEN coalesce(a.merged_prs, 0) >= 10 THEN 'regular contributor'
        WHEN coalesce(a.merged_prs, 0) >= 1 THEN 'contributor'
        ELSE 'newcomer'
    END AS role
  , CASE
        WHEN memory.default.is_bot(l.login) THEN 5
        WHEN coalesce(m.merged_commits_last_year, 0) > 0 THEN 1
        WHEN coalesce(a.merged_prs, 0) >= 10 THEN 2
        WHEN coalesce(a.merged_prs, 0) >= 1 THEN 3
        ELSE 4
    END AS role_rank
FROM logins l
LEFT JOIN authors a ON a.login = l.login
LEFT JOIN reviewers r ON r.login = l.login
LEFT JOIN mergers m ON m.login = l.login
WHERE l.login IS NOT NULL;

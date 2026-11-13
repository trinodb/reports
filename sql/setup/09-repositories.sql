
-- this is not a report, just a setup
-- pull requests and issues of the other repositories of trinodb, and of airlift, which the sync reads without their commits and CI,
-- so what happened in them is known only from comments and reviews

DROP TABLE IF EXISTS memory.default.repository_pull_requests;

CREATE TABLE memory.default.repository_pull_requests AS
WITH
pulls AS (
    SELECT *
    FROM pulls
    WHERE (owner = 'trinodb' AND repo != 'trino') OR owner = 'airlift'
)
, events AS (
    SELECT p.owner, p.repo, p.number, r.submitted_at AS event_at, 'review' AS kind, r.state AS detail, r.user_login AS actor, p.user_login AS author
    FROM pulls p
    JOIN reviews r ON (r.owner, r.repo, r.pull_number) = (p.owner, p.repo, p.number)
    WHERE r.submitted_at IS NOT NULL
    UNION ALL
    SELECT p.owner, p.repo, p.number, c.created_at, 'comment', NULL, c.user_login, p.user_login
    FROM pulls p
    JOIN issue_comments c ON (c.owner, c.repo, c.issue_number) = (p.owner, p.repo, p.number)
)
, responses AS (
    SELECT
        owner
      , repo
      , number
      , min(event_at) AS first_response_at
      , max(event_at) AS last_response_at
    FROM events
    WHERE actor != author AND NOT memory.default.is_bot(actor)
    GROUP BY owner, repo, number
)
, review_states AS (
    -- the newest approval or request for changes of every reviewer counts, like on GitHub
    SELECT owner, repo, number, array_agg(detail) AS states
    FROM (
        SELECT owner, repo, number, detail, row_number() OVER (PARTITION BY owner, repo, number, actor ORDER BY event_at DESC) AS rownum
        FROM events
        WHERE kind = 'review' AND detail IN ('APPROVED', 'CHANGES_REQUESTED') AND actor != author
    )
    WHERE rownum = 1
    GROUP BY owner, repo, number
)
SELECT
    p.owner
  , p.repo
  , p.number
  , p.title
  , p.user_login AS author
  , memory.default.is_bot(p.user_login) AS author_is_bot
  , CASE
        WHEN p.merged_at IS NOT NULL THEN 'merged'
        WHEN p.state = 'closed' THEN 'closed'
        ELSE 'open'
    END AS state
  , coalesce(p.draft, false) AS draft
  , p.created_at
  , p.merged_at
  , p.closed_at
  , r.first_response_at
  , r.last_response_at
  , CASE
        WHEN contains(s.states, 'CHANGES_REQUESTED') THEN 'changes requested'
        WHEN contains(s.states, 'APPROVED') THEN 'approved'
        WHEN r.first_response_at IS NOT NULL THEN 'commented'
        ELSE 'no response'
    END AS review_state
FROM pulls p
LEFT JOIN responses r ON (r.owner, r.repo, r.number) = (p.owner, p.repo, p.number)
LEFT JOIN review_states s ON (s.owner, s.repo, s.number) = (p.owner, p.repo, p.number);

DROP TABLE IF EXISTS memory.default.repository_issues;

CREATE TABLE memory.default.repository_issues AS
WITH
issues_only AS (
    -- the table has pull requests too, and only some of them have pull_request_url set
    SELECT i.owner, i.repo, i.number, i.title, i.user_login, i.state, i.created_at, i.closed_at, i.labels
    FROM issues i
    WHERE ((i.owner = 'trinodb' AND i.repo != 'trino') OR i.owner = 'airlift')
      AND i.pull_request_url IS NULL
      AND NOT EXISTS (SELECT 1 FROM pulls p WHERE (p.owner, p.repo, p.number) = (i.owner, i.repo, i.number))
)
, responses AS (
    SELECT i.owner, i.repo, i.number, min(c.created_at) AS first_response_at, max(c.created_at) AS last_response_at
    FROM issues_only i
    JOIN issue_comments c ON (c.owner, c.repo, c.issue_number) = (i.owner, i.repo, i.number)
    WHERE c.user_login != i.user_login AND NOT memory.default.is_bot(c.user_login)
    GROUP BY i.owner, i.repo, i.number
)
SELECT
    i.owner
  , i.repo
  , i.number
  , i.title
  , i.user_login AS author
  , memory.default.is_bot(i.user_login) AS author_is_bot
  , i.state
  , i.created_at
  -- reopened issues keep the time they were closed before
  , if(i.state = 'closed', i.closed_at) AS closed_at
  , i.labels
  , r.first_response_at
  , r.last_response_at
FROM issues_only i
LEFT JOIN responses r ON (r.owner, r.repo, r.number) = (i.owner, i.repo, i.number);

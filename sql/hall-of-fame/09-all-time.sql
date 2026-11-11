-- All-time top 10
-- The people who authored, reviewed, and merged the most pull requests since the project moved to this repository in January 2019. Reviewed counts pull requests of other people, and merged counts pull requests of other people. Bots are not counted.
WITH
repository_start AS (
    SELECT min(created_at) AS ts
    FROM memory.default.pull_requests
)
, authors AS (
    SELECT login, merged_prs AS value, row_number() OVER (ORDER BY merged_prs DESC, login) AS position
    FROM memory.default.contributors
    WHERE NOT is_bot
)
, reviewers AS (
    SELECT e.actor AS login, count(DISTINCT e.number) AS value, row_number() OVER (ORDER BY count(DISTINCT e.number) DESC, e.actor) AS position
    FROM memory.default.pull_request_events e
    JOIN memory.default.pull_requests p ON p.number = e.number
    WHERE e.kind = 'review' AND NOT e.by_author AND NOT e.by_bot AND NOT p.author_is_bot
    GROUP BY e.actor
)
, merges AS (
    -- pull requests are rebased onto master, so the commits of one pull request share the committer and the commit time
    SELECT DISTINCT c.committer_login AS login, c.author_login, c.committer_date
    FROM commits c
    CROSS JOIN repository_start r
    WHERE c.owner = 'trinodb' AND c.repo = 'trino'
      AND c.committer_login != c.author_login
      AND NOT memory.default.is_bot(c.committer_login)
      AND NOT memory.default.is_bot(c.author_login)
      AND c.committer_date >= r.ts
)
, mergers AS (
    SELECT login, count(*) AS value, row_number() OVER (ORDER BY count(*) DESC, login) AS position
    FROM merges
    GROUP BY login
)
SELECT
    a.position AS "Rank"
  , memory.default.user_link(a.login) AS "Author"
  , a.value AS "Merged pull requests"
  , memory.default.user_link(r.login) AS "Reviewer"
  , r.value AS "Reviewed pull requests"
  , memory.default.user_link(m.login) AS "Merger"
  , m.value AS "Merged for others"
FROM authors a
JOIN reviewers r ON r.position = a.position
JOIN mergers m ON m.position = a.position
WHERE a.position <= 10
ORDER BY a.position;

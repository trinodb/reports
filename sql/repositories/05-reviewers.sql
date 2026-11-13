-- Who reviews
-- People who reviewed or commented on pull requests of other people in the last 12 months, per repository, and the share of reviewed pull requests the top reviewer saw.
-- When one person reviews almost everything, the repository stops when they're away. Reviews from users of a client count too: ask them to review.
WITH
responses AS (
    SELECT DISTINCT p.owner, p.repo, p.number, r.user_login AS reviewer
    FROM memory.default.repository_pull_requests p
    JOIN reviews r ON (r.owner, r.repo, r.pull_number) = (p.owner, p.repo, p.number)
    WHERE r.user_login != p.author AND NOT memory.default.is_bot(r.user_login) AND NOT p.author_is_bot
      AND r.submitted_at >= current_date - INTERVAL '12' MONTH
    UNION
    SELECT DISTINCT p.owner, p.repo, p.number, c.user_login
    FROM memory.default.repository_pull_requests p
    JOIN issue_comments c ON (c.owner, c.repo, c.issue_number) = (p.owner, p.repo, p.number)
    WHERE c.user_login != p.author AND NOT memory.default.is_bot(c.user_login) AND NOT p.author_is_bot
      AND c.created_at >= current_date - INTERVAL '12' MONTH
)
, per_reviewer AS (
    SELECT owner, repo, reviewer, count(*) AS pull_requests, row_number() OVER (PARTITION BY owner, repo ORDER BY count(*) DESC, reviewer) AS reviewer_rank
    FROM responses
    GROUP BY owner, repo, reviewer
)
, reviewed AS (
    SELECT owner, repo, count(DISTINCT number) AS pull_requests
    FROM responses
    GROUP BY owner, repo
)
SELECT
    p.repo AS "Repository"
  , r.pull_requests AS "Reviewed PRs"
  , count(*) AS "Reviewers"
  , format('%.0f%%', max(p.pull_requests) * 100e0 / r.pull_requests) AS "Seen by the top reviewer"
  , array_join(array_agg(format('%s (%d)', p.reviewer, p.pull_requests) ORDER BY p.reviewer_rank) FILTER (WHERE p.reviewer_rank <= 4), ', ') AS "Top reviewers (PRs)"
FROM per_reviewer p
JOIN reviewed r ON (r.owner, r.repo) = (p.owner, p.repo)
GROUP BY p.owner, p.repo, r.pull_requests
ORDER BY r.pull_requests DESC
;

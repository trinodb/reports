-- Who reviews whom
-- Rows are the authors whose pull requests were reviewed most in the last 12 months, and columns A to L are the top reviewers, named in the key on the right. A cell shows the share of the author's reviewed pull requests that the reviewer reviewed: ░ up to 25%, ▒ up to 50%, ▓ up to 75%, █ more.
-- Use it to find who reviews the work in an author's area, so who to ask for a review there. A row with one dark cell and little else means that author's area depends on one reviewer. Bots are not counted.
WITH
reviews AS (
    SELECT DISTINCT
        p.author
      , e.actor AS reviewer
      , e.number
    FROM memory.default.pull_request_events e
    JOIN memory.default.pull_requests p ON p.number = e.number
    WHERE e.kind = 'review' AND NOT e.by_author AND NOT e.by_bot AND NOT p.author_is_bot
      AND e.event_at >= CAST(now() AT TIME ZONE 'UTC' AS timestamp(6)) - interval '1' year
)
, top_reviewers AS (
    SELECT reviewer, row_number() OVER (ORDER BY count(DISTINCT number) DESC, reviewer) AS reviewer_rank
    FROM reviews
    GROUP BY reviewer
    ORDER BY reviewer_rank
    LIMIT 12
)
, top_authors AS (
    SELECT author, count(DISTINCT number) AS reviewed_prs, row_number() OVER (ORDER BY count(DISTINCT number) DESC, author) AS author_rank
    FROM reviews
    GROUP BY author
    ORDER BY author_rank
    LIMIT 15
)
, pairs AS (
    SELECT
        a.author_rank
      , t.reviewer_rank
      , CAST(count(DISTINCT r.number) AS double) / a.reviewed_prs AS share
    FROM top_authors a
    JOIN reviews r ON r.author = a.author
    JOIN top_reviewers t ON t.reviewer = r.reviewer
    GROUP BY a.author_rank, a.reviewed_prs, t.reviewer_rank
)
, cells AS (
    SELECT author_rank, map_agg(reviewer_rank, share) AS shares
    FROM pairs
    GROUP BY author_rank
)
SELECT
    a.author AS "Author"
  , a.reviewed_prs AS "PRs with a review"
  -- a heatmap chart: one cell per reviewer, so the columns line up with the letters in the title
  , array_join(transform(sequence(1, 12), i -> memory.default.shade(coalesce(element_at(c.shares, i), 0e0), 1e0)), ' ') AS "A B C D E F G H I J K L"
  , coalesce(substr('ABCDEFGHIJKL', t.reviewer_rank, 1) || ' ' || memory.default.user_link(t.reviewer), '') AS "Reviewer key"
FROM top_authors a
LEFT JOIN cells c ON c.author_rank = a.author_rank
LEFT JOIN top_reviewers t ON t.reviewer_rank = a.author_rank
ORDER BY a.author_rank;

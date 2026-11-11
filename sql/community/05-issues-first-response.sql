-- How long do users wait for an answer?
-- Issues opened by users, not maintainers or bots, in the last 12 months, by the time until the first comment from another person. Answered within is the share answered in that time or sooner.
-- Issues closed without a comment were often fixed or closed by their reporter. The open ones are listed in the next report, so anyone can answer them.
WITH
issues_only AS (
    -- the table has pull requests too, and only some of them have pull_request_url set
    SELECT i.number, i.user_login, i.state, i.created_at
    FROM issues i
    LEFT JOIN memory.default.contributors ct ON ct.login = i.user_login
    WHERE i.owner = 'trinodb' AND i.repo = 'trino'
      AND i.pull_request_url IS NULL
      AND NOT EXISTS (SELECT 1 FROM pulls p WHERE (p.owner, p.repo, p.number) = (i.owner, i.repo, i.number))
      AND NOT memory.default.is_bot(i.user_login)
      AND coalesce(ct.role, 'newcomer') != 'maintainer'
      AND i.created_at >= current_date - INTERVAL '1' YEAR
)
, first_responses AS (
    SELECT i.number, min(c.created_at) AS first_response_at
    FROM issues_only i
    JOIN issue_comments c ON c.owner = 'trinodb' AND c.repo = 'trino' AND c.issue_number = i.number
    WHERE c.user_login != i.user_login AND NOT memory.default.is_bot(c.user_login)
    GROUP BY i.number
)
, waits AS (
    SELECT
        CASE
            WHEN r.first_response_at IS NULL AND i.state = 'open' THEN 9
            WHEN r.first_response_at IS NULL THEN 8
            WHEN r.first_response_at < i.created_at + INTERVAL '1' HOUR THEN 1
            WHEN r.first_response_at < i.created_at + INTERVAL '4' HOUR THEN 2
            WHEN r.first_response_at < i.created_at + INTERVAL '1' DAY THEN 3
            WHEN r.first_response_at < i.created_at + INTERVAL '3' DAY THEN 4
            WHEN r.first_response_at < i.created_at + INTERVAL '7' DAY THEN 5
            WHEN r.first_response_at < i.created_at + INTERVAL '28' DAY THEN 6
            ELSE 7
        END AS bucket
    FROM issues_only i
    LEFT JOIN first_responses r ON r.number = i.number
)
, buckets (bucket, label) AS (
    VALUES
        (1, 'Under 1 hour')
      , (2, '1 to 4 hours')
      , (3, '4 to 24 hours')
      , (4, '1 to 3 days')
      , (5, '3 to 7 days')
      , (6, '1 to 4 weeks')
      , (7, 'Over 4 weeks')
      , (8, 'No comment, but closed')
      , (9, 'No comment, still open')
)
, counts AS (
    SELECT b.bucket, b.label, count(w.bucket) AS issues
    FROM buckets b
    LEFT JOIN waits w ON w.bucket = b.bucket
    GROUP BY b.bucket, b.label
)
SELECT
    label AS "First response"
  , issues AS "Issues"
  , format('%.0f%%', issues * 100e0 / sum(issues) OVER ()) AS "Share"
  , if(bucket <= 7, format('%.0f%%', sum(issues) OVER (ORDER BY bucket) * 100e0 / sum(issues) OVER ()), '') AS "Answered within"
  , memory.default.hbar(issues, max(issues) OVER (), 40) AS "Issues chart"
FROM counts
ORDER BY bucket
;

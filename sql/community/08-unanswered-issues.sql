-- Issues waiting for a first answer
-- Open issues opened by users, not maintainers or bots, in the last 90 days, without any comment from another person, newest first.
-- If you know the area, ask for details, point to the documentation, or confirm the bug: an answer in the first days keeps reporters engaged.
WITH
issues_only AS (
    -- the table has pull requests too, and only some of them have pull_request_url set
    SELECT i.number, i.title, i.user_login, i.created_at, i.reactions_total_count
    FROM issues i
    LEFT JOIN memory.default.contributors ct ON ct.login = i.user_login
    WHERE i.owner = 'trinodb' AND i.repo = 'trino'
      AND i.state = 'open'
      AND i.pull_request_url IS NULL
      AND NOT EXISTS (SELECT 1 FROM pulls p WHERE (p.owner, p.repo, p.number) = (i.owner, i.repo, i.number))
      AND NOT memory.default.is_bot(i.user_login)
      AND coalesce(ct.role, 'newcomer') != 'maintainer'
      AND i.created_at >= current_date - INTERVAL '90' DAY
)
SELECT
    memory.default.link(format('#%d', i.number), format('https://github.com/trinodb/trino/issues/%d', i.number)) AS "Issue"
  , replace(replace(i.title, chr(13), ' '), chr(10), ' ') AS "Title"
  , memory.default.user_link(i.user_login) AS "Reporter"
  , memory.default.human_duration(to_milliseconds(current_timestamp - with_timezone(i.created_at, 'UTC')) / 1000e0) AS "Waiting for"
  , coalesce(i.reactions_total_count, 0) AS "Reactions"
FROM issues_only i
WHERE NOT EXISTS (
    SELECT 1
    FROM issue_comments c
    WHERE c.owner = 'trinodb' AND c.repo = 'trino' AND c.issue_number = i.number
      AND c.user_login != i.user_login AND NOT memory.default.is_bot(c.user_login)
)
ORDER BY i.created_at DESC
LIMIT 30
;

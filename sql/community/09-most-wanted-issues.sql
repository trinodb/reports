-- What do users ask for?
-- Open issues with the most reactions, which is how users vote for a feature or a fix, then the most comments. Comments in the last 90 days show what is discussed now.
-- Maintainers: this is the demand to plan for. Contributors: these are changes that many people will use; comment on the issue before you start, to agree on the approach.
WITH
issues_only AS (
    -- the table has pull requests too, and only some of them have pull_request_url set
    SELECT i.number, i.title, i.created_at, i.reactions_total_count, i.comments
    FROM issues i
    WHERE i.owner = 'trinodb' AND i.repo = 'trino'
      AND i.state = 'open'
      AND i.pull_request_url IS NULL
      AND NOT EXISTS (SELECT 1 FROM pulls p WHERE (p.owner, p.repo, p.number) = (i.owner, i.repo, i.number))
)
, recent_comments AS (
    SELECT issue_number AS number, count(*) AS comments
    FROM issue_comments
    WHERE owner = 'trinodb' AND repo = 'trino'
      AND created_at >= current_date - INTERVAL '90' DAY
      AND NOT memory.default.is_bot(user_login)
    GROUP BY issue_number
)
SELECT
    format('"#%d"@https://github.com/trinodb/trino/issues/%d ', i.number, i.number) AS "Issue"
  , replace(replace(i.title, chr(13), ' '), chr(10), ' ') AS "Title"
  , coalesce(i.reactions_total_count, 0) AS "Reactions"
  , coalesce(i.comments, 0) AS "Comments"
  , coalesce(r.comments, 0) AS "Comments in the last 90 days"
  , date_format(i.created_at, '%Y-%m') AS "Opened"
FROM issues_only i
LEFT JOIN recent_comments r ON r.number = i.number
ORDER BY coalesce(i.reactions_total_count, 0) DESC, coalesce(i.comments, 0) DESC, i.number DESC
LIMIT 25
;

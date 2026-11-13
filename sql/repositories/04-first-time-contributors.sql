-- First-time contributors
-- People whose first pull request to a repository was opened in the last 12 months, newest first, what happened to it, and how long it waited for a first response.
-- A quick first response keeps new people coming back. Thank them, and point them to issues they could help with next.
WITH
firsts AS (
    SELECT
        *
      , row_number() OVER (PARTITION BY owner, repo, author ORDER BY created_at) AS rownum
    FROM memory.default.repository_pull_requests
    WHERE owner = 'trinodb' AND NOT author_is_bot
)
SELECT
    repo AS "Repository"
  , memory.default.user_link(author) AS "Author"
  , memory.default.link(format('#%d', number), format('https://github.com/%s/%s/pull/%d', owner, repo, number)) AS "First PR"
  , format('%d-%02d-%02d', year(created_at), month(created_at), day(created_at)) AS "Opened"
  , if(draft AND state = 'open', 'draft', state) AS "State"
  , coalesce(memory.default.human_duration(first_response_at - created_at), if(state = 'open', 'none yet', 'none')) AS "First response"
FROM firsts
WHERE rownum = 1 AND created_at >= current_date - INTERVAL '12' MONTH
ORDER BY created_at DESC
LIMIT 30
;

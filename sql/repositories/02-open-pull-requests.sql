-- Open pull requests
-- Pull requests of people that aren't drafts, at most 8 per repository: approved ones first, because they only need a merge, then the ones without any response, oldest first, and then the ones that waited the longest since another person last commented or reviewed. Without commits, it doesn't show whether the author pushed changes since then.
-- Merge or close approved pull requests, answer the ones without a response, and ask the authors of the others whether they still work on them.
WITH
ranked AS (
    SELECT
        *
      , row_number() OVER (
            PARTITION BY repo
            ORDER BY CASE review_state WHEN 'approved' THEN 1 WHEN 'no response' THEN 2 ELSE 3 END, coalesce(last_response_at, created_at)) AS repo_rank
    FROM memory.default.repository_pull_requests
    WHERE state = 'open' AND NOT draft AND NOT author_is_bot
)
SELECT
    repo AS "Repository"
  , format('"#%d"@https://github.com/trinodb/%s/pull/%d ', number, repo, number) AS "PR"
  , if(length(title) > 70, substr(title, 1, 67) || '...', title) AS "Title"
  , memory.default.user_link(author) AS "Author"
  , memory.default.human_duration(current_timestamp - created_at) AS "Open for"
  , review_state AS "Review"
  , coalesce(memory.default.human_duration(current_timestamp - last_response_at), '') AS "Last response"
FROM ranked
WHERE repo_rank <= 8
ORDER BY repo, repo_rank
;

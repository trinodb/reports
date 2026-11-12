-- Issues without an answer
-- Issues of people opened in the last 12 months that are still open and that no other person commented on, at most 8 per repository, oldest first. Older ones are counted in "Activity per repository".
-- An answer, even a question or a label, tells the reporter that someone read it. Close the ones that are fixed or can't be reproduced.
WITH
ranked AS (
    SELECT *, row_number() OVER (PARTITION BY repo ORDER BY created_at) AS repo_rank
    FROM memory.default.repository_issues
    WHERE state = 'open' AND NOT author_is_bot AND first_response_at IS NULL
      AND created_at >= current_date - INTERVAL '12' MONTH
)
SELECT
    repo AS "Repository"
  , format('"#%d"@https://github.com/trinodb/%s/issues/%d ', number, repo, number) AS "Issue"
  , if(length(title) > 80, substr(title, 1, 77) || '...', title) AS "Title"
  , memory.default.user_link(author) AS "Author"
  , memory.default.human_duration(current_timestamp - created_at) AS "Open for"
FROM ranked
WHERE repo_rank <= 8
ORDER BY repo, repo_rank
;

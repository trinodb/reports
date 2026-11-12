-- Waiting on the author for over 4 weeks
-- Pull requests where a reviewer spoke last, the CLA is not signed, or the draft has not changed, for over 4 weeks, oldest first. Ping the author, offer to take the pull request over, or close it.
-- The stale bot closes inactive pull requests by itself, but never those labeled stale-ignore, so most of the oldest ones here are kept open on purpose: decide if they still should be.
SELECT
    memory.default.pr_link(number) AS "Pull request"
  , replace(substr(title, 1, 70), chr(10), ' ') AS "Title"
  , memory.default.user_link(author) AS "Author"
  , CASE triage_state
        WHEN 'author' THEN 'reviewer replied'
        WHEN 'cla' THEN 'CLA not signed'
        WHEN 'draft' THEN 'draft'
    END AS "State"
  , date_diff('day', waiting_since, current_timestamp) AS "Days waiting"
  , if(triage_state = 'author', memory.default.user_link(last_reviewer)) AS "Last reviewer"
  , size AS "Size"
  , CASE WHEN marked_stale THEN 'marked stale' WHEN stale_ignored THEN 'stale-ignore' ELSE '' END AS "Stale bot"
FROM memory.default.open_pull_request_states
WHERE next_actor = 'author'
  AND waiting_since < current_timestamp - INTERVAL '28' DAY
ORDER BY waiting_since
LIMIT 30
;

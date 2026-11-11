-- Waiting on reviewers: pick from the top
-- Pull requests where the next step is a review: nobody reviewed them yet, or the author replied or pushed after the last review. Days waiting count from that reply. Newcomers' first pull requests without a response are listed above.
-- First come authors with fewer than 10 merged pull requests whose pull request the stale bot already marked, because it will close it although the author is not the one who has to act; then their other pull requests; then everyone else's. The longest wait comes first in each group. Pull requests labeled stale-ignore come last.
SELECT
    memory.default.pr_link(number) AS "Pull request"
  , replace(substr(title, 1, 70), chr(10), ' ') AS "Title"
  , memory.default.user_link(author) AS "Author"
  , author_cohort AS "Author has"
  , date_diff('day', waiting_since, current_timestamp) AS "Days waiting"
  , if(triage_state = 'no response', 'no response yet', 'author replied') AS "State"
  , size AS "Size"
  , array_join(requested_reviewers, ', ') AS "Requested reviewers"
  , if(cardinality(area_labels) > 3, format('%d areas', cardinality(area_labels)), array_join(area_labels, ', ')) AS "Areas"
  , CASE WHEN marked_stale THEN 'marked stale' WHEN stale_ignored THEN 'stale-ignore' ELSE '' END AS "Stale bot"
FROM memory.default.open_pull_request_states
WHERE triage_state = 'reviewers'
   OR (triage_state = 'no response' AND author_cohort_rank > 1)
ORDER BY
    CASE
        WHEN stale_ignored THEN 4
        WHEN author_cohort_rank <= 2 AND marked_stale THEN 1
        WHEN author_cohort_rank <= 2 THEN 2
        ELSE 3
    END
  , waiting_since
LIMIT 30
;

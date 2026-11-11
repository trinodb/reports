-- First pull requests without any response
-- Pull requests of people with no merged pull request yet, with a signed CLA, that no one who reviews in this project has commented on or reviewed. Newcomers whose first pull request gets no response open another one less often than those who get one, so reply here first, even if only to say who will review it.
-- Marked stale: the stale bot closes it 21 days after marking it, unless someone acts.
SELECT
    memory.default.pr_link(number) AS "Pull request"
  , replace(substr(title, 1, 70), chr(10), ' ') AS "Title"
  , memory.default.user_link(author) AS "Author"
  , date_diff('day', waiting_since, current_timestamp) AS "Days waiting"
  , size AS "Size"
  , if(cardinality(area_labels) > 3, format('%d areas', cardinality(area_labels)), array_join(area_labels, ', ')) AS "Areas"
  , array_join(requested_reviewers, ', ') AS "Requested reviewers"
  , if(marked_stale, 'marked stale', '') AS "Stale bot"
FROM memory.default.open_pull_request_states
WHERE triage_state = 'no response' AND author_cohort_rank = 1
ORDER BY waiting_since
;

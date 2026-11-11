-- Approved, not merged
-- Pull requests whose last verdict is an approval, where only the approvers spoke after it. Those approved by a maintainer come first, then the oldest approval. If a maintainer approved, merge it or say what is missing; if not, a maintainer has to review it.
-- Check that the author answered all comments and that CI passed. Bots' pull requests are not included.
SELECT
    memory.default.pr_link(number) AS "Pull request"
  , replace(substr(title, 1, 70), chr(10), ' ') AS "Title"
  , memory.default.user_link(author) AS "Author"
  , date_diff('day', waiting_since, current_timestamp) AS "Days since approval"
  , if(cardinality(maintainer_approvers) > 0, array_join(maintainer_approvers, ', '), 'none') AS "Approved by maintainers"
  , array_join(filter(approvers, a -> NOT contains(maintainer_approvers, a)), ', ') AS "Approved by others"
  , if(author_acted_at > reviewer_acted_at, 'author', 'reviewer') AS "Acted last"
  , size AS "Size"
  , if(cardinality(area_labels) > 3, format('%d areas', cardinality(area_labels)), array_join(area_labels, ', ')) AS "Areas"
  , CASE WHEN marked_stale THEN 'marked stale' WHEN stale_ignored THEN 'stale-ignore' ELSE '' END AS "Stale bot"
FROM memory.default.open_pull_request_states
WHERE triage_state = 'approved'
ORDER BY cardinality(maintainer_approvers) = 0, waiting_since
;

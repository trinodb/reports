-- Review requests and review load per person
-- Open, non-draft pull requests that request a review from each person, and how many pull requests they reviewed in the last 90 days. Waiting on you counts the requests where the next step is a review; find yours, and if someone has many more requests than reviews, ask others to take some over.
-- GitHub drops a request once the person reviews, so old requests mean nobody answered them. Team requests are not counted. All maintainers are listed, and others with open requests.
WITH
requests AS (
    SELECT
        r.login
      , count(*) AS requests
      , count(*) FILTER (WHERE s.next_actor != 'author') AS waiting_on_review
      , max(date_diff('day', s.waiting_since, current_timestamp)) FILTER (WHERE s.next_actor != 'author') AS longest_wait
    FROM memory.default.open_pull_request_states s
    CROSS JOIN unnest(s.requested_reviewers) AS r(login)
    WHERE NOT s.draft
    GROUP BY r.login
)
, reviewed AS (
    SELECT
        actor AS login
      , count(DISTINCT number) FILTER (WHERE event_at >= current_timestamp - INTERVAL '90' DAY) AS reviewed_prs
      , count(DISTINCT number) FILTER (WHERE event_at < current_timestamp - INTERVAL '90' DAY) AS reviewed_prs_before
    FROM memory.default.pull_request_events
    WHERE kind = 'review' AND NOT by_author AND NOT by_bot
      AND event_at >= current_timestamp - INTERVAL '180' DAY
    GROUP BY actor
)
, people AS (
    SELECT login FROM requests
    UNION
    SELECT login FROM memory.default.contributors WHERE role = 'maintainer'
)
SELECT
    memory.default.user_link(p.login) AS "Reviewer"
  , coalesce(c.role, 'newcomer') AS "Role"
  , coalesce(q.waiting_on_review, 0) AS "Waiting on you"
  , coalesce(q.requests, 0) AS "All open requests"
  , q.longest_wait AS "Longest wait in days"
  , coalesce(r.reviewed_prs, 0) AS "Reviewed PRs, last 90 days"
  , memory.default.delta(coalesce(r.reviewed_prs, 0), r.reviewed_prs_before) AS "Change"
  , memory.default.hbar(coalesce(r.reviewed_prs, 0), max(r.reviewed_prs) OVER (), 20) AS "Reviewed PRs"
FROM people p
LEFT JOIN requests q ON q.login = p.login
LEFT JOIN reviewed r ON r.login = p.login
LEFT JOIN memory.default.contributors c ON c.login = p.login
WHERE NOT memory.default.is_bot(p.login)
ORDER BY coalesce(q.waiting_on_review, 0) DESC, coalesce(r.reviewed_prs, 0) DESC, p.login
LIMIT 30
;

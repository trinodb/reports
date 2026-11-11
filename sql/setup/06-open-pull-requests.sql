
-- this is not a report, just a setup
-- one row for every open pull request, with who has to act next and since when, so that all reports of the
-- maintaining page put a pull request in the same state

DROP TABLE IF EXISTS memory.default.open_pull_request_states;

CREATE TABLE memory.default.open_pull_request_states AS
WITH
open_prs AS (
    SELECT *
    FROM memory.default.pull_requests
    WHERE state = 'open' AND NOT author_is_bot
)
, events AS (
    SELECT
        e.*
      -- comments of users who never reviewed anything, like "+1" or "any news?", don't move a pull request forward
      , NOT e.by_author AND NOT e.by_bot AND coalesce(c.reviews, 0) > 0 AS by_reviewer
    FROM memory.default.pull_request_events e
    JOIN open_prs p ON p.number = e.number
    LEFT JOIN memory.default.contributors c ON c.login = e.actor
)
, last_events AS (
    SELECT
        number
      , max(event_at) FILTER (WHERE by_author) AS last_author_event_at
      , max(event_at) FILTER (WHERE by_reviewer) AS last_reviewer_event_at
      , max_by(actor, event_at) FILTER (WHERE by_reviewer) AS last_reviewer
      , max_by(detail, event_at) FILTER (WHERE by_reviewer AND kind = 'review' AND detail IN ('APPROVED', 'CHANGES_REQUESTED', 'DISMISSED')) AS last_verdict
      , max(event_at) FILTER (WHERE by_reviewer AND kind = 'review' AND detail = 'APPROVED') AS last_approved_at
      , coalesce(array_distinct(array_agg(actor) FILTER (WHERE by_reviewer AND kind = 'review' AND detail = 'APPROVED')), ARRAY[]) AS approvers
    FROM events
    GROUP BY number
)
, turns AS (
    -- when the current turn started: the first event of the side that acted last, after the other side last acted
    SELECT
        e.number
      , min(e.event_at) FILTER (WHERE e.by_author AND e.event_at > coalesce(l.last_reviewer_event_at, TIMESTAMP '1970-01-01')) AS reviewers_turn_started_at
      , min(e.event_at) FILTER (WHERE e.by_reviewer AND e.event_at > coalesce(l.last_author_event_at, TIMESTAMP '1970-01-01')) AS author_turn_started_at
    FROM events e
    JOIN last_events l ON l.number = e.number
    GROUP BY e.number
)
, classified AS (
    SELECT
        p.*
      , l.last_author_event_at AS author_acted_at
      , l.last_reviewer_event_at AS reviewer_acted_at
      , l.last_reviewer
      , l.approvers AS current_approvers
      , filter(l.approvers, a -> contains(m.maintainers, a)) AS maintainer_approvers
      , contains(p.labels, 'cla-signed') AS cla_signed
      , contains(p.labels, 'stale') AS marked_stale
      , contains(p.labels, 'stale-ignore') AS stale_ignored
      , CASE
            WHEN p.draft THEN 'draft'
            -- no pull request without a signed CLA gets merged, so the author has to act first
            WHEN NOT contains(p.labels, 'cla-signed') THEN 'cla'
            -- an approval stands until someone other than an approver speaks after it
            WHEN l.last_verdict = 'APPROVED'
                AND (l.last_author_event_at >= l.last_reviewer_event_at OR contains(l.approvers, l.last_reviewer)) THEN 'approved'
            WHEN l.last_reviewer_event_at IS NULL THEN 'no response'
            WHEN l.last_reviewer_event_at > l.last_author_event_at THEN 'author'
            ELSE 'reviewers'
        END AS triage_state
      , l.last_approved_at
      , t.reviewers_turn_started_at
      , t.author_turn_started_at
    FROM open_prs p
    JOIN last_events l ON l.number = p.number
    JOIN turns t ON t.number = p.number
    CROSS JOIN (SELECT array_agg(login) AS maintainers FROM memory.default.contributors WHERE role = 'maintainer') m
)
SELECT
    number
  , title
  , author
  , author_cohort
  , author_cohort_rank
  , draft
  , created_at
  , size
  , size_rank
  , changed_lines
  , area_labels
  , requested_reviewers
  , current_approvers AS approvers
  , maintainer_approvers
  , cla_signed
  , marked_stale
  -- labeled stale-ignore, which the stale bot never closes
  , stale_ignored
  , triage_state
  -- the order in which the states are listed, the ones that need a maintainer first
  , CASE triage_state
        WHEN 'approved' THEN 1
        WHEN 'no response' THEN 2
        WHEN 'reviewers' THEN 3
        WHEN 'author' THEN 4
        WHEN 'cla' THEN 5
        WHEN 'draft' THEN 6
    END AS triage_rank
  , CASE triage_state
        WHEN 'approved' THEN 'Approved, not merged'
        WHEN 'no response' THEN 'No response yet'
        WHEN 'reviewers' THEN 'Author replied, waiting on reviewers'
        WHEN 'author' THEN 'Reviewer replied, waiting on the author'
        WHEN 'cla' THEN 'CLA not signed'
        WHEN 'draft' THEN 'Draft'
    END AS triage_label
  , CASE
        WHEN triage_state = 'approved' THEN 'maintainers'
        WHEN triage_state IN ('no response', 'reviewers') THEN 'reviewers'
        ELSE 'author'
    END AS next_actor
  -- since when the pull request is in its current state
  , CASE triage_state
        WHEN 'approved' THEN last_approved_at
        WHEN 'no response' THEN created_at
        WHEN 'reviewers' THEN reviewers_turn_started_at
        WHEN 'author' THEN author_turn_started_at
        WHEN 'cla' THEN created_at
        WHEN 'draft' THEN coalesce(author_acted_at, created_at)
    END AS waiting_since
  , author_acted_at
  , reviewer_acted_at
  , last_reviewer
FROM classified;

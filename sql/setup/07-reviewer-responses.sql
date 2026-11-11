
-- this is not a report, just a setup
-- one row for every update of an author in the last 13 months that got a response from a reviewer, with how long it took,
-- so that the reports of the maintaining page measure the response time the same way

DROP TABLE IF EXISTS memory.default.reviewer_responses;

CREATE TABLE memory.default.reviewer_responses AS
WITH
prs AS (
    SELECT number, merged_at
    FROM memory.default.pull_requests
    WHERE NOT author_is_bot AND NOT draft
      AND coalesce(last_event_at, created_at) >= current_date - INTERVAL '13' MONTH
)
, events AS (
    SELECT e.number, e.event_at, e.by_author AS is_author
    FROM memory.default.pull_request_events e
    JOIN prs p ON p.number = e.number
    LEFT JOIN memory.default.contributors c ON c.login = e.actor
    -- comments of users who never reviewed anything, like "+1", are not a response
    WHERE NOT e.by_bot AND (e.by_author OR coalesce(c.reviews, 0) > 0)
    UNION ALL
    -- merging is a response too
    SELECT number, merged_at, false
    FROM prs
    WHERE merged_at IS NOT NULL
)
SELECT
    number
  -- the first of the author's events (opening, pushes, replies) since the last response
  , waiting_since
  , responded_at
  , to_milliseconds(responded_at - waiting_since) / 1000e0 AS response_seconds
FROM events MATCH_RECOGNIZE (
    PARTITION BY number
    ORDER BY event_at, is_author DESC
    MEASURES
        first(A.event_at) AS waiting_since
      , first(B.event_at) AS responded_at
    ONE ROW PER MATCH
    PATTERN (A+ B+)
    DEFINE
        A AS is_author
      , B AS NOT is_author
);

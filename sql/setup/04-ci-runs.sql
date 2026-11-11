
-- this is not a report, just a setup
-- workflow runs from the last year, one row per run, because the runs table has a row for every attempt,
-- and with what triggered them, because merges are tested in the merge queue, not on master

DROP TABLE IF EXISTS memory.default.ci_runs;

CREATE TABLE memory.default.ci_runs AS
WITH
attempts AS (
    SELECT *, row_number() OVER (PARTITION BY id ORDER BY run_attempt DESC) AS rownum
    FROM runs
    WHERE owner = 'trinodb' AND repo = 'trino' AND created_at >= current_date - interval '1' year
)
, fail_fast_cancelled AS (
    -- in the merge queue, a failing job starts the "Cancel merge queue workflow" workflow on the same commit,
    -- which cancels the rest of the run to save runners, so most runs that fail there end as cancelled
    SELECT DISTINCT head_sha
    FROM runs
    WHERE owner = 'trinodb' AND repo = 'trino' AND created_at >= current_date - interval '1' year
      AND name = 'Cancel merge queue workflow'
)
SELECT
    id
  , name AS workflow
  , event
  -- merge queue, pull request, scheduled, or other (pushes and manual runs)
  , CASE
        WHEN event = 'merge_group' THEN 'merge queue'
        WHEN event IN ('pull_request', 'pull_request_target') THEN 'pull request'
        WHEN event = 'schedule' THEN 'scheduled'
        ELSE 'other'
    END AS trigger
  , head_branch
  , a.head_sha
  , pull_request_numbers
  -- the number of the last attempt, so over 1 for runs that were run again
  , run_attempt
  -- of the last attempt: success, failure, cancelled, skipped
  , conclusion
  -- passed, failed, or cancelled; a merge queue run cancelled because one of its jobs failed counts as failed,
  -- and other cancelled runs, like ones replaced by a newer push or removed from the queue, stay cancelled
  , CASE
        WHEN conclusion = 'success' THEN 'passed'
        WHEN conclusion IN ('failure', 'timed_out', 'startup_failure') THEN 'failed'
        WHEN conclusion = 'cancelled' AND event = 'merge_group' AND f.head_sha IS NOT NULL THEN 'failed'
        WHEN conclusion = 'cancelled' THEN 'cancelled'
    END AS outcome
  , created_at
  -- when the last attempt started, and when it finished
  , run_started_at
  , updated_at
  , actor_login
FROM attempts a
LEFT JOIN fail_fast_cancelled f ON f.head_sha = a.head_sha
WHERE rownum = 1;

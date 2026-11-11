-- Merge queue outcomes per week
-- Every pull request is tested again in the merge queue before it is merged. In the bar, █ passed, ▒ failed, ░ cancelled. When a job fails, the merge queue cancels the rest of the run to save runners, so these runs count as failed. A run is cancelled without a failure when its queue entry is removed or rebuilt, for example because an entry ahead of it failed.
-- A low success rate means that pull requests that passed their own checks fail after they are combined with master: look for flaky tests in "Which jobs fail in the merge queue and nightly runs". The newest week is not complete.
WITH
weekly AS (
    SELECT
        date_trunc('week', CAST(created_at AS date)) AS week
      , count(*) AS runs
      , count(*) FILTER (WHERE outcome = 'passed') AS passed
      , count(*) FILTER (WHERE outcome = 'failed') AS failed
      , count(*) FILTER (WHERE outcome = 'cancelled') AS cancelled
    FROM memory.default.ci_runs
    WHERE workflow = 'ci'
    AND trigger = 'merge queue'
    AND created_at >= date_trunc('week', current_date) - INTERVAL '84' DAY
    AND created_at < current_timestamp
    GROUP BY 1
)
SELECT
    week AS "Week"
  , runs AS "Runs"
  , passed AS "Passed"
  , failed AS "Failed"
  , cancelled AS "Cancelled"
  , format('%.0f%%', 100e0 * passed / nullif(passed + failed, 0)) AS "Success rate"
  , memory.default.stacked(ARRAY[passed * 1e0, failed * 1e0, cancelled * 1e0], '█▒░', 40) AS "Passed, failed, cancelled chart"
FROM weekly
ORDER BY week DESC
;

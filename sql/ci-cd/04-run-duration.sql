-- How long a CI run takes
-- Time from the start of a `ci` run until its result, for runs that passed on the first attempt, so it is how long you wait for a green build. In the bars, █ is the median and ░ reaches the P90 (one run in ten takes longer).
-- A pull request is tested twice: once on its own, and again in the merge queue before it is merged. The newest week is not complete.
WITH
durations AS (
    SELECT
        date_trunc('week', CAST(created_at AS date)) AS week
      , trigger
      , to_milliseconds(updated_at - created_at) / 1000e0 AS seconds
    FROM memory.default.ci_runs
    WHERE workflow = 'ci'
    AND trigger IN ('merge queue', 'pull request')
    AND conclusion = 'success'
    AND run_attempt = 1
    AND created_at >= date_trunc('week', current_date) - INTERVAL '84' DAY
    AND created_at < current_timestamp
)
, weekly AS (
    SELECT
        week
      , count(*) FILTER (WHERE trigger = 'pull request') AS pr_runs
      , approx_percentile(seconds, 0.5) FILTER (WHERE trigger = 'pull request') AS pr_median
      , approx_percentile(seconds, 0.9) FILTER (WHERE trigger = 'pull request') AS pr_p90
      , count(*) FILTER (WHERE trigger = 'merge queue') AS mq_runs
      , approx_percentile(seconds, 0.5) FILTER (WHERE trigger = 'merge queue') AS mq_median
      , approx_percentile(seconds, 0.9) FILTER (WHERE trigger = 'merge queue') AS mq_p90
    FROM durations
    GROUP BY 1
)
, scaled AS (
    SELECT
        *
      , greatest(max(pr_p90) OVER (), max(mq_p90) OVER ()) AS max_seconds
    FROM weekly
)
SELECT
    week AS "Week"
  , pr_runs AS "PR runs"
  , memory.default.human_duration(pr_median) AS "PR median"
  , memory.default.human_duration(pr_p90) AS "PR P90"
  , rpad(memory.default.hbar(pr_median, max_seconds, 24), CAST(round(24 * pr_p90 / max_seconds) AS integer), '░') AS "Pull request chart"
  , mq_runs AS "Queue runs"
  , memory.default.human_duration(mq_median) AS "Queue median"
  , memory.default.human_duration(mq_p90) AS "Queue P90"
  , rpad(memory.default.hbar(mq_median, max_seconds, 24), CAST(round(24 * mq_p90 / max_seconds) AS integer), '░') AS "Merge queue chart"
FROM scaled
ORDER BY week DESC
;

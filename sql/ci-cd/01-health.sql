-- CI health at a glance
-- How often the `ci` workflow passes, by what started it. The pass rate is passed / (passed + failed) runs, for the last 7 days, the 7 days before, and the last 30 days. In the merge queue, a failing job cancels the rest of the run, so such runs count as failed; other cancelled runs (superseded or removed from the queue) are not counted.
-- A merge queue or nightly run that fails points to a broken or flaky test on master, not to an unfinished change: see "Which jobs fail in the merge queue and nightly runs" below. One character of the chart is one day; a dot is a day where every run failed.
WITH
ci_runs AS (
    SELECT
        trigger
      , CAST(created_at AS date) AS day
      , run_attempt
      , coalesce(outcome = 'cancelled', false) AS cancelled
      , CASE outcome WHEN 'passed' THEN 1 WHEN 'failed' THEN 0 END AS passed
    FROM memory.default.ci_runs
    WHERE workflow = 'ci'
    AND trigger IN ('merge queue', 'pull request', 'scheduled')
    AND created_at >= current_date - INTERVAL '29' DAY
    AND created_at < current_timestamp
)
, daily AS (
    SELECT
        t.trigger
      , d.day
      , avg(r.passed) AS success_rate
    FROM unnest(ARRAY['merge queue', 'pull request', 'scheduled']) AS t(trigger)
    CROSS JOIN unnest(sequence(current_date - INTERVAL '29' DAY, current_date)) AS d(day)
    LEFT JOIN ci_runs r ON r.trigger = t.trigger AND r.day = d.day
    GROUP BY 1, 2
)
, periods AS (
    SELECT
        trigger
      , count(*) FILTER (WHERE day > current_date - INTERVAL '7' DAY) AS runs
      , count(*) FILTER (WHERE day <= current_date - INTERVAL '7' DAY AND day > current_date - INTERVAL '14' DAY) AS previous_runs
      , avg(passed) FILTER (WHERE day > current_date - INTERVAL '7' DAY) AS success_rate
      , avg(passed) FILTER (WHERE day <= current_date - INTERVAL '7' DAY AND day > current_date - INTERVAL '14' DAY) AS previous_success_rate
      , avg(passed) AS month_success_rate
      , avg(CAST(cancelled AS integer)) FILTER (WHERE day > current_date - INTERVAL '7' DAY) AS cancelled_share
      , avg(IF(run_attempt > 1, 1, 0)) FILTER (WHERE day > current_date - INTERVAL '7' DAY) AS rerun_share
    FROM ci_runs
    GROUP BY 1
)
SELECT
    p.trigger AS "Started by"
  , p.runs AS "Runs, 7 days"
  , memory.default.delta(p.runs, p.previous_runs) AS "Change"
  , format('%.0f%%', 100 * p.success_rate) AS "Passed, 7 days"
  , format('%.0f%%', 100 * p.previous_success_rate) AS "Previous 7 days"
  , format('%.0f%%', 100 * p.month_success_rate) AS "30 days"
  , format('%.0f%%', 100 * p.cancelled_share) AS "Cancelled"
  , format('%.0f%%', 100 * p.rerun_share) AS "Re-run"
  , memory.default.sparkline(array_agg(d.success_rate ORDER BY d.day), 1e0) AS "Passed per day, 30 days chart"
FROM periods p
JOIN daily d ON d.trigger = p.trigger
GROUP BY 1, 2, 3, 4, 5, 6, 7, 8
ORDER BY CASE p.trigger WHEN 'merge queue' THEN 1 WHEN 'pull request' THEN 2 ELSE 3 END
;

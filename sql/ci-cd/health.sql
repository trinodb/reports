-- CI workflow health
-- Percentage of successful runs of the `ci` workflow on the master branch.
WITH FUNCTION vertical_bar(value DOUBLE, day DATE)
    RETURNS VARCHAR
    DETERMINISTIC
    RETURN CASE
        -- for weekends, if missing or zero, grey it out
        WHEN value = 0 AND day_of_week(day) IN (6,7) THEN '░'
        -- map [0.0, 1.0] to [1, 9]
        ELSE ARRAY[' ', '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█'][cast(value * 8 + 1 as int)]
END
WITH
runs AS (
  SELECT
      date(created_at) AS created_at
    , conclusion
    , count(*) AS num_runs
    , count(*) FILTER (WHERE conclusion = 'success') AS num_success
  FROM runs
  WHERE owner = 'trinodb' AND repo = 'trino' AND name = 'ci'
  AND head_branch = 'master' AND event != 'pull_request' AND status = 'completed'
  AND created_at >= CURRENT_DATE - INTERVAL '7' DAY
  GROUP BY date(created_at), conclusion
)
, days AS (
    SELECT seq.day
    FROM (SELECT min(created_at) AS first_day , max(created_at) AS last_day FROM runs) range
    CROSS JOIN UNNEST (sequence(range.first_day, range.last_day)) seq(day)
)
, daily AS (
  SELECT
      created_at
    , conclusion
    , num_runs
    , num_success
    , 1e0 * num_success / num_runs AS ratio
  FROM days
  LEFT JOIN runs ON runs.created_at = days.day
)
, summary AS (
  SELECT
      sum(num_runs) AS num_runs
    , sum(num_success) AS num_success
    , 1e0 * sum(num_success) / sum(num_runs) AS ratio
    , array_join(array_agg(vertical_bar(coalesce(ratio, 0), created_at) ORDER BY created_at DESC), '') AS chart
  FROM daily
)
, latest AS (
  SELECT
      num_runs
    , num_success
    , 1e0 * num_success / num_runs AS ratio
  FROM runs
  ORDER BY created_at DESC
  LIMIT 1
)
SELECT
    format('%.1f%% (%d/%d)', 100e0 * latest.ratio, latest.num_success, latest.num_runs) AS "Today"
  , format('%.1f%% (%d/%d)', 100e0 * summary.ratio, summary.num_success, summary.num_runs) AS "Weekly"
  , summary.chart AS "Daily (desc)"
FROM summary
CROSS JOIN latest
;

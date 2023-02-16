-- Job duration in last 30 days
-- The Duration ratio chart shows the ratio of the sum of duration of all runs of a job to the sum of all jobs.
-- In the Daily avg duration chart column, days are shown from latest to oldest and greyed parts are weekends.
WITH
job_duration AS (
  SELECT
    run_id
    , name
    , conclusion
    , CAST(started_at AS date) AS started_at_date
    , date_diff('minute', started_at, completed_at) AS duration_minutes
  FROM jobs
  WHERE owner = 'trinodb' AND repo = 'trino'
  AND started_at > CURRENT_DATE - INTERVAL '30' DAY AND status = 'completed'
)
, main AS (
  SELECT
    r.name AS workflow_name
    , j.name AS job_name
    , count(1) AS invocations
    , count(1) FILTER (WHERE j.conclusion = 'success') / CAST(count(1) AS double) AS success_ratio
    , sum(duration_minutes) FILTER (WHERE j.conclusion = 'success') AS sum_minutes
    , min(duration_minutes) FILTER (WHERE j.conclusion = 'success') AS min_minutes
    , max(duration_minutes) FILTER (WHERE j.conclusion = 'success') AS max_minutes
    , avg(duration_minutes) FILTER (WHERE j.conclusion = 'success') AS avg_minutes
    , approx_percentile(duration_minutes, ARRAY[0.5, 0.75, 0.9, 0.99]) AS perc
  FROM job_duration j
  JOIN runs r ON r.id = j.run_id
  GROUP BY 1, 2
  HAVING count(1) > 100
)
, daily_avg AS (
  SELECT
    dates.date
    , r.name AS workflow_name
    , j.name AS job_name
    , avg(duration_minutes) FILTER (WHERE j.conclusion = 'success') AS avg_minutes
  FROM unnest(sequence(CURRENT_DATE - INTERVAL '90' DAY, CURRENT_DATE)) AS dates(date)
  CROSS JOIN (SELECT DISTINCT run_id, name FROM job_duration) AS all_jobs
  LEFT JOIN job_duration j ON (j.run_id, j.name, j.started_at_date) = (all_jobs.run_id, all_jobs.name, dates.date)
  JOIN runs r ON r.id = j.run_id
  GROUP BY 1, 2, 3
)
, daily_norm AS (
  SELECT
    date
    , workflow_name
    , job_name
    -- normalize to [0.0, 1.0]
    , avg_minutes / CAST(max(avg_minutes) OVER (PARTITION BY workflow_name, job_name) AS double) AS avg_minutes_norm
  FROM daily_avg
)
, daily_chart AS (
  SELECT
    workflow_name
    , job_name
    , array_join(array_agg(CASE
          -- for weekends, if missing or zero, grey it out
          WHEN coalesce(avg_minutes_norm, 0) = 0 AND day_of_week(date) IN (6,7) THEN '░'
          -- map [0.0, 1.0] to [1, 9]
        ELSE ARRAY[' ', '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█'][cast(coalesce(case when is_nan(avg_minutes_norm) then null else avg_minutes_norm end, 0) * 8 + 1 as int)] END
      ORDER BY date DESC
      ), '') AS chart
  FROM daily_norm
  GROUP BY 1, 2
)
SELECT
    m.workflow_name AS "Workflow name"
    , case when length(m.job_name) > 60 then substr(m.job_name, 1, 30) || ' ... ' || substr(m.job_name, length(m.job_name) - 25) else m.job_name end AS "Job name"
    , bar(sum_minutes / CAST(max(sum_minutes) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Duration ratio chart"
    , c.chart AS "Daily avg duration chart"
    , bar(success_ratio, 20) AS "Success ratio chart"
    , invocations AS "Invocations"
    , round(success_ratio, 2) AS "Success ratio"
    , round(sum_minutes / CAST(max(sum_minutes) OVER () AS double), 2) AS "Duration ratio"
    , perc AS "Percentiles 50, 75, 90, 99"
    , min_minutes AS "Min minutes"
    , round(avg_minutes, 2) AS "Avg minutes"
    , max_minutes AS "Max minutes"
FROM main m
LEFT JOIN daily_chart c ON (c.workflow_name, c.job_name) = (m.workflow_name, m.job_name)
ORDER BY m.workflow_name, m.job_name
;

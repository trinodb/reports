WITH job_duration AS (
  SELECT
    run_id
    , name
    , conclusion
    , date_diff('minute', started_at, completed_at) AS duration_minutes
  FROM jobs
  WHERE started_at > CURRENT_DATE - INTERVAL '30' DAY AND status = 'completed'
),
main AS (
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
  ORDER BY 1, 2
)
SELECT
    workflow_name AS "Workflow name"
    , job_name AS "Job name"
    , bar(sum_minutes / CAST(max(sum_minutes) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Duration ratio chart"
    , bar(success_ratio, 20) AS "Success ratio chart"
    , invocations AS "Invocations"
    , round(success_ratio, 2) AS "Success ratio"
    , round(sum_minutes / CAST(max(sum_minutes) OVER () AS double), 2) AS "Duration ratio"
    , perc AS "Percentiles 50, 75, 90, 99"
    , min_minutes AS "Min minutes"
    , round(avg_minutes, 2) AS "Avg minutes"
    , max_minutes AS "Max minutes"
FROM main;

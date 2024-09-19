-- Flaky tests
-- Most failing tests on master branch in last 7 days.
WITH all_cases AS (
  SELECT
      suite_name
    , class_name
    , test_name
    -- case metrics
    , count(*) AS num_test_runs
    , count(*) FILTER (WHERE failure IS NULL AND skipped IS NULL) AS num_success_runs
    , count(*) FILTER (WHERE failure IS NOT NULL) AS num_failed_runs
    , count(*) FILTER (WHERE skipped IS NOT NULL) AS num_skipped_runs
    , avg(test_time) FILTER (WHERE failure IS NULL AND skipped IS NULL) AS avg_test_time
    , parse_duration(cast(
        cast(stddev(to_milliseconds(test_time)) FILTER (WHERE failure IS NULL AND skipped IS NULL) AS bigint)
      AS varchar) || 'ms') AS stddev_test_time
    --, min(test_time) FILTER (WHERE failure IS NULL AND skipped IS NULL) AS min_test_time
    --, max(test_time) FILTER (WHERE failure IS NULL AND skipped IS NULL) AS max_test_time
    -- suite metrics
    --, max(ignored) as num_ignored
    --, max(failures) as num_failures
    --, max(tests) as num_tests
    --, max(errors) as num_errors
    --, max(num_skipped) as num_skipped
    --, max(suite_time) as suite_time
    -- extra dimensions
    , count(DISTINCT workflow_run) AS num_runs
    --, min(job_timestamp) AS min_job_timestamp
    --, max(job_timestamp) AS max_job_timestamp
    --, array_agg(DISTINCT branch ORDER BY branch) AS branches
  FROM reports
  WHERE 1=1
    AND repo = 'trino'
    AND branch = 'master'
    AND date_created > current_date - interval '7' day
    AND workflow_conclusion = 'failure'
    -- having tests = 0 might also indicate issues with the whole test class,
    -- exclude these to avoid having zero times lower the avg
    AND tests != 0
    -- skip ignored tests
    AND COALESCE(test_time, INTERVAL '0' SECOND) != INTERVAL '0' SECOND
  GROUP BY suite_name, class_name, test_name
)
SELECT *
FROM all_cases
ORDER BY num_runs DESC, suite_name, class_name, test_name
LIMIT 10
;

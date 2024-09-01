-- Recently failing jobs
-- Lists failed jobs on master branch in last 24h
WITH
recent_master_runs AS (
  SELECT
      id
    , check_suite_id
    , format('<https://github.com/trinodb/trino/actions/runs/%d|%d>', id, run_number) AS details_link
    , conclusion
  FROM runs
  WHERE owner = 'trinodb' AND repo = 'trino' AND name = 'ci'
  -- do not include pull requests, to filter out PR runs from master branch in forks
  AND head_branch = 'master' AND event != 'pull_request' AND status = 'completed'
  AND created_at > now() - interval '1' day
)
, failed_recent_master_runs AS (
  SELECT
      id
    , check_suite_id
    , details_link
  FROM recent_master_runs
  WHERE conclusion != 'success'
)
, failed_jobs AS (
  SELECT
      jobs.name
    , count(DISTINCT runs.id) AS num_failed_runs
    , array_agg(DISTINCT runs.details_link ORDER BY runs.details_link) AS failed_runs
  FROM failed_recent_master_runs runs
  JOIN check_runs jobs ON jobs.check_suite_id = runs.check_suite_id AND jobs.conclusion NOT IN ('success', 'skipped')
  GROUP BY jobs.name
)

SELECT
  format(
    '• %s - %.1f%% (%d/%d)%n    %s'
    , name
    , 100e0 * num_failed_runs / (SELECT count(*) FROM recent_master_runs)
    , num_failed_runs
    , (SELECT count(*) FROM recent_master_runs)
    , array_join(failed_runs, ', ')
  ) AS "Jobs"
FROM failed_jobs
ORDER BY num_failed_runs DESC, name
;

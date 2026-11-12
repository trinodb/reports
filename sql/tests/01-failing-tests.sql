-- Tests failing in the merge queue and nightly runs
-- Tests that failed at least twice in the last 30 days in the merge queue or the nightly run, after the code passed its own checks, so they are broken or flaky. Fix the top rows first.
-- Failed runs is of the runs of the test's job, one chart character is one day (oldest on the left, a dot for none), In PRs counts pull request branches with the same failure, and Last links to the latest one.
WITH
master_runs AS (
    SELECT id
    FROM memory.default.ci_runs
    WHERE workflow = 'ci'
    AND trigger IN ('merge queue', 'scheduled')
    AND created_at >= current_date - INTERVAL '30' DAY
)
, pull_request_runs AS (
    SELECT id, head_branch
    FROM memory.default.ci_runs
    WHERE workflow = 'ci'
    AND trigger = 'pull request'
    AND created_at >= current_date - INTERVAL '30' DAY
)
, master_jobs AS (
    SELECT j.id, j.run_id, j.name, j.conclusion, j.started_at
    FROM jobs j
    JOIN master_runs r ON r.id = j.run_id
    WHERE j.started_at >= current_date - INTERVAL '29' DAY
    AND j.conclusion IN ('success', 'failure')
)
, test_failures AS (
    SELECT
        j.run_id
      , j.id AS job_id
      , j.name AS job_name
      , j.started_at
      -- parameterized and repeated tests end with (arguments) and [invocation], product tests with [groups: ...],
      -- and a failure of the whole class, like in its setup, has no method name
      , regexp_replace(regexp_replace(regexp_replace(a.title, ' \[groups: .*\]$', ''), '(\(.*\))?(\[\d+\])?$', ''), '\.$', ' (whole class)') AS test
    FROM master_jobs j
    JOIN check_run_annotations a ON a.check_run_id = j.id
    WHERE j.conclusion = 'failure'
    AND a.annotation_level = 'failure'
    AND a.title <> ''
    AND a.path NOT LIKE '.github%'
)
, pull_request_failures AS (
    SELECT
        regexp_replace(regexp_replace(regexp_replace(a.title, ' \[groups: .*\]$', ''), '(\(.*\))?(\[\d+\])?$', ''), '\.$', ' (whole class)') AS test
      -- runs of pull requests from forks have no pull request number, so count branches; two forks can use the same branch name
      , count(DISTINCT r.head_branch) AS branches
    FROM jobs j
    JOIN pull_request_runs r ON r.id = j.run_id
    JOIN check_run_annotations a ON a.check_run_id = j.id
    WHERE j.started_at >= current_date - INTERVAL '29' DAY
    AND j.conclusion = 'failure'
    AND a.annotation_level = 'failure'
    AND a.title <> ''
    AND a.path NOT LIKE '.github%'
    GROUP BY 1
)
, job_runs AS (
    SELECT name AS job_name, count(DISTINCT run_id) AS runs
    FROM master_jobs
    GROUP BY name
)
, tests AS (
    SELECT
        test
      , count(DISTINCT run_id) AS failed_runs
      -- a test can run in more than one job; count the runs of the job of the latest failure
      , max_by(job_name, started_at) AS job_name
      , min(started_at) AS first_failed_at
      , max(started_at) AS last_failed_at
      , max_by(format('https://github.com/trinodb/trino/actions/runs/%d/job/%d', run_id, job_id), started_at) AS latest_url
    FROM test_failures
    GROUP BY test
    HAVING count(DISTINCT run_id) >= 2
)
, daily AS (
    SELECT t.test, d.day, count(DISTINCT f.run_id) AS failed_runs
    FROM tests t
    CROSS JOIN UNNEST(sequence(current_date - INTERVAL '29' DAY, current_date, INTERVAL '1' DAY)) AS d(day)
    LEFT JOIN test_failures f ON f.test = t.test AND CAST(f.started_at AS date) = d.day
    GROUP BY t.test, d.day
)
SELECT
    -- shorten the class name, because tests of one class differ at the end
    if(length(t.test) > 72, substr(t.test, 1, 24) || '...' || substr(t.test, length(t.test) - 44), t.test) AS "Test"
  , format('%d of %d', t.failed_runs, jr.runs) AS "Failed runs"
  , memory.default.sparkline(array_agg(d.failed_runs * 1e0 ORDER BY d.day), 4e0) AS "Failures per day chart"
  , format_datetime(t.first_failed_at, 'MMM dd') AS "First"
  , coalesce(p.branches, 0) AS "In PRs"
  , memory.default.link(format_datetime(t.last_failed_at, 'MMM dd'), t.latest_url) AS "Last"
FROM tests t
JOIN job_runs jr ON jr.job_name = t.job_name
JOIN daily d ON d.test = t.test
LEFT JOIN pull_request_failures p ON p.test = t.test
GROUP BY t.test, t.failed_runs, jr.runs, t.first_failed_at, t.last_failed_at, p.branches, t.latest_url
ORDER BY t.failed_runs DESC, t.last_failed_at DESC
LIMIT 30
;

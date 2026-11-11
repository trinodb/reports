-- Is a test failure in my pull request known?
-- Tests that are flaky or broken for everyone: if your pull request fails in one of them with the same error, re-run the job and mention the test in the pull request.
-- Retried counts failures where the same job then passed on the same commit, which shows that the test is flaky; In PRs and In master count pull request branches and merge queue or nightly runs with the failure, in the last 30 days. Listed are tests with a pass on retry, or with failures in 3 changes including a pull request.
WITH
ci_runs AS (
    -- runs started with a /test-with-secrets comment test a pull request, but have the head of master as their commit
    SELECT id, trigger, head_sha, head_branch
    FROM memory.default.ci_runs
    WHERE workflow = 'ci'
    AND event <> 'repository_dispatch'
    AND created_at >= current_date - INTERVAL '31' DAY
)
, ci_jobs AS (
    SELECT j.id, j.run_id, j.name, j.conclusion, j.started_at, r.trigger, r.head_sha, r.head_branch
    FROM jobs j
    JOIN ci_runs r ON r.id = j.run_id
    WHERE j.started_at >= current_date - INTERVAL '31' DAY
    AND j.conclusion IN ('success', 'failure')
)
, passed_jobs AS (
    SELECT DISTINCT head_sha, name
    FROM ci_jobs
    WHERE conclusion = 'success'
)
, test_failures AS (
    SELECT
        j.id AS job_id
      , j.run_id
      , j.name AS job_name
      , j.started_at
      , j.trigger
      , j.head_branch
      , p.name IS NOT NULL AS passed_on_retry
      -- parameterized and repeated tests end with (arguments) and [invocation], product tests with [groups: ...],
      -- and a failure of the whole class, like in its setup, has no method name
      , regexp_replace(regexp_replace(regexp_replace(a.title, ' \[groups: .*\]$', ''), '(\(.*\))?(\[\d+\])?$', ''), '\.$', ' (whole class)') AS test
      , a.message
    FROM ci_jobs j
    JOIN check_run_annotations a ON a.check_run_id = j.id
    LEFT JOIN passed_jobs p ON p.head_sha = j.head_sha AND p.name = j.name
    WHERE j.conclusion = 'failure'
    AND j.started_at >= current_date - INTERVAL '29' DAY
    AND a.annotation_level = 'failure'
    AND a.title <> ''
    AND a.path NOT LIKE '.github%'
)
, tests AS (
    SELECT
        test
      , count(DISTINCT (run_id, job_name, started_at)) FILTER (WHERE passed_on_retry) AS retried
      -- runs of pull requests from forks have no pull request number, so count branches; two forks can use the same branch name
      , count(DISTINCT head_branch) FILTER (WHERE trigger = 'pull request') AS pull_request_branches
      , count(DISTINCT run_id) FILTER (WHERE trigger IN ('merge queue', 'scheduled')) AS master_runs
      , max(started_at) AS last_failed_at
      , max_by(job_name, started_at) AS job_name
      , max_by(message, started_at) AS message
      , max_by(format('https://github.com/trinodb/trino/actions/runs/%d/job/%d', run_id, job_id), started_at) AS latest_url
    FROM test_failures
    GROUP BY test
)
SELECT
    test AS "Test"
  , retried AS "Retried"
  , pull_request_branches AS "In PRs"
  , master_runs AS "In master"
  , regexp_replace(job_name, '^test \((.*)\)$', '$1') AS "Job"
  -- ansi2html escapes < and > after the Markdown escaping, so they would show as entities
  , translate(substr(trim(regexp_replace(message, '\s+', ' ')), 1, 120), '<>', '‹›') AS "Latest error"
  , format('"%s"@%s ', format_datetime(last_failed_at, 'MMM dd'), latest_url) AS "Last failed"
FROM tests
-- tests that fail only in the merge queue and nightly runs are in the first report
WHERE retried > 0 OR (pull_request_branches > 0 AND pull_request_branches + master_runs >= 3)
ORDER BY retried + pull_request_branches + master_runs DESC, last_failed_at DESC
LIMIT 30
;

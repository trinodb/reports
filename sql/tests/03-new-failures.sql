-- New test failures
-- Test classes whose tests started to fail in the last 7 days, after no failures in the 4 weeks before, in at least 2 changes. When many tests of a class fail from the same day, one change or an outside service broke them: find it, and fix or revert it.
-- Columns count as in the report above.
WITH
ci_runs AS (
    -- runs started with a /test-with-secrets comment test a pull request, but have the head of master as their commit
    SELECT id, trigger, head_sha, head_branch
    FROM memory.default.ci_runs
    WHERE workflow = 'ci'
    AND event <> 'repository_dispatch'
    AND created_at >= current_date - INTERVAL '36' DAY
)
, ci_jobs AS (
    SELECT j.id, j.run_id, j.name, j.conclusion, j.started_at, r.trigger, r.head_sha, r.head_branch
    FROM jobs j
    JOIN ci_runs r ON r.id = j.run_id
    WHERE j.started_at >= current_date - INTERVAL '35' DAY
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
    AND a.annotation_level = 'failure'
    AND a.title <> ''
    AND a.path NOT LIKE '.github%'
)
, tests AS (
    SELECT
        test
      , regexp_extract(test, '^[^. ]+') AS test_class
      , min(started_at) AS first_failed_at
    FROM test_failures
    GROUP BY test
    HAVING min(started_at) >= current_date - INTERVAL '7' DAY
)
, classes AS (
    SELECT
        t.test_class
      , count(DISTINCT t.test) AS tests
      , array_join(slice(array_sort(array_agg(DISTINCT substr(t.test, length(t.test_class) + 2))), 1, 3), ', ') AS some_tests
      , min(f.started_at) AS first_failed_at
      , max(f.started_at) AS last_failed_at
      , count(DISTINCT f.run_id) FILTER (WHERE f.trigger IN ('merge queue', 'scheduled')) AS master_runs
      -- runs of pull requests from forks have no pull request number, so count branches; two forks can use the same branch name
      , count(DISTINCT f.head_branch) FILTER (WHERE f.trigger = 'pull request') AS pull_request_branches
      , count(DISTINCT (f.run_id, f.job_name, f.started_at)) FILTER (WHERE f.passed_on_retry) AS retried
      , max_by(f.message, f.started_at) AS message
      , max_by(format('https://github.com/trinodb/trino/actions/runs/%d/job/%d', f.run_id, f.job_id), f.started_at) AS latest_url
    FROM tests t
    JOIN test_failures f ON f.test = t.test
    GROUP BY t.test_class
)
SELECT
    test_class AS "Test class"
  , tests AS "New failing tests"
  , some_tests AS "For example"
  , format_datetime(first_failed_at, 'MMM dd') AS "First failed"
  , master_runs AS "In master"
  , pull_request_branches AS "In PRs"
  , retried AS "Retried"
  -- ansi2html escapes < and > after the Markdown escaping, so they would show as entities
  , translate(substr(trim(regexp_replace(message, '\s+', ' ')), 1, 120), '<>', '‹›') AS "Latest error"
  , format('"%s"@%s ', format_datetime(last_failed_at, 'MMM dd'), latest_url) AS "Last failed"
FROM classes
WHERE master_runs + pull_request_branches >= 2
ORDER BY master_runs + pull_request_branches DESC, first_failed_at, test_class
LIMIT 30
;

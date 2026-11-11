-- Why CI jobs fail
-- Failed jobs of the `ci` workflow per week, by the cause in their error messages: █ tests (product test jobs included), ▓ compile errors and code checks, ▒ infrastructure (runners, downloads, containers), ░ timeouts, · other (mostly test jobs that failed without naming a test).
-- In pull requests most failures come from unfinished changes; in the merge queue and nightly runs the code already passed its checks, so failing tests there are flaky or broken. Jobs cancelled by a newer push or by another failed job are not counted, and the newest week is not complete.
WITH
ci_runs AS (
    SELECT id, if(trigger IN ('merge queue', 'scheduled'), 'merge queue, nightly', 'pull requests') AS runs_of
    FROM memory.default.ci_runs
    WHERE workflow = 'ci'
    AND trigger IN ('merge queue', 'scheduled', 'pull request')
    AND created_at >= date_trunc('week', current_date) - INTERVAL '85' DAY
)
, ended_jobs AS (
    -- a re-run copies the jobs it does not run again from the earlier attempt, with the same times, so count them once
    SELECT j.run_id, r.runs_of, j.name, j.started_at, j.conclusion, min(j.id) AS job_id
    FROM jobs j
    JOIN ci_runs r ON r.id = j.run_id
    WHERE j.started_at >= date_trunc('week', current_date) - INTERVAL '84' DAY
    AND j.conclusion IN ('failure', 'cancelled')
    -- it fails when any other job fails
    AND j.name <> 'build-success'
    GROUP BY j.run_id, r.runs_of, j.name, j.started_at, j.conclusion
)
, job_causes AS (
    SELECT
        j.run_id
      , j.runs_of
      , j.job_id
      , j.started_at
      , j.conclusion
      , coalesce(bool_or(a.message LIKE 'The job has exceeded the maximum execution time%' OR a.message = 'The action has timed out.'), false) AS timed_out
      , coalesce(bool_or(regexp_like(a.message, '^(Container startup failed|The job was not acquired|Failed to download|Unable to download artifact|The hosted runner lost communication|GitHub Actions has encountered an internal error|Failed to FinalizeArtifact|Failed to resolve action download info|Service Unavailable|Java setup (process )?failed|Checksum verification failed|connect (ENETUNREACH|ETIMEDOUT)|Could not receive a message from the daemon|Can''t find ''action\.yml''|RPC failed|unable to access|expected flush after ref listing|Response status code does not indicate success|RemoteDockerImage|Docker build failed|Unhandled error: HttpError)')
            OR a.message LIKE '%No space left on device%'
            OR a.message LIKE '%runner has received a shutdown signal%'), false) AS infrastructure
      , coalesce(bool_or(a.title <> '' AND a.path NOT LIKE '.github%'), false) AS tests
      -- javac and Error Prone errors point to a source file, but have no title
      , coalesce(bool_or(a.title = '' AND a.path LIKE '%.java'), false) AS compile_errors
      -- product tests don't report which test failed
      , regexp_like(j.name, '^pt( |-junit|$)') AS product_tests
      , regexp_like(j.name, '^(check-commit|maven-checks|error-prone-checks|artifact-checks|check-commit-messages|check-commits-dispatcher|mvnd-build|build-pt)') AS check_job
    FROM ended_jobs j
    LEFT JOIN check_run_annotations a ON a.check_run_id = j.job_id AND a.annotation_level = 'failure'
    GROUP BY j.run_id, j.runs_of, j.job_id, j.started_at, j.conclusion, j.name
)
, categorized AS (
    SELECT
        date_trunc('week', CAST(started_at AS date)) AS week
      , runs_of
      , run_id
      , CASE
            WHEN timed_out THEN 'timeouts'
            WHEN infrastructure THEN 'infrastructure'
            WHEN conclusion = 'cancelled' THEN NULL
            WHEN tests OR product_tests THEN 'tests'
            WHEN compile_errors OR check_job THEN 'compile'
            ELSE 'other'
        END AS cause
    FROM job_causes
)
, weekly AS (
    SELECT
        week
      , runs_of
      , count(DISTINCT run_id) AS runs
      , count(*) AS failed_jobs
      , count(*) FILTER (WHERE cause = 'tests') AS tests
      , count(*) FILTER (WHERE cause = 'compile') AS compile
      , count(*) FILTER (WHERE cause = 'infrastructure') AS infrastructure
      , count(*) FILTER (WHERE cause = 'timeouts') AS timeouts
      , count(*) FILTER (WHERE cause = 'other') AS other
    FROM categorized
    WHERE cause IS NOT NULL
    GROUP BY week, runs_of
)
SELECT
    week AS "Week"
  , runs_of AS "Runs of"
  , runs AS "Failed runs"
  , failed_jobs AS "Failed jobs"
  , format('%.0f%%', 100e0 * tests / failed_jobs) AS "Tests"
  , format('%.0f%%', 100e0 * compile / failed_jobs) AS "Compile"
  , format('%.0f%%', 100e0 * infrastructure / failed_jobs) AS "Infra"
  , format('%.0f%%', 100e0 * timeouts / failed_jobs) AS "Timeouts"
  , format('%.0f%%', 100e0 * other / failed_jobs) AS "Other"
  , memory.default.stacked(ARRAY[tests * 1e0, compile * 1e0, infrastructure * 1e0, timeouts * 1e0, other * 1e0], '█▓▒░·', 30) AS "Causes chart"
FROM weekly
ORDER BY week DESC, runs_of
;

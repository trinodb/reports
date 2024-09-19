CREATE SCHEMA trinocicd.tests WITH (location = 's3://trino-ci/tests');

CREATE TABLE trinocicd.tests.surefire_reports (
  testsuite row(
      "ignored" varchar
    , "hostname" varchar
    , "failures" varchar
    , "tests" varchar
    , "name" varchar
    , "time" varchar
    , "errors" varchar
    , "timestamp" varchar
    , "skipped" varchar
    , testcase array(row(
        "classname" varchar
      , "name" varchar
      , "time" varchar
      -- this is useless when value is null, and it's not possible to tell if it's set or not
      , skipped row(
          content varchar
        , type varchar
      )
      , failure row(
          content varchar
        , message varchar
        , type varchar
      )
    ))
  )
  , branch varchar
  , git_sha varchar
  , workflow_name varchar
  , workflow_run varchar
  , workflow_conclusion varchar
  , workflow_run_attempt varchar
  , timestamp varchar
  , repo varchar
  , date_created date
) WITH (
      external_location = 's3://trino-ci/tests/results/type=surefire/'
    , format = 'JSON'
    , partitioned_by = ARRAY['repo', 'date_created']
);

CALL trinocicd.system.sync_partition_metadata('tests', 'surefire_reports', 'ADD');

CREATE TABLE trinocicd.tests.testng_reports (
  "testng_results" row(
      "ignored" varchar
    , "total" varchar
    , "passed" varchar
    , "failed" varchar
    , "skipped" varchar
    , "reporter_output" varchar
    , suite row(
        "started_at" varchar
      , "name" varchar
      , "finished_at" varchar
      , "duration_ms" varchar
      , groups row("group" array(row(
          name varchar
        , method array(row(
            signature varchar
          , name varchar
          , class varchar
        ))
      )))
      , test row(
          "started_at" varchar
        , "name" varchar
        , "finished_at" varchar
        , "duration_ms" varchar
        , class array(row(
            name varchar
          , "test_method" array(row(
              "signature" varchar
            , "started_at" varchar
            , "name" varchar
            , "data_provider" varchar
            , "params" row(param array(row("index" varchar, "value" varchar)))
            , "finished_at" varchar
            , "duration_ms" varchar
            , "status" varchar
            , "exception" row(
                "class" varchar
              , "message" varchar
              , "full_stacktrace" varchar
            )
            , "reporter_output" varchar
          ))
        ))
      )
    )
  )
  , branch varchar
  , git_sha varchar
  , workflow_name varchar
  , workflow_run varchar
  , workflow_conclusion varchar
  , workflow_run_attempt varchar
  , timestamp varchar
  , repo varchar
  , date_created date
) WITH (
      external_location = 's3://trino-ci/tests/results/type=testng/'
    , format = 'JSON'
    , partitioned_by = ARRAY['repo', 'date_created']
);

CALL trinocicd.system.sync_partition_metadata('tests', 'testng_reports', 'ADD');

CREATE VIEW reports
AS SELECT
      branch
    , git_sha
    , workflow_name
    , workflow_run
    , workflow_conclusion
    , workflow_run_attempt
    , cast("timestamp" AS timestamp(3) with time zone) AS job_timestamp
    , repo
    , date_created
    , cast(testsuite.ignored AS bigint) AS ignored
    , cast(testsuite.failures AS bigint) AS failures
    , cast(testsuite.tests AS bigint) AS tests
    , cast(testsuite.errors AS bigint) AS errors
    , cast(testsuite.skipped AS bigint) AS num_skipped
    , testsuite.name AS suite_name
    , coalesce(
        try_cast(testsuite.timestamp AS timestamp(3) with time zone),
        parse_datetime(testsuite.timestamp, 'dd MMM yyyy HH:mm:ss z')
      ) AS suite_timestamp
    , parse_duration(testsuite.time || 's') AS suite_time
    , c.classname AS class_name
    , c.name AS test_name
    -- if it's null, it means the test was skipped
    , parse_duration(c.time || 's') AS test_time
    , c.failure
    , c.skipped
FROM surefire_reports
CROSS JOIN unnest(testsuite.testcase) AS c;

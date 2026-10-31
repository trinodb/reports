# Migration from trino-rest to trino-openapi

Plan for replacing the trino-rest GitHub and Slack syncs with
[trino-openapi](https://github.com/nineinchnick/trino-openapi), and moving the
data from Hive/ORC to Iceberg/Parquet.

## Why

* trino-rest is replaced by the more generic trino-openapi, which doesn't ship
  a sync program. The incremental sync logic has to live somewhere, and the
  GitHub-specific part of it belongs next to the reports that consume it.
* Iceberg supports `MERGE`, so rows can be updated in place instead of
  appending versions and deduplicating them in `unique_*` views.
* Iceberg keeps the table schema and snapshots in metadata files next to the
  data, so the metastore only points to the current metadata file. Leaving Glue
  later means calling `register_table` for every table, not rebuilding them,
  which makes Glue an acceptable dependency.

## State before the migration

Sizes of `trinocicd.v2` tables on 2026-10-28, from the `$path` and
`$file_size` hidden columns:

| Table                                                                         | Files | Size (GB) | Rows       | Notes                                   |
| ----------------------------------------------------------------------------- | ----- | --------- | ---------- | --------------------------------------- |
| `artifacts`                                                                   | 249   | 258.746   | 17,385,535 | not written since 2023-10; not migrated |
| `unique_artifact`                                                             | 76    | 63.860    | 3,973,597  | not written since 2023-09; not migrated |
| `check_runs`                                                                  | 33    | 0.259     | 6,746,594  |                                         |
| `artifact_ids`                                                                | 12    | 0.209     | 8,551,999  | not migrated                            |
| `steps`                                                                       | 246   | 0.188     | 68,636,274 | not migrated; jobs include their steps  |
| `runs_artifacts`                                                              | 3     | 0.140     | 9,462,997  | not written since 2024-10; not migrated |
| `jobs`                                                                        | 9     | 0.108     | 7,876,486  | has `started_at = 0001-01-01` values    |
| `check_run_annotations`                                                       | 213   | 0.102     | 6,347,900  |                                         |
| `review_comments`                                                             | 7     | 0.094     | 369,732    |                                         |
| `issues`                                                                      | 7     | 0.086     | 238,583    |                                         |
| `pulls`                                                                       | 6     | 0.042     | 126,100    | created since 2019-01                   |
| `issue_comments`                                                              | 5     | 0.025     | 153,340    |                                         |
| `runs`                                                                        | 6     | 0.014     | 361,097    | created since 2020-11                   |
| `check_suites`                                                                | 24    | 0.014     | 352,450    |                                         |
| `pull_commits`                                                                | 9     | 0.011     | 121,960    |                                         |
| `commits`                                                                     | 5     | 0.006     | 86,411     |                                         |
| `reviews`                                                                     | 5     | 0.003     | 105,009    |                                         |
| `pull_stats`                                                                  | 5     | 0.002     | 109,936    |                                         |
| `timestamped_members`                                                         | 1     | 0.000     | 6,132      | last synced 2025-06-25; not migrated    |
| `timestamped_teams`                                                           | 1     | 0.000     | 138        | not migrated                            |
| `members`                                                                     | 1     | 0.000     | 230        | written 2022-04; not migrated           |
| `orgs`, `repos`, `runners`, `users`, `workflows`, `timestamped_collaborators` | 0     | 0         | 0          | empty; not migrated                     |

Without the artifact tables, everything to migrate is about 1.3 GB.

All GitHub tables contain only `trinodb/trino`, plus a few thousand rows of the
`nineinchnick/trino` fork in `runs`, `jobs`, `steps` and `check_runs`. There's
no data of private repositories.

Other facts that shape the plan:

* The GitHub tables are Hive on Glue, in ORC (`catalog/trinocicd.properties`).
  Slack is already Iceberg on Glue (`catalog/trinoslack.properties`).
* Most reports read the `unique_*` and `all_members` views, defined in
  trino-rest's `trino-rest-github/sql/views.sql`, not the raw tables. 12 report
  files use fully qualified `trinocicd.v2.*` names.
* The only column the reports read that the PoC steps drop is `pulls.issue_url`
  (13 files, 8 of them run in CI).
* CI doesn't sync members or teams (`.github/workflows/sync.yml`).
  `timestamped_members` has two sources:
  * `sync`: `trinodb` and `starburstdata`, last updated 2025-06-25;
  * `manual`: 134 rows of company affiliations for 39 orgs, from 2005 to 2021.
* Membership data was removed from the reports in
  [#37](https://github.com/trinodb/reports/pull/37), and isn't migrated: it's
  out of date, nobody can maintain the Starburst membership anymore, and only
  public data is kept. If grouping by the `trinodb` teams, like maintainers, is
  needed again later, sync them fresh with the `teams` and `members` steps,
  without old history.
* trino-openapi v2.2 is built for Trino 484. Its Docker image is based on
  `trinodb/trino-core`, which doesn't include the Iceberg connector, so the
  plugin zip is mounted into `trinodb/trino`, like trino-rest is today.
* trino-openapi PR #271, which waits for GitHub rate limit resets, is merged
  and released in v2.0, so the limitation in the PoC README is outdated.
* trino-openapi only reads OpenAPI 3 specs and has no Slack spec. Slack's own
  spec, in the archived `slackapi/slack-api-specs` repository, is OpenAPI 2.
* `tests.surefire_reports` and `tests.testng_reports` aren't read by any CI
  report and are not migrated.

## Decisions

| Topic              | Decision                                                                                                  |
| ------------------ | --------------------------------------------------------------------------------------------------------- |
| Sync program       | Option B: a single-file Java driver in this repo, run with the Java source launcher                       |
| Sync steps         | GitHub SQL steps in `sync/github/`, ported from the PoC and adjusted to what the reports need             |
| Specs              | Patched copies in `sync/specs/`, not downloaded when the sync runs                                        |
| Slack              | Moved to trino-openapi too, with a spec written for the endpoints the sync reads                          |
| Table format       | Iceberg, Parquet                                                                                          |
| Metastore          | Glue, in the current AWS account, like the Slack sync                                                     |
| Migration strategy | Run the new pipeline next to the old one, then switch the reports                                         |
| Reports            | Moved to the new tables in `trinocicd.github` when switching, without views with the old names            |
| Membership data    | Removed from the reports and dropped: no members or teams sync, no backfill of `members`, `timestamped_*` |
| Not migrated       | Artifact tables, empty tables, membership tables, `steps`, `nineinchnick/trino` rows, `tests.*`           |

### Sync options considered

| Option                                               | Pros                                                                         | Cons                                                                                                   |
| ---------------------------------------------------- | ---------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| A. PoC driver in its own repo, released jar or image | Reusable by others; keeps the PoC tests with a fake GitHub server; versioned | Another repo and release process for about 600 lines of Java; driver changes need a release            |
| B. Single-file driver in this repo (chosen)          | No build or release; the GitHub steps and the driver change in one PR        | Guava and airlift must be replaced with the JDK; no unit tests unless added separately                 |
| C. Bash and the Trino CLI                            | No Java                                                                      | Loops depend on parsing row counts from the CLI output; retries in bash are fragile                    |
| D. dbt-trino or SQLMesh incremental models           | Lineage, tests, docs; could later own the reports too                        | Page loops, parent batches and `sync_state` don't fit one statement per model; adds a Python toolchain |
| E. Python script with trino-python-client            | Quick to change, no build                                                    | Another language; same amount of work as B                                                             |

Move to option A if a second user of the driver appears.

### Metastore options considered

| Option                                                 | Ops  | Lock-in                         | Notes                                                          |
| ------------------------------------------------------ | ---- | ------------------------------- | -------------------------------------------------------------- |
| Glue (chosen)                                          | none | low, thanks to `register_table` | Same as today; Slack already uses it                           |
| S3 Tables                                              | none | higher                          | Managed compaction, but the tables are tied to the service     |
| JDBC catalog on a managed Postgres                     | low  | another vendor                  | Free tiers suspend databases; credentials to rotate            |
| Self-hosted REST catalog (Lakekeeper, Polaris), Nessie | high | none                            | Needs a server running all the time                            |
| `TESTING_FILE_METASTORE`                               | none | none                            | Testing only, no safe concurrent commits; used only in phase 0 |

## Target architecture

```
GitHub API --> trino-openapi (github catalog) --> sync/Sync.java + sync/github/ --> trinocicd.github (Iceberg, Glue) --> reports.yml
Slack API  --> trino-openapi (slack catalog)  --> sync/Sync.java + sync/slack/  --> trinoslack.slack (Iceberg, Glue)
```

Workflows in the new setup:

| Workflow         | Schedule      | Writes                                 | Concurrency group |
| ---------------- | ------------- | -------------------------------------- | ----------------- |
| `sync.yml`       | every 2 hours | `trinocicd.github`                     | `writers`         |
| `sync-slack.yml` | weekly        | `trinoslack.slack`                     | `writers`         |
| `optimize.yml`   | daily         | all tables: optimize, expire snapshots | `writers`         |
| `reports.yml`    | daily, push   | `reports/`                             | `reports`         |

All writers share one concurrency group, so Iceberg commits don't conflict.
The driver retries failed commits anyway.

## Phase 0: verify trino-openapi against the current data

Goal: before any infrastructure exists, prove that the new connector, the
steps and the backfill produce the same data as the current pipeline, and
measure how many requests and how much time a sync takes. Everything runs
locally, against a scratch Iceberg catalog on the local disk, reading the old
tables with the existing read credentials.

V1, V2 and V3 found no unexplained differences, and a sync 2 hours after the
previous one takes 7 minutes and 428 requests. See
[Findings](#phase-0-findings).

### Setup

`sync/verify/run-trino.sh` starts a Trino 484 container, `trino-verify`, on
port 8081, with these catalogs, from `sync/verify/catalog/`:

| Catalog     | Connector                                | Purpose                                                     |
| ----------- | ---------------------------------------- | ----------------------------------------------------------- |
| `legacy`    | Hive on Glue, read-only                  | Current data, to compare with and backfill from             |
| `rest`      | trino-rest GitHub 0.178                  | Connector-level comparison                                  |
| `github`    | trino-openapi v2.2, `sync/specs` spec    | New source, with the HTTP cache in `sync/verify/.data`      |
| `trinocicd` | Iceberg, `TESTING_FILE_METASTORE`, local | Scratch target, named like production, so reports run as-is |
| `git`       | trino-git 1.0                            | Used by reports                                             |
| `memory`    | memory                                   | Used by reports                                             |

It needs `AWS_REGION`, `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` and
`GITHUB_TOKEN`. The `github` catalog is limited to 1 request per second, which
stays under the 5,000 requests per hour of a personal token, even when catching
up. The `pl.net.was` logger is at `DEBUG`, so every request is logged.

`sync/verify/verify.sh` runs the steps of the verification:

```bash
./sync/verify/verify.sh reset                     # drop and create the scratch tables
./sync/verify/verify.sh backfill '2026-10-25 00:00:00'
./sync/verify/verify.sh sync                      # the new sync, from the OpenAPI connector
./sync/verify/verify.sh connectors                # V1
./sync/verify/verify.sh compare '2026-10-25 00:00:00' '2026-10-28 10:30:00'  # V2
```

### V1: connector-level parity

`sync/verify/connectors.sql` compares the same data read with both connectors:
the newest 300 runs, jobs of 5 completed runs, issue comments updated since
yesterday, and reviews of 5 pull requests. Pull requests are not compared,
because trino-rest fails reading some of them.

### V2: sync parity over a recent window

1. Backfill old data from before a cutoff. Keep the cutoff less than a day
   before the sync starts, because the sync catches up at about 1 request per
   second, and the first try with 3 days used up the rate limit.
2. Run the sync. The cursors start from the backfilled data, so it reads only
   changes since the cutoff.
3. Compare rows between the cutoff and the start of the last old sync in CI,
   with `sync/verify/sync.sql`. It counts keys in only one of the tables, rows
   changed after the old sync ran, and rows with differing values, and lists
   the differing columns.

### V3: report parity

Run all CI reports against both containers, the ones from `main` on the old
tables, and the ones moved to the new tables on the new ones, and diff the
results. Every difference must be explained. This needs the reports moved in
[step 3](#step-3-switch-the-reports-second-pull-request). The results in the
findings were measured with views that gave the new tables the old names and
columns, before the reports were moved.

### V4: cost of a sync

From the request log and the sync log: the number of requests, the response
codes, and the duration of every step, for a sync about 2 hours after the
previous one, like in CI. Compare with the old sync in CI, which takes a median
of 17 minutes, p90 of 36 minutes, and at most 57 minutes, over the last 60 runs.

### Exit criteria

* V1 and V2 show no unexplained differences.
* V3 report diffs are all explained.
* A sync 2 hours after the previous one takes at most as long as the old one,
  and uses less than half of the hourly rate limit of the CI token.

### Phase 0 findings

Fixed in the steps or the backfill, or to handle when moving the reports:

* The PoC steps filtered on `state = 'all'` for issues and pull requests. Since
  `state` is also a field of the results, and the v2.2 spec sends `state=all`
  by default, the filter removed all rows. Reported in
  [trino-openapi#270](https://github.com/nineinchnick/trino-openapi/pull/270#issuecomment-6466924329).
* Listing 100 jobs per page of a run with about 200 jobs takes over 9 seconds,
  and often fails with `502 Server Error`. A failed request fails the whole
  batch of the `jobs` step, and every later sync fails on the same batch. With
  50 per page it takes under 3 seconds.
* With the `status` parameter, GitHub returns at most 1,000 runs, so a sync
  falling behind by more than about a day would miss runs and their jobs.
  trino-rest has the same limit. The `runs` step filters on
  `conclusion IS NOT NULL` instead, which isn't a parameter, so all pages can
  be read. Not verified yet.
* The old tables have `0` in `issue_comments.issue_number` and in
  `review_comments.pull_number` since 2022, and `''` or `0` instead of `NULL`
  in other columns. The backfill derives the numbers from URLs, and saves
  `NULL` like the sync. Reports comparing `in_reply_to_id`, and logins of
  commits, with `''` or `0` have to compare with `NULL` instead.
* The old tables have no jobs for 784 completed runs from the last 2 months,
  321,398 jobs of run attempts missing from `runs`, and 63,125 check runs of
  check suites missing from `runs`. The backfill copies all of them, and marks
  runs and check suites as read only when it copied their children, so the sync
  reads the missing ones if they're recent enough.
* The old `unique_pull_commits` view keeps one commit for every set of parent
  commits, so reports reading it have to pick rows the same way.

Report results (V3), with the old tables last synced at 16:30 UTC, and the
new ones backfilled until 12:45 UTC and synced at 15:47 UTC on 2026-10-28:

* 4 CI reports return the same results, and the others differ because of:
  * timing: data of the current day, and reports depending on `now()`;
  * duplicate rows in the old tables, which have 369,770 rows of review
    comments for 153,190 IDs, 86,418 rows of commits for 48,138 SHAs, and
    duplicate reviews, so reports counting raw rows, and names picked by the
    number of commits in `sql/pr/idents.sql`, change;
  * jobs missing from the old tables, which the new sync reads, like jobs of
    later attempts of a run;
  * ties in `ORDER BY` and `row_number()`, and `approx_percentile()` and
    `approx_most_frequent()`, which already give different results when
    running the same report twice on the old tables.
* Base data from before 12:30 UTC is the same in both: 15,408 runs from the
  last 31 days, 208,632 jobs, and 22,824 pull requests, apart from the known
  differences listed here.
* With jobs of all attempts, `sql/ci-cd/runs-duration-per-day.sql` shows runs
  lasting days, because GitHub copies the successful jobs of a run into the next
  attempt, with their original times. It now counts only first attempts, like
  `sql/ci-cd/runs-queue-time-per-day.sql` does.
  `sql/ci-cd/runs-job-cumulative-duration-per-day.sql` counts jobs of all
  attempts, but skips the copies, and joins jobs to one row of every run,
  instead of a row of every attempt.

Not problems:

* `author_association` depends on who reads it: `FIRST_TIME_CONTRIBUTOR` and
  `MEMBER` only appear with a personal token. It should match the old data when
  the sync runs in CI with the same token. `sql/pr/reviews-per-author-assoc.sql`
  reads it.
* The old tables keep commits of pull requests replaced by force-pushes, and
  older versions of pull request statistics, which the new sync never sees.
* The old sync only reads reviews of pull requests with review comments
  pointing to a missing review, so the new sync has more reviews.
* trino-rest returns `0` for `app_id` of comments without an app, and the
  OpenAPI connector `NULL`.
* trino-rest 0.178 fails with a `NullPointerException` in `Pull.toRow` reading
  some pull requests. The old CI sync isn't affected.

Rate limits and performance (V4), with `max-requests-per-second=1`, counted
from the request log:

| Sync                                           | Duration | Requests | Mostly                        |
| ---------------------------------------------- | -------- | -------- | ----------------------------- |
| 2 hours after the previous one, 2026-10-29     | 7m15s    | 428      | 271 for annotations, 4.5 min  |
| catching up 2 hours, and jobs missing from old | 51m      | 2,125    | 1,254 for jobs, 36 min        |
| catching up 3 hours, and jobs missing from old | 52m      | 2,382    | 1,404 for jobs, 36 min        |
| catching up 3 days, before fixes               | about 1h | 5,917    | 4,322 for annotations, failed |

* A sync 2 hours after the previous one is faster than the old one: a median
  of 17 minutes, p90 of 36 minutes, and at most 57 minutes, over 60 runs in CI.
* Its 428 requests were for about 135 check runs per hour. In busy hours there
  are 600 to 860, so a sync could need about 1,700 requests, more than the
  1,000 per hour per repository that `GITHUB_TOKEN` is believed to allow. The
  old sync reads the same annotations, and has all of them, so either the
  limit is higher, or it catches up in the next runs. Check the
  `x-ratelimit-limit` header in a CI job before choosing
  `max-requests-per-second`.
* Reading jobs is limited by GitHub, not by the request rate: a page of 50
  jobs takes about 2.6 seconds.

* The old and new syncs make the same number of requests for annotations: one
  for every check run with annotations, and almost all have some. In busy
  hours, there are 600 to 860 check runs per hour.
* Catching up 3 days took 5,917 requests in about an hour, mostly annotations
  (4,322) and jobs (998), and used up the rate limit of a personal token. Most
  responses were new, so the HTTP cache didn't help.
* When the rate limit is used up, the connector fails the query, unless the
  limit resets within `retry-max-delay`, which is 1 minute by default. The batches
  read before that are saved, so the next sync continues.
* The `/rate_limit` endpoint isn't reliable for measuring usage, because it
  sometimes reports a different counter than the one requests are charged to.
  Count requests in the request log instead.

## Phase 1: switch the GitHub sync to trino-openapi

The new pipeline only needs an Iceberg catalog on Glue, and the AWS account
already has one, used by the Slack sync.

Glue databases:

| Database | Location               | Contents                                        |
| -------- | ---------------------- | ----------------------------------------------- |
| `v2`     | `s3://trino-ci/v2`     | the old Hive tables, written by trino-rest      |
| `slack`  |                        | the Iceberg tables of the Slack sync            |
| `github` | `s3://trino-ci/github` | new: the Iceberg tables written by the new sync |

Catalogs, mounted under these names in the containers:

| Catalog     | File                                   | Connector                         |
| ----------- | -------------------------------------- | --------------------------------- |
| `trinocicd` | `catalog/trinocicd.properties`         | Hive, until the reports switch    |
| `trinocicd` | `catalog/trinocicd-iceberg.properties` | Iceberg, after the reports switch |
| `legacy`    | `catalog/trinocicd.properties`         | Hive, for the backfill            |
| `github`    | `catalog/github.properties`            | trino-rest, for the old sync      |
| `github`    | `catalog/github-openapi.properties`    | trino-openapi, for the new sync   |

### How the sync works

* `sync/Sync.java` is the PoC driver (`sync/src/main/java/pl/net/was/sync/` on
  the `github-sync` branch of trino-openapi), ported to a single file without
  dependencies other than the Trino JDBC driver, run with
  `java -cp trino-jdbc.jar sync/Sync.java`. It runs the steps in
  `SYNC_STEPS_DIR` in the order of their names, like `01-tables`. A step is a
  `.sql` file with one statement, or a directory of them, so the driver doesn't
  split scripts. Comments before a statement repeat it in a loop, with
  `-- loop: pages|batches` and `-- stop-after: N`, and bind values to its `?`
  parameters, with `-- parameters: page` or `-- parameters: cutoff`. It retries
  statements failing with errors that might be transient, runs all steps even
  if some fail, and exits with a non-zero code if any did.
* `sync/github/` has the PoC steps, with the fixes from the
  [findings](#phase-0-findings), reading `trinodb/trino` into
  `trinocicd.github`, and a `tables` step that creates all tables first, with
  their columns, so the backfill creates them without the OpenAPI connector.
* `sync/specs/github.json` is GitHub's spec with the patch from trino-openapi,
  see [`sync/specs/README.md`](specs/README.md).
* `sync/backfill/` copies the newest version of every row of `trinodb/trino`
  from the old tables, from before an optional cutoff, and marks the parents of
  copied children as read in `sync_state`. The scripts are safe to repeat.

### Step 1: add the new pipeline (first pull request)

Nothing changes for the old sync and the reports:

* `catalog/trinocicd-iceberg.properties` and `catalog/github-openapi.properties`;
* `.github/workflows/backfill.yml`, run manually: creates the `github`
  database and the tables, and copies the old data;
* `.github/workflows/sync-openapi.yml`, run manually at first: runs the new
  sync, keeps the HTTP cache between runs with `actions/cache`, and prints the
  rate limit of `GITHUB_TOKEN`.

### Step 2: backfill and run the new sync next to the old one

1. Run `backfill.yml`. It copies the old data of `trinodb/trino` without a
   cutoff, in about 2 minutes.
2. Run `sync-openapi.yml` manually, and check its log:
   * `x-ratelimit-limit` of `GITHUB_TOKEN`, to choose `max-requests-per-second`
     in `catalog/github-openapi.properties`;
   * the duration and failed steps.
3. Schedule `sync-openapi.yml` every 2 hours, an hour after the old sync, since
   both use the rate limit of `GITHUB_TOKEN`.

### Step 3: switch the reports (second pull request)

* the reports read the tables in `trinocicd.github`: the tables replace the
  `unique_*` views, since a `MERGE` keeps one row for every key, `issue_url` is
  derived from the URL of a pull request, and comparisons with `''` and `0`
  check for `NULL`;
* `reports.yml`, `bin/run-trino.sh` and `bin/reports.sh` use the Iceberg
  catalog and the `github` schema;
* `optimize.yml` optimizes the Iceberg tables in `github`, and expires
  snapshots and removes orphan files, since a `MERGE` every 2 hours creates
  many snapshots and delete files;
* the old sync, `sync.yml`, is removed, and `sync-openapi.yml` is renamed to
  `sync.yml`;
* `sync/verify/verify.sh reports` runs V3. Before merging, check that only the
  differences found in phase 0 remain.

To roll back, revert the second pull request. The old sync then catches up,
within its limits: children of the last 2 months, and at most 1,000 runs.

## Phase 2: switch the Slack sync to trino-openapi

In its own pull request, after phase 1:

* Write an OpenAPI 3 spec in `sync/specs/slack.json` for `users.list`,
  `conversations.list`, `conversations.members`, `conversations.history` and
  `conversations.replies`, which the Slack sync reads into the `users`,
  `channels`, `channel_members`, `messages` and `replies` tables. Describe
  cursor pagination with `cursorParam: cursor` and
  `nextCursorPath: /response_metadata/next_cursor`.
* Set `errorPath` to `$response.body#/error`. Slack returns errors with status
  `200` and `"ok": false`, and the connector fails a query when a response has
  no results but has a value at `errorPath`.
* Write `sync/slack/` steps, and switch `sync-slack.yml` to them, keeping the
  tables in `trinoslack.slack`.

## Phase 3: cleanup

* Remove the trino-rest catalogs and plugins, and rename the new catalog files
  to the old names.
* Drop the old Hive tables in `v2`, after deciding whether to keep them as an
  archive. The bucket also holds the 323 GB of artifacts.
* Remove `sql/tests-schema.sql`.

## Open questions

* What `max-requests-per-second` and `retry-max-delay` to use in CI, after
  checking the rate limit of `GITHUB_TOKEN` in a CI job.

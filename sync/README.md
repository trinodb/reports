# Sync

The syncs copy data from the GitHub and Slack APIs into Iceberg tables, which
the reports read:

```
GitHub API --> trino-openapi (github catalog) --> sync/Sync.java + sync/github/ --> trinocicd.github --> reports.yml
Slack API  --> trino-openapi (slack catalog)  --> sync/Sync.java + sync/slack/  --> trinocicd.slack
```

| Workflow         | Schedule                       | Writes                                          | Concurrency group |
| ---------------- | ------------------------------ | ----------------------------------------------- | ----------------- |
| `sync.yml`       | every 2 hours                  | `trinocicd.github`                              | `iceberg-writers` |
| `sync-slack.yml` | weekly, on Mondays             | `trinocicd.slack`                               | `iceberg-writers` |
| `optimize.yml`   | daily                          | all tables: optimize, expire snapshots, orphans | `iceberg-writers` |
| `reports.yml`    | daily, and on pushes to `main` | `reports/`                                      | `Reports`         |

The writers share a concurrency group, so their Iceberg commits don't conflict.

## AWS

The tables are in the AWS account `428825817873`, in `eu-central-1`, in the
`trino-reports-jwas` bucket, with the `github` and `slack` Glue databases at
`s3://trino-reports-jwas/github` and `s3://trino-reports-jwas/slack`.

The workflows don't use long-lived keys. They assume the
`arn:aws:iam::428825817873:role/trino-reports-github` role with GitHub OIDC,
using `aws-actions/configure-aws-credentials`, for 6 hours, because Trino
reads the credentials only when it starts. The role trusts only workflows
running on `main` of `trinodb/reports`, so workflows on other branches can't
write to the tables. It can change only tables in the `github` and `slack`
databases and objects in the bucket, and can't create databases.

## How the sync works

`Sync.java` runs SQL statements, with the Java source launcher and only the
Trino JDBC driver in the class path:

```shell
SYNC_TRINO_URL=jdbc:trino://localhost:8080 SYNC_STEPS_DIR=sync/github SYNC_OWNER=trinodb SYNC_REPO=trino \
    java -cp trino-jdbc.jar sync/Sync.java
```

* It runs the steps in `SYNC_STEPS_DIR` in the order of their names, like
  `01-tables`. A step is a `.sql` file with one statement, or a directory of
  them, so the driver doesn't split scripts. `SYNC_STEPS` runs only the listed
  steps, like `tables`.
* Comments before a statement repeat it in a loop, with
  `-- loop: pages|batches`, until the last statement of the step changes no
  rows, or `-- stop-after: N` iterations in a row change none. They also bind
  values to its `?` parameters, with `-- parameters: page`, or other
  settings, like `owner` and `repo`, set by `SYNC_OWNER` and `SYNC_REPO`.
* It retries statements failing with errors that might be transient, runs all
  steps even if some fail, and exits with a non-zero code if any did.
* The `tables` step creates all tables first, so every step can read them.

Every step is safe to repeat, usually a `MERGE` keyed by an identifier. Steps
reading children of parents, like jobs of workflow runs, read them in batches
of 30 parents. A batch is the parents not read yet, or changed since then,
and the second statement of the step saves them with their version in the
`sync_state` table, so parents without children aren't read again.

## GitHub

`sync/github/` reads `trinodb/trino`, using the spec in
[`specs/github.json`](specs/README.md), and the CI token, `GITHUB_TOKEN`:

* Issues, pull requests, comments, commits and runs are read from the newest
  ones, until there are no changes, or since the newest one saved.
* Commits of pull requests, statistics of pull requests, and reviews are read
  for pull requests updated since they were last read. Commits only for
  pull requests updated in the last 3 days.
* Jobs, check runs, and annotations are read only for runs from the last 2
  months, and check suites for runs from the last 15 days, because GitHub fails
  reading older ones.
* Jobs are read 50 per page, because pages of 100 jobs of large runs take over
  9 seconds, and often fail with `502 Server Error`. A failed request fails the
  whole batch, and every later sync would fail on the same batch.
* Runs are read by `conclusion IS NOT NULL`, instead of the `status` parameter,
  because with it GitHub returns at most 1,000 runs, and a sync falling behind
  by about a day would miss runs.
* Issues copied from trino-rest have no labels, types, reasons of their state,
  and links to their pull requests, and statistics of pull requests copied from
  it have no `merged_by`, so two steps read them once. `issue_labels` reads
  issues from the least recently updated, 1,000 at a time, sorted by the time
  of the update, and saves the cursor in `sync_state`, because GitHub rejects
  requests for later pages of all issues. Issues GitHub doesn't return, like
  deleted ones, keep `NULL` labels. `pull_merged_by` reads merged pull requests
  newest first, at most 1,200 an hour. When done, they make no requests.
* trino-rest missed the reviews of about half of the pull requests since 2022,
  and the copy marked all pull requests as read. The last step, `reviews_again`,
  marks 1,200 of them in every sync, newest first, with a version they never
  have, so the `reviews` step of the next sync reads them again. Until then,
  reports counting reviews show too few of them for older pull requests.
* `users` reads profiles of people who opened or reviewed pull requests in the
  last 2 years, for their company and location, which reports group people
  by. People change them, so they're read again every quarter. GitHub doesn't
  return deleted accounts, which keep their last profile.

`GITHUB_TOKEN` allows 15,000 requests per hour, shared with other workflows of
this repository. The catalog allows 2 requests per second, so a sync uses at
most 7,200 an hour, even when catching up. A sync 2 hours after the previous
one makes a few hundred requests in under 10 minutes, mostly for annotations,
one for every check run. Reading jobs is limited by GitHub, not by the request
rate: a page of 50 jobs takes about 2.6 seconds. The HTTP cache is kept between
syncs with `actions/cache`, so unchanged responses are revalidated, which
doesn't count against the rate limit. The first sync with `issue_labels` makes
about 330 more requests for it. Until `pull_merged_by` reads all of about
17,000 pull requests, which takes about 15 syncs, and `reviews` reads all of
about 23,000 again, which takes about 20 syncs, every sync makes 2,400 more
requests, and takes about 40 minutes longer. The first sync of every quarter
reads about 600 profiles, which takes about 10 minutes.

## Slack

The workspace is on the free plan, which shows only messages from the last 90
days, so these tables are the only copy of older messages, since 2015.
`sync/slack/` reads the channels listed in its steps, using the spec in
[`specs/slack.json`](specs/README.md), and the `SLACK_API_TOKEN` secret:

* `users` and `channels` get a row for every new version. A channel changing
  only its number of members doesn't get one.
* `channel_members` gets a row when a member joins a channel, and another one
  with `removed_at` when they leave.
* `messages` are read for the last 90 days every time, so edits, reactions, and
  replies counts are updated, and deleted messages stay saved.
* `replies` of a thread are read again when its number of replies or its latest
  reply changes. Only threads that the sync saw in the last 90 days are read,
  because reading a deleted thread fails the whole batch.

If the sync doesn't run for more than 90 days, messages from the gap are lost.

`users.list` and `conversations.list` allow about 20 requests per minute, so
the catalog allows 0.3 requests per second, and waits up to 2 minutes when
Slack asks to with `Retry-After`. A weekly sync takes about 10 minutes, mostly
reading users and members of large channels.

## History

Until November 2026, the syncs used trino-rest, and wrote Hive tables in
another AWS account. The migration plan, with the differences found between
the old and new tables, is in
[`sync/MIGRATION.md`](https://github.com/trinodb/reports/blob/9549141363890744def679a64ae414ff76eb3252/sync/MIGRATION.md)
in the history of this repository. The tables were copied to the new account,
and missing values, which trino-rest saved as `0`, empty strings, or timestamps
at the Unix epoch, were replaced with `NULL`.

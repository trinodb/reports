# Trino reports

Reports about the [Trino](https://github.com/trinodb/trino) project: pull requests, reviews, CI workflows, tests, issues, and Slack.

This repo is an example of using Trino to perform ETL (extract, transform, and load)
and generate basic reports. The complete workflow is:

1. Use [a custom connector](https://github.com/nineinchnick/trino-openapi) to read Github's API data and save it into Iceberg tables in an S3 bucket.
1. Run some [queries](https://github.com/trinodb/reports/blob/master/sql) to analyze the data stored in the S3 bucket, save results to a file and publish it to [Github Pages](https://trinodb.github.io/reports/reports/).

All the of the above is repeatable and executed on a schedule using Github Actions.

Queries could be executed against the tables in the Github connector, but it has a few downsides:
* it would perform many API requests, possibly hitting rate limits
* range of the data is limited - for example, Github Workflow runs are only available from 2 last months

Data is saved to an S3 bucket, since it's cheap and easy to set-up. Since there's no database server running,
there's no maintenance required.

Materialized views are not used, because incremental updates are tricky and different for many tables (Github API endpoints).

## Usage

To run the queries locally:
* download all the custom Trino connectors
* get AWS credentials that can access the Iceberg tables in the `trino-reports-jwas` bucket
* make sure to have the `GITHUB_TOKEN` environment variable set
* start Trino in a container

```bash
# ensure all these environment variables are set to correct values
export AWS_REGION AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN GITHUB_TOKEN
./bin/run-trino.sh
```

The reports read tables and functions built by the queries in `sql/setup`, in the memory catalog, so run these first,
and again after restarting Trino:
```bash
./bin/reports.sh /tmp/setup.md Setup sql/setup/*.sql
```

Now you can run any query from the `sql` directory using [the Trino CLI](https://trino.io/docs/current/installation/cli.html#installation):
```bash
trino trino://localhost:8080/trinocicd/github --output-format=ALIGNED < sql/contributing/04-how-long-it-takes.sql
```

Or generate a whole page:
```bash
./bin/reports.sh /tmp/contributing.md "Contributing to Trino" sql/contributing/*.sql
```

## Sync

[The sync workflow](https://github.com/trinodb/reports/blob/master/.github/workflows/sync.yml):
1. Downloads and extracts a zip with the custom `trino-openapi` connector.
1. Starts Trino in a container with both this additional connector (plugin),
   its [configuration](https://github.com/trinodb/reports/blob/master/catalog/github.properties),
   and [the GitHub spec](https://github.com/trinodb/reports/blob/master/sync/specs) it reads, mounted as volumes.
   It also includes [configuration](https://github.com/trinodb/reports/blob/master/catalog/trinocicd.properties) for a built-in connector
   that can read and write Iceberg tables in an S3 bucket. The AWS credentials come from assuming
   a role with GitHub OIDC, and are passed as environmental variables, together with the `GITHUB_TOKEN`.
1. It runs the [sync program](https://github.com/trinodb/reports/blob/master/sync/Sync.java), which runs the SQL statements from
   [sync/github](https://github.com/trinodb/reports/blob/master/sync/github), like `MERGE INTO trinocicd.github.<table> USING (SELECT ... FROM github.default.<table>)`,
   reading only data that changed since the previous run. See [how the sync works](https://github.com/trinodb/reports/blob/master/sync/README.md) for more details.

## Reports

[The reports workflow](https://github.com/trinodb/reports/blob/master/.github/workflows/reports.yml):
1. Starts Trino in a container with only the connector required to read data from the S3 bucket.
1. Executes the [queries](/sql) of every page, in the order of their names, saving results as a simple text table in a file.
1. Commits the updated results file to this repository, which triggers publishing it to [Github Pages](https://trinodb.github.io/reports/reports/).

Every directory in `sql` is a page, and every file in it is a report:

| Directory          | Page                                                                                 |
| ------------------ | ------------------------------------------------------------------------------------ |
| `sql/setup`        | not a page: tables and functions shared by all reports, built first                  |
| `sql/overview`     | the project in numbers                                                               |
| `sql/contributing` | for contributors: what to expect after opening a pull request, where help is needed  |
| `sql/maintaining`  | for maintainers: pull requests waiting for a decision, the backlog, the review work  |
| `sql/ci-cd`        | merge queue and nightly runs, durations, runner time                                 |
| `sql/tests`        | broken and flaky tests, new failures, causes of failed jobs                          |
| `sql/community`    | growth, regions, companies, releases, issues, Slack                                  |
| `sql/repositories` | clients and tools: open pull requests and issues, first-time contributors, reviewers  |
| `sql/hall-of-fame` | new contributors, milestones, top authors, reviewers, and mergers                    |

To add a report, add a file to one of these directories:
* The first line is a comment with the title, and the next comment lines are the description: what the report shows,
  how to read it, and what to do about it.
* The result is a Markdown table. If the file has the word `chart` anywhere, like in a column title, the result is
  printed in a monospace font instead, so characters line up between rows. Draw with the functions from
  [`sql/setup/01-functions.sql`](/sql/setup/01-functions.sql), like `hbar`, `sparkline`, `stacked`, and `shade`.
* A value like `"label"@https://example.com ` becomes a link; `pr_link` and `user_link` make these.
* Count people with `is_bot`, and read pull requests, their events, CI runs, and contributors from the tables built in
  `sql/setup`, so all pages count the same things.

# Trino reports

Reports about the [Trino](https://github.com/trinodb/trino) project, published at
**[trinodb.github.io/reports](https://trinodb.github.io/reports/)**: what needs attention now, what to expect when you
contribute, how CI is doing, and who the community is. They're generated every day from GitHub, Git, and Slack data.

| Page                                                                         | For                                                                    | Queries                                |
| ---------------------------------------------------------------------------- | ---------------------------------------------------------------------- | -------------------------------------- |
| [Overview](https://trinodb.github.io/reports/reports/overview/)              | everyone: what needs attention, the project in numbers, the last month | [`sql/overview`](sql/overview)         |
| [Contributing](https://trinodb.github.io/reports/reports/contributing/)      | contributors: what to expect after opening a pull request              | [`sql/contributing`](sql/contributing) |
| [Maintaining](https://trinodb.github.io/reports/reports/maintaining/)        | maintainers: pull requests waiting for a decision, the review work     | [`sql/maintaining`](sql/maintaining)   |
| [CI/CD](https://trinodb.github.io/reports/reports/ci-cd/)                    | the merge queue and nightly runs, durations, runner time               | [`sql/ci-cd`](sql/ci-cd)               |
| [Tests](https://trinodb.github.io/reports/reports/tests/)                    | broken and flaky tests, new failures, causes of failed jobs            | [`sql/tests`](sql/tests)               |
| [Community](https://trinodb.github.io/reports/reports/community/)            | growth, regions, companies, releases, issues, Slack                    | [`sql/community`](sql/community)       |
| [Clients and tools](https://trinodb.github.io/reports/reports/repositories/) | the other repositories: open pull requests and issues, reviewers       | [`sql/repositories`](sql/repositories) |
| [Hall of fame](https://trinodb.github.io/reports/reports/hall-of-fame/)      | new contributors, milestones, top authors, reviewers, and mergers      | [`sql/hall-of-fame`](sql/hall-of-fame) |

Something wrong, or missing? [Open an issue](https://github.com/trinodb/reports/issues), or change a report: every
section of a page is one SQL file.

## How it works

Everything is SQL, run by Trino. Two small Java programs only run the SQL files, in order:

```
GitHub and Slack APIs -> trino-openapi connector -> sync/Sync.java runs sync/github/*.sql  -> Iceberg tables in S3
                                                    every 2 hours, only what changed

Iceberg tables + trinodb/trino Git repository   -> sql/Reports.java runs sql/<page>/*.sql -> reports/<page>/index.md
                         (trino-git connector)      daily, printed with the Trino CLI         -> GitHub Pages
```

* **The sync** copies data from the APIs with the [trino-openapi](https://github.com/nineinchnick/trino-openapi)
  connector, which turns OpenAPI specs into tables. Every step is a `MERGE` from an API table into an Iceberg table.
  `Sync.java` needs only the Trino JDBC driver. See [how the sync works](sync/README.md).
* **The reports** are queries over those tables, and over the Git history read by the
  [trino-git](https://github.com/nineinchnick/trino-git) connector. `Reports.java` prints their results with the table
  printers of the Trino CLI, as Markdown or monospace tables, and the [workflow](.github/workflows/reports.yml) commits
  the pages, which GitHub Pages publishes with Jekyll.
* **There's no database server.** The tables are files in S3, and the workflows compact them.

## Find your way around

| Path                                           | What's there                                                                    |
| ---------------------------------------------- | ------------------------------------------------------------------------------- |
| [`sql/<page>/`](sql)                           | the queries of one page, one file for every section, in the order of the page   |
| [`sql/setup/`](sql/setup)                      | tables and functions that all reports use, like `pr_link` and `sparkline`       |
| [`sql/pages.properties`](sql/pages.properties) | the pages and their titles                                                      |
| [`sql/Reports.java`](sql/Reports.java)         | generates the pages                                                             |
| [`sync/`](sync)                                | the sync program, its steps for GitHub and Slack, the API specs, and table care |
| [`bin/`](bin)                                  | scripts to start Trino, run the sync, and generate the pages                    |
| [`catalog/`](catalog), [`etc/`](etc)           | the configuration of Trino and of its catalogs                                  |
| [`.github/workflows/`](.github/workflows)      | the schedules of the sync, the reports, and the table maintenance               |
| [`reports/`](reports)                          | the generated pages; edit only `index.md`                                       |

The workflows run the same scripts from `bin/` as you do locally, with the versions in
[`bin/versions.env`](bin/versions.env).

## Change or add a report

Add a `.sql` file to the directory of a page, or change one:

* The first line is a comment with the title. The next comment lines are the description: what the report shows, how
  to read it, and what to do about it.
* The result is a Markdown table. If the file has the word `chart` anywhere, like in a column title, it's printed in a
  monospace font instead, so characters line up between rows. Draw with the functions from
  [`sql/setup/01-functions.sql`](sql/setup/01-functions.sql), like `hbar`, `sparkline`, `stacked`, and `shade`.
* A value like `"label"@https://example.com ` becomes a link. `pr_link` and `user_link` make them, and `section_link`
  links to a report on another page by its title.
* Leave out bots with `is_bot`, and read pull requests, their events, CI runs, and contributors from the tables built
  in `sql/setup`, so all pages count the same things.

Try it locally, as described below, and open a pull request. The pages are generated again when it's merged.

To add a page, add its directory to [`sql/pages.properties`](sql/pages.properties), to `nav_pages` in
[`_config.yml`](_config.yml), and to [`reports/index.md`](reports/index.md).

## Run it locally

You need Docker and Java 25. The tables are in a private S3 bucket, so build a copy of recent history on your disk,
with any GitHub token, and generate a page from it:

```shell
export GITHUB_TOKEN=$(gh auth token)
./bin/run-trino.sh --local git github
export SYNC_TRINO_URL=jdbc:trino://localhost:8080
# a few weeks of trinodb/trino, without CI; 2 days take about 4 minutes, see sync/README.md
SYNC_STEPS_DIR=sync/github SYNC_OWNER=trinodb SYNC_REPO=trino SYNC_SINCE=2026-10-15 \
    SYNC_STEPS=tables,commits,issues,issue_comments,pulls,pull_commits,pull_stats,review_comments,reviews,users \
    ./bin/sync.sh
# empty Slack tables, which some reports read
SYNC_STEPS_DIR=sync/slack SYNC_STEPS=tables ./bin/sync.sh
./bin/reports.sh overview
```

The page is in `reports/overview/index.md`, and reports about longer periods show only what the copy has. Run a query
with `docker exec -it trino trino --catalog trinocicd --schema github`, and stop Trino with `docker rm -f trino`.

With access to the AWS account, start Trino on the real tables instead, with the AWS credentials and region in the
environment, and generate all pages:

```shell
export AWS_REGION=eu-central-1 AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
./bin/run-trino.sh git
./bin/reports.sh
```

## Design notes

* The reports read copies of the data, not the APIs, because the APIs limit requests, and keep only recent data:
  GitHub returns jobs only for runs from the last 2 months, and the free Slack plan shows only the last 90 days.
* The copies are Iceberg tables in S3, because they're cheap and need no server.
* The sync doesn't use materialized views, because every API needs its own way of reading only what changed.

# trino-cicd

Analysis of the [Trino](https://github.com/trinodb/trino) project CI workflows.

This repo is an example of using Trino to perform ETL (extract, transform, and load)
and generate basic reports. The complete workflow is:

1. Use [a custom connector](https://github.com/nineinchnick/trino-rest) to read Github's API data and save it into an S3 bucket.
1. Run some [queries](https://github.com/nineinchnick/trino-cicd/blob/master/sql) to analyze the data stored in the S3 bucket, save results to a file and publish it to [Github Pages](https://nineinchnick.github.io/trino-cicd/reports/).

All the of the above is repeatable and executed on a schedule using Github Actions.

Queries could be executed against the tables in the Github connector, but it has a few downsides:
* it would perform many API requests, possibly hitting rate limits
* range of the data is limited - for example, Github Workflow runs are only available from 2 last months

Data is saved to an S3 bucket, since it's cheap and easy to set-up. Since there's no database server running,
there's no maintenance required.

Materialized views are not used, because incremental updates are tricky and different for many tables (Github API endpoints).

## Sync

[The sync workflow](https://github.com/nineinchnick/trino-cicd/blob/master/.github/workflows/sync.yml):
1. Downloads and extracts a zip with the custom `trino-rest` connector.
1. Starts Trino in a container with both this additional connector (plugin)
   and its [configuration](https://github.com/nineinchnick/trino-cicd/blob/master/catalog/github.properties) mounted as volumes.
   It also includes [configuration](https://github.com/nineinchnick/trino-cicd/blob/master/catalog/hive.properties) for a built-in connector
   that can read and write to an S3 bucket. The required credentials are passed
   as environmental variables, populated from Github Secrets.
1. It runs a series of queries similar to `INSERT INTO hive.<table> SELECT * FROM github.<table>`
   to save the data. See the [Sync](https://github.com/nineinchnick/trino-rest/blob/master/trino-rest-github/src/main/java/pl/net/was/rest/github/Sync.java)
   class from `trino-rest` for more details.

## Reports

[The reports workflow](https://github.com/nineinchnick/trino-cicd/blob/master/.github/workflows/reports.yml):
1. Starts Trino in a container with only the connector required to read data from the S3 bucket.
1. Executes multiple [queries](/sql), saving results as a simple text table in a file.
1. Commits the updated results file to this repository, which triggers publishing it to [Github Pages](https://nineinchnick.github.io/trino-cicd/reports/).

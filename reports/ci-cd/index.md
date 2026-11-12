---
title: Trino CI/CD Reports
---

## CI health at a glance

How often the `ci` workflow passes, by what started it. The pass rate is passed / (passed + failed) runs, for the last 7 days, the 7 days before, and the last 30 days. In the merge queue, a failing job cancels the rest of the run, so such runs count as failed; other cancelled runs (superseded or removed from the queue) are not counted.
A merge queue or nightly run that fails points to a broken or flaky test on master, not to an unfinished change: see "Which jobs fail in the merge queue and nightly runs" below. One character of the chart is one day; a dot is a day where every run failed.

<pre><code>
  Started by  | Runs, 7 days | Change | Passed, 7 days | Previous 7 days | 30 days | Cancelled | Re-run | Passed per day, 30 days chart  
--------------+--------------+--------+----------------+-----------------+---------+-----------+--------+--------------------------------
 merge queue  |          119 | ▲ +34% | 62%            | 74%             | 68%     | 23%       | 2%     | ▇▇▇█▆▆█▆▆▅▆▄▆▅▆▅██▃█▆▇▆▇▅▇▅▅▅▄ 
 pull request |          354 | ▼ -13% | 78%            | 80%             | 76%     | 32%       | 6%     | ▆▆▇█▇▆▆▆▆▆▄█▆▆▆▇▆█▇▇▇▇▇▇▆▇▆▆▇█ 
 scheduled    |            7 | = 0%   | 43%            | 57%             | 40%     | 0%        | 0%     | ..........██.██████...█.███... 
(3 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/a7539d1e2536445269124ac9ee07122a28926ef0/sql/ci-cd/01-health.sql)

## Merge queue outcomes per week

Every pull request is tested again in the merge queue before it is merged. In the bar, █ passed, ▒ failed, ░ cancelled. When a job fails, the merge queue cancels the rest of the run to save runners, so these runs count as failed. A run is cancelled without a failure when its queue entry is removed or rebuilt, for example because an entry ahead of it failed.
A low success rate means that pull requests that passed their own checks fail after they are combined with master: look for flaky tests in "Which jobs fail in the merge queue and nightly runs". The newest week is not complete.

<pre><code>
    Week    | Runs | Passed | Failed | Cancelled | Success rate |     Passed, failed, cancelled chart      
------------+------+--------+--------+-----------+--------------+------------------------------------------
 2026-11-09 |   93 |     39 |     29 |        25 | 57%          | █████████████████▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░ 
 2026-11-02 |   84 |     59 |     20 |         5 | 75%          | ████████████████████████████▒▒▒▒▒▒▒▒▒▒░░ 
 2026-10-26 |  127 |     79 |     38 |        10 | 68%          | █████████████████████████▒▒▒▒▒▒▒▒▒▒▒▒░░░ 
 2026-10-19 |  130 |     72 |     40 |        18 | 64%          | ██████████████████████▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░ 
 2026-10-12 |  132 |     74 |     27 |        31 | 73%          | ██████████████████████▒▒▒▒▒▒▒▒▒░░░░░░░░░ 
 2026-10-05 |  161 |     94 |     43 |        24 | 69%          | ███████████████████████▒▒▒▒▒▒▒▒▒▒▒░░░░░░ 
 2026-09-28 |   96 |     63 |     26 |         7 | 71%          | ██████████████████████████▒▒▒▒▒▒▒▒▒▒▒░░░ 
 2026-09-21 |   91 |     55 |     30 |         6 | 65%          | ████████████████████████▒▒▒▒▒▒▒▒▒▒▒▒▒░░░ 
 2026-09-14 |  373 |    100 |    180 |        93 | 36%          | ███████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░ 
 2026-09-07 |  198 |     54 |     90 |        54 | 38%          | ███████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░ 
 2026-08-31 |   70 |     30 |     32 |         8 | 48%          | █████████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░ 
 2026-08-24 |  104 |     42 |     43 |        19 | 49%          | ████████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░ 
 2026-08-17 |  687 |     71 |    384 |       232 | 16%          | ████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░ 
(13 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/a7539d1e2536445269124ac9ee07122a28926ef0/sql/ci-cd/02-merge-queue-outcomes.sql)

## Which jobs fail in the merge queue and nightly runs

Jobs that failed in the last 14 days in runs of master: the merge queue and the nightly scheduled run. These changes already passed their own checks, so a failure here points to a flaky test or a broken dependency, not to the change. Fix the top rows first.
Failure rate is failed / (passed + failed) runs of the job, re-runs included. One character of the chart is one day, oldest on the left; a dot is a day without failures. The `build-success` job, which only sums up the others, is left out.

<pre><code>
                      Job                      | Failures | In merge queue | In nightly | Failure rate | Failures per day chart 
-----------------------------------------------+----------+----------------+------------+--------------+------------------------
 test (plugin/trino-bigquery)                  |       13 |             11 |          2 | 9%           | ...▃▃.▆█..▃▆▃▆         
 test (core/trino-main)                        |       11 |              9 |          2 | 9%           | ▂.█▂▂▂.▂......         
 test (plugin/trino-base-...ugin/trino-thrift) |       11 |             10 |          1 | 6%           | ....▂▄..▂..█▂▂         
 test (plugin/trino-hive)                      |        8 |              5 |          3 | 6%           | ......▂...▂█▂▂         
 test (testing/trino-tests)                    |        5 |              5 |          0 | 4%           | .......▃..█▃..         
 mvnd-build                                    |        3 |              3 |          0 | 5%           | ..........█...         
 pt (SuiteDeltaLakeDatabricks154)              |        3 |              3 |          0 | 3%           | .....█.....██.         
 pt (SuiteAzure)                               |        3 |              2 |          1 | 2%           | ....█........▄         
 test (plugin/trino-iceberg, cloud-tests)      |        3 |              2 |          1 | 2%           | ....█.........         
 test (plugin/trino-bigquery, cloud-tests-2)   |        2 |              0 |          2 | 14%          | ....█..█......         
 pt (SuiteHiveTransactional)                   |        2 |              2 |          0 | 2%           | ......█.....█.         
 pt (SuiteDeltaLakeOss)                        |        2 |              2 |          0 | 2%           | ........█...█.         
 test (plugin/trino-elasticsearch)             |        2 |              1 |          1 | 1%           | ...█........█.         
 pt (SuiteDeltaLakeDatabricks18)               |        1 |              1 |          0 | 1%           | ...........█..         
 pt (SuiteIceberg)                             |        1 |              1 |          0 | 1%           | ............█.         
 pt (SuiteIcebergVariants)                     |        1 |              1 |          0 | 1%           | ............█.         
 test (plugin/trino-oracle)                    |        1 |              0 |          1 | 1%           | ...........█..         
 test (plugin/trino-delta-lake)                |        1 |              1 |          0 | 1%           | .........█....         
 test (plugin/trino-postgresql)                |        1 |              0 |          1 | 1%           | ...█..........         
 test (plugin/trino-mongodb)                   |        1 |              1 |          0 | 1%           | ..█...........         
 pt (SuiteHmsOnly)                             |        1 |              1 |          0 | 1%           | .............█         
 test-other-modules                            |        1 |              1 |          0 | 1%           | ............█.         
 build-test-matrix                             |        1 |              1 |          0 | &lt;1%          | ......█.......         
(23 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/a7539d1e2536445269124ac9ee07122a28926ef0/sql/ci-cd/03-failing-jobs.sql)

## How long a CI run takes

Time from the start of a `ci` run until its result, for runs that passed on the first attempt, so it is how long you wait for a green build. In the bars, █ is the median and ░ reaches the P90 (one run in ten takes longer).
A pull request is tested twice: once on its own, and again in the merge queue before it is merged. The newest week is not complete.

<pre><code>
    Week    | PR runs | PR median | PR P90  | Pull request chart | Queue runs | Queue median | Queue P90 |    Merge queue chart     
------------+---------+-----------+---------+--------------------+------------+--------------+-----------+--------------------------
 2026-11-09 |     104 | 36m 31s   | 39m 57s | ██████████         |         37 | 44m 02s      | 1h 03m    | ████████████░░░░░        
 2026-11-02 |     171 | 36m 43s   | 44m 05s | ██████████░░       |         59 | 48m 20s      | 1h 05m    | █████████████░░░░        
 2026-10-26 |     263 | 35m 54s   | 41m 28s | █████████░░        |         76 | 52m 42s      | 1h 07m    | ██████████████░░░░       
 2026-10-19 |     163 | 37m 59s   | 45m 05s | ██████████░░       |         72 | 52m 40s      | 1h 10m    | ██████████████░░░░░      
 2026-10-12 |     162 | 37m 25s   | 41m 20s | ██████████░        |         74 | 1h 02m       | 1h 31m    | █████████████████░░░░░░░ 
 2026-10-05 |     195 | 37m 42s   | 41m 29s | ██████████░        |         93 | 52m 26s      | 1h 28m    | ██████████████░░░░░░░░░  
 2026-09-28 |     168 | 37m 42s   | 41m 46s | ██████████░        |         63 | 50m 39s      | 56m 45s   | █████████████░░          
 2026-09-21 |     137 | 38m 11s   | 43m 05s | ██████████░        |         55 | 47m 21s      | 1h 03m    | ████████████░░░░░        
 2026-09-14 |     231 | 37m 47s   | 41m 48s | ██████████░        |         99 | 54m 26s      | 1h 20m    | ██████████████░░░░░░░    
 2026-09-07 |     125 | 38m 49s   | 43m 52s | ██████████░░       |         54 | 51m 21s      | 1h 06m    | █████████████░░░░        
 2026-08-31 |      90 | 39m 00s   | 47m 08s | ██████████░░       |         30 | 41m 58s      | 52m 06s   | ███████████░░░           
 2026-08-24 |     107 | 38m 50s   | 46m 43s | ██████████░░       |         42 | 44m 16s      | 51m 34s   | ████████████░░           
 2026-08-17 |     173 | 53m 43s   | 1h 00m  | ██████████████░░   |         69 | 56m 53s      | 1h 14m    | ███████████████░░░░░     
(13 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/a7539d1e2536445269124ac9ee07122a28926ef0/sql/ci-cd/04-run-duration.sql)

## Runner hours per week

What CI costs: the time all jobs of all workflows ran on GitHub runners, by what started them. In the bar, █ is pull requests, ▓ the merge queue, ▒ nightly runs, and ░ everything else. Re-runs are included, cancelled jobs count for the time they ran.
"Hours per merged PR" divides the runner hours of the week by the pull requests merged that week, so it also carries the cost of pull requests that were closed or are still open. The newest week is not complete, and job data covers only the last 2 months.

<pre><code>
    Week    | Runner hours | Pull requests | Merge queue | Nightly | Merged PRs | Hours per merged PR |       Runner hours chart       
------------+--------------+---------------+-------------+---------+------------+---------------------+--------------------------------
 2026-11-09 |         3534 | 62%           | 35%         | 2%      |         38 |                  93 | █████████▓▓▓▓▓                 
 2026-11-02 |         5164 | 71%           | 26%         | 3%      |         58 |                  89 | ███████████████▓▓▓▓▓▒          
 2026-10-26 |         6553 | 68%           | 30%         | 2%      |         76 |                  86 | ██████████████████▓▓▓▓▓▓▓▓▒    
 2026-10-19 |         7055 | 64%           | 31%         | 2%      |         71 |                  99 | ███████████████████▓▓▓▓▓▓▓▓▓░  
 2026-10-12 |         6117 | 59%           | 38%         | 2%      |         69 |                  89 | ███████████████▓▓▓▓▓▓▓▓▓▒      
 2026-10-05 |         7354 | 60%           | 37%         | 2%      |         93 |                  79 | ██████████████████▓▓▓▓▓▓▓▓▓▓▓▒ 
 2026-09-28 |         5913 | 72%           | 25%         | 2%      |         63 |                  94 | █████████████████▓▓▓▓▓▓▓       
 2026-09-21 |         5206 | 71%           | 28%         | 0%      |         54 |                  96 | ███████████████▓▓▓▓▓▓          
(8 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/a7539d1e2536445269124ac9ee07122a28926ef0/sql/ci-cd/05-runner-hours.sql)

## Which jobs take the most runner time

The 30 jobs of the `ci` workflow that used the most runner time in the last 30 days, in all runs. Share is the job's part of the runner time of all `ci` jobs. Median and P90 are for runs of the job that passed.
Change compares the median of the last 7 days with the 23 days before. Each character of the chart is the median duration on one day, oldest on the left, on the scale of that row; a space is a day without runs. Making a job at the top shorter, or running it less often, saves the most.

<pre><code>
                   Job                    | Runs | Passed | Median  |   P90   | Hours | Share | Change | Median per day, 30 days chart  
------------------------------------------+------+--------+---------+---------+-------+-------+--------+--------------------------------
 test (testing/trino-tests)               | 1758 | 94%    | 29m 36s | 31m 47s |   722 | 2.8%  | ▼ -3%  | ██████████████████▇████▇██████ 
 test (plugin/trino-ic... floci-and-avro) | 1670 | 98%    | 30m 20s | 32m 51s |   708 | 2.8%  | ▼ -3%  | ███▇██████████████████████████ 
 pt (SuiteIceberg)                        | 1637 | 99%    | 26m 45s | 30m 37s |   665 | 2.6%  | = 0%   | ██████████████████████████████ 
 pt (SuiteDeltaLakeOss)                   | 1533 | 100%   | 29m 09s | 32m 37s |   635 | 2.5%  | ▼ -5%  | ███▇██████▇███████████████████ 
 test (plugin/trino-iceberg)              | 1679 | 96%    | 25m 52s | 28m 04s |   618 | 2.4%  | ▼ -6%  | ████▇████████████████████▇████ 
 test (testing/trino-f...t-tolerant-hive) | 1817 | 98%    | 21m 56s | 23m 41s |   575 | 2.2%  | ▼ -8%  | ████████████████████████▇█████ 
 pt (SuiteHiveTransactional)              | 1505 | 98%    | 23m 19s | 25m 43s |   538 | 2.1%  | ▼ -3%  | ██████████████████████████████ 
 error-prone-checks                       | 2095 | 95%    | 12m 00s | 32m 46s |   492 | 1.9%  | ▲ +89% | ▃▃▃▄▄▄▄▅▃▆▇▇▇▄▃▇▅▂▂▆▄▇▅▇█▇▇▇▄▂ 
 pt (SuiteIcebergVariants)                | 1638 | 99%    | 17m 59s | 20m 10s |   465 | 1.8%  | ▼ -2%  | ██████████████████████████████ 
 maven-checks 28-ea                       | 2114 | 93%    | 15m 16s | 16m 31s |   460 | 1.8%  | ▼ -1%  | ██████████▇█████████████▇████▇ 
 maven-checks 27                          | 2114 | 93%    | 14m 57s | 16m 12s |   454 | 1.8%  | ▼ -4%  | ███▇▇███████████████████▇████▇ 
 test (plugin/trino-delta-lake)           | 1461 | 98%    | 20m 51s | 23m 24s |   452 | 1.8%  | = 0%   | █████████████████████████████▇ 
 test (plugin/trino-hive)                 | 1425 | 94%    | 21m 27s | 23m 44s |   449 | 1.7%  | ▼ -7%  | █████████████████▇█████▇▇███▇▇ 
 test (plugin/trino-hive, test-parquet)   | 1414 | 99%    | 19m 48s | 23m 32s |   424 | 1.6%  | ▲ +2%  | ▇▇▇▇▇▇▇▇████████████████▇█████ 
 test (plugin/trino-druid)                | 1201 | 98%    | 23m 16s | 26m 51s |   419 | 1.6%  | ▼ -17% | ██████████████▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 
 test (core/trino-main)                   | 1155 | 95%    | 25m 36s | 27m 37s |   410 | 1.6%  | ▼ -7%  | ██████████████▇████▇█████▇██▇█ 
 test (testing/trino-f...olerant-iceberg) | 1813 | 98%    | 14m 17s | 15m 22s |   392 | 1.5%  | ▼ -4%  | ██████████████████████████████ 
 pt (SuiteDeltaLakeDatabricks18)          | 1485 | 99%    | 3m 06s  | 47m 16s |   377 | 1.5%  | ▼ -19% | ▁▁▁█▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▂▁▁▁▁▁▁▁▆▅ 
 pt (SuiteStorageFormatsDetailed)         | 1637 | 100%   | 13m 22s | 15m 28s |   355 | 1.4%  | ▼ -4%  | ████████████████████████████▇▇ 
 test (plugin/trino-hive, fte-tests)      | 1413 | 99%    | 16m 08s | 17m 14s |   351 | 1.4%  | = 0%   | ██████████████████████████████ 
 test (plugin/trino-iceberg, fte-tests)   | 1666 | 99%    | 13m 21s | 14m 32s |   349 | 1.4%  | ▲ +1%  | ██████████████████████████████ 
 artifact-checks                          | 2098 | 98%    | 10m 18s | 11m 38s |   332 | 1.3%  | ▲ +4%  | █▇█▇▇█████████████████████████ 
 test-other-modules                       | 2095 | 97%    | 11m 05s | 16m 26s |   329 | 1.3%  | ▲ +21% | ▄▇▄▇▆▇▆█▇▇▇██▆▅▇▅▂▆▇▄█▇▇████▆▃ 
 pt (SuiteCompatibility)                  | 1636 | 100%   | 11m 59s | 14m 13s |   323 | 1.3%  | ▼ -4%  | ████████████████████████████▇█ 
 pt (SuiteTpcds)                          | 1499 | 100%   | 13m 36s | 15m 42s |   321 | 1.2%  | ▼ -6%  | █████████████████▇██████▇█████ 
 test (plugin/trino-de...lake, fte-tests) | 1459 | 99%    | 13m 55s | 15m 12s |   318 | 1.2%  | ▼ -1%  | ██████████████████████████████ 
 pt (SuiteKafka)                          | 1401 | 100%   | 13m 56s | 16m 02s |   315 | 1.2%  | ▼ -4%  | ████████████████████████████▇█ 
 test-jdbc-compatibility                  | 2097 | 97%    | 10m 12s | 13m 21s |   304 | 1.2%  | ▲ +9%  | ▆▇▅▇▆▇▇▇█▇█▆▇▆▆▇▆▃▅▇▅▇▇▇▇▇▇▇▆▃ 
 test (plugin/trino-postgresql)           | 1212 | 98%    | 16m 10s | 18m 36s |   304 | 1.2%  | ▼ -3%  | ███████████████▇██▇▇█▇██▇▇▇▇▇▇ 
 test (plugin/trino-oracle)               | 1201 | 98%    | 15m 15s | 16m 45s |   282 | 1.1%  | ▼ -1%  | ██████████████████████████████ 
(30 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/a7539d1e2536445269124ac9ee07122a28926ef0/sql/ci-cd/06-jobs-duration.sql)

## Where runner time goes, by step

The steps of `ci` jobs that used the most runner time in the last 4 weeks, summed over all jobs that run them, as a share of the runner time of all `ci` jobs. Steps are recorded only for some runs since 2026-10-15, so this is a sample.
Steps other than the tests, like building, checking out, and setting up, are paid again in every job: making them faster saves time in every run.

| Step                                      | Share of runner time | Median  |
| ----------------------------------------- | -------------------- | ------- |
| Maven Tests                               | 33%                  | 5m 26s  |
| Product Tests \(JUnit suites\)            | 24%                  | 2m 34s  |
| Maven Install                             | 10%                  | 1m 54s  |
| Product tests artifact                    | 6%                   | 50s     |
| Run .github/actions/setup                 | 5%                   | 30s     |
| Run actions/checkout@v7.0.1               | 4%                   | 24s     |
| Maven Checks                              | 4%                   | 11m 52s |
| Load Trino Docker image for product tests | 2%                   | 24s     |
| Error Prone Checks                        | 1%                   | 10m 12s |
| Set up job                                | 1%                   | 7s      |
| Upload test results                       | 1%                   | 12s     |
| Product test distribution                 | 1%                   | 7s      |

[query](https://github.com/trinodb/reports/blob/a7539d1e2536445269124ac9ee07122a28926ef0/sql/ci-cd/07-runner-time-by-step.sql)

## When CI is busy

How many jobs of all workflows run at the same time, by weekday and hour of the day (UTC), on average over the last 4 weeks. The darkest cells, █, have at least three quarters of the jobs of the busiest hour. Peak is the most jobs running at the same moment on that weekday.
So far, the number of running jobs has not gone above 500, and it stays at 500 for minutes when it gets there, so 500 looks like the most jobs that can run at once: then new jobs wait for a runner. Pushing many changes at the busiest hours makes this more likely.

<pre><code>
  Weekday  | Hours of the day, UTC, chart | Average jobs running | Peak 
-----------+------------------------------+----------------------+------
 Hour      | 0     6     12    18         |                      |      
 Monday    | ▒░░░░░▓▓▒▒▒▒▓▓▓▒▓▓▒▒░▒░▒     |                   48 |  474 
 Tuesday   | ▒░░░░▒▒▒▒▒▓▓▓▓▓▒▒▒▒▒▒░░░     |                   46 |  489 
 Wednesday | ▒░░░▒▒▓▓▒░▒▒▒▒▒▒▒▒▒░▒▒▒▒     |                   45 |  473 
 Thursday  | ▒░░░░░▒▒▒▒░▒▒░▒░▒▒▒░▒▒░░     |                   34 |  248 
 Friday    | ░░░▒▒▒▓▒▓░▓▓▓▒▒▓█▒▒▒▒▒░░     |                   51 |  400 
 Saturday  | ░░░░░░░░░░░░░░░░░░░░░░░░     |                   13 |  188 
 Sunday    | ░░░░░░▒░░░░░░░░░░▒▒░░░░▒     |                   20 |  399 
(8 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/a7539d1e2536445269124ac9ee07122a28926ef0/sql/ci-cd/08-busy-hours.sql)

## How long jobs wait for a runner

Time from when a job is queued until a runner starts it, by runner type, for jobs of all workflows in the last 4 weeks (wait times are recorded only for some runs since 2026-10-15). P90: one job in ten waits longer.
If waits grow, CI has reached the most jobs it can run at once: see the peaks in "When CI is busy".

| Runner type   |  Jobs | Median wait | P90 wait | Longest wait | Waited over a minute |
| ------------- | -----:| ----------- | -------- | ------------ | --------------------:|
| ubuntu-latest | 33016 | 2s          | 3s       | 4m 00s       |                    8 |
| macos-latest  |   130 | 3s          | 8s       | 13s          |                    0 |

[query](https://github.com/trinodb/reports/blob/a7539d1e2536445269124ac9ee07122a28926ef0/sql/ci-cd/09-queue-time.sql)

Generated on Thu Nov 12 08:27:17 UTC 2026

---
title: Trino CI/CD Reports
---

## CI health at a glance

How often the `ci` workflow passes, by what started it. The pass rate is passed / (passed + failed) runs, for the last 7 days, the 7 days before, and the last 30 days. In the merge queue, a failing job cancels the rest of the run, so such runs count as failed; other cancelled runs (superseded or removed from the queue) are not counted.
A merge queue or nightly run that fails points to a broken or flaky test on master, not to an unfinished change: see "Which jobs fail in the merge queue and nightly runs" below. One character of the chart is one day; a dot is a day where every run failed.

<pre><code>
  Started by  | Runs, 7 days | Change | Passed, 7 days | Previous 7 days | 30 days | Cancelled | Re-run | Passed per day, 30 days chart  
--------------+--------------+--------+----------------+-----------------+---------+-----------+--------+--------------------------------
 merge queue  |          162 | ▲ +59% | 57%            | 82%             | 67%     | 15%       | 1%     | ▅▆▅██▃█▆▇▆▇▅▇▅▅▅▇▇█.▆█▇▄▆▆▇▇▂▆ 
 pull request |          466 | ▲ +35% | 76%            | 82%             | 78%     | 27%       | 6%     | ▆▆▇▆█▇▇▇▇▇▇▆▇▆▆▇▇▇███▇▇▇▇▇▇▆▆▆ 
 scheduled    |            7 | = 0%   | 71%            | 86%             | 70%     | 0%        | 0%     | ██████...█.███...███████.████. 
(3 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/a10ccfecc2596fbea80abd18628322946696ec45/sql/ci-cd/01-health.sql)

## Merge queue outcomes per week

Every pull request is tested again in the merge queue before it is merged. In the bar, █ passed, ▒ failed, ░ cancelled. When a job fails, the merge queue cancels the rest of the run to save runners, so these runs count as failed. A run is cancelled without a failure when its queue entry is removed or rebuilt, for example because an entry ahead of it failed.
A low success rate means that pull requests that passed their own checks fail after they are combined with master: look for flaky tests in "Which jobs fail in the merge queue and nightly runs". The newest week is not complete.

<pre><code>
    Week    | Runs | Passed | Failed | Cancelled | Success rate |     Passed, failed, cancelled chart      
------------+------+--------+--------+-----------+--------------+------------------------------------------
 2026-11-23 |   62 |     25 |     27 |        10 | 48%          | ████████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░ 
 2026-11-16 |  141 |     87 |     39 |        15 | 69%          | █████████████████████████▒▒▒▒▒▒▒▒▒▒▒░░░░ 
 2026-11-09 |  141 |     77 |     35 |        29 | 69%          | ██████████████████████▒▒▒▒▒▒▒▒▒▒░░░░░░░░ 
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
(13 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/a10ccfecc2596fbea80abd18628322946696ec45/sql/ci-cd/02-merge-queue-outcomes.sql)

## Which jobs fail in the merge queue and nightly runs

Jobs that failed in the last 14 days in runs of master: the merge queue and the nightly scheduled run. These changes already passed their own checks, so a failure here points to a flaky test or a broken dependency, not to the change. Fix the top rows first.
Failure rate is failed / (passed + failed) runs of the job, re-runs included. One character of the chart is one day, oldest on the left; a dot is a day without failures. The `build-success` job, which only sums up the others, is left out.

<pre><code>
                      Job                      | Failures | In merge queue | In nightly | Failure rate | Failures per day chart 
-----------------------------------------------+----------+----------------+------------+--------------+------------------------
 test (plugin/trino-bigquery)                  |       14 |             12 |          2 | 11%          | ▆▃..▆▃.▆▃...█▆         
 test (testing/trino-tests)                    |       10 |             10 |          0 | 6%           | ...▃...█▃▆▃▆..         
 build-pt                                      |       10 |             10 |          0 | 4%           | .......▆....█.         
 artifact-checks                               |        9 |              9 |          0 | 4%           | .......▃....█.         
 test (lib/trino-filesystem-gcs, cloud-tests)  |        7 |              7 |          0 | 4%           | ............█.         
 test-other-modules                            |        6 |              6 |          0 | 3%           | ....▄..█▄.▄▄..         
 test (plugin/trino-iceberg, cloud-tests)      |        5 |              5 |          0 | 3%           | .......▆....█.         
 pt (SuiteAzure)                               |        4 |              4 |          0 | 3%           | ▃.......█.....         
 test (plugin/trino-hive)                      |        3 |              2 |          1 | 2%           | █.............         
 pt (SuiteHudi)                                |        3 |              3 |          0 | 2%           | .......█......         
 pt (SuiteDeltaLakeDatabricks154)              |        2 |              2 |          0 | 2%           | ......█.█.....         
 pt (SuiteHiveSpark)                           |        2 |              2 |          0 | 1%           | ....█.........         
 pt (SuiteGcs)                                 |        2 |              2 |          0 | 1%           | .█.........█..         
 test (plugin/trino-base-...ugin/trino-thrift) |        2 |              2 |          0 | 1%           | █..........█..         
 test (plugin/trino-bigquery, cloud-tests-2)   |        1 |              0 |          1 | 7%           | .............█         
 test (lib/trino-filesyst...blob-cache-memory) |        1 |              1 |          0 | 1%           | ........█.....         
 test (lib/trino-filesyst...zure, cloud-tests) |        1 |              1 |          0 | 1%           | .......█......         
 test (plugin/trino-exasol)                    |        1 |              1 |          0 | 1%           | ........█.....         
 pt (SuiteIcebergVariants)                     |        1 |              1 |          0 | 1%           | .█............         
 test (plugin/trino-elasticsearch)             |        1 |              1 |          0 | 1%           | .........█....         
 test (testing/trino-faul...-tolerant-iceberg) |        1 |              1 |          0 | 1%           | ........█.....         
 pt (SuiteHmsOnly)                             |        1 |              1 |          0 | 1%           | █.............         
 test (testing/trino-faul...lt-tolerant-delta) |        1 |              1 |          0 | &lt;1%          | .......█......         
(23 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/a10ccfecc2596fbea80abd18628322946696ec45/sql/ci-cd/03-failing-jobs.sql)

## How long a CI run takes

Time from the start of a `ci` run until its result, for runs that passed on the first attempt, so it is how long you wait for a green build. In the bars, █ is the median and ░ reaches the P90 (one run in ten takes longer).
A pull request is tested twice: once on its own, and again in the merge queue before it is merged. The newest week is not complete.

<pre><code>
    Week    | PR runs | PR median | PR P90  | Pull request chart | Queue runs | Queue median | Queue P90 |    Merge queue chart     
------------+---------+-----------+---------+--------------------+------------+--------------+-----------+--------------------------
 2026-11-23 |      66 | 34m 26s   | 37m 58s | █████████░         |         25 | 31m 04s      | 52m 55s   | ████████░░░░░░           
 2026-11-16 |     264 | 36m 13s   | 41m 02s | ██████████░        |         85 | 50m 43s      | 1h 08m    | █████████████░░░░░       
 2026-11-09 |     200 | 36m 17s   | 40m 21s | ██████████░        |         75 | 46m 23s      | 1h 23m    | ████████████░░░░░░░░░░   
 2026-11-02 |     171 | 36m 44s   | 44m 05s | ██████████░░       |         59 | 48m 20s      | 1h 05m    | █████████████░░░░        
 2026-10-26 |     263 | 35m 50s   | 41m 30s | █████████░░        |         76 | 53m 08s      | 1h 07m    | ██████████████░░░░       
 2026-10-19 |     163 | 38m 02s   | 45m 05s | ██████████░░       |         72 | 52m 40s      | 1h 10m    | ██████████████░░░░░      
 2026-10-12 |     162 | 37m 23s   | 41m 35s | ██████████░        |         74 | 1h 02m       | 1h 31m    | █████████████████░░░░░░░ 
 2026-10-05 |     195 | 37m 41s   | 41m 30s | ██████████░        |         93 | 52m 25s      | 1h 28m    | ██████████████░░░░░░░░░  
 2026-09-28 |     168 | 37m 37s   | 41m 46s | ██████████░        |         63 | 50m 39s      | 56m 45s   | █████████████░░          
 2026-09-21 |     137 | 38m 12s   | 43m 05s | ██████████░        |         55 | 47m 21s      | 1h 03m    | ████████████░░░░░        
 2026-09-14 |     231 | 37m 46s   | 41m 39s | ██████████░        |         99 | 54m 26s      | 1h 20m    | ██████████████░░░░░░░    
 2026-09-07 |     125 | 38m 49s   | 43m 52s | ██████████░░       |         54 | 51m 21s      | 1h 06m    | █████████████░░░░        
 2026-08-31 |      90 | 39m 00s   | 47m 08s | ██████████░░       |         30 | 41m 58s      | 52m 06s   | ███████████░░░           
(13 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/a10ccfecc2596fbea80abd18628322946696ec45/sql/ci-cd/04-run-duration.sql)

## Runner hours per week

What CI costs: the time all jobs of all workflows ran on GitHub runners, by what started them. In the bar, █ is pull requests, ▓ the merge queue, ▒ nightly runs, and ░ everything else. Re-runs are included, cancelled jobs count for the time they ran.
"Hours per merged PR" divides the runner hours of the week by the pull requests merged that week, so it also carries the cost of pull requests that were closed or are still open. The newest week is not complete, and job data covers only the last 2 months.

<pre><code>
    Week    | Runner hours | Pull requests | Merge queue | Nightly | Merged PRs | Hours per merged PR |       Runner hours chart       
------------+--------------+---------------+-------------+---------+------------+---------------------+--------------------------------
 2026-11-23 |         1922 | 75%           | 22%         | 3%      |         25 |                  77 | ██████▓▓                       
 2026-11-16 |         6969 | 69%           | 27%         | 2%      |         86 |                  81 | ████████████████████▓▓▓▓▓▓▓▒   
 2026-11-09 |         5949 | 65%           | 32%         | 2%      |         74 |                  80 | ████████████████▓▓▓▓▓▓▓▓       
 2026-11-02 |         5164 | 71%           | 26%         | 3%      |         58 |                  89 | ███████████████▓▓▓▓▓▒          
 2026-10-26 |         6553 | 68%           | 30%         | 2%      |         76 |                  86 | ██████████████████▓▓▓▓▓▓▓▓▒    
 2026-10-19 |         7055 | 64%           | 31%         | 2%      |         71 |                  99 | ███████████████████▓▓▓▓▓▓▓▓▓░  
 2026-10-12 |         6117 | 59%           | 38%         | 2%      |         69 |                  89 | ███████████████▓▓▓▓▓▓▓▓▓▒      
 2026-10-05 |         7354 | 60%           | 37%         | 2%      |         93 |                  79 | ██████████████████▓▓▓▓▓▓▓▓▓▓▓▒ 
(8 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/a10ccfecc2596fbea80abd18628322946696ec45/sql/ci-cd/05-runner-hours.sql)

## Which jobs take the most runner time

The 30 jobs of the `ci` workflow that used the most runner time in the last 30 days, in all runs. Share is the job's part of the runner time of all `ci` jobs. Median and P90 are for runs of the job that passed.
Change compares the median of the last 7 days with the 23 days before. Each character of the chart is the median duration on one day, oldest on the left, on the scale of that row; a space is a day without runs. Making a job at the top shorter, or running it less often, saves the most.

<pre><code>
                   Job                    | Runs | Passed | Median  |   P90   | Hours | Share |  Change  | Median per day, 30 days chart  
------------------------------------------+------+--------+---------+---------+-------+-------+----------+--------------------------------
 test (testing/trino-tests)               | 1861 | 92%    | 28m 34s | 31m 35s |   736 | 2.9%  | ▼ -10%   | █████▇████▇█████▇█▇▇███▇▇██▇█▆ 
 test (plugin/trino-ic... floci-and-avro) | 1755 | 98%    | 30m 13s | 33m 34s |   735 | 2.9%  | ▲ +4%    | ██████████████████████████████ 
 test (plugin/trino-iceberg)              | 1758 | 97%    | 25m 55s | 28m 48s |   638 | 2.5%  | ▲ +1%    | ███████████▇▇█▇█▇███████▇▇████ 
 pt (SuiteIceberg)                        | 1584 | 99%    | 26m 32s | 29m 49s |   629 | 2.5%  | ▼ -1%    | ██████████████████████████████ 
 test (testing/trino-f...t-tolerant-hive) | 1920 | 98%    | 21m 41s | 23m 46s |   595 | 2.4%  | ▼ -1%    | ███████████▇██████▇███████████ 
 pt (SuiteDeltaLakeOss)                   | 1467 | 99%    | 27m 35s | 31m 56s |   585 | 2.3%  | ▼ -5%    | ███████████████████▆█▇█████▇▇█ 
 error-prone-checks                       | 2282 | 95%    | 9m 57s  | 30m 53s |   500 | 2.0%  | ▼ -41%   | ▄▃▇▅▂▂▆▄▇▅▇█▇▇▇▄▄▄█▆▅▇█▃▃▃▃▃▃▂ 
 test (plugin/trino-delta-lake)           | 1628 | 98%    | 20m 48s | 23m 16s |   491 | 2.0%  | = 0%     | ██████████████████████████████ 
 maven-checks 28-ea                       | 2303 | 94%    | 14m 39s | 16m 40s |   488 | 1.9%  | ▼ -12%   | ███████████▇██████▇█▇▇█▇██▇▇█▇ 
 pt (SuiteHiveTransactional)              | 1411 | 100%   | 22m 43s | 24m 40s |   487 | 1.9%  | ▼ -2%    | ██████████████████████████████ 
 test (plugin/trino-hive)                 | 1570 | 94%    | 20m 53s | 23m 58s |   482 | 1.9%  | ▼ -1%    | ████▇█████▇▇▇██▇█▇▇████▇▇▇█▇██ 
 maven-checks 27                          | 2303 | 94%    | 14m 25s | 16m 15s |   481 | 1.9%  | ▼ -12%   | ███████████▇█████▇██▇▇█▇▇▇█▇██ 
 test (plugin/trino-hive, test-parquet)   | 1557 | 99%    | 19m 22s | 23m 47s |   450 | 1.8%  | ▼ -13%   | ███████████▇██████▇█████▇█▇▅▅▅ 
 pt (SuiteIcebergVariants)                | 1584 | 99%    | 17m 32s | 19m 35s |   435 | 1.7%  | ▼ -3%    | █████████████████████████████▇ 
 test (core/trino-main)                   | 1249 | 95%    | 24m 56s | 28m 13s |   433 | 1.7%  | = 0%     | █▇████▇█████▇██▇▇▇▇██▇██▇█▇██▆ 
 test (plugin/trino-druid)                | 1326 | 98%    | 21m 06s | 22m 23s |   409 | 1.6%  | ▼ -2%    | █▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 
 test (testing/trino-f...olerant-iceberg) | 1916 | 98%    | 14m 18s | 15m 32s |   408 | 1.6%  | = 0%     | ██████████████████████████████ 
 test (plugin/trino-hive, fte-tests)      | 1556 | 99%    | 16m 17s | 17m 36s |   380 | 1.5%  | ▲ +1%    | ██████████████████████████████ 
 test (plugin/trino-iceberg, fte-tests)   | 1753 | 99%    | 13m 26s | 14m 47s |   361 | 1.4%  | ▼ -4%    | ██████████████████████████████ 
 artifact-checks                          | 2290 | 97%    | 10m 36s | 11m 39s |   360 | 1.4%  | ▼ -5%    | ██████████████████████████████ 
 test-other-modules                       | 2284 | 97%    | 10m 35s | 16m 41s |   351 | 1.4%  | ▲ +14%   | ▆▅▇▅▂▆▇▄█▇▇████▆▄▅█▇▅▇█▇▇▇▇▇▅▃ 
 test (plugin/trino-de...lake, fte-tests) | 1625 | 99%    | 14m 05s | 15m 29s |   349 | 1.4%  | = 0%     | ██████████████████████████████ 
 maven-checks 25.0.5                      | 1597 | 93%    | 14m 51s | 16m 30s |   346 | 1.4%  |          | █████████▇█▇████▇▇██▇▇▇        
 pt (SuiteStorageFormatsDetailed)         | 1584 | 99%    | 12m 38s | 14m 40s |   320 | 1.3%  | ▼ -10%   | ████████████████████████▇▇▇▇▇▇ 
 test (plugin/trino-postgresql)           | 1336 | 98%    | 15m 54s | 18m 10s |   320 | 1.3%  | ▼ -2%    | ██████████████████████████████ 
 test-jdbc-compatibility                  | 2286 | 97%    | 9m 40s  | 13m 03s |   316 | 1.3%  | ▼ -2%    | ▇▆█▆▃▆▇▆█▇█████▇▆▆█▇▇██▆▇▇▇▇▆▃ 
 test (plugin/trino-oracle)               | 1332 | 98%    | 15m 16s | 16m 55s |   307 | 1.2%  | = 0%     | ███████████████████▇██████████ 
 pt (SuiteDeltaLakeDatabricks18)          |  951 | 100%   | 4m 24s  | 50m 22s |   302 | 1.2%  | ▲ +1049% | ▁▁▁▁▁▁▁▂▂▁▁▁▁▁▁██▇▇▇▆███▇▇▆▇▇█ 
 pt (SuiteCompatibility)                  | 1582 | 100%   | 11m 30s | 13m 36s |   294 | 1.2%  | ▼ -7%    | ███████████████▇▇▇▇▇▇▇█▇▇▇▇▇▇▇ 
 pt (SuiteDeltaLakeDatabricks154)         |  951 | 99%    | 4m 18s  | 47m 48s |   290 | 1.2%  | ▲ +1027% | ▁▁▁▁▁▁▁▂▁▁▁▁▁▁▁██▆▇█▇▇█▇▇▇▇▇▇█ 
(30 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/a10ccfecc2596fbea80abd18628322946696ec45/sql/ci-cd/06-jobs-duration.sql)

## Where runner time goes, by step

The steps of `ci` jobs that used the most runner time in the last 4 weeks, summed over all jobs that run them, as a share of the runner time of all `ci` jobs. Steps are recorded only for some runs since 2026-10-15, so this is a sample.
Steps other than the tests, like building, checking out, and setting up, are paid again in every job: making them faster saves time in every run.

<table>
<thead>
<tr><th>Step</th><th>Share of runner time</th><th>Median</th></tr>
</thead>
<tbody>
<tr><td>Maven Tests</td><td>36%</td><td>4m 36s</td></tr>
<tr><td>Product Tests (JUnit suites)</td><td>23%</td><td>2m 49s</td></tr>
<tr><td>Maven Install</td><td>12%</td><td>1m 52s</td></tr>
<tr><td>Maven Checks</td><td>5%</td><td>10m 48s</td></tr>
<tr><td>Run .github/actions/setup</td><td>4%</td><td>28s</td></tr>
<tr><td>Product tests artifact</td><td>4%</td><td>36s</td></tr>
<tr><td>Run actions/checkout@v7.0.1</td><td>4%</td><td>22s</td></tr>
<tr><td>Set up job</td><td>2%</td><td>8s</td></tr>
<tr><td>Upload test results</td><td>1%</td><td>11s</td></tr>
<tr><td>Error Prone Checks</td><td>1%</td><td>5m 06s</td></tr>
<tr><td>Load Trino Docker image for product tests</td><td>1%</td><td>15s</td></tr>
<tr><td>Run .github/actions/compile-commit</td><td>1%</td><td>4m 39s</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/a10ccfecc2596fbea80abd18628322946696ec45/sql/ci-cd/07-runner-time-by-step.sql)

## When CI is busy

How many jobs of all workflows run at the same time, by weekday and hour of the day (UTC), on average over the last 4 weeks. The darkest cells, █, have at least three quarters of the jobs of the busiest hour. Peak is the most jobs running at the same moment on that weekday.
So far, the number of running jobs has not gone above 500, and it stays at 500 for minutes when it gets there, so 500 looks like the most jobs that can run at once: then new jobs wait for a runner. Pushing many changes at the busiest hours makes this more likely.

<pre><code>
  Weekday  | Hours of the day, UTC, chart | Average jobs running | Peak 
-----------+------------------------------+----------------------+------
 Hour      | 0     6     12    18         |                      |      
 Monday    | ▒░░░░░▓▓█▒▒▓▓▒█▒▓▒▒░░▓░▒     |                   35 |  291 
 Tuesday   | ▒▒▒░░▒▒▒▒▒█▓█▓▓█▓▒▓▓▒▒░▒     |                   41 |  489 
 Wednesday | ▒░░▒▒▓█▓▒░▒▓▒░▒▒▒▒▒░▒▓▓▒     |                   38 |  473 
 Thursday  | ▓▒▒▒▒▒▓█▒▒▓█▓▒▓█▓▓▒▒▒▓▓▒     |                   48 |  380 
 Friday    | ▓▒▒▒░▓▓▒▓█▒▒▓▒▓▒█▓▒░▒▓▒▒     |                   46 |  336 
 Saturday  | ▒░░░░░░░░░▒░░░░░░▒░░░▓▒░     |                   17 |  275 
 Sunday    | ▒░▒░░░░░▒░░▒░▒▒░▓▒▒▒▒▒░░     |                   24 |  326 
(8 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/a10ccfecc2596fbea80abd18628322946696ec45/sql/ci-cd/08-busy-hours.sql)

## How long jobs wait for a runner

Time from when a job is queued until a runner starts it, by runner type, for jobs of all workflows in the last 4 weeks (wait times are recorded only for some runs since 2026-10-15). P90: one job in ten waits longer.
If waits grow, CI has reached the most jobs it can run at once: see the peaks in "When CI is busy".

<table>
<thead>
<tr><th>Runner type</th><th style="text-align: right">Jobs</th><th>Median wait</th><th>P90 wait</th><th>Longest wait</th><th style="text-align: right">Waited over a minute</th></tr>
</thead>
<tbody>
<tr><td>ubuntu-latest</td><td style="text-align: right">101634</td><td>2s</td><td>2s</td><td>5m 03s</td><td style="text-align: right">13</td></tr>
<tr><td>macos-latest</td><td style="text-align: right">349</td><td>2s</td><td>3s</td><td>16s</td><td style="text-align: right">0</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/a10ccfecc2596fbea80abd18628322946696ec45/sql/ci-cd/09-queue-time.sql)

Generated on Wed Nov 25 06:15:28 UTC 2026

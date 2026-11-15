---
title: Trino CI/CD Reports
---

## CI health at a glance

How often the `ci` workflow passes, by what started it. The pass rate is passed / (passed + failed) runs, for the last 7 days, the 7 days before, and the last 30 days. In the merge queue, a failing job cancels the rest of the run, so such runs count as failed; other cancelled runs (superseded or removed from the queue) are not counted.
A merge queue or nightly run that fails points to a broken or flaky test on master, not to an unfinished change: see "Which jobs fail in the merge queue and nightly runs" below. One character of the chart is one day; a dot is a day where every run failed.

<pre><code>
  Started by  | Runs, 7 days | Change | Passed, 7 days | Previous 7 days | 30 days | Cancelled | Re-run | Passed per day, 30 days chart  
--------------+--------------+--------+----------------+-----------------+---------+-----------+--------+--------------------------------
 merge queue  |          140 | ▲ +67% | 69%            | 75%             | 69%     | 21%       | 1%     | █▆▆█▆▆▅▆▄▆▅▆▅██▃█▆▇▆▇▅▇▅▅▅▇▇█  
 pull request |          388 | ▲ +17% | 77%            | 81%             | 76%     | 29%       | 5%     | █▇▆▆▆▆▆▄█▆▆▆▇▆█▇▇▇▇▇▇▆▇▆▆▇▇▇█  
 scheduled    |            7 | = 0%   | 57%            | 43%             | 50%     | 0%        | 0%     | .......██.██████...█.███...███ 
(3 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/8fcd363e3023c47a06260d64fb1f9020cfc3c477/sql/ci-cd/01-health.sql)

## Merge queue outcomes per week

Every pull request is tested again in the merge queue before it is merged. In the bar, █ passed, ▒ failed, ░ cancelled. When a job fails, the merge queue cancels the rest of the run to save runners, so these runs count as failed. A run is cancelled without a failure when its queue entry is removed or rebuilt, for example because an entry ahead of it failed.
A low success rate means that pull requests that passed their own checks fail after they are combined with master: look for flaky tests in "Which jobs fail in the merge queue and nightly runs". The newest week is not complete.

<pre><code>
    Week    | Runs | Passed | Failed | Cancelled | Success rate |     Passed, failed, cancelled chart      
------------+------+--------+--------+-----------+--------------+------------------------------------------
 2026-11-09 |  140 |     77 |     34 |        29 | 69%          | ██████████████████████▒▒▒▒▒▒▒▒▒▒░░░░░░░░ 
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
[query](https://github.com/trinodb/reports/blob/8fcd363e3023c47a06260d64fb1f9020cfc3c477/sql/ci-cd/02-merge-queue-outcomes.sql)

## Which jobs fail in the merge queue and nightly runs

Jobs that failed in the last 14 days in runs of master: the merge queue and the nightly scheduled run. These changes already passed their own checks, so a failure here points to a flaky test or a broken dependency, not to the change. Fix the top rows first.
Failure rate is failed / (passed + failed) runs of the job, re-runs included. One character of the chart is one day, oldest on the left; a dot is a day without failures. The `build-success` job, which only sums up the others, is left out.

<pre><code>
                      Job                      | Failures | In merge queue | In nightly | Failure rate | Failures per day chart 
-----------------------------------------------+----------+----------------+------------+--------------+------------------------
 test (plugin/trino-bigquery)                  |       14 |             12 |          2 | 10%          | ▃▃.▆█..▃▆▃▆▃..         
 test (plugin/trino-base-...ugin/trino-thrift) |       11 |             10 |          1 | 6%           | .▂▄..▂..█▂▂...         
 test (plugin/trino-hive)                      |       10 |              7 |          3 | 6%           | ...▂...▂█▂▆...         
 test (testing/trino-tests)                    |        5 |              5 |          0 | 3%           | ....▃..█▃.....         
 test (core/trino-main)                        |        4 |              2 |          2 | 3%           | ███.█.........         
 mvnd-build                                    |        3 |              3 |          0 | 4%           | .......█......         
 pt (SuiteDeltaLakeDatabricks154)              |        3 |              3 |          0 | 2%           | ..█.....██....         
 pt (SuiteAzure)                               |        3 |              2 |          1 | 2%           | .█........▄...         
 test (plugin/trino-iceberg, cloud-tests)      |        3 |              2 |          1 | 2%           | .█............         
 test (plugin/trino-bigquery, cloud-tests-2)   |        2 |              0 |          2 | 14%          | .█..█.........         
 pt (SuiteHiveTransactional)                   |        2 |              2 |          0 | 1%           | ...█.....█....         
 pt (SuiteDeltaLakeOss)                        |        2 |              2 |          0 | 1%           | .....█...█....         
 pt (SuiteIcebergVariants)                     |        2 |              2 |          0 | 1%           | .........█.█..         
 test (plugin/trino-elasticsearch)             |        2 |              1 |          1 | 1%           | █........█....         
 pt (SuiteDeltaLakeDatabricks18)               |        1 |              1 |          0 | 1%           | ........█.....         
 test (plugin/trino-oracle)                    |        1 |              0 |          1 | 1%           | ........█.....         
 test (plugin/trino-postgresql)                |        1 |              0 |          1 | 1%           | █.............         
 pt (SuiteIceberg)                             |        1 |              1 |          0 | 1%           | .........█....         
 test (plugin/trino-delta-lake)                |        1 |              1 |          0 | 1%           | ......█.......         
 pt (SuiteGcs)                                 |        1 |              1 |          0 | 1%           | ...........█..         
 pt (SuiteHmsOnly)                             |        1 |              1 |          0 | 1%           | ..........█...         
 test-other-modules                            |        1 |              1 |          0 | &lt;1%          | .........█....         
 build-test-matrix                             |        1 |              1 |          0 | &lt;1%          | ...█..........         
(23 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/8fcd363e3023c47a06260d64fb1f9020cfc3c477/sql/ci-cd/03-failing-jobs.sql)

## How long a CI run takes

Time from the start of a `ci` run until its result, for runs that passed on the first attempt, so it is how long you wait for a green build. In the bars, █ is the median and ░ reaches the P90 (one run in ten takes longer).
A pull request is tested twice: once on its own, and again in the merge queue before it is merged. The newest week is not complete.

<pre><code>
    Week    | PR runs | PR median | PR P90  | Pull request chart | Queue runs | Queue median | Queue P90 |    Merge queue chart     
------------+---------+-----------+---------+--------------------+------------+--------------+-----------+--------------------------
 2026-11-09 |     192 | 36m 24s   | 40m 35s | ██████████░        |         75 | 46m 23s      | 1h 23m    | ████████████░░░░░░░░░░   
 2026-11-02 |     171 | 36m 44s   | 44m 05s | ██████████░░       |         59 | 48m 20s      | 1h 05m    | █████████████░░░░        
 2026-10-26 |     263 | 35m 47s   | 41m 31s | █████████░░        |         76 | 53m 08s      | 1h 07m    | ██████████████░░░░       
 2026-10-19 |     163 | 38m 02s   | 45m 05s | ██████████░░       |         72 | 52m 40s      | 1h 10m    | ██████████████░░░░░      
 2026-10-12 |     162 | 37m 25s   | 41m 35s | ██████████░        |         74 | 1h 02m       | 1h 31m    | █████████████████░░░░░░░ 
 2026-10-05 |     195 | 37m 41s   | 41m 29s | ██████████░        |         93 | 52m 27s      | 1h 28m    | ██████████████░░░░░░░░░  
 2026-09-28 |     168 | 37m 40s   | 41m 46s | ██████████░        |         63 | 50m 39s      | 56m 45s   | █████████████░░          
 2026-09-21 |     137 | 38m 10s   | 43m 05s | ██████████░        |         55 | 47m 21s      | 1h 03m    | ████████████░░░░░        
 2026-09-14 |     231 | 37m 45s   | 41m 39s | ██████████░        |         99 | 54m 26s      | 1h 20m    | ██████████████░░░░░░░    
 2026-09-07 |     125 | 38m 48s   | 43m 52s | ██████████░░       |         54 | 51m 21s      | 1h 06m    | █████████████░░░░        
 2026-08-31 |      90 | 39m 00s   | 47m 08s | ██████████░░       |         30 | 41m 58s      | 52m 06s   | ███████████░░░           
 2026-08-24 |     107 | 38m 50s   | 46m 43s | ██████████░░       |         42 | 44m 16s      | 51m 34s   | ████████████░░           
 2026-08-17 |     173 | 53m 42s   | 1h 00m  | ██████████████░░   |         69 | 56m 53s      | 1h 14m    | ███████████████░░░░░     
(13 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/8fcd363e3023c47a06260d64fb1f9020cfc3c477/sql/ci-cd/04-run-duration.sql)

## Runner hours per week

What CI costs: the time all jobs of all workflows ran on GitHub runners, by what started them. In the bar, █ is pull requests, ▓ the merge queue, ▒ nightly runs, and ░ everything else. Re-runs are included, cancelled jobs count for the time they ran.
"Hours per merged PR" divides the runner hours of the week by the pull requests merged that week, so it also carries the cost of pull requests that were closed or are still open. The newest week is not complete, and job data covers only the last 2 months.

<pre><code>
    Week    | Runner hours | Pull requests | Merge queue | Nightly | Merged PRs | Hours per merged PR |       Runner hours chart       
------------+--------------+---------------+-------------+---------+------------+---------------------+--------------------------------
 2026-11-09 |         5835 | 65%           | 32%         | 2%      |         74 |                  79 | ███████████████▓▓▓▓▓▓▓▓▒       
 2026-11-02 |         5164 | 71%           | 26%         | 3%      |         58 |                  89 | ███████████████▓▓▓▓▓▒          
 2026-10-26 |         6553 | 68%           | 30%         | 2%      |         76 |                  86 | ██████████████████▓▓▓▓▓▓▓▓▒    
 2026-10-19 |         7055 | 64%           | 31%         | 2%      |         71 |                  99 | ███████████████████▓▓▓▓▓▓▓▓▓░  
 2026-10-12 |         6117 | 59%           | 38%         | 2%      |         69 |                  89 | ███████████████▓▓▓▓▓▓▓▓▓▒      
 2026-10-05 |         7354 | 60%           | 37%         | 2%      |         93 |                  79 | ██████████████████▓▓▓▓▓▓▓▓▓▓▓▒ 
 2026-09-28 |         5913 | 72%           | 25%         | 2%      |         63 |                  94 | █████████████████▓▓▓▓▓▓▓       
 2026-09-21 |         5206 | 71%           | 28%         | 0%      |         54 |                  96 | ███████████████▓▓▓▓▓▓          
(8 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/8fcd363e3023c47a06260d64fb1f9020cfc3c477/sql/ci-cd/05-runner-hours.sql)

## Which jobs take the most runner time

The 30 jobs of the `ci` workflow that used the most runner time in the last 30 days, in all runs. Share is the job's part of the runner time of all `ci` jobs. Median and P90 are for runs of the job that passed.
Change compares the median of the last 7 days with the 23 days before. Each character of the chart is the median duration on one day, oldest on the left, on the scale of that row; a space is a day without runs. Making a job at the top shorter, or running it less often, saves the most.

<pre><code>
                   Job                    | Runs | Passed | Median  |   P90   | Hours | Share | Change  | Median per day, 30 days chart  
------------------------------------------+------+--------+---------+---------+-------+-------+---------+--------------------------------
 test (testing/trino-tests)               | 1739 | 94%    | 29m 31s | 31m 50s |   710 | 2.8%  | ▼ -9%   | ███████████████▇████▇█████▇█▇▆ 
 test (plugin/trino-ic... floci-and-avro) | 1645 | 98%    | 30m 20s | 33m 11s |   699 | 2.8%  | ▼ -3%   | ▇████████████████████████████▇ 
 pt (SuiteIceberg)                        | 1584 | 99%    | 26m 47s | 30m 32s |   644 | 2.6%  | ▼ -1%   | █████████████████████████████▇ 
 pt (SuiteDeltaLakeOss)                   | 1473 | 99%    | 29m 03s | 32m 28s |   609 | 2.4%  | ▼ -6%   | ▇██████▇█████████████████████▆ 
 test (plugin/trino-iceberg)              | 1654 | 96%    | 25m 51s | 28m 18s |   609 | 2.4%  | ▼ -5%   | █▇████████████████████▇██████▇ 
 test (testing/trino-f...t-tolerant-hive) | 1803 | 98%    | 21m 58s | 23m 44s |   571 | 2.3%  | ▼ -7%   | █████████████████████▇██████▇▆ 
 pt (SuiteHiveTransactional)              | 1436 | 99%    | 23m 10s | 25m 30s |   512 | 2.0%  | ▼ -3%   | ██████████████████████████████ 
 error-prone-checks                       | 2074 | 95%    | 13m 57s | 33m 22s |   510 | 2.0%  | ▲ +20%  | ▃▃▃▃▃▂▄▅▅▅▃▂▅▄▁▂▄▃▅▃▅▆▅▅▅▃▃▃▆█ 
 maven-checks 28-ea                       | 2086 | 93%    | 15m 17s | 16m 37s |   455 | 1.8%  | ▼ -3%   | ███████▇█████▇███████▇▇███▇▇▇█ 
 test (plugin/trino-delta-lake)           | 1464 | 98%    | 20m 52s | 23m 14s |   451 | 1.8%  | = 0%    | ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇█ 
 pt (SuiteIcebergVariants)                | 1585 | 99%    | 17m 54s | 20m 05s |   449 | 1.8%  | ▼ -4%   | █████████████████████████████▇ 
 maven-checks 27                          | 2086 | 93%    | 15m 00s | 16m 15s |   448 | 1.8%  | ▼ -6%   | ▇▇███████████████████▇█████▇██ 
 test (plugin/trino-hive)                 | 1424 | 93%    | 21m 28s | 23m 48s |   447 | 1.8%  | ▼ -5%   | ██████████████▇█████▇▇███▇█▇▇▆ 
 test (plugin/trino-hive, test-parquet)   | 1412 | 98%    | 20m 11s | 23m 42s |   427 | 1.7%  | = 0%    | ▇▇▇▇▇████████████████▇██████▇▆ 
 test (plugin/trino-druid)                | 1199 | 98%    | 21m 59s | 26m 48s |   407 | 1.6%  | ▼ -12%  | ███████████▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▆ 
 test (core/trino-main)                   | 1148 | 95%    | 25m 22s | 27m 46s |   405 | 1.6%  | ▼ -7%   | ███████████▇████▇█████▇██▇▇▇▇█ 
 test (testing/trino-f...olerant-iceberg) | 1799 | 98%    | 14m 17s | 15m 28s |   389 | 1.6%  | ▼ -4%   | ██████████████████████████████ 
 pt (SuiteDeltaLakeDatabricks18)          | 1337 | 99%    | 3m 18s  | 47m 49s |   360 | 1.4%  | ▲ +773% | █▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▂▁▁▁▁▁▁▁▆▆▅▅▅ 
 test (plugin/trino-hive, fte-tests)      | 1411 | 99%    | 16m 10s | 17m 20s |   350 | 1.4%  | ▲ +1%   | █████████████████████████████▇ 
 test (plugin/trino-iceberg, fte-tests)   | 1641 | 98%    | 13m 24s | 14m 39s |   344 | 1.4%  | ▲ +1%   | ██████████████████████████████ 
 pt (SuiteStorageFormatsDetailed)         | 1584 | 100%   | 13m 14s | 15m 24s |   341 | 1.4%  | ▼ -6%   | █████████████████████████▇▇▇▇▇ 
 artifact-checks                          | 2076 | 97%    | 10m 32s | 11m 42s |   332 | 1.3%  | ▲ +1%   | ▇▇███████████████████████████▆ 
 test-other-modules                       | 2074 | 97%    | 11m 06s | 16m 34s |   326 | 1.3%  | ▼ -10%  | ▇▆▇▆█▇▇▇██▆▅▇▅▂▆▇▄█▇▇████▆▄▅██ 
 maven-checks 25.0.5                      | 1481 | 93%    | 15m 07s | 16m 30s |   320 | 1.3%  | ▼ -7%   |          ██████████▇█▇████▇▇█▇ 
 test (plugin/trino-de...lake, fte-tests) | 1462 | 98%    | 13m 57s | 15m 17s |   319 | 1.3%  | = 0%    | ██████████████████████████████ 
 pt (SuiteCompatibility)                  | 1583 | 100%   | 11m 52s | 14m 06s |   311 | 1.2%  | ▼ -8%   | █████████████████████████▇▇▇▇▇ 
 pt (SuiteTpcds)                          | 1434 | 100%   | 13m 25s | 15m 42s |   304 | 1.2%  | ▼ -8%   | ██████████████▇██████▇█████▇▇█ 
 test-jdbc-compatibility                  | 2076 | 97%    | 10m 13s | 13m 22s |   301 | 1.2%  | ▼ -5%   | ▇▆▇▇▇█▇█▆▇▆▆▇▆▃▅▇▅▇▇▇▇▇▇▇▆▆▆█▇ 
 pt (SuiteDeltaLakeDatabricks154)         | 1336 | 99%    | 3m 29s  | 44m 25s |   301 | 1.2%  | ▲ +723% | ▂▁▁▁▁▁▁▁▅▂▁▁▁▁▁▁▁▂▁▁▁▁▁▁▁██▆▇█ 
 test (plugin/trino-postgresql)           | 1210 | 98%    | 16m 08s | 18m 33s |   301 | 1.2%  | ▼ -3%   | ████████████▇██▇▇█▇██▇▇▇▇▇▇▇█▇ 
(30 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/8fcd363e3023c47a06260d64fb1f9020cfc3c477/sql/ci-cd/06-jobs-duration.sql)

## Where runner time goes, by step

The steps of `ci` jobs that used the most runner time in the last 4 weeks, summed over all jobs that run them, as a share of the runner time of all `ci` jobs. Steps are recorded only for some runs since 2026-10-15, so this is a sample.
Steps other than the tests, like building, checking out, and setting up, are paid again in every job: making them faster saves time in every run.

<table>
<thead>
<tr><th>Step</th><th>Share of runner time</th><th>Median</th></tr>
</thead>
<tbody>
<tr><td>Maven Tests</td><td>33%</td><td>5m 10s</td></tr>
<tr><td>Product Tests (JUnit suites)</td><td>24%</td><td>2m 45s</td></tr>
<tr><td>Maven Install</td><td>11%</td><td>1m 54s</td></tr>
<tr><td>Product tests artifact</td><td>6%</td><td>47s</td></tr>
<tr><td>Run .github/actions/setup</td><td>5%</td><td>29s</td></tr>
<tr><td>Maven Checks</td><td>4%</td><td>11m 20s</td></tr>
<tr><td>Run actions/checkout@v7.0.1</td><td>4%</td><td>23s</td></tr>
<tr><td>Error Prone Checks</td><td>2%</td><td>9m 10s</td></tr>
<tr><td>Load Trino Docker image for product tests</td><td>2%</td><td>20s</td></tr>
<tr><td>Set up job</td><td>1%</td><td>7s</td></tr>
<tr><td>Upload test results</td><td>1%</td><td>11s</td></tr>
<tr><td>Product test distribution</td><td>1%</td><td>7s</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/8fcd363e3023c47a06260d64fb1f9020cfc3c477/sql/ci-cd/07-runner-time-by-step.sql)

## When CI is busy

How many jobs of all workflows run at the same time, by weekday and hour of the day (UTC), on average over the last 4 weeks. The darkest cells, █, have at least three quarters of the jobs of the busiest hour. Peak is the most jobs running at the same moment on that weekday.
So far, the number of running jobs has not gone above 500, and it stays at 500 for minutes when it gets there, so 500 looks like the most jobs that can run at once: then new jobs wait for a runner. Pushing many changes at the busiest hours makes this more likely.

<pre><code>
  Weekday  | Hours of the day, UTC, chart | Average jobs running | Peak 
-----------+------------------------------+----------------------+------
 Hour      | 0     6     12    18         |                      |      
 Monday    | ▓░░░░░▓▓▓▒▒▓▓▓█▒▓▓▒▒▒▒▒▒     |                   48 |  474 
 Tuesday   | ▒░░░░▒▒▓▒▓▓▓█▓▓▓▒▒▓▒▒░░░     |                   46 |  489 
 Wednesday | ▒░░░▒▓▓▓▒▒▒▓▒▒▒▒▒▒▒░▒▒▒▓     |                   45 |  473 
 Thursday  | ▒░░░▒▒▒▓▒▒▒▓▓▒▒▒▒▒░░▒▒▒▒     |                   39 |  323 
 Friday    | ▒░░▒░▒▓▒▓▒▓▓▓▒▒▓█▓▒▒▒▒░▒     |                   47 |  394 
 Saturday  | ░░░░░░░░░░░░░░░░░░░░░░▒░     |                   14 |  194 
 Sunday    | ░░░░░░▒░░░░░░░░▒▒▒▒░░░░▒     |                   20 |  399 
(8 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/8fcd363e3023c47a06260d64fb1f9020cfc3c477/sql/ci-cd/08-busy-hours.sql)

## How long jobs wait for a runner

Time from when a job is queued until a runner starts it, by runner type, for jobs of all workflows in the last 4 weeks (wait times are recorded only for some runs since 2026-10-15). P90: one job in ten waits longer.
If waits grow, CI has reached the most jobs it can run at once: see the peaks in "When CI is busy".

<table>
<thead>
<tr><th>Runner type</th><th style="text-align: right">Jobs</th><th>Median wait</th><th>P90 wait</th><th>Longest wait</th><th style="text-align: right">Waited over a minute</th></tr>
</thead>
<tbody>
<tr><td>ubuntu-latest</td><td style="text-align: right">47169</td><td>2s</td><td>3s</td><td>5m 02s</td><td style="text-align: right">9</td></tr>
<tr><td>macos-latest</td><td style="text-align: right">190</td><td>3s</td><td>7s</td><td>16s</td><td style="text-align: right">0</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/8fcd363e3023c47a06260d64fb1f9020cfc3c477/sql/ci-cd/09-queue-time.sql)

Generated on Sun Nov 15 06:14:24 UTC 2026

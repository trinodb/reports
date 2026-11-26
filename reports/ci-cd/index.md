---
title: Trino CI/CD Reports
---

## CI health at a glance

How often the `ci` workflow passes, by what started it. The pass rate is passed / (passed + failed) runs, for the last 7 days, the 7 days before, and the last 30 days. In the merge queue, a failing job cancels the rest of the run, so such runs count as failed; other cancelled runs (superseded or removed from the queue) are not counted.
A merge queue or nightly run that fails points to a broken or flaky test on master, not to an unfinished change: see "Which jobs fail in the merge queue and nightly runs" below. One character of the chart is one day; a dot is a day where every run failed.

<pre><code>
  Started by  | Runs, 7 days | Change | Passed, 7 days | Previous 7 days | 30 days | Cancelled | Re-run | Passed per day, 30 days chart  
--------------+--------------+--------+----------------+-----------------+---------+-----------+--------+--------------------------------
 merge queue  |          171 | ▲ +58% | 58%            | 70%             | 66%     | 19%       | 1%     | ▆▅██▃█▆▇▆▇▅▇▅▅▅▇▇█.▆█▇▄▆▆▇▇▂▅█ 
 pull request |          427 | ▲ +16% | 76%            | 84%             | 79%     | 26%       | 5%     | ▆▇▆█▇▇▇▇▇▇▆▇▆▆▇▇▇███▇▇▇▇▇▇▆▆▇█ 
 scheduled    |            7 | = 0%   | 57%            | 100%            | 67%     | 0%        | 0%     | █████...█.███...███████.████.. 
(3 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/5a4c5d98380c81f056e58435b987b260035b8ee1/sql/ci-cd/01-health.sql)

## Merge queue outcomes per week

Every pull request is tested again in the merge queue before it is merged. In the bar, █ passed, ▒ failed, ░ cancelled. When a job fails, the merge queue cancels the rest of the run to save runners, so these runs count as failed. A run is cancelled without a failure when its queue entry is removed or rebuilt, for example because an entry ahead of it failed.
A low success rate means that pull requests that passed their own checks fail after they are combined with master: look for flaky tests in "Which jobs fail in the merge queue and nightly runs". The newest week is not complete.

<pre><code>
    Week    | Runs | Passed | Failed | Cancelled | Success rate |     Passed, failed, cancelled chart      
------------+------+--------+--------+-----------+--------------+------------------------------------------
 2026-11-23 |  116 |     45 |     45 |        26 | 50%          | ████████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░ 
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
[query](https://github.com/trinodb/reports/blob/5a4c5d98380c81f056e58435b987b260035b8ee1/sql/ci-cd/02-merge-queue-outcomes.sql)

## Which jobs fail in the merge queue and nightly runs

Jobs that failed in the last 14 days in runs of master: the merge queue and the nightly scheduled run. These changes already passed their own checks, so a failure here points to a flaky test or a broken dependency, not to the change. Fix the top rows first.
Failure rate is failed / (passed + failed) runs of the job, re-runs included. One character of the chart is one day, oldest on the left; a dot is a day without failures. The `build-success` job, which only sums up the others, is left out.

<pre><code>
                      Job                      | Failures | In merge queue | In nightly | Failure rate | Failures per day chart 
-----------------------------------------------+----------+----------------+------------+--------------+------------------------
 test (plugin/trino-bigquery)                  |       25 |             23 |          2 | 17%          | ▁..▂▁.▂▁...▂█.         
 test (testing/trino-tests)                    |       10 |             10 |          0 | 7%           | ..▃...█▃▆▃▆...         
 artifact-checks                               |       10 |              9 |          1 | 4%           | ......▃....█.▂         
 build-pt                                      |       10 |             10 |          0 | 4%           | ......▆....█..         
 test (lib/trino-filesystem-gcs, cloud-tests)  |        7 |              7 |          0 | 4%           | ...........█..         
 test-other-modules                            |        6 |              6 |          0 | 3%           | ...▄..█▄.▄▄...         
 test (plugin/trino-iceberg, cloud-tests)      |        5 |              5 |          0 | 3%           | ......▆....█..         
 test (plugin/trino-googl...eets, cloud-tests) |        4 |              4 |          0 | 2%           | ............█.         
 pt (SuiteAzure)                               |        3 |              3 |          0 | 2%           | .......█......         
 pt (SuiteHudi)                                |        3 |              3 |          0 | 2%           | ......█.......         
 pt (SuiteDeltaLakeDatabricks154)              |        2 |              2 |          0 | 2%           | .....█.█......         
 pt (SuiteHiveSpark)                           |        2 |              2 |          0 | 1%           | ...█..........         
 pt (SuiteGcs)                                 |        2 |              2 |          0 | 1%           | █.........█...         
 test (plugin/trino-bigquery, cloud-tests-2)   |        1 |              0 |          1 | 7%           | ............█.         
 pt (SuiteIcebergVariants)                     |        1 |              1 |          0 | 1%           | █.............         
 test (lib/trino-filesyst...blob-cache-memory) |        1 |              1 |          0 | 1%           | .......█......         
 test (lib/trino-filesyst...zure, cloud-tests) |        1 |              1 |          0 | 1%           | ......█.......         
 pt (SuiteFunctions)                           |        1 |              1 |          0 | 1%           | ............█.         
 test (plugin/trino-exasol)                    |        1 |              1 |          0 | 1%           | .......█......         
 test (plugin/trino-elasticsearch)             |        1 |              1 |          0 | 1%           | ........█.....         
 test (plugin/trino-base-...ugin/trino-thrift) |        1 |              1 |          0 | 1%           | ..........█...         
 test (testing/trino-faul...-tolerant-iceberg) |        1 |              1 |          0 | 1%           | .......█......         
 test (testing/trino-faul...lt-tolerant-delta) |        1 |              1 |          0 | &lt;1%          | ......█.......         
(23 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/5a4c5d98380c81f056e58435b987b260035b8ee1/sql/ci-cd/03-failing-jobs.sql)

## How long a CI run takes

Time from the start of a `ci` run until its result, for runs that passed on the first attempt, so it is how long you wait for a green build. In the bars, █ is the median and ░ reaches the P90 (one run in ten takes longer).
A pull request is tested twice: once on its own, and again in the merge queue before it is merged. The newest week is not complete.

<pre><code>
    Week    | PR runs | PR median | PR P90  | Pull request chart | Queue runs | Queue median | Queue P90 |    Merge queue chart     
------------+---------+-----------+---------+--------------------+------------+--------------+-----------+--------------------------
 2026-11-23 |     110 | 34m 21s   | 38m 26s | █████████░         |         45 | 39m 20s      | 1h 23m    | ██████████░░░░░░░░░░░░   
 2026-11-16 |     264 | 36m 06s   | 41m 08s | █████████░░        |         85 | 50m 46s      | 1h 08m    | █████████████░░░░░       
 2026-11-09 |     200 | 36m 17s   | 40m 21s | ██████████░        |         75 | 46m 23s      | 1h 23m    | ████████████░░░░░░░░░░   
 2026-11-02 |     171 | 36m 48s   | 44m 04s | ██████████░░       |         59 | 48m 14s      | 1h 05m    | █████████████░░░░        
 2026-10-26 |     263 | 35m 53s   | 41m 30s | █████████░░        |         76 | 52m 31s      | 1h 07m    | ██████████████░░░░       
 2026-10-19 |     163 | 38m 02s   | 45m 05s | ██████████░░       |         72 | 52m 30s      | 1h 10m    | ██████████████░░░░░      
 2026-10-12 |     162 | 37m 23s   | 41m 35s | ██████████░        |         74 | 1h 02m       | 1h 31m    | ████████████████░░░░░░░░ 
 2026-10-05 |     195 | 37m 43s   | 41m 29s | ██████████░        |         93 | 52m 25s      | 1h 28m    | ██████████████░░░░░░░░░  
 2026-09-28 |     168 | 37m 32s   | 41m 46s | ██████████░        |         63 | 50m 39s      | 56m 45s   | █████████████░░          
 2026-09-21 |     137 | 38m 13s   | 43m 05s | ██████████░        |         55 | 47m 21s      | 1h 03m    | ████████████░░░░░        
 2026-09-14 |     231 | 37m 45s   | 41m 38s | ██████████░        |         99 | 54m 26s      | 1h 20m    | ██████████████░░░░░░░    
 2026-09-07 |     125 | 38m 44s   | 43m 52s | ██████████░░       |         54 | 51m 21s      | 1h 06m    | █████████████░░░░        
 2026-08-31 |      90 | 39m 00s   | 47m 08s | ██████████░░       |         30 | 41m 58s      | 52m 06s   | ███████████░░░           
(13 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/5a4c5d98380c81f056e58435b987b260035b8ee1/sql/ci-cd/04-run-duration.sql)

## Runner hours per week

What CI costs: the time all jobs of all workflows ran on GitHub runners, by what started them. In the bar, █ is pull requests, ▓ the merge queue, ▒ nightly runs, and ░ everything else. Re-runs are included, cancelled jobs count for the time they ran.
"Hours per merged PR" divides the runner hours of the week by the pull requests merged that week, so it also carries the cost of pull requests that were closed or are still open. The newest week is not complete, and job data covers only the last 2 months.

<pre><code>
    Week    | Runner hours | Pull requests | Merge queue | Nightly | Merged PRs | Hours per merged PR |       Runner hours chart       
------------+--------------+---------------+-------------+---------+------------+---------------------+--------------------------------
 2026-11-23 |         3336 | 68%           | 30%         | 2%      |         44 |                  76 | █████████▓▓▓▓▒                 
 2026-11-16 |         6969 | 69%           | 27%         | 2%      |         86 |                  81 | ████████████████████▓▓▓▓▓▓▓▒   
 2026-11-09 |         5949 | 65%           | 32%         | 2%      |         74 |                  80 | ████████████████▓▓▓▓▓▓▓▓       
 2026-11-02 |         5164 | 71%           | 26%         | 3%      |         58 |                  89 | ███████████████▓▓▓▓▓▒          
 2026-10-26 |         6553 | 68%           | 30%         | 2%      |         76 |                  86 | ██████████████████▓▓▓▓▓▓▓▓▒    
 2026-10-19 |         7055 | 64%           | 31%         | 2%      |         71 |                  99 | ███████████████████▓▓▓▓▓▓▓▓▓░  
 2026-10-12 |         6117 | 59%           | 38%         | 2%      |         69 |                  89 | ███████████████▓▓▓▓▓▓▓▓▓▒      
 2026-10-05 |         7354 | 60%           | 37%         | 2%      |         93 |                  79 | ██████████████████▓▓▓▓▓▓▓▓▓▓▓▒ 
(8 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/5a4c5d98380c81f056e58435b987b260035b8ee1/sql/ci-cd/05-runner-hours.sql)

## Which jobs take the most runner time

The 30 jobs of the `ci` workflow that used the most runner time in the last 30 days, in all runs. Share is the job's part of the runner time of all `ci` jobs. Median and P90 are for runs of the job that passed.
Change compares the median of the last 7 days with the 23 days before. Each character of the chart is the median duration on one day, oldest on the left, on the scale of that row; a space is a day without runs. Making a job at the top shorter, or running it less often, saves the most.

<pre><code>
                   Job                    | Runs | Passed | Median  |   P90   | Hours | Share |  Change  | Median per day, 30 days chart  
------------------------------------------+------+--------+---------+---------+-------+-------+----------+--------------------------------
 test (plugin/trino-ic... floci-and-avro) | 1791 | 98%    | 30m 20s | 33m 34s |   742 | 2.9%  | ▲ +3%    | ██████████████████████████████ 
 test (testing/trino-tests)               | 1889 | 91%    | 28m 24s | 31m 32s |   738 | 2.9%  | ▼ -7%    | ████▇████▇█████▇█▇▇███▇▇██▇███ 
 test (plugin/trino-iceberg)              | 1793 | 97%    | 25m 47s | 28m 49s |   644 | 2.6%  | ▲ +1%    | ███████████▇████████████▇████▇ 
 pt (SuiteIceberg)                        | 1592 | 99%    | 26m 23s | 29m 38s |   626 | 2.5%  | ▼ -2%    | ██████████████████████████████ 
 test (testing/trino-f...t-tolerant-hive) | 1942 | 98%    | 21m 27s | 23m 44s |   595 | 2.4%  | ▼ -1%    | ██████████▇██████▇████████████ 
 pt (SuiteDeltaLakeOss)                   | 1479 | 99%    | 27m 11s | 31m 53s |   582 | 2.3%  | ▼ -7%    | ██████████████████▆█▇█████▇▇▇▆ 
 test (plugin/trino-delta-lake)           | 1672 | 98%    | 20m 50s | 23m 17s |   500 | 2.0%  | ▲ +1%    | ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇█ 
 error-prone-checks                       | 2302 | 95%    | 9m 57s  | 29m 55s |   489 | 1.9%  | ▼ -29%   | ▃▇▅▂▂▆▄▇▅▇█▇▇▇▄▄▄█▆▅▇█▃▃▃▃▃▃▃▄ 
 test (plugin/trino-hive)                 | 1607 | 96%    | 20m 47s | 23m 58s |   488 | 1.9%  | ▲ +1%    | ███▇█████▇▇▇██▇█▇▇████▇▇▇█▇███ 
 maven-checks 28-ea                       | 2322 | 94%    | 14m 33s | 16m 38s |   488 | 1.9%  | ▼ -8%    | ██████████▇██████▇█▇▇█▇██▇▇█▇▇ 
 pt (SuiteHiveTransactional)              | 1421 | 99%    | 22m 38s | 24m 38s |   486 | 1.9%  | ▼ -3%    | ██████████████████████████████ 
 maven-checks 27                          | 2322 | 94%    | 14m 21s | 16m 14s |   483 | 1.9%  | ▼ -5%    | ██████████▇█████▇██▇▇█▇▇▇█▇██▇ 
 test (plugin/trino-hive, test-parquet)   | 1599 | 99%    | 18m 58s | 23m 40s |   448 | 1.8%  | ▼ -28%   | ██████████▇██████▇█████▇█▇▅▅▅▅ 
 test (core/trino-main)                   | 1295 | 95%    | 24m 47s | 28m 16s |   443 | 1.8%  | = 0%     | ▇████▇█████▇██▇▇▇▇██▇██▇█▇███▇ 
 pt (SuiteIcebergVariants)                | 1592 | 99%    | 17m 29s | 19m 29s |   432 | 1.7%  | ▼ -3%    | █████████████████████████████▇ 
 test (plugin/trino-druid)                | 1374 | 99%    | 20m 59s | 22m 10s |   414 | 1.6%  | ▼ -1%    | ██████████████████████████████ 
 test (testing/trino-f...olerant-iceberg) | 1939 | 98%    | 14m 15s | 15m 31s |   409 | 1.6%  | = 0%     | ██████████████████████████████ 
 test (plugin/trino-hive, fte-tests)      | 1598 | 99%    | 16m 16s | 17m 33s |   387 | 1.5%  | ▲ +1%    | █████████████████████████████▇ 
 test (plugin/trino-iceberg, fte-tests)   | 1789 | 99%    | 13m 24s | 14m 44s |   365 | 1.4%  | ▼ -3%    | ██████████████████████████████ 
 artifact-checks                          | 2310 | 97%    | 10m 33s | 11m 37s |   361 | 1.4%  | ▼ -3%    | █████████████████████████████▇ 
 test-other-modules                       | 2303 | 97%    | 10m 46s | 16m 45s |   356 | 1.4%  | ▲ +15%   | ▄▇▅▂▆▇▄▇▇▇█▇▇▇▆▄▅█▆▅▇█▇▇▇▇▇▅▇█ 
 test (plugin/trino-de...lake, fte-tests) | 1669 | 99%    | 14m 05s | 15m 29s |   355 | 1.4%  | = 0%     | ██████████████████████████████ 
 test (plugin/trino-postgresql)           | 1383 | 98%    | 15m 52s | 18m 11s |   328 | 1.3%  | ▼ -2%    | ██████████████████████████████ 
 maven-checks 25.0.5                      | 1491 | 94%    | 14m 46s | 16m 31s |   323 | 1.3%  |          | ████████▇█▇████▇▇██▇▇▇         
 test-jdbc-compatibility                  | 2306 | 98%    | 9m 48s  | 13m 01s |   319 | 1.3%  | ▲ +6%    | ▆█▆▃▆▇▆█▇█████▇▆▆█▇▇██▆▇▇▇▇▆█▇ 
 pt (SuiteStorageFormatsDetailed)         | 1592 | 99%    | 12m 30s | 14m 34s |   317 | 1.3%  | ▼ -10%   | ███████████████████████▇▇▇▇▇▇▇ 
 test (plugin/trino-oracle)               | 1380 | 98%    | 15m 16s | 16m 59s |   316 | 1.3%  | = 0%     | ██████████████████▇███████████ 
 pt (SuiteDeltaLakeDatabricks18)          |  909 | 100%   | 8m 02s  | 52m 19s |   305 | 1.2%  | ▲ +1012% | ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▆▆▅▅▅▄▆▆▆▅▅▄▅▅█▆ 
 test (plugin/trino-lakehouse)            | 1847 | 99%    | 10m 19s | 11m 28s |   292 | 1.2%  | ▼ -2%    | █████████████████▇▇████▇██████ 
 pt (SuiteDeltaLakeDatabricks154)         |  909 | 99%    | 5m 56s  | 48m 50s |   291 | 1.2%  | ▲ +950%  | ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▇▇▅▇▇▆▆█▇▆▆▇▆▆█▇ 
(30 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/5a4c5d98380c81f056e58435b987b260035b8ee1/sql/ci-cd/06-jobs-duration.sql)

## Where runner time goes, by step

The steps of `ci` jobs that used the most runner time in the last 4 weeks, summed over all jobs that run them, as a share of the runner time of all `ci` jobs. Steps are recorded only for some runs since 2026-10-15, so this is a sample.
Steps other than the tests, like building, checking out, and setting up, are paid again in every job: making them faster saves time in every run.

<table>
<thead>
<tr><th>Step</th><th>Share of runner time</th><th>Median</th></tr>
</thead>
<tbody>
<tr><td>Maven Tests</td><td>36%</td><td>4m 34s</td></tr>
<tr><td>Product Tests (JUnit suites)</td><td>23%</td><td>2m 40s</td></tr>
<tr><td>Maven Install</td><td>12%</td><td>1m 52s</td></tr>
<tr><td>Maven Checks</td><td>5%</td><td>10m 46s</td></tr>
<tr><td>Run .github/actions/setup</td><td>4%</td><td>29s</td></tr>
<tr><td>Product tests artifact</td><td>4%</td><td>34s</td></tr>
<tr><td>Run actions/checkout@v7.0.1</td><td>4%</td><td>22s</td></tr>
<tr><td>Set up job</td><td>2%</td><td>8s</td></tr>
<tr><td>Upload test results</td><td>1%</td><td>11s</td></tr>
<tr><td>Error Prone Checks</td><td>1%</td><td>5m 02s</td></tr>
<tr><td>Load Trino Docker image for product tests</td><td>1%</td><td>15s</td></tr>
<tr><td>Run .github/actions/compile-commit</td><td>1%</td><td>4m 33s</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/5a4c5d98380c81f056e58435b987b260035b8ee1/sql/ci-cd/07-runner-time-by-step.sql)

## When CI is busy

How many jobs of all workflows run at the same time, by weekday and hour of the day (UTC), on average over the last 4 weeks. The darkest cells, █, have at least three quarters of the jobs of the busiest hour. Peak is the most jobs running at the same moment on that weekday.
So far, the number of running jobs has not gone above 500, and it stays at 500 for minutes when it gets there, so 500 looks like the most jobs that can run at once: then new jobs wait for a runner. Pushing many changes at the busiest hours makes this more likely.

<pre><code>
  Weekday  | Hours of the day, UTC, chart | Average jobs running | Peak 
-----------+------------------------------+----------------------+------
 Hour      | 0     6     12    18         |                      |      
 Monday    | ▒░░░░░▓▓█▒▒▓▓▒█▒▓▒▒░░▓░▒     |                   35 |  291 
 Tuesday   | ▒▒▒░░▒▒▒▒▒█▓█▓▓█▓▒▓▓▒▒░▒     |                   41 |  489 
 Wednesday | ▒▒░▒░▓███▓▒▓▒▒▒▒▒▒▒▒▒▓▓▒     |                   41 |  479 
 Thursday  | ▓▒▒▒▒▒▓█▒▒▓█▓▒▓█▓▓▒▒▒▓▓▒     |                   48 |  380 
 Friday    | ▓▒▒▒░▓▓▒▓█▒▒▓▒▓▒█▓▒░▒▓▒▒     |                   46 |  336 
 Saturday  | ▒░░░░░░░░░▒░░░░░░▒░░░▓▒░     |                   17 |  275 
 Sunday    | ▒░▒░░░░░▒░░▒░▒▒░▓▒▒▒▒▒░░     |                   24 |  326 
(8 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/5a4c5d98380c81f056e58435b987b260035b8ee1/sql/ci-cd/08-busy-hours.sql)

## How long jobs wait for a runner

Time from when a job is queued until a runner starts it, by runner type, for jobs of all workflows in the last 4 weeks (wait times are recorded only for some runs since 2026-10-15). P90: one job in ten waits longer.
If waits grow, CI has reached the most jobs it can run at once: see the peaks in "When CI is busy".

<table>
<thead>
<tr><th>Runner type</th><th style="text-align: right">Jobs</th><th>Median wait</th><th>P90 wait</th><th>Longest wait</th><th style="text-align: right">Waited over a minute</th></tr>
</thead>
<tbody>
<tr><td>ubuntu-latest</td><td style="text-align: right">112683</td><td>2s</td><td>2s</td><td>5m 03s</td><td style="text-align: right">13</td></tr>
<tr><td>macos-latest</td><td style="text-align: right">381</td><td>2s</td><td>3s</td><td>16s</td><td style="text-align: right">0</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/5a4c5d98380c81f056e58435b987b260035b8ee1/sql/ci-cd/09-queue-time.sql)

Generated on Thu Nov 26 06:15:08 UTC 2026

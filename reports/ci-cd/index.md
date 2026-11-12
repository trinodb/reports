---
title: Trino CI/CD Reports
---

## CI health at a glance

How often the `ci` workflow passes, by what started it. The pass rate is passed / (passed + failed) runs, for the last 7 days, the 7 days before, and the last 30 days. In the merge queue, a failing job cancels the rest of the run, so such runs count as failed; other cancelled runs (superseded or removed from the queue) are not counted.
A merge queue or nightly run that fails points to a broken or flaky test on master, not to an unfinished change: see "Which jobs fail in the merge queue and nightly runs" below. One character of the chart is one day; a dot is a day where every run failed.

<pre><code>
  Started by  | Runs, 7 days | Change | Passed, 7 days | Previous 7 days | 30 days | Cancelled | Re-run | Passed per day, 30 days chart  
--------------+--------------+--------+----------------+-----------------+---------+-----------+--------+--------------------------------
 merge queue  |          141 | ▲ +58% | 66%            | 74%             | 69%     | 22%       | 1%     | ▇▇▇█▆▆█▆▆▅▆▄▆▅▆▅██▃█▆▇▆▇▅▇▅▅▅▇ 
 pull request |          383 | ▼ -5%  | 78%            | 80%             | 76%     | 31%       | 6%     | ▆▆▇█▇▆▆▆▆▆▄█▆▆▆▇▆█▇▇▇▇▇▇▆▇▆▆▇▇ 
 scheduled    |            7 | = 0%   | 43%            | 57%             | 40%     | 0%        | 0%     | ..........██.██████...█.███... 
(3 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/0f0ae7b85ba78a1489038a7b3ae21a130900e5bf/sql/ci-cd/01-health.sql)

## Merge queue outcomes per week

Every pull request is tested again in the merge queue before it is merged. In the bar, █ passed, ▒ failed, ░ cancelled. When a job fails, the merge queue cancels the rest of the run to save runners, so these runs count as failed. A run is cancelled without a failure when its queue entry is removed or rebuilt, for example because an entry ahead of it failed.
A low success rate means that pull requests that passed their own checks fail after they are combined with master: look for flaky tests in "Which jobs fail in the merge queue and nightly runs". The newest week is not complete.

<pre><code>
    Week    | Runs | Passed | Failed | Cancelled | Success rate |     Passed, failed, cancelled chart      
------------+------+--------+--------+-----------+--------------+------------------------------------------
 2026-11-09 |  115 |     55 |     31 |        29 | 64%          | ███████████████████▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░ 
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
[query](https://github.com/trinodb/reports/blob/0f0ae7b85ba78a1489038a7b3ae21a130900e5bf/sql/ci-cd/02-merge-queue-outcomes.sql)

## Which jobs fail in the merge queue and nightly runs

Jobs that failed in the last 14 days in runs of master: the merge queue and the nightly scheduled run. These changes already passed their own checks, so a failure here points to a flaky test or a broken dependency, not to the change. Fix the top rows first.
Failure rate is failed / (passed + failed) runs of the job, re-runs included. One character of the chart is one day, oldest on the left; a dot is a day without failures. The `build-success` job, which only sums up the others, is left out.

<pre><code>
                      Job                      | Failures | In merge queue | In nightly | Failure rate | Failures per day chart 
-----------------------------------------------+----------+----------------+------------+--------------+------------------------
 test (plugin/trino-bigquery)                  |       13 |             11 |          2 | 8%           | ...▃▃.▆█..▃▆▃▆         
 test (core/trino-main)                        |       11 |              9 |          2 | 8%           | ▂.█▂▂▂.▂......         
 test (plugin/trino-base-...ugin/trino-thrift) |       11 |             10 |          1 | 6%           | ....▂▄..▂..█▂▂         
 test (plugin/trino-hive)                      |       10 |              7 |          3 | 6%           | ......▂...▂█▂▆         
 test (testing/trino-tests)                    |        5 |              5 |          0 | 3%           | .......▃..█▃..         
 mvnd-build                                    |        3 |              3 |          0 | 5%           | ..........█...         
 pt (SuiteDeltaLakeDatabricks154)              |        3 |              3 |          0 | 2%           | .....█.....██.         
 pt (SuiteAzure)                               |        3 |              2 |          1 | 2%           | ....█........▄         
 test (plugin/trino-iceberg, cloud-tests)      |        3 |              2 |          1 | 1%           | ....█.........         
 test (plugin/trino-bigquery, cloud-tests-2)   |        2 |              0 |          2 | 14%          | ....█..█......         
 pt (SuiteHiveTransactional)                   |        2 |              2 |          0 | 1%           | ......█.....█.         
 pt (SuiteDeltaLakeOss)                        |        2 |              2 |          0 | 1%           | ........█...█.         
 test (plugin/trino-elasticsearch)             |        2 |              1 |          1 | 1%           | ...█........█.         
 pt (SuiteDeltaLakeDatabricks18)               |        1 |              1 |          0 | 1%           | ...........█..         
 test (plugin/trino-oracle)                    |        1 |              0 |          1 | 1%           | ...........█..         
 pt (SuiteIceberg)                             |        1 |              1 |          0 | 1%           | ............█.         
 test (plugin/trino-postgresql)                |        1 |              0 |          1 | 1%           | ...█..........         
 pt (SuiteIcebergVariants)                     |        1 |              1 |          0 | 1%           | ............█.         
 test (plugin/trino-delta-lake)                |        1 |              1 |          0 | 1%           | .........█....         
 test (plugin/trino-mongodb)                   |        1 |              1 |          0 | 1%           | ..█...........         
 pt (SuiteHmsOnly)                             |        1 |              1 |          0 | &lt;1%          | .............█         
 test-other-modules                            |        1 |              1 |          0 | &lt;1%          | ............█.         
 build-test-matrix                             |        1 |              1 |          0 | &lt;1%          | ......█.......         
(23 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/0f0ae7b85ba78a1489038a7b3ae21a130900e5bf/sql/ci-cd/03-failing-jobs.sql)

## How long a CI run takes

Time from the start of a `ci` run until its result, for runs that passed on the first attempt, so it is how long you wait for a green build. In the bars, █ is the median and ░ reaches the P90 (one run in ten takes longer).
A pull request is tested twice: once on its own, and again in the merge queue before it is merged. The newest week is not complete.

<pre><code>
    Week    | PR runs | PR median | PR P90  | Pull request chart | Queue runs | Queue median | Queue P90 |    Merge queue chart     
------------+---------+-----------+---------+--------------------+------------+--------------+-----------+--------------------------
 2026-11-09 |     118 | 36m 10s   | 39m 55s | ██████████         |         53 | 46m 41s      | 1h 23m    | ████████████░░░░░░░░░░   
 2026-11-02 |     171 | 36m 41s   | 44m 05s | ██████████░░       |         59 | 48m 20s      | 1h 05m    | █████████████░░░░        
 2026-10-26 |     263 | 35m 47s   | 41m 31s | █████████░░        |         76 | 53m 08s      | 1h 07m    | ██████████████░░░░       
 2026-10-19 |     163 | 38m 01s   | 45m 05s | ██████████░░       |         72 | 52m 40s      | 1h 10m    | ██████████████░░░░░      
 2026-10-12 |     162 | 37m 25s   | 41m 35s | ██████████░        |         74 | 1h 02m       | 1h 31m    | █████████████████░░░░░░░ 
 2026-10-05 |     195 | 37m 41s   | 41m 30s | ██████████░        |         93 | 52m 29s      | 1h 28m    | ██████████████░░░░░░░░░  
 2026-09-28 |     168 | 37m 41s   | 41m 46s | ██████████░        |         63 | 50m 39s      | 56m 45s   | █████████████░░          
 2026-09-21 |     137 | 38m 12s   | 43m 05s | ██████████░        |         55 | 47m 21s      | 1h 03m    | ████████████░░░░░        
 2026-09-14 |     231 | 37m 47s   | 41m 41s | ██████████░        |         99 | 54m 25s      | 1h 20m    | ██████████████░░░░░░░    
 2026-09-07 |     125 | 38m 47s   | 43m 52s | ██████████░░       |         54 | 51m 21s      | 1h 06m    | █████████████░░░░        
 2026-08-31 |      90 | 39m 00s   | 47m 08s | ██████████░░       |         30 | 41m 58s      | 52m 06s   | ███████████░░░           
 2026-08-24 |     107 | 38m 46s   | 46m 43s | ██████████░░       |         42 | 44m 16s      | 51m 34s   | ████████████░░           
 2026-08-17 |     173 | 53m 43s   | 1h 00m  | ██████████████░░   |         69 | 56m 53s      | 1h 14m    | ███████████████░░░░░     
(13 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/0f0ae7b85ba78a1489038a7b3ae21a130900e5bf/sql/ci-cd/04-run-duration.sql)

## Runner hours per week

What CI costs: the time all jobs of all workflows ran on GitHub runners, by what started them. In the bar, █ is pull requests, ▓ the merge queue, ▒ nightly runs, and ░ everything else. Re-runs are included, cancelled jobs count for the time they ran.
"Hours per merged PR" divides the runner hours of the week by the pull requests merged that week, so it also carries the cost of pull requests that were closed or are still open. The newest week is not complete, and job data covers only the last 2 months.

<pre><code>
    Week    | Runner hours | Pull requests | Merge queue | Nightly | Merged PRs | Hours per merged PR |       Runner hours chart       
------------+--------------+---------------+-------------+---------+------------+---------------------+--------------------------------
 2026-11-09 |         4163 | 60%           | 38%         | 2%      |         52 |                  80 | ██████████▓▓▓▓▓▓▓              
 2026-11-02 |         5164 | 71%           | 26%         | 3%      |         58 |                  89 | ███████████████▓▓▓▓▓▒          
 2026-10-26 |         6553 | 68%           | 30%         | 2%      |         76 |                  86 | ██████████████████▓▓▓▓▓▓▓▓▒    
 2026-10-19 |         7055 | 64%           | 31%         | 2%      |         71 |                  99 | ███████████████████▓▓▓▓▓▓▓▓▓░  
 2026-10-12 |         6117 | 59%           | 38%         | 2%      |         69 |                  89 | ███████████████▓▓▓▓▓▓▓▓▓▒      
 2026-10-05 |         7354 | 60%           | 37%         | 2%      |         93 |                  79 | ██████████████████▓▓▓▓▓▓▓▓▓▓▓▒ 
 2026-09-28 |         5913 | 72%           | 25%         | 2%      |         63 |                  94 | █████████████████▓▓▓▓▓▓▓       
 2026-09-21 |         5206 | 71%           | 28%         | 0%      |         54 |                  96 | ███████████████▓▓▓▓▓▓          
(8 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/0f0ae7b85ba78a1489038a7b3ae21a130900e5bf/sql/ci-cd/05-runner-hours.sql)

## Which jobs take the most runner time

The 30 jobs of the `ci` workflow that used the most runner time in the last 30 days, in all runs. Share is the job's part of the runner time of all `ci` jobs. Median and P90 are for runs of the job that passed.
Change compares the median of the last 7 days with the 23 days before. Each character of the chart is the median duration on one day, oldest on the left, on the scale of that row; a space is a day without runs. Making a job at the top shorter, or running it less often, saves the most.

<pre><code>
                   Job                    | Runs | Passed | Median  |   P90   | Hours | Share | Change | Median per day, 30 days chart  
------------------------------------------+------+--------+---------+---------+-------+-------+--------+--------------------------------
 test (testing/trino-tests)               | 1807 | 94%    | 29m 32s | 31m 47s |   741 | 2.8%  | ▼ -7%  | ██████████████████▇████▇█████▇ 
 test (plugin/trino-ic... floci-and-avro) | 1716 | 98%    | 30m 22s | 32m 53s |   729 | 2.8%  | ▼ -3%  | ███▇██████████████████████████ 
 pt (SuiteIceberg)                        | 1679 | 99%    | 26m 45s | 30m 35s |   683 | 2.6%  | = 0%   | ██████████████████████████████ 
 pt (SuiteDeltaLakeOss)                   | 1571 | 100%   | 29m 09s | 32m 32s |   651 | 2.5%  | ▼ -6%  | ███▇██████▇███████████████████ 
 test (plugin/trino-iceberg)              | 1725 | 96%    | 25m 52s | 28m 06s |   636 | 2.4%  | ▼ -5%  | ████▇████████████████████▇███▇ 
 test (testing/trino-f...t-tolerant-hive) | 1866 | 98%    | 21m 59s | 23m 40s |   591 | 2.2%  | ▼ -7%  | ████████████████████████▇█████ 
 pt (SuiteHiveTransactional)              | 1543 | 98%    | 23m 16s | 25m 41s |   551 | 2.1%  | ▼ -3%  | ██████████████████████████████ 
 error-prone-checks                       | 2145 | 95%    | 11m 53s | 32m 34s |   504 | 1.9%  | ▲ +82% | ▃▃▃▄▄▄▄▅▃▆▇▇▇▄▃▇▅▂▂▆▄▇▅▇█▇▇▇▄▃ 
 pt (SuiteIcebergVariants)                | 1680 | 99%    | 17m 57s | 20m 08s |   477 | 1.8%  | ▼ -2%  | ██████████████████████████████ 
 maven-checks 28-ea                       | 2165 | 93%    | 15m 14s | 16m 31s |   471 | 1.8%  | = 0%   | ██████████▇█████████████▇█████ 
 test (plugin/trino-delta-lake)           | 1503 | 98%    | 20m 51s | 23m 23s |   465 | 1.8%  | = 0%   | ██████████████████████████████ 
 maven-checks 27                          | 2165 | 93%    | 14m 57s | 16m 12s |   465 | 1.8%  | ▼ -4%  | ███▇▇███████████████████▇█████ 
 test (plugin/trino-hive)                 | 1468 | 94%    | 21m 27s | 23m 44s |   463 | 1.8%  | ▼ -7%  | █████████████████▇█████▇▇███▇█ 
 test (plugin/trino-hive, test-parquet)   | 1456 | 99%    | 19m 50s | 23m 34s |   438 | 1.7%  | ▲ +3%  | ▇▇▇▇▇▇▇▇████████████████▇█████ 
 test (plugin/trino-druid)                | 1223 | 98%    | 23m 02s | 26m 51s |   426 | 1.6%  | ▼ -17% | ██████████████▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 
 test (core/trino-main)                   | 1176 | 95%    | 25m 38s | 27m 40s |   418 | 1.6%  | ▼ -6%  | ██████████████▇████▇█████▇██▇█ 
 test (testing/trino-f...olerant-iceberg) | 1862 | 98%    | 14m 19s | 15m 24s |   403 | 1.5%  | ▼ -3%  | ██████████████████████████████ 
 pt (SuiteDeltaLakeDatabricks18)          | 1505 | 99%    | 3m 04s  | 47m 55s |   397 | 1.5%  | ▼ -15% | ▁▁▁█▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▆█ 
 pt (SuiteStorageFormatsDetailed)         | 1679 | 100%   | 13m 22s | 15m 26s |   364 | 1.4%  | ▼ -5%  | ████████████████████████████▇▇ 
 test (plugin/trino-hive, fte-tests)      | 1455 | 99%    | 16m 08s | 17m 14s |   362 | 1.4%  | ▲ +1%  | ██████████████████████████████ 
 test (plugin/trino-iceberg, fte-tests)   | 1712 | 99%    | 13m 21s | 14m 33s |   359 | 1.4%  | = 0%   | ██████████████████████████████ 
 artifact-checks                          | 2148 | 98%    | 10m 17s | 11m 38s |   340 | 1.3%  | ▲ +3%  | █▇█▇▇█████████████████████████ 
 test-other-modules                       | 2145 | 97%    | 10m 53s | 16m 27s |   336 | 1.3%  | ▲ +19% | ▄▇▄▇▆▇▆█▇▇▇██▆▅▇▅▂▆▇▄█▇▇████▆▄ 
 pt (SuiteCompatibility)                  | 1678 | 100%   | 11m 58s | 14m 10s |   331 | 1.3%  | ▼ -4%  | ████████████████████████████▇█ 
 pt (SuiteTpcds)                          | 1537 | 100%   | 13m 35s | 15m 41s |   329 | 1.2%  | ▼ -6%  | █████████████████▇██████▇█████ 
 test (plugin/trino-de...lake, fte-tests) | 1501 | 99%    | 13m 55s | 15m 11s |   328 | 1.2%  | ▼ -1%  | ██████████████████████████████ 
 pt (SuiteKafka)                          | 1429 | 100%   | 13m 55s | 15m 59s |   321 | 1.2%  | ▼ -5%  | ████████████████████████████▇▇ 
 test-jdbc-compatibility                  | 2147 | 98%    | 10m 07s | 13m 21s |   311 | 1.2%  | ▲ +7%  | ▆▇▅▇▆▇▇▇█▇█▆▇▆▆▇▆▃▅▇▅▇▇▇▇▇▇▇▆▆ 
 test (plugin/trino-postgresql)           | 1234 | 98%    | 16m 10s | 18m 36s |   310 | 1.2%  | ▼ -3%  | ███████████████▇██▇▇█▇██▇▇▇▇▇▇ 
 pt (SuiteDeltaLakeDatabricks154)         | 1504 | 99%    | 3m 19s  | 41m 41s |   297 | 1.1%  | ▼ -9%  | ▁▁▁▁▁▁▁▁▁▁▁▄▂▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▇█ 
(30 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/0f0ae7b85ba78a1489038a7b3ae21a130900e5bf/sql/ci-cd/06-jobs-duration.sql)

## Where runner time goes, by step

The steps of `ci` jobs that used the most runner time in the last 4 weeks, summed over all jobs that run them, as a share of the runner time of all `ci` jobs. Steps are recorded only for some runs since 2026-10-15, so this is a sample.
Steps other than the tests, like building, checking out, and setting up, are paid again in every job: making them faster saves time in every run.

| Step                                      | Share of runner time | Median  |
| ----------------------------------------- | -------------------- | ------- |
| Maven Tests                               | 33%                  | 5m 18s  |
| Product Tests \(JUnit suites\)            | 25%                  | 2m 39s  |
| Maven Install                             | 10%                  | 1m 54s  |
| Product tests artifact                    | 6%                   | 48s     |
| Run .github/actions/setup                 | 5%                   | 30s     |
| Run actions/checkout@v7.0.1               | 4%                   | 24s     |
| Maven Checks                              | 4%                   | 11m 42s |
| Load Trino Docker image for product tests | 2%                   | 23s     |
| Error Prone Checks                        | 1%                   | 9m 27s  |
| Set up job                                | 1%                   | 7s      |
| Upload test results                       | 1%                   | 12s     |
| Product test distribution                 | 1%                   | 7s      |

[query](https://github.com/trinodb/reports/blob/0f0ae7b85ba78a1489038a7b3ae21a130900e5bf/sql/ci-cd/07-runner-time-by-step.sql)

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
[query](https://github.com/trinodb/reports/blob/0f0ae7b85ba78a1489038a7b3ae21a130900e5bf/sql/ci-cd/08-busy-hours.sql)

## How long jobs wait for a runner

Time from when a job is queued until a runner starts it, by runner type, for jobs of all workflows in the last 4 weeks (wait times are recorded only for some runs since 2026-10-15). P90: one job in ten waits longer.
If waits grow, CI has reached the most jobs it can run at once: see the peaks in "When CI is busy".

| Runner type   |  Jobs | Median wait | P90 wait | Longest wait | Waited over a minute |
| ------------- | -----:| ----------- | -------- | ------------ | --------------------:|
| ubuntu-latest | 37214 | 2s          | 3s       | 4m 00s       |                    8 |
| macos-latest  |   142 | 3s          | 8s       | 13s          |                    0 |

[query](https://github.com/trinodb/reports/blob/0f0ae7b85ba78a1489038a7b3ae21a130900e5bf/sql/ci-cd/09-queue-time.sql)

Generated on Thu Nov 12 15:14:02 UTC 2026

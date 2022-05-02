Trino Flaky Tests
=======

#  Flaky jobs per week
<pre><code>
    Week    |                        Job name                         | Fail percent | Failure count | Success count 
------------+---------------------------------------------------------+--------------+---------------+---------------
 2022-05-02 | test (plugin/trino-kudu)                                |        23.47 |            23 |            75 
 2022-04-25 | hive-tests (config-empty)                               |        51.39 |            37 |            35 
 2022-04-25 | test (plugin/trino-accumulo)                            |         50.0 |             1 |             1 
 2022-04-25 | hive-tests (config-hdp3)                                |        49.33 |            37 |            38 
 2022-04-25 | test (plugin/trino-delta-lake)                          |        38.18 |            21 |            34 
 2022-04-25 | test (plugin/trino-delta-lake, test-failure-recovery)   |        36.21 |            21 |            37 
 2022-04-25 | test (plugin/trino-kudu)                                |          3.9 |             3 |            74 
 2022-04-25 | pt (hdp3, suite-3, 11)                                  |         3.75 |             3 |            77 
 2022-04-25 | test-other-modules                                      |         3.75 |             3 |            77 
 2022-04-25 | test (plugin/trino-iceberg, test-failure-recovery)      |         2.74 |             2 |            71 
 2022-04-25 | maven-checks (11)                                       |          2.6 |             2 |            75 
 2022-04-25 | pt (hdp3, suite-2, 17)                                  |          2.5 |             2 |            78 
 2022-04-25 | pt (hdp3, suite-5, 11)                                  |          2.5 |             2 |            78 
 2022-04-25 | pt (default, suite-7-non-generic, 11)                   |          1.3 |             1 |            76 
 2022-04-25 | pt (default, suite-6-non-generic, 11)                   |         1.28 |             1 |            77 
 2022-04-25 | pt (hdp3, suite-1, 11)                                  |         1.28 |             1 |            77 
 2022-04-25 | pt (hdp3, suite-2, 11)                                  |         1.28 |             1 |            77 
 2022-04-25 | test (plugin/trino-hive, test-failure-recovery)         |         1.28 |             1 |            77 
 2022-04-25 | test (plugin/trino-singlestore)                         |         1.28 |             1 |            77 
 2022-04-18 | test (plugin/trino-iceberg)                             |         2.38 |             2 |            82 
 2022-04-18 | test (plugin/trino-sqlserver)                           |         2.27 |             2 |            86 
 2022-04-18 | maven-checks (17)                                       |         1.15 |             1 |            86 
 2022-04-18 | test (plugin/trino-hive)                                |         1.15 |             1 |            86 
 2022-04-18 | test (plugin/trino-hive, test-fault-tolerant-execution) |         1.15 |             1 |            86 
 2022-04-18 | test (plugin/trino-bigquery)                            |         1.14 |             1 |            87 
 2022-04-18 | test (plugin/trino-delta-lake, test-failure-recovery)   |         1.14 |             1 |            87 
 2022-04-11 | hive-tests (config-hdp3)                                |         5.36 |             3 |            53 
 2022-04-11 | test (plugin/trino-hive, test-fault-tolerant-execution) |          3.7 |             2 |            52 
 2022-04-11 | test (plugin/trino-hive)                                |         3.64 |             2 |            53 
 2022-04-11 | test-jdbc-compatibility                                 |         1.96 |             1 |            50 
 2022-04-11 | test (plugin/trino-iceberg)                             |         1.85 |             1 |            53 
 2022-04-04 | test (plugin/trino-iceberg, test-failure-recovery)      |         75.0 |            66 |            22 
 2022-04-04 | test (plugin/trino-iceberg)                             |        74.71 |            65 |            22 
 2022-04-04 | test (plugin/trino-kudu)                                |        19.81 |            21 |            85 
 2022-04-04 | pt (default, suite-compatibility, 11)                   |          8.4 |            10 |           109 
 2022-04-04 | pt (default, suite-7-non-generic, 11)                   |         6.56 |             8 |           114 
 2022-04-04 | pt (hdp3, suite-1, 11)                                  |         6.56 |             8 |           114 
 2022-04-04 | pt (hdp3, suite-1, 17)                                  |         6.56 |             8 |           114 
 2022-04-04 | pt (hdp3, suite-2, 11)                                  |         6.56 |             8 |           114 
 2022-04-04 | pt (hdp3, suite-2, 17)                                  |         6.56 |             8 |           114 
 2022-04-04 | pt (hdp3, suite-5, 11)                                  |         6.56 |             8 |           114 
 2022-04-04 | pt (apache-hive3, suite-hms-only, 11)                   |         6.45 |             8 |           116 
 2022-04-04 | pt (default, suite-6-non-generic, 11)                   |         6.45 |             8 |           116 
 2022-04-04 | pt (default, suite-8-non-generic, 11)                   |         6.45 |             8 |           116 
 2022-04-04 | pt (default, suite-ldap, 11)                            |         6.45 |             8 |           116 
 2022-04-04 | pt (default, suite-oauth2, 11)                          |         6.45 |             8 |           116 
 2022-04-04 | pt (default, suite-tpcds, 11)                           |         6.45 |             8 |           116 
 2022-04-04 | pt (hdp3, suite-3, 11)                                  |         6.45 |             8 |           116 
 2022-04-04 | test-jdbc-compatibility                                 |         5.65 |             7 |           117 
 2022-04-04 | test-other-modules                                      |         3.28 |             4 |           118 
 2022-04-04 | test (plugin/trino-pinot)                               |         1.63 |             2 |           121 
 2022-04-04 | test (testing/trino-tests)                              |         0.95 |             1 |           104 
 2022-04-04 | maven-checks (17)                                       |          0.9 |             1 |           110 
 2022-03-28 | test (plugin/trino-iceberg, test-failure-recovery)      |        68.18 |            30 |            14 
 2022-03-28 | maven-checks (11)                                       |         50.0 |             1 |             1 
 2022-03-28 | test (plugin/trino-iceberg)                             |        41.89 |            31 |            43 
 2022-03-28 | test (plugin/trino-delta-lake, test-failure-recovery)   |        20.59 |             7 |            27 
 2022-03-28 | test (plugin/trino-delta-lake)                          |        18.03 |            11 |            50 
 2022-03-28 | maven-checks (17)                                       |        10.34 |             6 |            52 
 2022-03-28 | pt (default, suite-8-non-generic, 11)                   |         7.69 |             5 |            60 
 2022-03-28 | hive-tests (config-empty)                               |         6.56 |             4 |            57 
 2022-03-28 | pt (hdp3, suite-1, 17)                                  |         4.62 |             3 |            62 
 2022-03-28 | test (plugin/trino-bigquery)                            |         3.17 |             2 |            61 
 2022-03-28 | pt (default, suite-tpcds, 11)                           |         3.08 |             2 |            63 
 2022-03-28 | pt (hdp3, suite-1, 11)                                  |         3.08 |             2 |            63 
 2022-03-28 | pt (default, suite-oauth2, 11)                          |         3.03 |             2 |            64 
 2022-03-28 | test-other-modules                                      |         1.56 |             1 |            63 
 2022-03-28 | pt (hdp3, suite-3, 11)                                  |         1.54 |             1 |            64 
 2022-03-28 | build-pt                                                |         1.49 |             1 |            66 
 2022-03-21 | test (plugin/trino-kudu)                                |        28.57 |             2 |             5 
 2022-03-21 | test (plugin/trino-iceberg)                             |        13.73 |             7 |            44 
 2022-03-21 | test (plugin/trino-iceberg, test-failure-recovery)      |          9.8 |             5 |            46 
 2022-03-21 | pt (cdh5, suite-1, 11)                                  |         6.12 |             3 |            46 
 2022-03-21 | hive-tests (config-empty)                               |         4.55 |             2 |            42 
 2022-03-21 | test (testing/trino-tests)                              |         2.22 |             1 |            44 
 2022-03-21 | test (plugin/trino-phoenix,plugin/trino-phoenix5)       |         1.96 |             1 |            50 
 2022-03-21 | maven-checks (17)                                       |         1.92 |             1 |            51 
 2022-03-21 | test (plugin/trino-hive, test-failure-recovery)         |         1.92 |             1 |            51 
(78 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/927b9bc515a15be9c4a2d577b0abbefc104e1c7d/sql/flaky/jobs.sql)

Generated on Mon May  2 10:08:50 UTC 2022

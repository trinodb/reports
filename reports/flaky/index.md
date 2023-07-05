---
title: Trino Flaky Tests
---

## Flaky jobs in last 3 months

Counting runs of the `ci` workflow, executed on master and retried jobs from other branches.
Histogram is failure percentage for every day, descending (starts from current day).
Weekends are greyed out.
<pre><code>
                           Job name                            | Fail pct | Failures | Runs |                                       Histogram chart                                       
---------------------------------------------------------------+----------+----------+------+---------------------------------------------------------------------------------------------
 artifact-checks                                               |    10.87 |       35 |  322 |    ░░ ▄  ▁░░  ▁ ▂░░ ▁   ░░     ░░     ░░     ░░   ▁ ░░▁ ▂  ░░▁    ░░    ▁░░     ░░     ░░   
 build-pt                                                      |    12.28 |       35 |  285 |    ░░     ░▂  ▁  ░░     ░░     ░░     ░░     ░░     ░░▁ ▂  ░░▁    ░░  ▄ ▁░░  ▂  ░░     ░░   
 build-test-matrix                                             |    12.46 |       40 |  321 |    ░░    ▁░░ ▁▁  ░░     ░░     ░░     ░░     ░░     ░░▁ ▂  ░░▁    ░░  ▄ ▁░░  ▂  ░░     ░░   
 check-commit                                                  |     50.0 |        1 |    2 |    ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░  ▄  ░░     ░░     ░░     ░░     ░░   
 check-commits-dispatcher                                      |     50.0 |        3 |    6 |    ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░  ▄  ░░     ░░  ▄  ░░     ░░     ░░   
 error-prone-checks                                            |    11.87 |       33 |  278 |    ░░     ░░  ▁  ░░     ░░     ░░     ░░     ░░     ░░▁ ▂  ░░▁    ░░  ▄ ▁░░  ▂  ░░     ░░   
 hive-tests (config-hdp3)                                      |    15.25 |       68 |  446 |   ▂░░ ▁   ░░  ▁  ░░  ▁  ░░ ▁▅▂ ░░     ░░    ▁░░     ░░▁ ▂  ░░▁    ░░  ▄ ▁░░  ▂  ░▄  ▁  ░░   
 maven-checks (17)                                             |    12.31 |       48 |  390 |    ░░  ▁  ░░  ▁  ░░     ░░  ▁  ░░     ░░     ░░     ░░▁ ▂  ░░▁    ░░  ▄ ▁░░  ▃  ░░  ▁ ▂░░   
 maven-checks (19)                                             |     7.58 |        5 |   66 |    ░░  ▁  ░░  ▁  ░░     ░░  ▁  ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░   
 maven-checks (20)                                             |    12.47 |       48 |  385 |    ░░     ░░     ░░     ░░     ░░     ░░     ░░     ▄░▁ ▂  ░░▁  ▄ ░░  ▄ ▁░░ ▁▃  ░░▁ ▁▁ ░░   
 pt (apache-hive3, suite-hms-only, )                           |     7.14 |        9 |  126 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▁  ░░     ░░     ░░    ▄░░     ░░   
 pt (default, suite-1, )                                       |     7.69 |        4 |   52 |   ▄░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░    ▄░░     ░░   
 pt (default, suite-2, )                                       |      6.0 |        3 |   50 |    ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░    ▄░░     ░░   
 pt (default, suite-3, )                                       |     7.69 |        4 |   52 |    ░░     ░░     ░░     ░░     ░░   ▄ ░░     ░░     ░░     ░░     ░░     ░░    ▄░░     ░░   
 pt (default, suite-5, )                                       |    16.18 |       11 |   68 |    ░░     ░░     ░░     ░░     ░░▄    ░░     ░░     ░░     ░░     ░░     ░░    ▄░░     ░░   
 pt (default, suite-6-non-generic, )                           |     9.55 |       17 |  178 |    ░░ ▁   ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▂  ░░     ░░     ░░  ▁  ░░     ░░   
 pt (default, suite-7-non-generic, )                           |      6.9 |        8 |  116 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░  ▁  ░░     ░░     ░░     ░░     ░░     ░░    ▄░░     ░░   
 pt (default, suite-8-non-generic, )                           |     9.03 |       25 |  277 |   ▁░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░  ▄▂ ░░     ░░  ▁  ░░     ░░    ▁░░    ▄░░▄▁   ░░   
 pt (default, suite-all-connectors-smoke, )                    |     8.24 |       15 |  182 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░ ▁▁  ░░▁    ░░     ░░    ▄░░     ░░   
 pt (default, suite-cassandra, )                               |    13.97 |       32 |  229 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▄  ░░     ░░     ░░  ▄ ▁░░▂▁  ▂░░▄▁ 
 pt (default, suite-clickhouse, )                              |     7.27 |        8 |  110 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▄  ░░     ░░     ░░    ▄░░     ░░   
 pt (default, suite-clients, )                                 |      6.0 |        3 |   50 |    ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░    ▄░░     ░░   
 pt (default, suite-compatibility, )                           |     7.14 |       10 |  140 |    ░░ ▁   ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▁  ░░     ░░     ░░     ░░     ░░   
 pt (default, suite-delta-lake-databricks104, )                |    100.0 |        1 |    1 |   █░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░   
 pt (default, suite-delta-lake-databricks113, )                |     8.89 |        4 |   45 |   █░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░▁    ░░   
 pt (default, suite-delta-lake-databricks122, )                |    100.0 |        3 |    3 |   █░░     ░░     ░░     ░░     ░░     █░     ░░     ░░     ░░     ░░     ░░     ░░     ░░   
 pt (default, suite-delta-lake-databricks73, )                 |    11.59 |        8 |   69 |   █░░     ░░     ░░ ▁   ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░ ▁   ░░▁    ░░   
 pt (default, suite-delta-lake-databricks91, )                 |    15.79 |        3 |   19 |   █░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░▁    ░░   
 pt (default, suite-delta-lake-oss, )                          |    10.53 |       12 |  114 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▄▁ ░░     ░░     ░░    ▄░░     ░░   
 pt (default, suite-functions, )                               |     10.0 |        5 |   50 |    ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░   ▁ ░░     ░░     ░░    ▄░░     ░░   
 pt (default, suite-hudi, )                                    |     9.52 |       14 |  147 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▁▁ ░░▁    ░░     ░░    ▄░░     ░░   
 pt (default, suite-iceberg, )                                 |     7.61 |       14 |  184 |    ░░ ▁   ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▁▁ ░░     ░░     ░░    ▄░░     ░░   
 pt (default, suite-ignite, )                                  |     8.59 |       11 |  128 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▁▁ ░░     ░░     ░░    ▄░░     ░░   
 pt (default, suite-kafka, )                                   |     9.23 |       12 |  130 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▁▁ ░░     ░░     ░░    ▄░░     ░░   
 pt (default, suite-ldap, )                                    |    10.07 |       15 |  149 |    ░░     ░░     ░░   ▁▁░░▁ ▁  ░░     ░░     ░░     ░░  ▂▁ ░░     ░░     ░░    ▄░░     ░░   
 pt (default, suite-mysql, )                                   |     8.59 |       11 |  128 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▁▁ ░░     ░░     ░░    ▄░░     ░░   
 pt (default, suite-oauth2, )                                  |     9.23 |       12 |  130 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▁▁ ░░     ░░     ░░    ▄░░     ░░   
 pt (default, suite-parquet, )                                 |    10.45 |       14 |  134 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▂▁ ░░     ░░     ░░    ▄░░     ░░   
 pt (default, suite-storage-formats-detailed, )                |     10.0 |        5 |   50 |    ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░   ▁ ░░     ░░     ░░    ▄░░     ░░   
 pt (default, suite-tpcds, )                                   |     9.09 |       10 |  110 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▄▁ ░░     ░░     ░░    ▄░░     ░░   
 pt (default, suite-tpch, )                                    |     10.0 |        5 |   50 |    ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░   ▁ ░░     ░░     ░░    ▄░░     ░░   
 pt (hdp3, suite-1, )                                          |    11.07 |       28 |  253 |    ░░     ░░     ░░ ▁ ▁ ░░  ▁  ░░     ░░  ▄  ░░ ▂   ░░▁ ▄▁ ░░     ░░ ▄  ▁▄░ ▄  ▄▄░  ▁  ░░   
 pt (hdp3, suite-2, )                                          |     8.33 |        9 |  108 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░   ▁ ░░     ░░     ░░    ▄░░     ░░   
 pt (hdp3, suite-3, )                                          |    11.11 |       16 |  144 |  ▄ ░░ ▁   ░░     ░░   ▁ ░░  ▁  ░░     ░░  ▄  ░░     ░░  ▄▁ ░░     ░░  ▁  ░░    ▄░░     ░░   
 pt (hdp3, suite-5, )                                          |    10.46 |       16 |  153 |    ░░ ▁   ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▁▁ ░░     ░░     ░░    ▃░░     ░░   
 pt (hdp3, suite-cassandra, )                                  |     12.5 |        2 |   16 |    ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░    ▁░░     ░░   
 pt (hdp3, suite-clients, )                                    |     8.33 |        9 |  108 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░   ▁ ░░     ░░     ░░    ▄░░     ░░   
 pt (hdp3, suite-functions, )                                  |    11.57 |       14 |  121 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▄▁ ░░     ░░     ░░    ▂░░     ░░   
 pt (hdp3, suite-storage-formats-detailed, )                   |     9.26 |       10 |  108 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░   ▁ ░░     ░░     ░░    ▄░░     ░░   
 pt (hdp3, suite-tpch, )                                       |     9.26 |       10 |  108 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░   ▁ ░░     ░░     ░░    ▄░░     ░░   
 test (client/trino-jdbc,plugin ... hrift,plugin/trino-memory) |    16.19 |       17 |  105 |    ░░     ░░     ░░   ▁ ░░     ░░     ░░     ░░     ░░  ▄  ░░     ░░    ▁░▃▄▄▁  ░░     ░░   
 test (core/trino-main)                                        |    15.15 |       10 |   66 |    ░░     ░░     ░░   ▁ ░░     ░░     ░░     ░░  ▁  ░░  ▄  ░░     ░░     ░░  ▁  ▄░     ░░   
 test (core/trino-main, 19)                                    |    13.58 |       11 |   81 |    ░░     ░░     ░░   ▁ ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░  ▁  ░░     ░░ ▁ 
 test (core/trino-main, 20)                                    |    18.67 |       28 |  150 |    ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░▁     ░░ ▄   ░░  ▂  ░░  ▁▁ ░░▄▄   ░░▂▂ 
 test (lib/trino-filesystem-s3, cloud-tests)                   |     9.09 |        2 |   22 |    ░░     ░░     ░░   ▁ ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░   
 test (plugin/trino-accumulo)                                  |    19.79 |       38 |  192 |    ░░     ░░     ░░   ▁ ░░     ░░ ▄   ░░     ░░     ░░     ░░▄    ░░▂   ▁▄▂▁▃▁ ▁░░  ▄  ░░   
 test (plugin/trino-bigquery)                                  |    19.72 |      127 |  644 |   ▂░░▆  ▆▆█░ ▃▂  ░░  ▁▁ █░▁ ▃▃ ░▁ ▂▁▁▄░░ ▂▂  ░░▄  ▂ ░░ ▁▁▂ ░░ ▁▂▁▁░░ ▁▁  ░░ ▁▂ ▁▄▂ ▁▁ ▂░░ ▁ 
 test (plugin/trino-bigquery, cloud-tests-arrow)               |    18.35 |       20 |  109 |    ░░    ▆█░     ░░   ▁ ░░     ░░     ░░     ░▂     ░░     ░░     ░░     ░░  ▁  ░░     ░░   
 test (plugin/trino-cassandra)                                 |    13.16 |       15 |  114 |    ░░     ░░     ░░   ▁ ░░     ░░     ░░     ░░     ░░ ▁▁  ░░     ░░     ░░  ▁  ▄░ ▁   ░░ ▄ 
 test (plugin/trino-clickhouse)                                |     8.57 |       12 |  140 |    ░░     ░░     ░░   ▁ ░░     ░░     ░░     ░░     ░░ ▁   ░░     ░░     ░░  ▁  ░░    ▁░░   
 test (plugin/trino-delta-lake)                                |    20.83 |       35 |  168 |    ░░     ░░     ░░   ▁ ░░  ▁ ▄░░     ░░  ▄  ░░     ░░     ░░     ░▆▅    ░░  ▁  ░░     ░░   
 test (plugin/trino-delta-lake, cloud-tests)                   |    32.95 |       85 |  258 |    ░░     ░░ ▃ ▄ ░░   ▁ ░░ ▁▁  ░░   ▄ ░░   ▂ ░░     ░░ ▁▁  ░░   ▁ ░▆▆ ▁ ▄░░  ▇▇ ░░     ░░   
 test (plugin/trino-delta-lake, fte-tests)                     |    11.11 |       12 |  108 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▁  ░░     ░░     ░░  ▁  ░░     ░░   
 test (plugin/trino-delta-lake, gcs-tests)                     |    11.49 |       10 |   87 |    ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░   ▁ ░░ ▁▁  ░░     ░░   
 test (plugin/trino-druid)                                     |     12.2 |       15 |  123 |    ░░     ░░     ░░   ▁ ░░     ░░     ░░     ░░     ░░     ░░     ░░   ▁ ░░  ▁  ░░   ▂ ░░   
 test (plugin/trino-elasticsearch)                             |    11.54 |        6 |   52 |    ░░     ░░     ░░   ▁ ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░  ▁  ░░     ░░   
 test (plugin/trino-hive)                                      |    11.57 |       25 |  216 |    ░░ ▄▁▁▄░░     ░░   ▁ ░░  ▁ ▄░░ ▂   ░░     ░░     ░░  ▄  ░░     ░░     ░░  ▂  ░░     ░░ ▁ 
 test (plugin/trino-hive, fte-tests)                           |    11.32 |       12 |  106 |    ░░▄    ░░▄    ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░     ░░     ░░     ░░  ▁  ░░ ▁   ░░   
 test (plugin/trino-hive, test-parquet)                        |     10.0 |       10 |  100 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▁  ░░     ░░     ░░  ▁  ░░     ░░   
 test (plugin/trino-hudi)                                      |     10.0 |       12 |  120 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▄  ░░▁    ░░     ░░  ▁  ░░     ░░   
 test (plugin/trino-iceberg)                                   |     7.78 |        7 |   90 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▁  ░░     ░░     ░░     ░░     ░░   
 test (plugin/trino-iceberg, cloud-tests)                      |    32.01 |      161 |  503 |    ░░     ░░   ▄ ░░   ▁ ░░  ▁  ░░  ▁  ░░     ░░    ▁░░     ░░   ▁ ░░ ▃▂▁▂░████▃▂█▆▂▂▁▁▂░█▂▂ 
 test (plugin/trino-iceberg, fte-tests)                        |     8.93 |        5 |   56 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▄  ░░     ░░     ░░     ░░     ░░   
 test (plugin/trino-iceberg, minio-and-avro)                   |    10.31 |       10 |   97 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░   ▄ ░░     ░░     ░░  ▁ ▄░░     ░░    ▄░░     ░░     ░░   
 test (plugin/trino-ignite)                                    |      7.1 |       44 |  620 |    ░░     ░░     ░░   ▁ ░░     ░░     ░░     ░░   ▁ ░░     ░░     ░░▄  ▁  ▃▁    ░░     ░░▂▁ 
 test (plugin/trino-kafka)                                     |    15.38 |        4 |   26 |    ░░     ░░     ░░   ▁▄░░     ░░     ░░     ░░     ░░  ▄  ░░     ░░     ░░     ░░     ░░   
 test (plugin/trino-kudu)                                      |     10.0 |        4 |   40 |    ░░     ░░     ░░   ▁ ░░     ░░     ░░     ░░     ░░  ▁  ░░     ░░     ░░     ░░     ░░   
 test (plugin/trino-mariadb)                                   |     8.33 |        2 |   24 |    ░░     ░░     ░░   ▁ ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░   
 test (plugin/trino-mongodb)                                   |     9.52 |        4 |   42 |    ░░     ░░     ░░   ▁ ░░     ░░     ░░     ░░     ░░  ▁  ░░     ░░     ░░     ░░     ░░   
 test (plugin/trino-mysql)                                     |     8.33 |        2 |   24 |    ░░     ░░     ░░   ▁ ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░   
 test (plugin/trino-oracle)                                    |    11.39 |       27 |  237 |    ░░     ░░▄    ░░   ▁ ░░     ░░     ░░▄ ▁ ▄░░▂ ▁▁▁▄░▁    ░░     ░░     ░░     ░░     ░░   
 test (plugin/trino-phoenix5)                                  |    13.95 |        6 |   43 |    ░░     ░░   ▁ ░░   ▁ ░░     ░░     ░░     ░░   ▄ ░░     ░░     ░░     ░░ ▄   ░░     ░░   
 test (plugin/trino-pinot)                                     |    13.24 |       18 |  136 |  ▃ ░░ ▄   ░░     ░░   ▁ ░░   ▄ ░░  ▁  ░░   ▃ ░░ ▁   ░░     ░░     ░░     ░░ ▁ ▁ ░░▁    ░░   
 test (plugin/trino-postgresql)                                |    10.53 |        4 |   38 |    ░░     ░░     ░░   ▁ ░░     ░░     ░░     ░░     ░░  ▁  ░░     ░░     ░░     ░░     ░░   
 test (plugin/trino-raptor-legacy)                             |    14.47 |       11 |   76 |    ░░  ▂  ░░     ░░   ▁ ░░▁    ░░     ░░    ▄░░     ░░▄ ▄  ░░     ░░     ░░     ░░   ▁ ░░   
 test (plugin/trino-redis)                                     |     7.94 |        5 |   63 |    ░░     ░░     ░░   ▁ ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░   ▄ ░▁     ░░   
 test (plugin/trino-redshift)                                  |     11.9 |        5 |   42 |    ░░     ░░     ░░   ▁ ░░     ░░     ░░     ░░     ░░  ▁  ░░     ░░ ▄   ░░     ░░     ░░   
 test (plugin/trino-redshift, cloud-tests)                     |    11.54 |        3 |   26 |    ░░     ░░     ░░   ▁ ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░ ▄   ░░     ░░   
 test (plugin/trino-redshift, fte-tests)                       |    12.82 |        5 |   39 |    ░░▄  ▁ ░░     ░░   ▁ ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░   
 test (plugin/trino-singlestore)                               |    11.54 |        3 |   26 |    ░░     ░░     ░░   ▁ ░░     ░░     ░░     ░░     ░░  ▄  ░░     ░░     ░░     ░░     ░░   
 test (plugin/trino-sqlserver)                                 |    16.28 |        7 |   43 |    ░░     ░░  ▄  ░░   ▁ ░░     ░░     ░░     ░░     ░░  ▄  ░░ ▁   ░░ ▄   ░░     ░░     ░░   
 test (plugin/trino-sqlserver, fte-tests)                      |     50.0 |        1 |    2 |    ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░ ▄   ░░   
 test (testing/trino-faulttolerant-tests, default)             |     8.93 |        5 |   56 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▄  ░░     ░░     ░░     ░░     ░░   
 test (testing/trino-faulttoler ... test-fault-tolerant-delta) |     9.64 |        8 |   83 |    ░░    ▁░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▁  ░░     ░░    ▄░░     ░░     ░░   
 test (testing/trino-faulttoler ...  test-fault-tolerant-hive) |     8.93 |        5 |   56 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▄  ░░     ░░     ░░     ░░     ░░   
 test (testing/trino-faulttoler ... st-fault-tolerant-iceberg) |    10.81 |        8 |   74 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░   ▄ ░░  ▁  ░░     ░░     ░░     ░░     ░░   
 test (testing/trino-tests)                                    |     8.93 |        5 |   56 |    ░░     ░░     ░░   ▁ ░░  ▁  ░░     ░░     ░░     ░░  ▄  ░░     ░░     ░░     ░░     ░░   
 test-jdbc-compatibility                                       |     10.1 |       21 |  208 |    ░░     ░░  ▁  ░░     ░░     ░░     ░░     ░░     ░░▁ ▂  ░░▁    ░░    ▁░░     ░░     ░░   
 test-other-modules                                            |    25.55 |      164 |  642 |    ░░     ░░  ▁  ░░   ▁ ░░     ░░    ▁░░▄▁   ░░▁▁▃▃▃░░▅ ▅  ░░▂▄▂▃ ░░ ▄▂▁▂▃░▁▄▂  ░░     ░░   
 web-ui-checks                                                 |      8.7 |        6 |   69 |    ░░     ░░     ░░     ░░     ░░     ░░     ░░     ░░  ▁  ░░     ░░     ░░     ░░     ░░   
(100 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/7c6e432a950108bb3edd7c240729453d483f0f18/sql/flaky/jobs.sql)

## Flaky jobs per week



| Week       | Job name                                                                                | Fail percent | Failure count | Success count |
| ---------- | --------------------------------------------------------------------------------------- | ------------ | ------------- | ------------- |
| 2023-07-03 | pt (default, suite-delta-lake-databricks104, )                                          | 100.0        | 1             | 0             |
| 2023-07-03 | pt (default, suite-delta-lake-databricks113, )                                          | 100.0        | 1             | 0             |
| 2023-07-03 | pt (default, suite-delta-lake-databricks122, )                                          | 100.0        | 1             | 0             |
| 2023-07-03 | pt (default, suite-delta-lake-databricks73, )                                           | 100.0        | 1             | 0             |
| 2023-07-03 | pt (default, suite-delta-lake-databricks91, )                                           | 100.0        | 1             | 0             |
| 2023-07-03 | pt (default, suite-1, )                                                                 | 50.0         | 1             | 1             |
| 2023-07-03 | pt (hdp3, suite-3, )                                                                    | 50.0         | 1             | 1             |
| 2023-07-03 | hive-tests (config-hdp3)                                                                | 13.33        | 2             | 13            |
| 2023-07-03 | test (plugin/trino-pinot)                                                               | 13.33        | 2             | 13            |
| 2023-07-03 | test (plugin/trino-bigquery)                                                            | 9.09         | 1             | 10            |
| 2023-07-03 | pt (default, suite-8-non-generic, )                                                     | 6.67         | 1             | 14            |
| 2023-06-26 | test (plugin/trino-hive, fte-tests)                                                     | 50.0         | 1             | 1             |
| 2023-06-26 | test (plugin/trino-pinot)                                                               | 50.0         | 1             | 1             |
| 2023-06-26 | test (plugin/trino-bigquery)                                                            | 34.88        | 15            | 28            |
| 2023-06-26 | test (plugin/trino-bigquery, cloud-tests-arrow)                                         | 14.58        | 7             | 41            |
| 2023-06-26 | test (plugin/trino-hive)                                                                | 7.55         | 4             | 49            |
| 2023-06-26 | test (plugin/trino-redshift, fte-tests)                                                 | 6.12         | 3             | 46            |
| 2023-06-26 | test (plugin/trino-raptor-legacy)                                                       | 4.17         | 2             | 46            |
| 2023-06-26 | artifact-checks                                                                         | 3.51         | 2             | 55            |
| 2023-06-26 | test (testing/trino-faulttolerant-tests, test-fault-tolerant-delta)                     | 1.92         | 1             | 51            |
| 2023-06-26 | pt (default, suite-6-non-generic, )                                                     | 1.89         | 1             | 52            |
| 2023-06-26 | pt (default, suite-iceberg, )                                                           | 1.89         | 1             | 52            |
| 2023-06-26 | pt (hdp3, suite-3, )                                                                    | 1.89         | 1             | 52            |
| 2023-06-26 | pt (hdp3, suite-5, )                                                                    | 1.89         | 1             | 52            |
| 2023-06-26 | pt (default, suite-compatibility, )                                                     | 1.85         | 1             | 53            |
| 2023-06-26 | hive-tests (config-hdp3)                                                                | 1.82         | 1             | 54            |
| 2023-06-26 | maven-checks (17)                                                                       | 1.82         | 1             | 54            |
| 2023-06-26 | maven-checks (19)                                                                       | 1.82         | 1             | 54            |
| 2023-06-26 | build-test-matrix                                                                       | 1.79         | 1             | 55            |
| 2023-06-19 | test (plugin/trino-iceberg, cloud-tests)                                                | 50.0         | 1             | 1             |
| 2023-06-19 | test (plugin/trino-oracle)                                                              | 50.0         | 1             | 1             |
| 2023-06-19 | test (plugin/trino-sqlserver)                                                           | 50.0         | 1             | 1             |
| 2023-06-19 | test (plugin/trino-bigquery)                                                            | 19.23        | 10            | 42            |
| 2023-06-19 | test (plugin/trino-bigquery, cloud-tests-arrow)                                         | 7.81         | 5             | 59            |
| 2023-06-19 | build-test-matrix                                                                       | 7.14         | 7             | 91            |
| 2023-06-19 | test (plugin/trino-delta-lake, cloud-tests)                                             | 7.04         | 5             | 66            |
| 2023-06-19 | artifact-checks                                                                         | 5.21         | 5             | 91            |
| 2023-06-19 | build-pt                                                                                | 3.13         | 3             | 93            |
| 2023-06-19 | test (plugin/trino-phoenix5)                                                            | 3.03         | 2             | 64            |
| 2023-06-19 | test-jdbc-compatibility                                                                 | 2.3          | 2             | 85            |
| 2023-06-19 | hive-tests (config-hdp3)                                                                | 2.2          | 2             | 89            |
| 2023-06-19 | test-other-modules                                                                      | 2.2          | 2             | 89            |
| 2023-06-19 | maven-checks (17)                                                                       | 2.11         | 2             | 93            |
| 2023-06-19 | maven-checks (19)                                                                       | 2.11         | 2             | 93            |
| 2023-06-19 | error-prone-checks                                                                      | 2.08         | 2             | 94            |
| 2023-06-19 | test (plugin/trino-hive, fte-tests)                                                     | 1.45         | 1             | 68            |
| 2023-06-12 | test (plugin/trino-bigquery)                                                            | 6.49         | 5             | 72            |
| 2023-06-12 | pt (hdp3, suite-1, )                                                                    | 3.96         | 4             | 97            |
| 2023-06-12 | test-other-modules                                                                      | 3.96         | 4             | 97            |
| 2023-06-12 | test (plugin/trino-kafka)                                                               | 3.37         | 3             | 86            |
| 2023-06-12 | pt (default, suite-6-non-generic, )                                                     | 2.97         | 3             | 98            |
| 2023-06-12 | pt (default, suite-ldap, )                                                              | 2.97         | 3             | 98            |
| 2023-06-12 | test (plugin/trino-pinot)                                                               | 2.33         | 2             | 84            |
| 2023-06-12 | test (plugin/trino-sqlserver)                                                           | 2.33         | 2             | 84            |
| 2023-06-12 | test (core/trino-main)                                                                  | 2.3          | 2             | 85            |
| 2023-06-12 | test (core/trino-main, 19)                                                              | 2.3          | 2             | 85            |
| 2023-06-12 | test (plugin/trino-accumulo)                                                            | 2.25         | 2             | 87            |
| 2023-06-12 | test (plugin/trino-bigquery, cloud-tests-arrow)                                         | 2.25         | 2             | 87            |
| 2023-06-12 | test (plugin/trino-cassandra)                                                           | 2.25         | 2             | 87            |
| 2023-06-12 | test (plugin/trino-clickhouse)                                                          | 2.25         | 2             | 87            |
| 2023-06-12 | test (plugin/trino-druid)                                                               | 2.25         | 2             | 87            |
| 2023-06-12 | test (plugin/trino-elasticsearch)                                                       | 2.25         | 2             | 87            |
| 2023-06-12 | test (plugin/trino-ignite)                                                              | 2.25         | 2             | 87            |
| 2023-06-12 | test (plugin/trino-kudu)                                                                | 2.25         | 2             | 87            |
| 2023-06-12 | test (plugin/trino-mariadb)                                                             | 2.25         | 2             | 87            |
| 2023-06-12 | test (plugin/trino-mongodb)                                                             | 2.25         | 2             | 87            |
| 2023-06-12 | test (plugin/trino-mysql)                                                               | 2.25         | 2             | 87            |
| 2023-06-12 | test (plugin/trino-oracle)                                                              | 2.25         | 2             | 87            |
| 2023-06-12 | test (plugin/trino-phoenix5)                                                            | 2.25         | 2             | 87            |
| 2023-06-12 | test (plugin/trino-postgresql)                                                          | 2.25         | 2             | 87            |
| 2023-06-12 | test (plugin/trino-redis)                                                               | 2.25         | 2             | 87            |
| 2023-06-12 | test (plugin/trino-redshift)                                                            | 2.25         | 2             | 87            |
| 2023-06-12 | test (plugin/trino-redshift, cloud-tests)                                               | 2.25         | 2             | 87            |
| 2023-06-12 | test (plugin/trino-redshift, fte-tests)                                                 | 2.25         | 2             | 87            |
| 2023-06-12 | test (plugin/trino-singlestore)                                                         | 2.25         | 2             | 87            |
| 2023-06-12 | test (plugin/trino-hive, test-parquet)                                                  | 2.22         | 2             | 88            |
| 2023-06-12 | test (lib/trino-filesystem-s3, cloud-tests)                                             | 2.2          | 2             | 89            |
| 2023-06-12 | test (plugin/trino-hive)                                                                | 2.2          | 2             | 89            |
| 2023-06-12 | test (plugin/trino-hive, fte-tests)                                                     | 2.2          | 2             | 89            |
| 2023-06-12 | test (plugin/trino-raptor-legacy)                                                       | 2.2          | 2             | 89            |
| 2023-06-12 | test (client/trino-jdbc,plugin/trino-base-jdbc,plugin/trino-thrift,plugin/trino-memory) | 2.15         | 2             | 91            |
| 2023-06-12 | test (plugin/trino-hudi)                                                                | 2.15         | 2             | 91            |
| 2023-06-12 | test (plugin/trino-iceberg)                                                             | 2.15         | 2             | 91            |
| 2023-06-12 | test (plugin/trino-iceberg, cloud-tests)                                                | 2.15         | 2             | 91            |
| 2023-06-12 | test (plugin/trino-iceberg, fte-tests)                                                  | 2.15         | 2             | 91            |
| 2023-06-12 | test (plugin/trino-iceberg, minio-and-avro)                                             | 2.15         | 2             | 91            |
| 2023-06-12 | test (testing/trino-faulttolerant-tests, test-fault-tolerant-delta)                     | 2.15         | 2             | 91            |
| 2023-06-12 | test (testing/trino-tests)                                                              | 2.15         | 2             | 91            |
| 2023-06-12 | pt (default, suite-delta-lake-databricks73, )                                           | 2.06         | 2             | 95            |
| 2023-06-12 | test (plugin/trino-delta-lake)                                                          | 2.06         | 2             | 95            |
| 2023-06-12 | test (plugin/trino-delta-lake, cloud-tests)                                             | 2.06         | 2             | 95            |
| 2023-06-12 | test (plugin/trino-delta-lake, fte-tests)                                               | 2.06         | 2             | 95            |
| 2023-06-12 | test (testing/trino-faulttolerant-tests, default)                                       | 2.06         | 2             | 95            |
| 2023-06-12 | test (testing/trino-faulttolerant-tests, test-fault-tolerant-hive)                      | 2.06         | 2             | 95            |
| 2023-06-12 | test (testing/trino-faulttolerant-tests, test-fault-tolerant-iceberg)                   | 2.06         | 2             | 95            |
| 2023-06-12 | hive-tests (config-hdp3)                                                                | 2.04         | 2             | 96            |
| 2023-06-12 | artifact-checks                                                                         | 2.02         | 2             | 97            |
| 2023-06-12 | pt (apache-hive3, suite-hms-only, )                                                     | 1.98         | 2             | 99            |
| 2023-06-12 | pt (default, suite-7-non-generic, )                                                     | 1.98         | 2             | 99            |
| 2023-06-12 | pt (default, suite-8-non-generic, )                                                     | 1.98         | 2             | 99            |
| 2023-06-12 | pt (default, suite-all-connectors-smoke, )                                              | 1.98         | 2             | 99            |
| 2023-06-12 | pt (default, suite-cassandra, )                                                         | 1.98         | 2             | 99            |
| 2023-06-12 | pt (default, suite-clickhouse, )                                                        | 1.98         | 2             | 99            |
| 2023-06-12 | pt (default, suite-compatibility, )                                                     | 1.98         | 2             | 99            |
| 2023-06-12 | pt (default, suite-delta-lake-oss, )                                                    | 1.98         | 2             | 99            |
| 2023-06-12 | pt (default, suite-hudi, )                                                              | 1.98         | 2             | 99            |
| 2023-06-12 | pt (default, suite-iceberg, )                                                           | 1.98         | 2             | 99            |
| 2023-06-12 | pt (default, suite-ignite, )                                                            | 1.98         | 2             | 99            |
| 2023-06-12 | pt (default, suite-kafka, )                                                             | 1.98         | 2             | 99            |
| 2023-06-12 | pt (default, suite-mysql, )                                                             | 1.98         | 2             | 99            |
| 2023-06-12 | pt (default, suite-oauth2, )                                                            | 1.98         | 2             | 99            |
| 2023-06-12 | pt (default, suite-parquet, )                                                           | 1.98         | 2             | 99            |
| 2023-06-12 | pt (default, suite-tpcds, )                                                             | 1.98         | 2             | 99            |
| 2023-06-12 | pt (hdp3, suite-2, )                                                                    | 1.98         | 2             | 99            |
| 2023-06-12 | pt (hdp3, suite-3, )                                                                    | 1.98         | 2             | 99            |
| 2023-06-12 | pt (hdp3, suite-5, )                                                                    | 1.98         | 2             | 99            |
| 2023-06-12 | pt (hdp3, suite-clients, )                                                              | 1.98         | 2             | 99            |
| 2023-06-12 | pt (hdp3, suite-functions, )                                                            | 1.98         | 2             | 99            |
| 2023-06-12 | pt (hdp3, suite-storage-formats-detailed, )                                             | 1.98         | 2             | 99            |
| 2023-06-12 | pt (hdp3, suite-tpch, )                                                                 | 1.98         | 2             | 99            |
| 2023-06-05 | test (plugin/trino-pinot)                                                               | 50.0         | 1             | 1             |
| 2023-06-05 | hive-tests (config-hdp3)                                                                | 28.74        | 25            | 62            |
| 2023-06-05 | test (plugin/trino-bigquery)                                                            | 18.31        | 13            | 58            |
| 2023-06-05 | test (plugin/trino-delta-lake, cloud-tests)                                             | 4.55         | 4             | 84            |
| 2023-06-05 | test (plugin/trino-delta-lake)                                                          | 3.66         | 3             | 79            |
| 2023-06-05 | test (plugin/trino-iceberg, minio-and-avro)                                             | 3.41         | 3             | 85            |
| 2023-06-05 | pt (default, suite-ldap, )                                                              | 3.37         | 3             | 86            |
| 2023-06-05 | pt (hdp3, suite-functions, )                                                            | 3.37         | 3             | 86            |
| 2023-06-05 | pt (hdp3, suite-storage-formats-detailed, )                                             | 3.37         | 3             | 86            |
| 2023-06-05 | pt (hdp3, suite-tpch, )                                                                 | 3.37         | 3             | 86            |
| 2023-06-05 | test (plugin/trino-hive)                                                                | 3.37         | 3             | 86            |
| 2023-06-05 | pt (default, suite-compatibility, )                                                     | 3.33         | 3             | 87            |
| 2023-06-05 | pt (default, suite-7-non-generic, )                                                     | 2.27         | 2             | 86            |
| 2023-06-05 | pt (hdp3, suite-1, )                                                                    | 2.27         | 2             | 86            |
| 2023-06-05 | test (plugin/trino-delta-lake, fte-tests)                                               | 2.27         | 2             | 86            |
| 2023-06-05 | test (plugin/trino-hive, fte-tests)                                                     | 2.27         | 2             | 86            |
| 2023-06-05 | test (plugin/trino-hive, test-parquet)                                                  | 2.27         | 2             | 86            |
| 2023-06-05 | test (plugin/trino-hudi)                                                                | 2.27         | 2             | 86            |
| 2023-06-05 | test (plugin/trino-iceberg)                                                             | 2.27         | 2             | 86            |
| 2023-06-05 | test (plugin/trino-iceberg, fte-tests)                                                  | 2.27         | 2             | 86            |
| 2023-06-05 | test (testing/trino-faulttolerant-tests, default)                                       | 2.27         | 2             | 86            |
| 2023-06-05 | test (testing/trino-faulttolerant-tests, test-fault-tolerant-delta)                     | 2.27         | 2             | 86            |
| 2023-06-05 | test (testing/trino-faulttolerant-tests, test-fault-tolerant-hive)                      | 2.27         | 2             | 86            |
| 2023-06-05 | test (testing/trino-faulttolerant-tests, test-fault-tolerant-iceberg)                   | 2.27         | 2             | 86            |
| 2023-06-05 | test (testing/trino-tests)                                                              | 2.27         | 2             | 86            |
| 2023-06-05 | pt (apache-hive3, suite-hms-only, )                                                     | 2.25         | 2             | 87            |
| 2023-06-05 | pt (default, suite-6-non-generic, )                                                     | 2.25         | 2             | 87            |
| 2023-06-05 | pt (default, suite-8-non-generic, )                                                     | 2.25         | 2             | 87            |
| 2023-06-05 | pt (default, suite-all-connectors-smoke, )                                              | 2.25         | 2             | 87            |
| 2023-06-05 | pt (default, suite-cassandra, )                                                         | 2.25         | 2             | 87            |
| 2023-06-05 | pt (default, suite-clickhouse, )                                                        | 2.25         | 2             | 87            |
| 2023-06-05 | pt (default, suite-delta-lake-oss, )                                                    | 2.25         | 2             | 87            |
| 2023-06-05 | pt (default, suite-hudi, )                                                              | 2.25         | 2             | 87            |
| 2023-06-05 | pt (default, suite-iceberg, )                                                           | 2.25         | 2             | 87            |
| 2023-06-05 | pt (default, suite-ignite, )                                                            | 2.25         | 2             | 87            |
| 2023-06-05 | pt (default, suite-kafka, )                                                             | 2.25         | 2             | 87            |
| 2023-06-05 | pt (default, suite-mysql, )                                                             | 2.25         | 2             | 87            |
| 2023-06-05 | pt (default, suite-oauth2, )                                                            | 2.25         | 2             | 87            |
| 2023-06-05 | pt (default, suite-parquet, )                                                           | 2.25         | 2             | 87            |
| 2023-06-05 | pt (default, suite-tpcds, )                                                             | 2.25         | 2             | 87            |
| 2023-06-05 | pt (hdp3, suite-2, )                                                                    | 2.25         | 2             | 87            |
| 2023-06-05 | pt (hdp3, suite-3, )                                                                    | 2.25         | 2             | 87            |
| 2023-06-05 | pt (hdp3, suite-5, )                                                                    | 2.25         | 2             | 87            |
| 2023-06-05 | pt (hdp3, suite-clients, )                                                              | 2.25         | 2             | 87            |
| 2023-06-05 | test (plugin/trino-iceberg, cloud-tests)                                                | 2.25         | 2             | 87            |
| 2023-06-05 | maven-checks (17)                                                                       | 2.22         | 2             | 88            |
| 2023-06-05 | maven-checks (19)                                                                       | 2.22         | 2             | 88            |
| 2023-06-05 | test (plugin/trino-oracle)                                                              | 1.41         | 1             | 70            |
| 2023-06-05 | test (plugin/trino-raptor-legacy)                                                       | 1.33         | 1             | 74            |
| 2023-06-05 | test-jdbc-compatibility                                                                 | 1.23         | 1             | 80            |
| 2023-06-05 | artifact-checks                                                                         | 1.12         | 1             | 88            |
| 2023-06-05 | build-pt                                                                                | 1.11         | 1             | 89            |
| 2023-06-05 | error-prone-checks                                                                      | 1.11         | 1             | 89            |
| 2023-06-05 | build-test-matrix                                                                       | 1.1          | 1             | 90            |
| 2023-06-05 | test-other-modules                                                                      | 1.1          | 1             | 90            |
| 2023-05-29 | pt (default, suite-3, )                                                                 | 50.0         | 1             | 1             |
| 2023-05-29 | test (plugin/trino-accumulo)                                                            | 50.0         | 1             | 1             |
| 2023-05-29 | test (plugin/trino-delta-lake, cloud-tests)                                             | 50.0         | 1             | 1             |
| 2023-05-29 | test (plugin/trino-iceberg, minio-and-avro)                                             | 50.0         | 1             | 1             |
| 2023-05-29 | test (plugin/trino-bigquery)                                                            | 16.39        | 10            | 51            |
| 2023-05-29 | pt (default, suite-5, )                                                                 | 11.43        | 8             | 62            |
| 2023-05-29 | test (plugin/trino-hive)                                                                | 2.86         | 2             | 68            |
| 2023-05-29 | test (plugin/trino-iceberg)                                                             | 1.45         | 1             | 68            |
| 2023-05-29 | test (plugin/trino-pinot)                                                               | 1.45         | 1             | 68            |
| 2023-05-29 | test (plugin/trino-iceberg, cloud-tests)                                                | 1.43         | 1             | 69            |
| 2023-05-29 | pt (default, suite-7-non-generic, )                                                     | 1.41         | 1             | 70            |
| 2023-05-29 | test-other-modules                                                                      | 1.35         | 1             | 73            |
| 2023-05-22 | test (plugin/trino-oracle)                                                              | 50.0         | 1             | 1             |
| 2023-05-22 | test-other-modules                                                                      | 50.0         | 1             | 1             |
| 2023-05-22 | pt (default, suite-delta-lake-databricks122, )                                          | 14.29        | 2             | 12            |

[query](https://github.com/nineinchnick/trino-cicd/blob/7c6e432a950108bb3edd7c240729453d483f0f18/sql/flaky/jobs-week.sql)

## Flaky tests in last 30 days



| Test name                                                                                                         | Count | %   | First seen at           | Last seen at            | Messages                                      |
| ----------------------------------------------------------------------------------------------------------------- | ----- | --- | ----------------------- | ----------------------- | --------------------------------------------- |
| TestHiveS3AndGlueMetastoreTest\.testBasicOperationsWithProvidedTableLocation\[true, TRAILING\_WHITESPACE\]\(8\)   | 1     | 0.0 | 2023-07-04 00:26:41.000 | 2023-07-04 00:26:41.000 | [Schema test\_glue\_s3\_r2k5crziw1 not found] |
| TestHiveS3AndGlueMetastoreTest\.testBasicOperationsWithProvidedTableLocation\[true, PERCENT\]\(6\)                | 1     | 0.0 | 2023-07-04 00:26:41.000 | 2023-07-04 00:26:41.000 | [Schema test\_glue\_s3\_r2k5crziw1 not found] |
| TestHiveS3AndGlueMetastoreTest\.testBasicOperationsWithProvidedTableLocation\[false, TRAILING\_SLASH\]\(10\)      | 1     | 0.0 | 2023-07-04 00:26:41.000 | 2023-07-04 00:26:41.000 | [Schema test\_glue\_s3\_r2k5crziw1 not found] |
| TestHiveS3AndGlueMetastoreTest\.tearDown                                                                          | 1     | 0.0 | 2023-07-04 00:26:41.000 | 2023-07-04 00:26:41.000 | [Schema test\_glue\_s3\_r2k5crziw1 not found] |
| TestHiveS3AndGlueMetastoreTest\.testBasicOperationsWithProvidedTableLocation\[false, WHITESPACE\]\(15\)           | 1     | 0.0 | 2023-07-04 00:26:41.000 | 2023-07-04 00:26:41.000 | [Schema test\_glue\_s3\_r2k5crziw1 not found] |
| TestHiveS3AndGlueMetastoreTest\.testBasicOperationsWithProvidedTableLocation\[true, REGULAR\]\(1\)                | 1     | 0.0 | 2023-07-04 00:26:41.000 | 2023-07-04 00:26:41.000 | [Schema test\_glue\_s3\_r2k5crziw1 not found] |
| TestS3FileSystemAwsS3\.testInputFile                                                                              | 1     | 0.0 | 2023-07-04 00:26:41.000 | 2023-07-04 00:26:41.000 | [Connection reset]                            |
| TestHiveS3AndGlueMetastoreTest\.testBasicOperationsWithProvidedTableLocation\[true, TRAILING\_SLASH\]\(2\)        | 1     | 0.0 | 2023-07-04 00:26:41.000 | 2023-07-04 00:26:41.000 | [Schema test\_glue\_s3\_r2k5crziw1 not found] |
| TestHiveS3AndGlueMetastoreTest\.testBasicOperationsWithProvidedTableLocation\[true, WHITESPACE\]\(7\)             | 1     | 0.0 | 2023-07-04 00:26:41.000 | 2023-07-04 00:26:41.000 | [Schema test\_glue\_s3\_r2k5crziw1 not found] |
| TestHiveS3AndGlueMetastoreTest\.testBasicOperationsWithProvidedTableLocation\[false, PERCENT\]\(14\)              | 1     | 0.0 | 2023-07-04 00:26:41.000 | 2023-07-04 00:26:41.000 | [Schema test\_glue\_s3\_r2k5crziw1 not found] |
| TestHiveS3AndGlueMetastoreTest\.testBasicOperationsWithProvidedTableLocation\[false, REGULAR\]\(9\)               | 1     | 0.0 | 2023-07-04 00:26:41.000 | 2023-07-04 00:26:41.000 | [Schema test\_glue\_s3\_r2k5crziw1 not found] |
| TestHiveS3AndGlueMetastoreTest\.testBasicOperationsWithProvidedTableLocation\[false, TRAILING\_WHITESPACE\]\(16\) | 1     | 0.0 | 2023-07-04 00:26:41.000 | 2023-07-04 00:26:41.000 | [Schema test\_glue\_s3\_r2k5crziw1 not found] |

[query](https://github.com/nineinchnick/trino-cicd/blob/7c6e432a950108bb3edd7c240729453d483f0f18/sql/flaky/tests.sql)

## Flaky test classes in last 30 days



| test_class_name                | failed_runs | % runs | failed_methods | last_occurrence_at      |
| ------------------------------ | ----------- | ------ | -------------- | ----------------------- |
| TestHiveS3AndGlueMetastoreTest | 1           | 0.0    | 11             | 2023-07-04 00:26:41.000 |
| TestS3FileSystemAwsS3          | 1           | 0.0    | 1              | 2023-07-04 00:26:41.000 |

[query](https://github.com/nineinchnick/trino-cicd/blob/7c6e432a950108bb3edd7c240729453d483f0f18/sql/flaky/classes.sql)

Generated on Wed Jul  5 06:40:30 UTC 2023

Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |       updated_at        |  untouched_for   |   running_time    | time_since_review | time_since_push 
--------+----------------------------------------------------------------------+-------------------------+------------------+-------------------+-------------------+-----------------
   1364 | Filter tables based on table privilege of user                       | 2019-10-10 09:07:45.000 | 861 21:18:31.828 | -0 16:27:24.000   | 862 13:45:55.828  | NULL            
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 2020-02-11 20:15:18.000 | 737 10:10:58.828 | 0 00:00:00.000    | 737 10:10:58.828  | NULL            
   2832 | Use file extension based on the file format                          | 2020-03-02 13:41:32.000 | 717 16:44:44.828 | 0 00:00:00.000    | 717 16:44:44.828  | NULL            
   4834 | Reuse containers in product tests                                    | 2020-08-25 15:52:33.000 | 541 14:33:43.828 | 0 00:00:00.000    | 541 14:33:43.828  | NULL            
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 2020-08-31 12:22:42.000 | 535 18:03:34.828 | 0 00:00:00.000    | 535 18:03:34.828  | NULL            
   2976 | [WIP] Add sybase connector                                           | 2020-10-18 17:32:31.000 | 487 12:53:45.828 | NULL              | NULL              | NULL            
   4426 | Fix type mismatch between partition and table                        | 2020-10-21 06:53:00.000 | 484 23:33:16.828 | -36 02:00:45.000  | 521 01:34:01.828  | NULL            
   5624 | Ability to run product tests from IntelliJ                           | 2020-10-24 07:12:28.000 | 481 23:13:48.828 | -2 02:02:34.000   | 484 01:16:22.828  | NULL            
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 2020-11-24 09:00:33.000 | 450 21:25:43.828 | -131 15:18:16.000 | 582 12:43:59.828  | NULL            
   5699 | Add support for HDFS only iceberg tables                             | 2021-01-14 20:19:37.000 | 399 10:06:39.828 | NULL              | NULL              | NULL            
   7870 | Isaac Scafe Writing Exercises                                        | 2021-06-04 17:38:15.000 | 258 12:48:01.828 | -14 19:30:29.000  | 273 08:18:30.828  | NULL            
   5834 | Throw SQLException in getTime                                        | 2021-07-30 22:13:59.000 | 202 08:12:17.828 | -245 22:29:10.000 | 448 06:41:27.828  | NULL            
   8255 | Add aggregation push down into Oracle                                | 2021-10-06 19:56:33.000 | 134 10:29:43.828 | NULL              | NULL              | NULL            
   1832 | Feature/add sortkey distkey redshift                                 | 2021-10-06 19:56:36.000 | 134 10:29:40.828 | -665 22:50:15.000 | 800 09:19:55.828  | NULL            
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 2021-10-07 04:33:18.000 | 134 01:52:58.828 | -338 12:56:39.000 | 472 14:49:37.828  | NULL            
   9722 | Remove usage of @test with exceptions in plugin tests                | 2021-11-08 19:07:06.000 | 101 11:19:10.828 | 69 06:17:46.000   | 32 05:01:24.828   | NULL            
   9893 | Derive more precise types for EXTRACT                                | 2021-11-08 19:07:06.000 | 101 11:19:10.828 | 26 02:13:54.000   | 75 09:05:16.828   | NULL            
   9752 | Fix description in IfStatement                                       | 2021-11-08 19:07:06.000 | 101 11:19:10.828 | -7 17:34:05.000   | 109 04:53:15.828  | NULL            
   9817 | Fix bug in iceberg connector with external table locations           | 2021-11-08 19:07:06.000 | 101 11:19:10.828 | 56 21:07:27.000   | 44 14:11:43.828   | NULL            
   9789 | allow push down join on redshift                                     | 2021-11-08 19:07:06.000 | 101 11:19:10.828 | NULL              | NULL              | NULL            
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/85e053f18bb632913b3a757b626fb85a08ceae88/sql/pr/stale-prs.sql)

#  Stale PRs
<pre><code>
 number |                                          title                                          |       updated_at        |  untouched_for   |  running_time   | time_since_review | time_since_push 
--------+-----------------------------------------------------------------------------------------+-------------------------+------------------+-----------------+-------------------+-----------------
   8743 | Add support for optional Kafka properties from external file                            | 2021-11-08 19:07:08.000 | 101 11:19:30.058 | 80 19:34:26.000 | 20 15:45:04.058   | NULL            
   7994 | ConnectorExpression pushdown                                                            | 2021-11-09 16:48:45.000 | 100 13:37:53.058 | 80 03:48:14.000 | 20 09:49:39.058   | NULL            
   9906 | Refactor Iceberg table statistics to be deterministic                                   | 2021-11-09 11:10:15.000 | 100 19:16:23.058 | 73 07:48:27.000 | 27 11:27:56.058   | NULL            
   3507 | Upgrade gcs to 2.2.2                                                                    | 2021-11-08 19:07:10.000 | 101 11:19:28.058 | 73 01:58:13.000 | 28 09:21:15.058   | NULL            
   9788 | Add support for OpenID connect metadata discovery mechanism                             | 2021-11-08 19:07:07.000 | 101 11:19:31.058 | 72 14:48:00.000 | 28 20:31:31.058   | NULL            
   9841 | Make map and array functions use IS DISTINCT semantics as appropriate                   | 2021-11-18 16:50:24.000 | 91 13:36:14.058  | 69 08:56:34.000 | 22 04:39:40.058   | NULL            
   9722 | Remove usage of @test with exceptions in plugin tests                                   | 2021-11-08 19:07:06.000 | 101 11:19:32.058 | 69 06:17:46.000 | 32 05:01:46.058   | NULL            
   3316 | Allow merging consecutive 'long' values in SortedRangeSet                               | 2021-11-21 15:56:23.000 | 88 14:30:15.058  | 63 17:10:25.000 | 24 21:19:50.058   | NULL            
   9812 | Add PostgreSQL and Oracle migration files for DB backed resource group manager          | 2021-11-17 22:36:50.000 | 92 07:49:48.058  | 63 06:57:32.000 | 29 00:52:16.058   | NULL            
   9965 | Improve performance/memory overhead for Spatial Join                                    | 2021-11-18 20:58:14.000 | 91 09:28:24.058  | 63 01:07:44.000 | 28 08:20:40.058   | NULL            
   9818 | [WIP] Implement task level retries                                                      | 2021-11-19 12:32:56.000 | 90 17:53:42.058  | 62 07:56:01.000 | 28 09:57:41.058   | NULL            
   7828 | Use Datastax Cassandra java driver v4                                                   | 2021-11-08 19:07:08.000 | 101 11:19:30.058 | 61 01:29:54.000 | 40 09:49:36.058   | NULL            
   9541 | [Pinot connector] Add support for basic authentication                                  | 2021-11-18 05:15:55.000 | 92 01:10:43.058  | 60 23:08:27.000 | 31 02:02:16.058   | NULL            
   8474 | Implement timestamp predicate pushdown in Druid connector                               | 2021-11-08 19:07:08.000 | 101 11:19:30.058 | 60 12:34:24.000 | 40 22:45:06.058   | NULL            
   9938 | Support Metrics mode when creating/writing Iceberg tables                               | 2021-11-15 17:30:16.000 | 94 12:56:22.058  | 59 20:19:39.000 | 34 16:36:43.058   | NULL            
   9868 | Allow ValueSet expansion into a discrete set for Bloom filtering                        | 2021-11-21 15:53:38.000 | 88 14:33:00.058  | 59 17:17:39.000 | 28 21:15:21.058   | NULL            
   9613 | Support ALTER MATERIALIZED VIEW ... SET PROPERTIES ...                                  | 2021-11-22 05:22:36.000 | 88 01:04:02.058  | 58 07:34:38.000 | 29 17:29:24.058   | NULL            
   9817 | Fix bug in iceberg connector with external table locations                              | 2021-11-08 19:07:06.000 | 101 11:19:32.058 | 56 21:07:27.000 | 44 14:12:05.058   | NULL            
   8202 | Fixed #2748 - Metadata for alias in elasticsearch connector only uses the first mapping | 2021-11-20 13:04:09.000 | 89 17:22:29.058  | 55 18:54:03.000 | 33 22:28:26.058   | NULL            
   9951 | Add WKB Support for PostGIS Geometry Columns                                            | 2021-11-18 03:41:23.000 | 92 02:45:15.058  | 55 04:26:35.000 | 36 22:18:40.058   | NULL            
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/85e053f18bb632913b3a757b626fb85a08ceae88/sql/pr/running-prs.sql)

#  Stale PRs
<pre><code>
 number |                          title                          |       updated_at        |  untouched_for   |   running_time    | time_since_review | time_since_push 
--------+---------------------------------------------------------+-------------------------+------------------+-------------------+-------------------+-----------------
    685 | Add SampleNode stats and cost rule                      | 2021-12-20 01:27:10.000 | 60 04:59:48.067  | -966 15:39:04.000 | 1026 20:38:52.067 | NULL            
    685 | Add SampleNode stats and cost rule                      | 2021-11-08 19:07:10.000 | 101 11:19:48.067 | -925 09:19:04.000 | 1026 20:38:52.067 | NULL            
    624 | Optimize distinct aggregation on multiple columns       | 2021-11-08 19:07:11.000 | 101 11:19:47.067 | -909 18:24:54.000 | 1011 05:44:41.067 | NULL            
    624 | Optimize distinct aggregation on multiple columns       | 2021-12-20 01:27:10.000 | 60 04:59:48.067  | -951 00:44:53.000 | 1011 05:44:41.067 | NULL            
    821 | Distributed sort for unpartitioned window functions     | 2021-11-08 19:07:10.000 | 101 11:19:48.067 | -895 02:18:18.000 | 996 13:38:06.067  | NULL            
    821 | Distributed sort for unpartitioned window functions     | 2021-12-20 01:27:10.000 | 60 04:59:48.067  | -936 08:38:18.000 | 996 13:38:06.067  | NULL            
    855 | Change client to assume types are encoded as text       | 2021-11-08 19:07:10.000 | 101 11:19:48.067 | -893 11:04:02.000 | 994 22:23:50.067  | NULL            
    855 | Change client to assume types are encoded as text       | 2021-12-20 01:27:10.000 | 60 04:59:48.067  | -934 17:24:02.000 | 994 22:23:50.067  | NULL            
    819 | Remove TableLayout from TPCDS connector                 | 2021-11-08 19:07:10.000 | 101 11:19:48.067 | -888 12:46:56.000 | 990 00:06:44.067  | NULL            
   1255 | Remove no longer needed ConnectorSplitSource#isFinished | 2021-12-20 01:27:10.000 | 60 04:59:48.067  | -866 16:34:38.000 | 926 21:34:26.067  | NULL            
   1255 | Remove no longer needed ConnectorSplitSource#isFinished | 2021-11-08 19:07:10.000 | 101 11:19:48.067 | -825 10:14:38.000 | 926 21:34:26.067  | NULL            
   1224 | Add graceful shutdown script for Docker                 | 2021-11-08 19:07:10.000 | 101 11:19:48.067 | -825 03:06:17.000 | 926 14:26:05.067  | NULL            
   1224 | Add graceful shutdown script for Docker                 | 2021-12-20 01:27:10.000 | 60 04:59:48.067  | -866 09:26:17.000 | 926 14:26:05.067  | NULL            
   1319 | Add execution statistic warnings                        | 2021-12-20 01:27:10.000 | 60 04:59:48.067  | -853 16:57:33.000 | 913 21:57:21.067  | NULL            
   1319 | Add execution statistic warnings                        | 2021-11-08 19:07:10.000 | 101 11:19:48.067 | -812 10:37:33.000 | 913 21:57:21.067  | NULL            
   1317 | Add connector table metadata warnings                   | 2021-11-08 19:07:10.000 | 101 11:19:48.067 | -804 22:16:59.000 | 906 09:36:47.067  | NULL            
   1317 | Add connector table metadata warnings                   | 2021-12-20 01:27:10.000 | 60 04:59:48.067  | -846 04:36:59.000 | 906 09:36:47.067  | NULL            
   1364 | Filter tables based on table privilege of user          | 2019-10-10 09:07:45.000 | 861 21:19:13.067 | -0 16:27:24.000   | 862 13:46:37.067  | NULL            
   1637 | [WIP] patch to add support for array by table subquery  | 2021-11-08 19:07:10.000 | 101 11:19:48.067 | -761 01:00:33.000 | 862 12:20:21.067  | NULL            
   1637 | [WIP] patch to add support for array by table subquery  | 2021-12-20 01:27:10.000 | 60 04:59:48.067  | -802 07:20:33.000 | 862 12:20:21.067  | NULL            
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/85e053f18bb632913b3a757b626fb85a08ceae88/sql/pr/awaiting-review.sql)

#  Stale PRs
<pre><code>
 number |                                          title                                          |       updated_at        |  untouched_for  |   running_time   | time_since_review | time_since_push 
--------+-----------------------------------------------------------------------------------------+-------------------------+-----------------+------------------+-------------------+-----------------
  10453 | Enable Jacoco coverage for product tests                                                | 2022-01-18 15:45:13.000 | 30 14:42:02.926 | -0 05:06:10.000  | 30 19:48:12.926   | NULL            
  10524 | Upgrade okhttp to 4.9.3                                                                 | 2022-01-18 15:42:59.000 | 30 14:44:16.926 | -6 22:56:02.000  | 37 13:40:18.926   | NULL            
  10614 | Enable writer scaling by default                                                        | 2022-01-18 14:07:03.000 | 30 16:20:12.926 | -0 03:23:40.000  | 30 19:43:52.926   | NULL            
  10248 | Add support for composite external auth redirect handler                                | 2022-01-18 12:33:28.000 | 30 17:53:47.926 | -28 21:47:04.000 | 59 15:40:51.926   | NULL            
  10411 | Document atop connector                                                                 | 2022-01-18 12:33:13.000 | 30 17:54:02.926 | -0 02:00:54.000  | 30 19:54:56.926   | NULL            
   8202 | Fixed #2748 - Metadata for alias in elasticsearch connector only uses the first mapping | 2022-01-15 09:01:14.000 | 33 21:26:01.926 | -0 01:03:02.000  | 33 22:29:03.926   | NULL            
  10535 | Retry STS Throttling error codes in TrinoS3FileSystem                                   | 2022-01-14 14:56:46.000 | 34 15:30:29.926 | -1 15:36:34.000  | 36 07:07:03.926   | NULL            
  10598 | Don't suppress test-specific assertion descriptions in QueryAssert                      | 2022-01-14 09:53:32.000 | 34 20:33:43.926 | 0 00:00:00.000   | 34 20:33:43.926   | NULL            
   9831 | Support JSON_EXISTS, JSON_VALUE and JSON_QUERY functions                                | 2022-01-14 09:46:55.000 | 34 20:40:20.926 | -14 23:47:19.000 | 49 20:27:39.926   | NULL            
  10771 | Add documentation for db resource group manager                                         | 2022-01-30 15:55:10.000 | 18 14:32:05.926 | -4 17:55:13.000  | 23 08:27:18.926   | NULL            
   7994 | ConnectorExpression pushdown                                                            | 2022-01-30 14:23:28.000 | 18 16:03:47.926 | -1 17:46:29.000  | 20 09:50:16.926   | NULL            
  10854 | [WIP] Add comments at column level for views                                            | 2022-01-30 13:55:43.000 | 18 16:31:32.926 | NULL             | NULL              | NULL            
  10831 | Document existing Hive properties                                                       | 2022-01-30 13:23:03.000 | 18 17:04:12.926 | -2 04:02:20.000  | 20 21:06:32.926   | NULL            
  10790 | Document OPTIMIZE for Iceberg                                                           | 2022-02-08 20:55:25.000 | 9 09:31:50.926  | -12 08:58:02.000 | 21 18:29:52.926   | NULL            
  10549 | Avoid firing RemoveRedundantTableScanPredicate when there is no TableScan predicate     | 2022-02-08 17:16:41.000 | 9 13:10:34.926  | -26 22:14:30.000 | 36 11:25:04.926   | NULL            
   9965 | Improve performance/memory overhead for Spatial Join                                    | 2022-02-08 11:59:53.000 | 9 18:27:22.926  | -18 13:53:55.000 | 28 08:21:17.926   | NULL            
  10979 | Delay removal of containers during Docker image tests                                   | 2022-02-08 11:52:30.000 | 9 18:34:45.926  | NULL             | NULL              | NULL            
  10843 | Use airlift json codec in http event listener, fixing airlift/airlift#983               | 2022-02-08 11:41:46.000 | 9 18:45:29.926  | NULL             | NULL              | NULL            
   9788 | Add support for OpenID connect metadata discovery mechanism                             | 2022-01-20 09:57:39.000 | 28 20:29:36.926 | -0 00:02:32.000  | 28 20:32:08.926   | NULL            
  10681 | Return exception message in HTTP header                                                 | 2022-01-19 12:12:26.000 | 29 18:14:49.926 | 0 00:00:00.000   | 29 18:14:49.926   | NULL            
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/85e053f18bb632913b3a757b626fb85a08ceae88/sql/pr/abandoned-prs.sql)

Generated on Fri Feb 18 06:27:34 UTC 2022

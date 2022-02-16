Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                      title                                      |       updated_at        |  untouched_for   |   running_time    | time_since_review | time_since_push 
--------+---------------------------------------------------------------------------------+-------------------------+------------------+-------------------+-------------------+-----------------
   1364 | Filter tables based on table privilege of user                                  | 2019-10-10 09:07:45.000 | 860 05:09:34.935 | -0 16:27:24.000   | 860 21:36:58.935  | NULL            
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor            | 2020-02-11 20:15:18.000 | 735 18:02:01.935 | 0 00:00:00.000    | 735 18:02:01.935  | NULL            
   2832 | Use file extension based on the file format                                     | 2020-03-02 13:41:32.000 | 716 00:35:47.935 | 0 00:00:00.000    | 716 00:35:47.935  | NULL            
   4834 | Reuse containers in product tests                                               | 2020-08-25 15:52:33.000 | 539 22:24:46.935 | 0 00:00:00.000    | 539 22:24:46.935  | NULL            
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()                  | 2020-08-31 12:22:42.000 | 534 01:54:37.935 | 0 00:00:00.000    | 534 01:54:37.935  | NULL            
   2976 | [WIP] Add sybase connector                                                      | 2020-10-18 17:32:31.000 | 485 20:44:48.935 | NULL              | NULL              | NULL            
   4426 | Fix type mismatch between partition and table                                   | 2020-10-21 06:53:00.000 | 483 07:24:19.935 | -36 02:00:45.000  | 519 09:25:04.935  | NULL            
   5624 | Ability to run product tests from IntelliJ                                      | 2020-10-24 07:12:28.000 | 480 07:04:51.935 | -2 02:02:34.000   | 482 09:07:25.935  | NULL            
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                            | 2020-11-24 09:00:33.000 | 449 05:16:46.935 | -131 15:18:16.000 | 580 20:35:02.935  | NULL            
   5699 | Add support for HDFS only iceberg tables                                        | 2021-01-14 20:19:37.000 | 397 17:57:42.935 | NULL              | NULL              | NULL            
   7870 | Isaac Scafe Writing Exercises                                                   | 2021-06-04 17:38:15.000 | 256 20:39:04.935 | -14 19:30:29.000  | 271 16:09:33.935  | NULL            
   5834 | Throw SQLException in getTime                                                   | 2021-07-30 22:13:59.000 | 200 16:03:20.935 | -245 22:29:10.000 | 446 14:32:30.935  | NULL            
   8255 | Add aggregation push down into Oracle                                           | 2021-10-06 19:56:33.000 | 132 18:20:46.935 | NULL              | NULL              | NULL            
   1832 | Feature/add sortkey distkey redshift                                            | 2021-10-06 19:56:36.000 | 132 18:20:43.935 | -665 22:50:15.000 | 798 17:10:58.935  | NULL            
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`                 | 2021-10-07 04:33:18.000 | 132 09:44:01.935 | -338 12:56:39.000 | 470 22:40:40.935  | NULL            
   9893 | Derive more precise types for EXTRACT                                           | 2021-11-08 19:07:06.000 | 99 19:10:13.935  | 26 02:13:54.000   | 73 16:56:19.935   | NULL            
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass                   | 2021-11-08 19:07:06.000 | 99 19:10:13.935  | NULL              | NULL              | NULL            
   9752 | Fix description in IfStatement                                                  | 2021-11-08 19:07:06.000 | 99 19:10:13.935  | -7 17:34:05.000   | 107 12:44:18.935  | NULL            
   9708 | Add testDivide expected result verification using BigDecimal.divide             | 2021-11-08 19:07:06.000 | 99 19:10:13.935  | NULL              | NULL              | NULL            
   9859 |  Allow NON-ASCII Chars on extra credentials values and session property values. | 2021-11-08 19:07:06.000 | 99 19:10:13.935  | NULL              | NULL              | NULL            
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/7b47d21c0a89ffc7c6e3d60cf9049f2c04b4d41d/sql/pr/stale-prs.sql)

#  Stale PRs
<pre><code>
 number |                                          title                                          |       updated_at        |  untouched_for  |  running_time   | time_since_review | time_since_push 
--------+-----------------------------------------------------------------------------------------+-------------------------+-----------------+-----------------+-------------------+-----------------
   8743 | Add support for optional Kafka properties from external file                            | 2021-11-08 19:07:08.000 | 99 19:10:28.639 | 80 19:34:26.000 | 18 23:36:02.639   | NULL            
   7994 | ConnectorExpression pushdown                                                            | 2021-11-09 16:48:45.000 | 98 21:28:51.639 | 80 03:48:14.000 | 18 17:40:37.639   | NULL            
   9906 | Refactor Iceberg table statistics to be deterministic                                   | 2021-11-09 11:10:15.000 | 99 03:07:21.639 | 73 07:48:27.000 | 25 19:18:54.639   | NULL            
   3507 | Upgrade gcs to 2.2.2                                                                    | 2021-11-08 19:07:10.000 | 99 19:10:26.639 | 73 01:58:13.000 | 26 17:12:13.639   | NULL            
   9788 | Add support for OpenID connect metadata discovery mechanism                             | 2021-11-08 19:07:07.000 | 99 19:10:29.639 | 72 14:48:00.000 | 27 04:22:29.639   | NULL            
   9841 | Make map and array functions use IS DISTINCT semantics as appropriate                   | 2021-11-18 16:50:24.000 | 89 21:27:12.639 | 69 08:56:34.000 | 20 12:30:38.639   | NULL            
   9722 | Remove usage of @test with exceptions in plugin tests                                   | 2021-11-08 19:07:06.000 | 99 19:10:30.639 | 69 06:17:46.000 | 30 12:52:44.639   | NULL            
   3316 | Allow merging consecutive 'long' values in SortedRangeSet                               | 2021-11-21 15:56:23.000 | 86 22:21:13.639 | 63 17:10:25.000 | 23 05:10:48.639   | NULL            
   9812 | Add PostgreSQL and Oracle migration files for DB backed resource group manager          | 2021-11-17 22:36:50.000 | 90 15:40:46.639 | 63 06:57:32.000 | 27 08:43:14.639   | NULL            
   9965 | Improve performance/memory overhead for Spatial Join                                    | 2021-11-18 20:58:14.000 | 89 17:19:22.639 | 63 01:07:44.000 | 26 16:11:38.639   | NULL            
   9818 | [WIP] Implement task level retries                                                      | 2021-11-19 12:32:56.000 | 89 01:44:40.639 | 62 07:56:01.000 | 26 17:48:39.639   | NULL            
   7828 | Use Datastax Cassandra java driver v4                                                   | 2021-11-08 19:07:08.000 | 99 19:10:28.639 | 61 01:29:54.000 | 38 17:40:34.639   | NULL            
   9541 | [Pinot connector] Add support for basic authentication                                  | 2021-11-18 05:15:55.000 | 90 09:01:41.639 | 60 23:08:27.000 | 29 09:53:14.639   | NULL            
   8474 | Implement timestamp predicate pushdown in Druid connector                               | 2021-11-08 19:07:08.000 | 99 19:10:28.639 | 60 12:34:24.000 | 39 06:36:04.639   | NULL            
   9938 | Support Metrics mode when creating/writing Iceberg tables                               | 2021-11-15 17:30:16.000 | 92 20:47:20.639 | 59 20:19:39.000 | 33 00:27:41.639   | NULL            
   9868 | Allow ValueSet expansion into a discrete set for Bloom filtering                        | 2021-11-21 15:53:38.000 | 86 22:23:58.639 | 59 17:17:39.000 | 27 05:06:19.639   | NULL            
   9613 | Support ALTER MATERIALIZED VIEW ... SET PROPERTIES ...                                  | 2021-11-22 05:22:36.000 | 86 08:55:00.639 | 58 07:34:38.000 | 28 01:20:22.639   | NULL            
   9817 | Fix bug in iceberg connector with external table locations                              | 2021-11-08 19:07:06.000 | 99 19:10:30.639 | 56 21:07:27.000 | 42 22:03:03.639   | NULL            
   8202 | Fixed #2748 - Metadata for alias in elasticsearch connector only uses the first mapping | 2021-11-20 13:04:09.000 | 88 01:13:27.639 | 55 18:54:03.000 | 32 06:19:24.639   | NULL            
   9951 | Add WKB Support for PostGIS Geometry Columns                                            | 2021-11-18 03:41:23.000 | 90 10:36:13.639 | 55 04:26:35.000 | 35 06:09:38.639   | NULL            
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/7b47d21c0a89ffc7c6e3d60cf9049f2c04b4d41d/sql/pr/running-prs.sql)

#  Stale PRs
<pre><code>
 number |                          title                          |       updated_at        |  untouched_for   |   running_time    | time_since_review | time_since_push 
--------+---------------------------------------------------------+-------------------------+------------------+-------------------+-------------------+-----------------
    685 | Add SampleNode stats and cost rule                      | 2021-11-08 19:07:10.000 | 99 19:10:43.673  | -925 09:19:04.000 | 1025 04:29:47.673 | NULL            
    685 | Add SampleNode stats and cost rule                      | 2021-12-20 01:27:10.000 | 58 12:50:43.673  | -966 15:39:04.000 | 1025 04:29:47.673 | NULL            
    624 | Optimize distinct aggregation on multiple columns       | 2021-11-08 19:07:11.000 | 99 19:10:42.673  | -909 18:24:54.000 | 1009 13:35:36.673 | NULL            
    624 | Optimize distinct aggregation on multiple columns       | 2021-12-20 01:27:10.000 | 58 12:50:43.673  | -951 00:44:53.000 | 1009 13:35:36.673 | NULL            
    821 | Distributed sort for unpartitioned window functions     | 2021-12-20 01:27:10.000 | 58 12:50:43.673  | -936 08:38:18.000 | 994 21:29:01.673  | NULL            
    821 | Distributed sort for unpartitioned window functions     | 2021-11-08 19:07:10.000 | 99 19:10:43.673  | -895 02:18:18.000 | 994 21:29:01.673  | NULL            
    855 | Change client to assume types are encoded as text       | 2021-12-20 01:27:10.000 | 58 12:50:43.673  | -934 17:24:02.000 | 993 06:14:45.673  | NULL            
    855 | Change client to assume types are encoded as text       | 2021-11-08 19:07:10.000 | 99 19:10:43.673  | -893 11:04:02.000 | 993 06:14:45.673  | NULL            
    819 | Remove TableLayout from TPCDS connector                 | 2021-11-08 19:07:10.000 | 99 19:10:43.673  | -888 12:46:56.000 | 988 07:57:39.673  | NULL            
   1255 | Remove no longer needed ConnectorSplitSource#isFinished | 2021-12-20 01:27:10.000 | 58 12:50:43.673  | -866 16:34:38.000 | 925 05:25:21.673  | NULL            
   1255 | Remove no longer needed ConnectorSplitSource#isFinished | 2021-11-08 19:07:10.000 | 99 19:10:43.673  | -825 10:14:38.000 | 925 05:25:21.673  | NULL            
   1224 | Add graceful shutdown script for Docker                 | 2021-11-08 19:07:10.000 | 99 19:10:43.673  | -825 03:06:17.000 | 924 22:17:00.673  | NULL            
   1224 | Add graceful shutdown script for Docker                 | 2021-12-20 01:27:10.000 | 58 12:50:43.673  | -866 09:26:17.000 | 924 22:17:00.673  | NULL            
   1319 | Add execution statistic warnings                        | 2021-12-20 01:27:10.000 | 58 12:50:43.673  | -853 16:57:33.000 | 912 05:48:16.673  | NULL            
   1319 | Add execution statistic warnings                        | 2021-11-08 19:07:10.000 | 99 19:10:43.673  | -812 10:37:33.000 | 912 05:48:16.673  | NULL            
   1317 | Add connector table metadata warnings                   | 2021-11-08 19:07:10.000 | 99 19:10:43.673  | -804 22:16:59.000 | 904 17:27:42.673  | NULL            
   1317 | Add connector table metadata warnings                   | 2021-12-20 01:27:10.000 | 58 12:50:43.673  | -846 04:36:59.000 | 904 17:27:42.673  | NULL            
   1364 | Filter tables based on table privilege of user          | 2019-10-10 09:07:45.000 | 860 05:10:08.673 | -0 16:27:24.000   | 860 21:37:32.673  | NULL            
   1637 | [WIP] patch to add support for array by table subquery  | 2021-12-20 01:27:10.000 | 58 12:50:43.673  | -802 07:20:33.000 | 860 20:11:16.673  | NULL            
   1637 | [WIP] patch to add support for array by table subquery  | 2021-11-08 19:07:10.000 | 99 19:10:43.673  | -761 01:00:33.000 | 860 20:11:16.673  | NULL            
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/7b47d21c0a89ffc7c6e3d60cf9049f2c04b4d41d/sql/pr/awaiting-review.sql)

#  Stale PRs
<pre><code>
 number |                                        title                                        |       updated_at        |  untouched_for  |   running_time    | time_since_review | time_since_push 
--------+-------------------------------------------------------------------------------------+-------------------------+-----------------+-------------------+-------------------+-----------------
   8020 | [Connector]Add plugin for Apache Pulsar.                                            | 2022-02-07 12:13:27.000 | 9 02:04:44.022  | -79 23:57:14.000  | 89 02:01:58.022   | NULL            
  10378 | Add function management abstractions                                                | 2022-01-14 03:38:21.000 | 33 10:39:50.022 | NULL              | NULL              | NULL            
  10461 | Correct log retention properties                                                    | 2022-01-13 22:39:04.000 | 33 15:39:07.022 | 0 00:00:00.000    | 33 15:39:07.022   | NULL            
  10116 | Introduce LDAP Group Provider                                                       | 2022-01-13 14:33:29.000 | 33 23:44:42.022 | 0 00:00:00.000    | 33 23:44:42.022   | NULL            
  10528 | Add LDAP group-provider                                                             | 2022-01-13 14:23:38.000 | 33 23:54:33.022 | NULL              | NULL              | NULL            
  10004 | Run all tests on JDK 17                                                             | 2022-01-13 12:00:09.000 | 34 02:18:02.022 | -14 12:20:16.000  | 48 14:38:18.022   | NULL            
  10561 | retry to connect to hive metastore with new delegation token.                       | 2022-01-13 01:43:07.000 | 34 12:35:04.022 | -0 13:20:38.000   | 35 01:55:42.022   | NULL            
  10549 | Avoid firing RemoveRedundantTableScanPredicate when there is no TableScan predicate | 2022-01-13 00:46:07.000 | 34 13:32:04.022 | -0 05:43:56.000   | 34 19:16:00.022   | NULL            
   7131 | Elasticsearch Connector support applyAggregation                                    | 2022-01-12 11:22:24.000 | 35 02:55:47.022 | -211 02:18:38.000 | 246 05:14:25.022  | NULL            
  10500 |  FileBasedSystemAccessControl: Make impersonation new_user optional                 | 2022-01-12 11:07:54.000 | 35 03:10:17.022 | 0 00:00:00.000    | 35 03:10:17.022   | NULL            
   9951 | Add WKB Support for PostGIS Geometry Columns                                        | 2022-01-12 08:13:47.000 | 35 06:04:24.022 | -0 00:05:49.000   | 35 06:10:13.022   | NULL            
  10531 | fix a bug of planning infinite in some cases                                        | 2022-01-11 11:42:13.000 | 36 02:35:58.022 | NULL              | NULL              | NULL            
  10504 | WIP: Driver processing improvements                                                 | 2022-01-10 15:24:42.000 | 36 22:53:29.022 | NULL              | NULL              | NULL            
   9447 | Support correlated subqueries for DELETE                                            | 2022-01-10 09:03:11.000 | 37 05:15:00.022 | -45 17:56:01.000  | 82 23:11:01.022   | NULL            
  10046 | Add MariaDB connector                                                               | 2022-01-10 08:59:49.000 | 37 05:18:22.022 | -33 02:12:11.000  | 70 07:30:33.022   | NULL            
  10508 | Disable running tests in separate threads                                           | 2022-01-09 00:14:45.000 | 38 14:03:26.022 | NULL              | NULL              | NULL            
  10177 | Update jline to 3.21.0                                                              | 2022-01-07 23:52:32.000 | 39 14:25:39.022 | -35 02:11:06.000  | 74 16:36:45.022   | NULL            
   9337 | Iceberg support partitioning on a nested field                                      | 2022-01-07 19:51:39.000 | 39 18:26:32.022 | -99 23:31:57.000  | 139 17:58:29.022  | NULL            
  10706 | Row wise group by on fixed width types                                              | 2022-02-07 12:45:15.000 | 9 01:32:56.022  | -17 02:48:07.000  | 26 04:21:03.022   | NULL            
  10956 | Add product tests for clickhouse clusters                                           | 2022-02-07 12:36:57.000 | 9 01:41:14.022  | NULL              | NULL              | NULL            
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/7b47d21c0a89ffc7c6e3d60cf9049f2c04b4d41d/sql/pr/abandoned-prs.sql)

Generated on Wed Feb 16 14:18:25 UTC 2022

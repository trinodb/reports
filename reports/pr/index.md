Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                      title                                      |       updated_at        |  untouched_for   |   running_time    | time_since_review | time_since_push 
--------+---------------------------------------------------------------------------------+-------------------------+------------------+-------------------+-------------------+-----------------
   1364 | Filter tables based on table privilege of user                                  | 2019-10-10 09:07:45.000 | 860 21:18:24.673 | -0 16:27:24.000   | 861 13:45:48.673  | NULL            
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor            | 2020-02-11 20:15:18.000 | 736 10:10:51.673 | 0 00:00:00.000    | 736 10:10:51.673  | NULL            
   2832 | Use file extension based on the file format                                     | 2020-03-02 13:41:32.000 | 716 16:44:37.673 | 0 00:00:00.000    | 716 16:44:37.673  | NULL            
   4834 | Reuse containers in product tests                                               | 2020-08-25 15:52:33.000 | 540 14:33:36.673 | 0 00:00:00.000    | 540 14:33:36.673  | NULL            
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()                  | 2020-08-31 12:22:42.000 | 534 18:03:27.673 | 0 00:00:00.000    | 534 18:03:27.673  | NULL            
   2976 | [WIP] Add sybase connector                                                      | 2020-10-18 17:32:31.000 | 486 12:53:38.673 | NULL              | NULL              | NULL            
   4426 | Fix type mismatch between partition and table                                   | 2020-10-21 06:53:00.000 | 483 23:33:09.673 | -36 02:00:45.000  | 520 01:33:54.673  | NULL            
   5624 | Ability to run product tests from IntelliJ                                      | 2020-10-24 07:12:28.000 | 480 23:13:41.673 | -2 02:02:34.000   | 483 01:16:15.673  | NULL            
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                            | 2020-11-24 09:00:33.000 | 449 21:25:36.673 | -131 15:18:16.000 | 581 12:43:52.673  | NULL            
   5699 | Add support for HDFS only iceberg tables                                        | 2021-01-14 20:19:37.000 | 398 10:06:32.673 | NULL              | NULL              | NULL            
   7870 | Isaac Scafe Writing Exercises                                                   | 2021-06-04 17:38:15.000 | 257 12:47:54.673 | -14 19:30:29.000  | 272 08:18:23.673  | NULL            
   5834 | Throw SQLException in getTime                                                   | 2021-07-30 22:13:59.000 | 201 08:12:10.673 | -245 22:29:10.000 | 447 06:41:20.673  | NULL            
   8255 | Add aggregation push down into Oracle                                           | 2021-10-06 19:56:33.000 | 133 10:29:36.673 | NULL              | NULL              | NULL            
   1832 | Feature/add sortkey distkey redshift                                            | 2021-10-06 19:56:36.000 | 133 10:29:33.673 | -665 22:50:15.000 | 799 09:19:48.673  | NULL            
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`                 | 2021-10-07 04:33:18.000 | 133 01:52:51.673 | -338 12:56:39.000 | 471 14:49:30.673  | NULL            
   9689 | [TEST] Separate GitHub Actions job to build documentation                       | 2021-11-08 19:07:06.000 | 100 11:19:03.673 | NULL              | NULL              | NULL            
   9752 | Fix description in IfStatement                                                  | 2021-11-08 19:07:06.000 | 100 11:19:03.673 | -7 17:34:05.000   | 108 04:53:08.673  | NULL            
   9851 | Use smaller load factors for small join hash arrays                             | 2021-11-08 19:07:06.000 | 100 11:19:03.673 | 14 19:49:15.000   | 85 15:29:48.673   | NULL            
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass                   | 2021-11-08 19:07:06.000 | 100 11:19:03.673 | NULL              | NULL              | NULL            
   9859 |  Allow NON-ASCII Chars on extra credentials values and session property values. | 2021-11-08 19:07:06.000 | 100 11:19:03.673 | NULL              | NULL              | NULL            
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/2deda0e0c29d8a94b22dd3daaf20d3fa8d6e9f7b/sql/pr/stale-prs.sql)

#  Stale PRs
<pre><code>
 number |                                          title                                          |       updated_at        |  untouched_for   |  running_time   | time_since_review | time_since_push 
--------+-----------------------------------------------------------------------------------------+-------------------------+------------------+-----------------+-------------------+-----------------
   8743 | Add support for optional Kafka properties from external file                            | 2021-11-08 19:07:08.000 | 100 11:19:18.872 | 80 19:34:26.000 | 19 15:44:52.872   | NULL            
   7994 | ConnectorExpression pushdown                                                            | 2021-11-09 16:48:45.000 | 99 13:37:41.872  | 80 03:48:14.000 | 19 09:49:27.872   | NULL            
   9906 | Refactor Iceberg table statistics to be deterministic                                   | 2021-11-09 11:10:15.000 | 99 19:16:11.872  | 73 07:48:27.000 | 26 11:27:44.872   | NULL            
   3507 | Upgrade gcs to 2.2.2                                                                    | 2021-11-08 19:07:10.000 | 100 11:19:16.872 | 73 01:58:13.000 | 27 09:21:03.872   | NULL            
   9788 | Add support for OpenID connect metadata discovery mechanism                             | 2021-11-08 19:07:07.000 | 100 11:19:19.872 | 72 14:48:00.000 | 27 20:31:19.872   | NULL            
   9841 | Make map and array functions use IS DISTINCT semantics as appropriate                   | 2021-11-18 16:50:24.000 | 90 13:36:02.872  | 69 08:56:34.000 | 21 04:39:28.872   | NULL            
   9722 | Remove usage of @test with exceptions in plugin tests                                   | 2021-11-08 19:07:06.000 | 100 11:19:20.872 | 69 06:17:46.000 | 31 05:01:34.872   | NULL            
   3316 | Allow merging consecutive 'long' values in SortedRangeSet                               | 2021-11-21 15:56:23.000 | 87 14:30:03.872  | 63 17:10:25.000 | 23 21:19:38.872   | NULL            
   9812 | Add PostgreSQL and Oracle migration files for DB backed resource group manager          | 2021-11-17 22:36:50.000 | 91 07:49:36.872  | 63 06:57:32.000 | 28 00:52:04.872   | NULL            
   9965 | Improve performance/memory overhead for Spatial Join                                    | 2021-11-18 20:58:14.000 | 90 09:28:12.872  | 63 01:07:44.000 | 27 08:20:28.872   | NULL            
   9818 | [WIP] Implement task level retries                                                      | 2021-11-19 12:32:56.000 | 89 17:53:30.872  | 62 07:56:01.000 | 27 09:57:29.872   | NULL            
   7828 | Use Datastax Cassandra java driver v4                                                   | 2021-11-08 19:07:08.000 | 100 11:19:18.872 | 61 01:29:54.000 | 39 09:49:24.872   | NULL            
   9541 | [Pinot connector] Add support for basic authentication                                  | 2021-11-18 05:15:55.000 | 91 01:10:31.872  | 60 23:08:27.000 | 30 02:02:04.872   | NULL            
   8474 | Implement timestamp predicate pushdown in Druid connector                               | 2021-11-08 19:07:08.000 | 100 11:19:18.872 | 60 12:34:24.000 | 39 22:44:54.872   | NULL            
   9938 | Support Metrics mode when creating/writing Iceberg tables                               | 2021-11-15 17:30:16.000 | 93 12:56:10.872  | 59 20:19:39.000 | 33 16:36:31.872   | NULL            
   9868 | Allow ValueSet expansion into a discrete set for Bloom filtering                        | 2021-11-21 15:53:38.000 | 87 14:32:48.872  | 59 17:17:39.000 | 27 21:15:09.872   | NULL            
   9613 | Support ALTER MATERIALIZED VIEW ... SET PROPERTIES ...                                  | 2021-11-22 05:22:36.000 | 87 01:03:50.872  | 58 07:34:38.000 | 28 17:29:12.872   | NULL            
   9817 | Fix bug in iceberg connector with external table locations                              | 2021-11-08 19:07:06.000 | 100 11:19:20.872 | 56 21:07:27.000 | 43 14:11:53.872   | NULL            
   8202 | Fixed #2748 - Metadata for alias in elasticsearch connector only uses the first mapping | 2021-11-20 13:04:09.000 | 88 17:22:17.872  | 55 18:54:03.000 | 32 22:28:14.872   | NULL            
   9951 | Add WKB Support for PostGIS Geometry Columns                                            | 2021-11-18 03:41:23.000 | 91 02:45:03.872  | 55 04:26:35.000 | 35 22:18:28.872   | NULL            
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/2deda0e0c29d8a94b22dd3daaf20d3fa8d6e9f7b/sql/pr/running-prs.sql)

#  Stale PRs
<pre><code>
 number |                          title                          |       updated_at        |  untouched_for   |   running_time    | time_since_review | time_since_push 
--------+---------------------------------------------------------+-------------------------+------------------+-------------------+-------------------+-----------------
    685 | Add SampleNode stats and cost rule                      | 2021-11-08 19:07:10.000 | 100 11:19:33.090 | -925 09:19:04.000 | 1025 20:38:37.090 | NULL            
    685 | Add SampleNode stats and cost rule                      | 2021-12-20 01:27:10.000 | 59 04:59:33.090  | -966 15:39:04.000 | 1025 20:38:37.090 | NULL            
    624 | Optimize distinct aggregation on multiple columns       | 2021-12-20 01:27:10.000 | 59 04:59:33.090  | -951 00:44:53.000 | 1010 05:44:26.090 | NULL            
    624 | Optimize distinct aggregation on multiple columns       | 2021-11-08 19:07:11.000 | 100 11:19:32.090 | -909 18:24:54.000 | 1010 05:44:26.090 | NULL            
    821 | Distributed sort for unpartitioned window functions     | 2021-11-08 19:07:10.000 | 100 11:19:33.090 | -895 02:18:18.000 | 995 13:37:51.090  | NULL            
    821 | Distributed sort for unpartitioned window functions     | 2021-12-20 01:27:10.000 | 59 04:59:33.090  | -936 08:38:18.000 | 995 13:37:51.090  | NULL            
    855 | Change client to assume types are encoded as text       | 2021-12-20 01:27:10.000 | 59 04:59:33.090  | -934 17:24:02.000 | 993 22:23:35.090  | NULL            
    855 | Change client to assume types are encoded as text       | 2021-11-08 19:07:10.000 | 100 11:19:33.090 | -893 11:04:02.000 | 993 22:23:35.090  | NULL            
    819 | Remove TableLayout from TPCDS connector                 | 2021-11-08 19:07:10.000 | 100 11:19:33.090 | -888 12:46:56.000 | 989 00:06:29.090  | NULL            
   1255 | Remove no longer needed ConnectorSplitSource#isFinished | 2021-11-08 19:07:10.000 | 100 11:19:33.090 | -825 10:14:38.000 | 925 21:34:11.090  | NULL            
   1255 | Remove no longer needed ConnectorSplitSource#isFinished | 2021-12-20 01:27:10.000 | 59 04:59:33.090  | -866 16:34:38.000 | 925 21:34:11.090  | NULL            
   1224 | Add graceful shutdown script for Docker                 | 2021-11-08 19:07:10.000 | 100 11:19:33.090 | -825 03:06:17.000 | 925 14:25:50.090  | NULL            
   1224 | Add graceful shutdown script for Docker                 | 2021-12-20 01:27:10.000 | 59 04:59:33.090  | -866 09:26:17.000 | 925 14:25:50.090  | NULL            
   1319 | Add execution statistic warnings                        | 2021-12-20 01:27:10.000 | 59 04:59:33.090  | -853 16:57:33.000 | 912 21:57:06.090  | NULL            
   1319 | Add execution statistic warnings                        | 2021-11-08 19:07:10.000 | 100 11:19:33.090 | -812 10:37:33.000 | 912 21:57:06.090  | NULL            
   1317 | Add connector table metadata warnings                   | 2021-12-20 01:27:10.000 | 59 04:59:33.090  | -846 04:36:59.000 | 905 09:36:32.090  | NULL            
   1317 | Add connector table metadata warnings                   | 2021-11-08 19:07:10.000 | 100 11:19:33.090 | -804 22:16:59.000 | 905 09:36:32.090  | NULL            
   1364 | Filter tables based on table privilege of user          | 2019-10-10 09:07:45.000 | 860 21:18:58.090 | -0 16:27:24.000   | 861 13:46:22.090  | NULL            
   1637 | [WIP] patch to add support for array by table subquery  | 2021-11-08 19:07:10.000 | 100 11:19:33.090 | -761 01:00:33.000 | 861 12:20:06.090  | NULL            
   1637 | [WIP] patch to add support for array by table subquery  | 2021-12-20 01:27:10.000 | 59 04:59:33.090  | -802 07:20:33.000 | 861 12:20:06.090  | NULL            
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/2deda0e0c29d8a94b22dd3daaf20d3fa8d6e9f7b/sql/pr/awaiting-review.sql)

#  Stale PRs
<pre><code>
 number |                                  title                                   |       updated_at        |  untouched_for  |   running_time    | time_since_review | time_since_push 
--------+--------------------------------------------------------------------------+-------------------------+-----------------+-------------------+-------------------+-----------------
   4400 | [#4398] Support to get running taskInfo from worker                      | 2021-12-20 01:27:09.000 | 59 04:59:48.356 | -521 05:46:06.000 | 580 10:45:54.356  | NULL            
   4270 | Prune unnest mappings using lambda expressions                           | 2021-12-20 01:27:09.000 | 59 04:59:48.356 | -466 00:48:19.000 | 525 05:48:07.356  | NULL            
   4263 | Adds auto.purge as a thrift metastore property                           | 2021-12-20 01:27:09.000 | 59 04:59:48.356 | -425 13:24:19.000 | 484 18:24:07.356  | NULL            
   4147 | Minor changes for Pinot connector                                        | 2021-12-20 01:27:09.000 | 59 04:59:48.356 | NULL              | NULL              | NULL            
   4081 | Remove deprecated checkCanSetUser and principal rules                    | 2021-12-20 01:27:09.000 | 59 04:59:48.356 | -394 01:43:31.000 | 453 06:43:19.356  | NULL            
   3775 | Add Oracle fetchSize                                                     | 2021-12-20 01:27:09.000 | 59 04:59:48.356 | -185 16:16:06.000 | 244 21:15:54.356  | NULL            
   3666 | Use univocity CSV parser instead of opencsv                              | 2021-12-20 01:27:09.000 | 59 04:59:48.356 | -590 06:08:09.000 | 649 11:07:57.356  | NULL            
   3560 | (WIP) Expose rule stats in QueryStats                                    | 2021-12-20 01:27:09.000 | 59 04:59:48.356 | -536 16:53:10.000 | 595 21:52:58.356  | NULL            
   3549 | Support kerberos authentication for Kudu connector                       | 2021-12-20 01:27:09.000 | 59 04:59:48.356 | -601 17:23:05.000 | 660 22:22:53.356  | NULL            
   3297 | Accept different http proxy per s3 catalog                               | 2021-12-20 01:27:09.000 | 59 04:59:48.356 | -627 09:34:48.000 | 686 14:34:36.356  | NULL            
   3098 | Enable late materialization by default                                   | 2021-12-20 01:27:09.000 | 59 04:59:48.356 | NULL              | NULL              | NULL            
   9324 | Add comment to clarify intent of file name generation in configureTempto | 2021-12-20 01:27:08.000 | 59 04:59:49.356 | -87 12:16:57.000  | 146 17:16:46.356  | NULL            
   8956 | Add support for external db for schema management in mongodb connector   | 2021-12-20 01:27:08.000 | 59 04:59:49.356 | -27 23:11:48.000  | 87 04:11:37.356   | NULL            
   8912 | Fix handling of timestamps in avro files created in hive 3.1             | 2021-12-20 01:27:08.000 | 59 04:59:49.356 | -111 11:17:09.000 | 170 16:16:58.356  | NULL            
   8896 | Add support for built in Elasticsearch custom date formats               | 2021-12-20 01:27:08.000 | 59 04:59:49.356 | -108 16:34:57.000 | 167 21:34:46.356  | NULL            
   8829 | Adds MongoDB nested fields documentation.                                | 2021-12-20 01:27:08.000 | 59 04:59:49.356 | -131 08:14:33.000 | 190 13:14:22.356  | NULL            
   8819 | Set higher open files limit in init script                               | 2021-12-20 01:27:08.000 | 59 04:59:49.356 | -2 14:50:44.000   | 61 19:50:33.356   | NULL            
   8632 | Mark TestHiveStorageFormats:: testTimestampCreatedFromTrino as flaky     | 2021-12-20 01:27:08.000 | 59 04:59:49.356 | -145 14:09:45.000 | 204 19:09:34.356  | NULL            
   4554 | Optimizer rule to support aggregate pushdown with grouping sets          | 2021-12-20 01:27:09.000 | 59 04:59:48.356 | -473 06:06:23.000 | 532 11:06:11.356  | NULL            
   4523 | Add documentation for db resource group manager                          | 2021-12-20 01:27:09.000 | 59 04:59:48.356 | -509 05:45:04.000 | 568 10:44:52.356  | NULL            
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/2deda0e0c29d8a94b22dd3daaf20d3fa8d6e9f7b/sql/pr/abandoned-prs.sql)

Generated on Thu Feb 17 06:27:10 UTC 2022

Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |       updated_at        |  untouched_for   |   running_time    | time_since_review | time_since_push 
--------+----------------------------------------------------------------------+-------------------------+------------------+-------------------+-------------------+-----------------
   1364 | Filter tables based on table privilege of user                       | 2019-10-10 09:07:45.000 | 860 09:17:09.510 | -0 16:27:24.000   | 861 01:44:33.510  | NULL            
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 2020-02-11 20:15:18.000 | 735 22:09:36.510 | 0 00:00:00.000    | 735 22:09:36.510  | NULL            
   2832 | Use file extension based on the file format                          | 2020-03-02 13:41:32.000 | 716 04:43:22.510 | 0 00:00:00.000    | 716 04:43:22.510  | NULL            
   4834 | Reuse containers in product tests                                    | 2020-08-25 15:52:33.000 | 540 02:32:21.510 | 0 00:00:00.000    | 540 02:32:21.510  | NULL            
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 2020-08-31 12:22:42.000 | 534 06:02:12.510 | 0 00:00:00.000    | 534 06:02:12.510  | NULL            
   2976 | [WIP] Add sybase connector                                           | 2020-10-18 17:32:31.000 | 486 00:52:23.510 | NULL              | NULL              | NULL            
   4426 | Fix type mismatch between partition and table                        | 2020-10-21 06:53:00.000 | 483 11:31:54.510 | -36 02:00:45.000  | 519 13:32:39.510  | NULL            
   5624 | Ability to run product tests from IntelliJ                           | 2020-10-24 07:12:28.000 | 480 11:12:26.510 | -2 02:02:34.000   | 482 13:15:00.510  | NULL            
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 2020-11-24 09:00:33.000 | 449 09:24:21.510 | -131 15:18:16.000 | 581 00:42:37.510  | NULL            
   5699 | Add support for HDFS only iceberg tables                             | 2021-01-14 20:19:37.000 | 397 22:05:17.510 | NULL              | NULL              | NULL            
   7870 | Isaac Scafe Writing Exercises                                        | 2021-06-04 17:38:15.000 | 257 00:46:39.510 | -14 19:30:29.000  | 271 20:17:08.510  | NULL            
   5834 | Throw SQLException in getTime                                        | 2021-07-30 22:13:59.000 | 200 20:10:55.510 | -245 22:29:10.000 | 446 18:40:05.510  | NULL            
   8255 | Add aggregation push down into Oracle                                | 2021-10-06 19:56:33.000 | 132 22:28:21.510 | NULL              | NULL              | NULL            
   1832 | Feature/add sortkey distkey redshift                                 | 2021-10-06 19:56:36.000 | 132 22:28:18.510 | -665 22:50:15.000 | 798 21:18:33.510  | NULL            
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 2021-10-07 04:33:18.000 | 132 13:51:36.510 | -338 12:56:39.000 | 471 02:48:15.510  | NULL            
   9817 | Fix bug in iceberg connector with external table locations           | 2021-11-08 19:07:06.000 | 99 23:17:48.510  | 56 21:07:27.000   | 43 02:10:21.510   | NULL            
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 2021-11-08 19:07:06.000 | 99 23:17:48.510  | NULL              | NULL              | NULL            
   9722 | Remove usage of @test with exceptions in plugin tests                | 2021-11-08 19:07:06.000 | 99 23:17:48.510  | 69 06:17:46.000   | 30 17:00:02.510   | NULL            
   9867 | Avoid dynamic filter current predicate computation when not used     | 2021-11-08 19:07:06.000 | 99 23:17:48.510  | 16 21:00:45.000   | 83 02:17:03.510   | NULL            
   9893 | Derive more precise types for EXTRACT                                | 2021-11-08 19:07:06.000 | 99 23:17:48.510  | 26 02:13:54.000   | 73 21:03:54.510   | NULL            
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/03a6ec469ff26cb30bba2381aaca45e311b73279/sql/pr/stale-prs.sql)

#  Stale PRs
<pre><code>
 number |                                          title                                          |       updated_at        |  untouched_for  |  running_time   | time_since_review | time_since_push 
--------+-----------------------------------------------------------------------------------------+-------------------------+-----------------+-----------------+-------------------+-----------------
   8743 | Add support for optional Kafka properties from external file                            | 2021-11-08 19:07:08.000 | 99 23:18:04.518 | 80 19:34:26.000 | 19 03:43:38.518   | NULL            
   7994 | ConnectorExpression pushdown                                                            | 2021-11-09 16:48:45.000 | 99 01:36:27.518 | 80 03:48:14.000 | 18 21:48:13.518   | NULL            
   9906 | Refactor Iceberg table statistics to be deterministic                                   | 2021-11-09 11:10:15.000 | 99 07:14:57.518 | 73 07:48:27.000 | 25 23:26:30.518   | NULL            
   3507 | Upgrade gcs to 2.2.2                                                                    | 2021-11-08 19:07:10.000 | 99 23:18:02.518 | 73 01:58:13.000 | 26 21:19:49.518   | NULL            
   9788 | Add support for OpenID connect metadata discovery mechanism                             | 2021-11-08 19:07:07.000 | 99 23:18:05.518 | 72 14:48:00.000 | 27 08:30:05.518   | NULL            
   9841 | Make map and array functions use IS DISTINCT semantics as appropriate                   | 2021-11-18 16:50:24.000 | 90 01:34:48.518 | 69 08:56:34.000 | 20 16:38:14.518   | NULL            
   9722 | Remove usage of @test with exceptions in plugin tests                                   | 2021-11-08 19:07:06.000 | 99 23:18:06.518 | 69 06:17:46.000 | 30 17:00:20.518   | NULL            
   3316 | Allow merging consecutive 'long' values in SortedRangeSet                               | 2021-11-21 15:56:23.000 | 87 02:28:49.518 | 63 17:10:25.000 | 23 09:18:24.518   | NULL            
   9812 | Add PostgreSQL and Oracle migration files for DB backed resource group manager          | 2021-11-17 22:36:50.000 | 90 19:48:22.518 | 63 06:57:32.000 | 27 12:50:50.518   | NULL            
   9965 | Improve performance/memory overhead for Spatial Join                                    | 2021-11-18 20:58:14.000 | 89 21:26:58.518 | 63 01:07:44.000 | 26 20:19:14.518   | NULL            
   9818 | [WIP] Implement task level retries                                                      | 2021-11-19 12:32:56.000 | 89 05:52:16.518 | 62 07:56:01.000 | 26 21:56:15.518   | NULL            
   7828 | Use Datastax Cassandra java driver v4                                                   | 2021-11-08 19:07:08.000 | 99 23:18:04.518 | 61 01:29:54.000 | 38 21:48:10.518   | NULL            
   9541 | [Pinot connector] Add support for basic authentication                                  | 2021-11-18 05:15:55.000 | 90 13:09:17.518 | 60 23:08:27.000 | 29 14:00:50.518   | NULL            
   8474 | Implement timestamp predicate pushdown in Druid connector                               | 2021-11-08 19:07:08.000 | 99 23:18:04.518 | 60 12:34:24.000 | 39 10:43:40.518   | NULL            
   9938 | Support Metrics mode when creating/writing Iceberg tables                               | 2021-11-15 17:30:16.000 | 93 00:54:56.518 | 59 20:19:39.000 | 33 04:35:17.518   | NULL            
   9868 | Allow ValueSet expansion into a discrete set for Bloom filtering                        | 2021-11-21 15:53:38.000 | 87 02:31:34.518 | 59 17:17:39.000 | 27 09:13:55.518   | NULL            
   9613 | Support ALTER MATERIALIZED VIEW ... SET PROPERTIES ...                                  | 2021-11-22 05:22:36.000 | 86 13:02:36.518 | 58 07:34:38.000 | 28 05:27:58.518   | NULL            
   9817 | Fix bug in iceberg connector with external table locations                              | 2021-11-08 19:07:06.000 | 99 23:18:06.518 | 56 21:07:27.000 | 43 02:10:39.518   | NULL            
   8202 | Fixed #2748 - Metadata for alias in elasticsearch connector only uses the first mapping | 2021-11-20 13:04:09.000 | 88 05:21:03.518 | 55 18:54:03.000 | 32 10:27:00.518   | NULL            
   9951 | Add WKB Support for PostGIS Geometry Columns                                            | 2021-11-18 03:41:23.000 | 90 14:43:49.518 | 55 04:26:35.000 | 35 10:17:14.518   | NULL            
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/03a6ec469ff26cb30bba2381aaca45e311b73279/sql/pr/running-prs.sql)

#  Stale PRs
<pre><code>
 number |                          title                          |       updated_at        |  untouched_for   |   running_time    | time_since_review | time_since_push 
--------+---------------------------------------------------------+-------------------------+------------------+-------------------+-------------------+-----------------
    685 | Add SampleNode stats and cost rule                      | 2021-11-08 19:07:10.000 | 99 23:18:18.108  | -925 09:19:04.000 | 1025 08:37:22.108 | NULL            
    685 | Add SampleNode stats and cost rule                      | 2021-12-20 01:27:10.000 | 58 16:58:18.108  | -966 15:39:04.000 | 1025 08:37:22.108 | NULL            
    624 | Optimize distinct aggregation on multiple columns       | 2021-11-08 19:07:11.000 | 99 23:18:17.108  | -909 18:24:54.000 | 1009 17:43:11.108 | NULL            
    624 | Optimize distinct aggregation on multiple columns       | 2021-12-20 01:27:10.000 | 58 16:58:18.108  | -951 00:44:53.000 | 1009 17:43:11.108 | NULL            
    821 | Distributed sort for unpartitioned window functions     | 2021-12-20 01:27:10.000 | 58 16:58:18.108  | -936 08:38:18.000 | 995 01:36:36.108  | NULL            
    821 | Distributed sort for unpartitioned window functions     | 2021-11-08 19:07:10.000 | 99 23:18:18.108  | -895 02:18:18.000 | 995 01:36:36.108  | NULL            
    855 | Change client to assume types are encoded as text       | 2021-12-20 01:27:10.000 | 58 16:58:18.108  | -934 17:24:02.000 | 993 10:22:20.108  | NULL            
    855 | Change client to assume types are encoded as text       | 2021-11-08 19:07:10.000 | 99 23:18:18.108  | -893 11:04:02.000 | 993 10:22:20.108  | NULL            
    819 | Remove TableLayout from TPCDS connector                 | 2021-11-08 19:07:10.000 | 99 23:18:18.108  | -888 12:46:56.000 | 988 12:05:14.108  | NULL            
   1255 | Remove no longer needed ConnectorSplitSource#isFinished | 2021-12-20 01:27:10.000 | 58 16:58:18.108  | -866 16:34:38.000 | 925 09:32:56.108  | NULL            
   1255 | Remove no longer needed ConnectorSplitSource#isFinished | 2021-11-08 19:07:10.000 | 99 23:18:18.108  | -825 10:14:38.000 | 925 09:32:56.108  | NULL            
   1224 | Add graceful shutdown script for Docker                 | 2021-12-20 01:27:10.000 | 58 16:58:18.108  | -866 09:26:17.000 | 925 02:24:35.108  | NULL            
   1224 | Add graceful shutdown script for Docker                 | 2021-11-08 19:07:10.000 | 99 23:18:18.108  | -825 03:06:17.000 | 925 02:24:35.108  | NULL            
   1319 | Add execution statistic warnings                        | 2021-11-08 19:07:10.000 | 99 23:18:18.108  | -812 10:37:33.000 | 912 09:55:51.108  | NULL            
   1319 | Add execution statistic warnings                        | 2021-12-20 01:27:10.000 | 58 16:58:18.108  | -853 16:57:33.000 | 912 09:55:51.108  | NULL            
   1317 | Add connector table metadata warnings                   | 2021-11-08 19:07:10.000 | 99 23:18:18.108  | -804 22:16:59.000 | 904 21:35:17.108  | NULL            
   1317 | Add connector table metadata warnings                   | 2021-12-20 01:27:10.000 | 58 16:58:18.108  | -846 04:36:59.000 | 904 21:35:17.108  | NULL            
   1364 | Filter tables based on table privilege of user          | 2019-10-10 09:07:45.000 | 860 09:17:43.108 | -0 16:27:24.000   | 861 01:45:07.108  | NULL            
   1637 | [WIP] patch to add support for array by table subquery  | 2021-11-08 19:07:10.000 | 99 23:18:18.108  | -761 01:00:33.000 | 861 00:18:51.108  | NULL            
   1637 | [WIP] patch to add support for array by table subquery  | 2021-12-20 01:27:10.000 | 58 16:58:18.108  | -802 07:20:33.000 | 861 00:18:51.108  | NULL            
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/03a6ec469ff26cb30bba2381aaca45e311b73279/sql/pr/awaiting-review.sql)

#  Stale PRs
<pre><code>
 number |                                   title                                   |       updated_at        |  untouched_for  |   running_time   | time_since_review | time_since_push 
--------+---------------------------------------------------------------------------+-------------------------+-----------------+------------------+-------------------+-----------------
  10866 | Migrate to UBI8 based Docker image                                        | 2022-01-31 17:25:22.000 | 16 01:00:21.062 | NULL             | NULL              | NULL            
   7994 | ConnectorExpression pushdown                                              | 2022-01-31 16:57:21.000 | 16 01:28:22.062 | -2 20:20:22.000  | 18 21:48:44.062   | NULL            
  10865 | Fix NPE when hiding Delta tables and Glue table lacks parameters          | 2022-01-31 16:55:36.000 | 16 01:30:07.062 | NULL             | NULL              | NULL            
   9447 | Support correlated subqueries for DELETE                                  | 2022-01-31 16:37:52.000 | 16 01:47:51.062 | -67 01:30:42.000 | 83 03:18:33.062   | NULL            
  10844 | Fix Iceberg metadata listing failure when materialized view dropped       | 2022-01-31 16:37:20.000 | 16 01:48:23.062 | -2 19:20:45.000  | 18 21:09:08.062   | NULL            
   9841 | Make map and array functions use IS DISTINCT semantics as appropriate     | 2022-01-31 16:06:52.000 | 16 02:18:51.062 | -4 14:19:54.000  | 20 16:38:45.062   | NULL            
  10856 | Correct decoding for Trino UUID partition key value                       | 2022-01-31 14:53:06.000 | 16 03:32:37.062 | NULL             | NULL              | NULL            
  10790 | Document OPTIMIZE for Iceberg                                             | 2022-01-31 12:12:02.000 | 16 06:13:41.062 | -4 00:14:39.000  | 20 06:28:20.062   | NULL            
  10215 | Lazily load hive partition information                                    | 2022-01-31 10:23:41.000 | 16 08:02:02.062 | -20 00:12:13.000 | 36 08:14:15.062   | NULL            
  10506 | Improvements to Unnest Operator                                           | 2022-01-31 09:23:44.000 | 16 09:01:59.062 | -18 23:35:09.000 | 35 08:37:08.062   | NULL            
  10411 | Document atop connector                                                   | 2022-01-31 07:14:48.000 | 16 11:10:55.062 | -12 20:42:29.000 | 29 07:53:24.062   | NULL            
  10831 | Document existing Hive properties                                         | 2022-01-31 06:48:51.000 | 16 11:36:52.062 | -2 21:28:08.000  | 19 09:05:00.062   | NULL            
  10843 | Use airlift json codec in http event listener, fixing airlift/airlift#983 | 2022-01-31 06:45:09.000 | 16 11:40:34.062 | NULL             | NULL              | NULL            
   9482 | Simplify Hive metastore creation and use                                  | 2022-02-05 01:19:40.000 | 11 17:06:03.062 | NULL             | NULL              | NULL            
  10378 | Add function management abstractions                                      | 2022-02-05 00:22:03.000 | 11 18:03:40.062 | NULL             | NULL              | NULL            
  10955 | Remove line breaks in pull request template                               | 2022-02-04 23:46:40.000 | 11 18:39:03.062 | NULL             | NULL              | NULL            
  10954 | Avoid reflection and services lookup for JWT processing                   | 2022-02-04 22:54:46.000 | 11 19:30:57.062 | NULL             | NULL              | NULL            
  10956 | Add product tests for clickhouse clusters                                 | 2022-02-04 22:19:58.000 | 11 20:05:45.062 | NULL             | NULL              | NULL            
   9482 | Simplify Hive metastore creation and use                                  | 2022-02-06 20:07:02.000 | 9 22:18:41.062  | NULL             | NULL              | NULL            
  10823 | Implement exchange spooling                                               | 2022-02-06 20:03:13.000 | 9 22:22:30.062  | -9 02:22:34.000  | 19 00:45:04.062   | NULL            
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/03a6ec469ff26cb30bba2381aaca45e311b73279/sql/pr/abandoned-prs.sql)

Generated on Wed Feb 16 18:25:56 UTC 2022

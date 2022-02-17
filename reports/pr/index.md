Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                      title                                      |       updated_at        |  untouched_for   |   running_time    | time_since_review | time_since_push 
--------+---------------------------------------------------------------------------------+-------------------------+------------------+-------------------+-------------------+-----------------
   1364 | Filter tables based on table privilege of user                                  | 2019-10-10 09:07:45.000 | 861 09:17:19.412 | -0 16:27:24.000   | 862 01:44:43.412  | NULL            
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor            | 2020-02-11 20:15:18.000 | 736 22:09:46.412 | 0 00:00:00.000    | 736 22:09:46.412  | NULL            
   2832 | Use file extension based on the file format                                     | 2020-03-02 13:41:32.000 | 717 04:43:32.412 | 0 00:00:00.000    | 717 04:43:32.412  | NULL            
   4834 | Reuse containers in product tests                                               | 2020-08-25 15:52:33.000 | 541 02:32:31.412 | 0 00:00:00.000    | 541 02:32:31.412  | NULL            
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()                  | 2020-08-31 12:22:42.000 | 535 06:02:22.412 | 0 00:00:00.000    | 535 06:02:22.412  | NULL            
   2976 | [WIP] Add sybase connector                                                      | 2020-10-18 17:32:31.000 | 487 00:52:33.412 | NULL              | NULL              | NULL            
   4426 | Fix type mismatch between partition and table                                   | 2020-10-21 06:53:00.000 | 484 11:32:04.412 | -36 02:00:45.000  | 520 13:32:49.412  | NULL            
   5624 | Ability to run product tests from IntelliJ                                      | 2020-10-24 07:12:28.000 | 481 11:12:36.412 | -2 02:02:34.000   | 483 13:15:10.412  | NULL            
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                            | 2020-11-24 09:00:33.000 | 450 09:24:31.412 | -131 15:18:16.000 | 582 00:42:47.412  | NULL            
   5699 | Add support for HDFS only iceberg tables                                        | 2021-01-14 20:19:37.000 | 398 22:05:27.412 | NULL              | NULL              | NULL            
   7870 | Isaac Scafe Writing Exercises                                                   | 2021-06-04 17:38:15.000 | 258 00:46:49.412 | -14 19:30:29.000  | 272 20:17:18.412  | NULL            
   5834 | Throw SQLException in getTime                                                   | 2021-07-30 22:13:59.000 | 201 20:11:05.412 | -245 22:29:10.000 | 447 18:40:15.412  | NULL            
   8255 | Add aggregation push down into Oracle                                           | 2021-10-06 19:56:33.000 | 133 22:28:31.412 | NULL              | NULL              | NULL            
   1832 | Feature/add sortkey distkey redshift                                            | 2021-10-06 19:56:36.000 | 133 22:28:28.412 | -665 22:50:15.000 | 799 21:18:43.412  | NULL            
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`                 | 2021-10-07 04:33:18.000 | 133 13:51:46.412 | -338 12:56:39.000 | 472 02:48:25.412  | NULL            
   9758 | Print error when DateTimeZoneIndex init with failure for debug                  | 2021-11-08 19:07:06.000 | 100 23:17:58.412 | -10 15:38:11.000  | 111 14:56:09.412  | NULL            
   9859 |  Allow NON-ASCII Chars on extra credentials values and session property values. | 2021-11-08 19:07:06.000 | 100 23:17:58.412 | NULL              | NULL              | NULL            
   9722 | Remove usage of @test with exceptions in plugin tests                           | 2021-11-08 19:07:06.000 | 100 23:17:58.412 | 69 06:17:46.000   | 31 17:00:12.412   | NULL            
   9689 | [TEST] Separate GitHub Actions job to build documentation                       | 2021-11-08 19:07:06.000 | 100 23:17:58.412 | NULL              | NULL              | NULL            
   9789 | allow push down join on redshift                                                | 2021-11-08 19:07:06.000 | 100 23:17:58.412 | NULL              | NULL              | NULL            
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/9c44ae61c8f4f093ff1e675edb8ed377abebc53c/sql/pr/stale-prs.sql)

#  Stale PRs
<pre><code>
 number |                                          title                                          |       updated_at        |  untouched_for   |  running_time   | time_since_review | time_since_push 
--------+-----------------------------------------------------------------------------------------+-------------------------+------------------+-----------------+-------------------+-----------------
   8743 | Add support for optional Kafka properties from external file                            | 2021-11-08 19:07:08.000 | 100 23:18:13.329 | 80 19:34:26.000 | 20 03:43:47.329   | NULL            
   7994 | ConnectorExpression pushdown                                                            | 2021-11-09 16:48:45.000 | 100 01:36:36.329 | 80 03:48:14.000 | 19 21:48:22.329   | NULL            
   9906 | Refactor Iceberg table statistics to be deterministic                                   | 2021-11-09 11:10:15.000 | 100 07:15:06.329 | 73 07:48:27.000 | 26 23:26:39.329   | NULL            
   3507 | Upgrade gcs to 2.2.2                                                                    | 2021-11-08 19:07:10.000 | 100 23:18:11.329 | 73 01:58:13.000 | 27 21:19:58.329   | NULL            
   9788 | Add support for OpenID connect metadata discovery mechanism                             | 2021-11-08 19:07:07.000 | 100 23:18:14.329 | 72 14:48:00.000 | 28 08:30:14.329   | NULL            
   9841 | Make map and array functions use IS DISTINCT semantics as appropriate                   | 2021-11-18 16:50:24.000 | 91 01:34:57.329  | 69 08:56:34.000 | 21 16:38:23.329   | NULL            
   9722 | Remove usage of @test with exceptions in plugin tests                                   | 2021-11-08 19:07:06.000 | 100 23:18:15.329 | 69 06:17:46.000 | 31 17:00:29.329   | NULL            
   3316 | Allow merging consecutive 'long' values in SortedRangeSet                               | 2021-11-21 15:56:23.000 | 88 02:28:58.329  | 63 17:10:25.000 | 24 09:18:33.329   | NULL            
   9812 | Add PostgreSQL and Oracle migration files for DB backed resource group manager          | 2021-11-17 22:36:50.000 | 91 19:48:31.329  | 63 06:57:32.000 | 28 12:50:59.329   | NULL            
   9965 | Improve performance/memory overhead for Spatial Join                                    | 2021-11-18 20:58:14.000 | 90 21:27:07.329  | 63 01:07:44.000 | 27 20:19:23.329   | NULL            
   9818 | [WIP] Implement task level retries                                                      | 2021-11-19 12:32:56.000 | 90 05:52:25.329  | 62 07:56:01.000 | 27 21:56:24.329   | NULL            
   7828 | Use Datastax Cassandra java driver v4                                                   | 2021-11-08 19:07:08.000 | 100 23:18:13.329 | 61 01:29:54.000 | 39 21:48:19.329   | NULL            
   9541 | [Pinot connector] Add support for basic authentication                                  | 2021-11-18 05:15:55.000 | 91 13:09:26.329  | 60 23:08:27.000 | 30 14:00:59.329   | NULL            
   8474 | Implement timestamp predicate pushdown in Druid connector                               | 2021-11-08 19:07:08.000 | 100 23:18:13.329 | 60 12:34:24.000 | 40 10:43:49.329   | NULL            
   9938 | Support Metrics mode when creating/writing Iceberg tables                               | 2021-11-15 17:30:16.000 | 94 00:55:05.329  | 59 20:19:39.000 | 34 04:35:26.329   | NULL            
   9868 | Allow ValueSet expansion into a discrete set for Bloom filtering                        | 2021-11-21 15:53:38.000 | 88 02:31:43.329  | 59 17:17:39.000 | 28 09:14:04.329   | NULL            
   9613 | Support ALTER MATERIALIZED VIEW ... SET PROPERTIES ...                                  | 2021-11-22 05:22:36.000 | 87 13:02:45.329  | 58 07:34:38.000 | 29 05:28:07.329   | NULL            
   9817 | Fix bug in iceberg connector with external table locations                              | 2021-11-08 19:07:06.000 | 100 23:18:15.329 | 56 21:07:27.000 | 44 02:10:48.329   | NULL            
   8202 | Fixed #2748 - Metadata for alias in elasticsearch connector only uses the first mapping | 2021-11-20 13:04:09.000 | 89 05:21:12.329  | 55 18:54:03.000 | 33 10:27:09.329   | NULL            
   9951 | Add WKB Support for PostGIS Geometry Columns                                            | 2021-11-18 03:41:23.000 | 91 14:43:58.329  | 55 04:26:35.000 | 36 10:17:23.329   | NULL            
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/9c44ae61c8f4f093ff1e675edb8ed377abebc53c/sql/pr/running-prs.sql)

#  Stale PRs
<pre><code>
 number |                          title                          |       updated_at        |  untouched_for   |   running_time    | time_since_review | time_since_push 
--------+---------------------------------------------------------+-------------------------+------------------+-------------------+-------------------+-----------------
    685 | Add SampleNode stats and cost rule                      | 2021-11-08 19:07:10.000 | 100 23:18:27.898 | -925 09:19:04.000 | 1026 08:37:31.898 | NULL            
    685 | Add SampleNode stats and cost rule                      | 2021-12-20 01:27:10.000 | 59 16:58:27.898  | -966 15:39:04.000 | 1026 08:37:31.898 | NULL            
    624 | Optimize distinct aggregation on multiple columns       | 2021-12-20 01:27:10.000 | 59 16:58:27.898  | -951 00:44:53.000 | 1010 17:43:20.898 | NULL            
    624 | Optimize distinct aggregation on multiple columns       | 2021-11-08 19:07:11.000 | 100 23:18:26.898 | -909 18:24:54.000 | 1010 17:43:20.898 | NULL            
    821 | Distributed sort for unpartitioned window functions     | 2021-12-20 01:27:10.000 | 59 16:58:27.898  | -936 08:38:18.000 | 996 01:36:45.898  | NULL            
    821 | Distributed sort for unpartitioned window functions     | 2021-11-08 19:07:10.000 | 100 23:18:27.898 | -895 02:18:18.000 | 996 01:36:45.898  | NULL            
    855 | Change client to assume types are encoded as text       | 2021-12-20 01:27:10.000 | 59 16:58:27.898  | -934 17:24:02.000 | 994 10:22:29.898  | NULL            
    855 | Change client to assume types are encoded as text       | 2021-11-08 19:07:10.000 | 100 23:18:27.898 | -893 11:04:02.000 | 994 10:22:29.898  | NULL            
    819 | Remove TableLayout from TPCDS connector                 | 2021-11-08 19:07:10.000 | 100 23:18:27.898 | -888 12:46:56.000 | 989 12:05:23.898  | NULL            
   1255 | Remove no longer needed ConnectorSplitSource#isFinished | 2021-12-20 01:27:10.000 | 59 16:58:27.898  | -866 16:34:38.000 | 926 09:33:05.898  | NULL            
   1255 | Remove no longer needed ConnectorSplitSource#isFinished | 2021-11-08 19:07:10.000 | 100 23:18:27.898 | -825 10:14:38.000 | 926 09:33:05.898  | NULL            
   1224 | Add graceful shutdown script for Docker                 | 2021-12-20 01:27:10.000 | 59 16:58:27.898  | -866 09:26:17.000 | 926 02:24:44.898  | NULL            
   1224 | Add graceful shutdown script for Docker                 | 2021-11-08 19:07:10.000 | 100 23:18:27.898 | -825 03:06:17.000 | 926 02:24:44.898  | NULL            
   1319 | Add execution statistic warnings                        | 2021-12-20 01:27:10.000 | 59 16:58:27.898  | -853 16:57:33.000 | 913 09:56:00.898  | NULL            
   1319 | Add execution statistic warnings                        | 2021-11-08 19:07:10.000 | 100 23:18:27.898 | -812 10:37:33.000 | 913 09:56:00.898  | NULL            
   1317 | Add connector table metadata warnings                   | 2021-12-20 01:27:10.000 | 59 16:58:27.898  | -846 04:36:59.000 | 905 21:35:26.898  | NULL            
   1317 | Add connector table metadata warnings                   | 2021-11-08 19:07:10.000 | 100 23:18:27.898 | -804 22:16:59.000 | 905 21:35:26.898  | NULL            
   1364 | Filter tables based on table privilege of user          | 2019-10-10 09:07:45.000 | 861 09:17:52.898 | -0 16:27:24.000   | 862 01:45:16.898  | NULL            
   1637 | [WIP] patch to add support for array by table subquery  | 2021-11-08 19:07:10.000 | 100 23:18:27.898 | -761 01:00:33.000 | 862 00:19:00.898  | NULL            
   1637 | [WIP] patch to add support for array by table subquery  | 2021-12-20 01:27:10.000 | 59 16:58:27.898  | -802 07:20:33.000 | 862 00:19:00.898  | NULL            
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/9c44ae61c8f4f093ff1e675edb8ed377abebc53c/sql/pr/awaiting-review.sql)

#  Stale PRs
<pre><code>
 number |                                        title                                        |       updated_at        |  untouched_for  |   running_time    | time_since_review | time_since_push 
--------+-------------------------------------------------------------------------------------+-------------------------+-----------------+-------------------+-------------------+-----------------
   1224 | Add graceful shutdown script for Docker                                             | 2021-12-20 01:27:10.000 | 59 16:58:42.781 | -866 09:26:17.000 | 926 02:24:59.781  | NULL            
    821 | Distributed sort for unpartitioned window functions                                 | 2021-12-20 01:27:10.000 | 59 16:58:42.781 | -936 08:38:18.000 | 996 01:37:00.781  | NULL            
   8323 | Add Ignite connector                                                                | 2021-12-20 01:27:09.000 | 59 16:58:43.781 | -103 19:17:58.000 | 163 12:16:41.781  | NULL            
   7160 | [WIP] Drop table                                                                    | 2021-12-20 01:27:09.000 | 59 16:58:43.781 | -290 03:16:47.000 | 349 20:15:30.781  | NULL            
   7134 | Collect events from query planner for reporting to query completion events          | 2021-12-20 01:27:09.000 | 59 16:58:43.781 | -290 20:32:43.000 | 350 13:31:26.781  | NULL            
   7131 | Elasticsearch Connector support applyAggregation                                    | 2021-12-20 01:27:09.000 | 59 16:58:43.781 | -187 16:23:23.000 | 247 09:22:06.781  | NULL            
   7010 | Fix statistics update in ANALYZE table for Hive transactional tables                | 2021-12-20 01:27:09.000 | 59 16:58:43.781 | -12 09:34:12.000  | 72 02:32:55.781   | NULL            
   6665 | Add cron functions                                                                  | 2021-12-20 01:27:09.000 | 59 16:58:43.781 | -331 18:07:30.000 | 391 11:06:13.781  | NULL            
   6644 | Refactoring Dynamic Filter test cases                                               | 2021-12-20 01:27:09.000 | 59 16:58:43.781 | -170 21:43:54.000 | 230 14:42:37.781  | NULL            
   6499 | Respect default values specified in Avro schema                                     | 2021-12-20 01:27:09.000 | 59 16:58:43.781 | -325 14:32:45.000 | 385 07:31:28.781  | NULL            
   6438 | Document assume canonical hive partition key                                        | 2021-12-20 01:27:09.000 | 59 16:58:43.781 | NULL              | NULL              | NULL            
   6409 | [WIP] Join                                                                          | 2021-12-20 01:27:09.000 | 59 16:58:43.781 | NULL              | NULL              | NULL            
   6384 | Support allow/deny list of schemas from hive metastore                              | 2021-12-20 01:27:09.000 | 59 16:58:43.781 | NULL              | NULL              | NULL            
   6182 | Add option to sync partitions from folders not in hive-style format                 | 2021-12-20 01:27:09.000 | 59 16:58:43.781 | NULL              | NULL              | NULL            
   6180 | Fallback to an available alter table and alter partitions API in Hive Metastore 3.x | 2021-12-20 01:27:09.000 | 59 16:58:43.781 | -370 04:11:02.000 | 429 21:09:45.781  | NULL            
   6173 | Fix realtype conversion in KafkaRecordCursor                                        | 2021-12-20 01:27:09.000 | 59 16:58:43.781 | -180 14:18:32.000 | 240 07:17:15.781  | NULL            
   6168 | Update document for public data on azure blob store                                 | 2021-12-20 01:27:09.000 | 59 16:58:43.781 | -378 19:22:05.000 | 438 12:20:48.781  | NULL            
   6162 | Support public GCS bucket access                                                    | 2021-12-20 01:27:09.000 | 59 16:58:43.781 | NULL              | NULL              | NULL            
   1318 | Add deprecated warnings                                                             | 2021-12-20 01:27:10.000 | 59 16:58:42.781 | NULL              | NULL              | NULL            
   1235 | Introduce RankingBuilder and streaming way to calculate rank                        | 2021-12-20 01:27:10.000 | 59 16:58:42.781 | NULL              | NULL              | NULL            
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/9c44ae61c8f4f093ff1e675edb8ed377abebc53c/sql/pr/abandoned-prs.sql)

Generated on Thu Feb 17 18:26:05 UTC 2022

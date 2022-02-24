Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 867 21:17:54.260 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 743 10:10:21.260 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 723 16:44:07.260 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 547 14:33:06.260 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 541 18:02:57.260 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 493 12:53:08.260 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 490 23:32:39.260 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 487 23:13:11.260 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 456 21:25:06.260 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 405 10:06:02.260 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 264 12:47:24.260 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 208 08:11:40.260 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 140 10:29:06.260 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 140 10:29:03.260 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 140 01:52:21.260 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 107 11:18:33.260 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 107 11:18:33.260 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 107 11:18:33.260 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 107 11:18:33.260 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 107 11:18:33.260 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/851cd1e55dbb80a0ad56b3f3c5f9f70068947c12/sql/pr/stale-prs.sql)

#  Longest running PRs
<pre><code>
 number |                                          title                                          |  running_time   |                             link                              
--------+-----------------------------------------------------------------------------------------+-----------------+---------------------------------------------------------------
   8743 | Add support for optional Kafka properties from external file                            | 80 19:34:26.000 | <a href="https://github.com/trinodb/trino/pull/8743">link</a> 
   7994 | ConnectorExpression pushdown                                                            | 80 03:48:14.000 | <a href="https://github.com/trinodb/trino/pull/7994">link</a> 
   9906 | Refactor Iceberg table statistics to be deterministic                                   | 73 07:48:27.000 | <a href="https://github.com/trinodb/trino/pull/9906">link</a> 
   3507 | Upgrade gcs to 2.2.2                                                                    | 73 01:58:13.000 | <a href="https://github.com/trinodb/trino/pull/3507">link</a> 
   9788 | Add support for OpenID connect metadata discovery mechanism                             | 72 14:48:00.000 | <a href="https://github.com/trinodb/trino/pull/9788">link</a> 
   9841 | Make map and array functions use IS DISTINCT semantics as appropriate                   | 69 08:56:34.000 | <a href="https://github.com/trinodb/trino/pull/9841">link</a> 
   9722 | Remove usage of @test with exceptions in plugin tests                                   | 69 06:17:46.000 | <a href="https://github.com/trinodb/trino/pull/9722">link</a> 
   3316 | Allow merging consecutive 'long' values in SortedRangeSet                               | 63 17:10:25.000 | <a href="https://github.com/trinodb/trino/pull/3316">link</a> 
   9812 | Add PostgreSQL and Oracle migration files for DB backed resource group manager          | 63 06:57:32.000 | <a href="https://github.com/trinodb/trino/pull/9812">link</a> 
   9965 | Improve performance/memory overhead for Spatial Join                                    | 63 01:07:44.000 | <a href="https://github.com/trinodb/trino/pull/9965">link</a> 
   9818 | [WIP] Implement task level retries                                                      | 62 07:56:01.000 | <a href="https://github.com/trinodb/trino/pull/9818">link</a> 
   7828 | Use Datastax Cassandra java driver v4                                                   | 61 01:29:54.000 | <a href="https://github.com/trinodb/trino/pull/7828">link</a> 
   9541 | [Pinot connector] Add support for basic authentication                                  | 60 23:08:27.000 | <a href="https://github.com/trinodb/trino/pull/9541">link</a> 
   8474 | Implement timestamp predicate pushdown in Druid connector                               | 60 12:34:24.000 | <a href="https://github.com/trinodb/trino/pull/8474">link</a> 
   9938 | Support Metrics mode when creating/writing Iceberg tables                               | 59 20:19:39.000 | <a href="https://github.com/trinodb/trino/pull/9938">link</a> 
   9868 | Allow ValueSet expansion into a discrete set for Bloom filtering                        | 59 17:17:39.000 | <a href="https://github.com/trinodb/trino/pull/9868">link</a> 
   9613 | Support ALTER MATERIALIZED VIEW ... SET PROPERTIES ...                                  | 58 07:34:38.000 | <a href="https://github.com/trinodb/trino/pull/9613">link</a> 
   9817 | Fix bug in iceberg connector with external table locations                              | 56 21:07:27.000 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   8202 | Fixed #2748 - Metadata for alias in elasticsearch connector only uses the first mapping | 55 18:54:03.000 | <a href="https://github.com/trinodb/trino/pull/8202">link</a> 
   9951 | Add WKB Support for PostGIS Geometry Columns                                            | 55 04:26:35.000 | <a href="https://github.com/trinodb/trino/pull/9951">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/851cd1e55dbb80a0ad56b3f3c5f9f70068947c12/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1032 20:37:56.382 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1017 05:43:45.382 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1002 13:37:10.382 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1000 22:22:54.382 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 996 00:05:48.382  | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 932 21:33:30.382  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 932 14:25:09.382  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 919 21:56:25.382  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 912 09:35:51.382  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 868 13:45:41.382  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 868 12:19:25.382  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 861 20:09:09.382  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 860 00:28:01.382  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 839 11:53:52.382  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 828 18:03:01.382  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 806 09:19:41.382  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 790 10:36:59.382  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 771 11:52:00.382  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 768 23:41:00.382  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 764 03:07:09.382  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/851cd1e55dbb80a0ad56b3f3c5f9f70068947c12/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                            title                                             | time_since_push |                              link                              
--------+----------------------------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  11059 | Track Glue API calls that was untracked                                                      | NULL            | <a href="https://github.com/trinodb/trino/pull/11059">link</a> 
  10915 | Invalidate CachingDirectoryLister when writing through Trino                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10915">link</a> 
  11047 | Fix EvictableCache replace                                                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/11047">link</a> 
  11028 | Add sql type tests for cassandra                                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/11028">link</a> 
  11056 | Minor cleanups to PR template                                                                | NULL            | <a href="https://github.com/trinodb/trino/pull/11056">link</a> 
   7734 | handle InvalidCodePointException and add a testcase                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/7734">link</a>  
   7599 | Fix use kudu connector to query values of UNIXTIME_MICROS type, time zone didn't take effect | NULL            | <a href="https://github.com/trinodb/trino/pull/7599">link</a>  
   7407 | Kafka insert                                                                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/7407">link</a>  
   7404 | FutureTask replaces CompletableFuture to solve the thread can't be cancelled                 | NULL            | <a href="https://github.com/trinodb/trino/pull/7404">link</a>  
   7252 | Added a new JDBC driver parameter - 'TimeZoneID'                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/7252">link</a>  
   7197 | Support tables with non-lowercase names in Druid                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/7197">link</a>  
   7164 | [WIP] Pinot create table                                                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/7164">link</a>  
   6599 | Document for assume canonical hive partition key                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/6599">link</a>  
   6574 | Refactor partition output                                                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/6574">link</a>  
   6498 | Refactor JoinProbe                                                                           | NULL            | <a href="https://github.com/trinodb/trino/pull/6498">link</a>  
  10171 | expose physicalInputDataSize and inputDataSize in JDBC client                                | NULL            | <a href="https://github.com/trinodb/trino/pull/10171">link</a> 
  10151 | Support Glue catalog in Iceberg connector                                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10151">link</a> 
  10075 | Support Iceberg row-level delete and update                                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/10075">link</a> 
  10825 | Dont use row block field block offsets if not needed                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10825">link</a> 
  11040 | Making TestCassandraConnectorTest more maintainable                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/11040">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/851cd1e55dbb80a0ad56b3f3c5f9f70068947c12/sql/pr/abandoned-prs.sql)

Generated on Thu Feb 24 06:26:19 UTC 2022

Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 869 21:21:01.902 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 745 10:13:28.902 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 725 16:47:14.902 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 549 14:36:13.902 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 543 18:06:04.902 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 495 12:56:15.902 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 492 23:35:46.902 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 489 23:16:18.902 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 458 21:28:13.902 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 407 10:09:09.902 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 266 12:50:31.902 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 210 08:14:47.902 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 142 10:32:13.902 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 142 10:32:10.902 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 142 01:55:28.902 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 109 11:21:40.902 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 109 11:21:40.902 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 109 11:21:40.902 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 109 11:21:40.902 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 109 11:21:40.902 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/d0cb432164d6ca91cc76c67a14d928383d16bd16/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/d0cb432164d6ca91cc76c67a14d928383d16bd16/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1034 20:41:01.271 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1019 05:46:50.271 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1004 13:40:15.271 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1002 22:25:59.271 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 998 00:08:53.271  | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 934 21:36:35.271  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 934 14:28:14.271  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 921 21:59:30.271  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 914 09:38:56.271  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 870 13:48:46.271  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 870 12:22:30.271  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 863 20:12:14.271  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 862 00:31:06.271  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 841 11:56:57.271  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 830 18:06:06.271  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 808 09:22:46.271  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 792 10:40:04.271  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 773 11:55:05.271  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 770 23:44:05.271  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 766 03:10:14.271  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/d0cb432164d6ca91cc76c67a14d928383d16bd16/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                            title                                             | time_since_push |                              link                              
--------+----------------------------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
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
  10063 | Replace deprecated iceberg Rollback.toSnapshotId usage                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/10063">link</a> 
  10040 | Upgrade Phoenix5 HBase to 4.2.8                                                              | NULL            | <a href="https://github.com/trinodb/trino/pull/10040">link</a> 
   9993 | Fix getColumns column mapping                                                                | NULL            | <a href="https://github.com/trinodb/trino/pull/9993">link</a>  
   9955 | Skip reading Parquet pages using Column Indexes feature of Parquet for Iceberg               | NULL            | <a href="https://github.com/trinodb/trino/pull/9955">link</a>  
   9924 | Opentelemetry tracing introduction with auto instrumentation using opentelemetry-javaagent   | NULL            | <a href="https://github.com/trinodb/trino/pull/9924">link</a>  
   9893 | Derive more precise types for EXTRACT                                                        | NULL            | <a href="https://github.com/trinodb/trino/pull/9893">link</a>  
   3602 | Add editing-mode option to CLI                                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/3602">link</a>  
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/d0cb432164d6ca91cc76c67a14d928383d16bd16/sql/pr/abandoned-prs.sql)

Generated on Sat Feb 26 06:29:25 UTC 2022

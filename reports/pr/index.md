Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 869 04:58:31.200 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 744 17:50:58.200 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 725 00:24:44.200 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 548 22:13:43.200 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 543 01:43:34.200 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 494 20:33:45.200 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 492 07:13:16.200 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 489 06:53:48.200 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 458 05:05:43.200 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 406 17:46:39.200 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 265 20:28:01.200 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 209 15:52:17.200 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 141 18:09:43.200 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 141 18:09:40.200 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 141 09:32:58.200 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 108 18:59:10.200 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9789 | allow push down join on redshift                                     | 108 18:59:10.200 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 108 18:59:10.200 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 108 18:59:10.200 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 108 18:59:10.200 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/1219b5b620118fa3e4c702c1e6325999e8a91935/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/1219b5b620118fa3e4c702c1e6325999e8a91935/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1034 04:18:37.150 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1018 13:24:26.150 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1003 21:17:51.150 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1002 06:03:35.150 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 997 07:46:29.150  | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 934 05:14:11.150  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 933 22:05:50.150  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 921 05:37:06.150  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 913 17:16:32.150  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 869 21:26:22.150  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 869 20:00:06.150  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 863 03:49:50.150  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 861 08:08:42.150  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 840 19:34:33.150  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 830 01:43:42.150  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 807 17:00:22.150  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 791 18:17:40.150  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 772 19:32:41.150  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 770 07:21:41.150  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 765 10:47:50.150  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/1219b5b620118fa3e4c702c1e6325999e8a91935/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                    title                                    | time_since_push |                              link                              
--------+-----------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10323 | Make CI only build/test modules with any changes                            | NULL            | <a href="https://github.com/trinodb/trino/pull/10323">link</a> 
  10322 | Load lazy blocks before using them in page filter/projection                | NULL            | <a href="https://github.com/trinodb/trino/pull/10322">link</a> 
  10463 | Describe string cast to JSON handling                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/10463">link</a> 
  10387 | Add Snowflake JDBC Connector                                                | NULL            | <a href="https://github.com/trinodb/trino/pull/10387">link</a> 
  10166 | Implement flushing for partial TopNOperator                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10166">link</a> 
   3602 | Add editing-mode option to CLI                                              | NULL            | <a href="https://github.com/trinodb/trino/pull/3602">link</a>  
  10418 | Reinitialize the column writers when flushing a row group                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10418">link</a> 
  10215 | Lazily load hive partition information                                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10215">link</a> 
   9818 | Implement task level retries                                                | NULL            | <a href="https://github.com/trinodb/trino/pull/9818">link</a>  
  10356 | Clarify duration values as integers                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10356">link</a> 
  10116 | Introduce LDAP Group Provider                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/10116">link</a> 
  10385 | Extend metadata cache flush procedure to flush specific caches              | NULL            | <a href="https://github.com/trinodb/trino/pull/10385">link</a> 
  10355 | Add reusable smoke test coverage for UPDATE                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10355">link</a> 
  10261 | Fix inserting into transactional table when task_writer_count &gt; 1           | NULL            | <a href="https://github.com/trinodb/trino/pull/10261">link</a> 
  10150 | Proactively enforce memory limits in distincting accumulators               | NULL            | <a href="https://github.com/trinodb/trino/pull/10150">link</a> 
  10415 | Trino CLI Docker image                                                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10415">link</a> 
   7828 | Use Datastax Cassandra java driver v4                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/7828">link</a>  
  10422 | ClickHouse connector support split by clickhouse partition and shard info   | NULL            | <a href="https://github.com/trinodb/trino/pull/10422">link</a> 
  10409 | Improve performance of VariableWidthBlock#copyPositions                     | NULL            | <a href="https://github.com/trinodb/trino/pull/10409">link</a> 
  10059 | Refactor QueryBuilder usage and implement *char join pushdown in PostgreSQL | NULL            | <a href="https://github.com/trinodb/trino/pull/10059">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/1219b5b620118fa3e4c702c1e6325999e8a91935/sql/pr/abandoned-prs.sql)

Generated on Fri Feb 25 14:07:07 UTC 2022

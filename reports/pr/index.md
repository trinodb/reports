Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 873 21:23:26.845 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 749 10:15:53.845 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 729 16:49:39.845 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 553 14:38:38.845 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 547 18:08:29.845 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 499 12:58:40.845 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 496 23:38:11.845 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 493 23:18:43.845 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 462 21:30:38.845 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 411 10:11:34.845 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 270 12:52:56.845 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 214 08:17:12.845 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 146 10:34:38.845 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 146 10:34:35.845 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 146 01:57:53.845 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 113 11:24:05.845 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 113 11:24:05.845 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 113 11:24:05.845 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 113 11:24:05.845 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 113 11:24:05.845 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/a550e8a7edaa3ed7a5808c47d8b951a4dbdbf5f9/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/a550e8a7edaa3ed7a5808c47d8b951a4dbdbf5f9/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1038 20:43:27.485 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1023 05:49:16.485 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1008 13:42:41.485 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1006 22:28:25.485 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1002 00:11:19.485 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 938 21:39:01.485  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 938 14:30:40.485  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 925 22:01:56.485  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 918 09:41:22.485  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 874 13:51:12.485  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 874 12:24:56.485  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 867 20:14:40.485  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 866 00:33:32.485  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 845 11:59:23.485  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 834 18:08:32.485  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 812 09:25:12.485  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 796 10:42:30.485  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 777 11:57:31.485  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 774 23:46:31.485  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 770 03:12:40.485  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/a550e8a7edaa3ed7a5808c47d8b951a4dbdbf5f9/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                    title                                    | time_since_push |                              link                              
--------+-----------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10915 | Invalidate CachingDirectoryLister when writing through Trino                | NULL            | <a href="https://github.com/trinodb/trino/pull/10915">link</a> 
  10823 | Implement exchange spooling                                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10823">link</a> 
  10837 | Handle split weights in SourceDistributionTaskSource                        | NULL            | <a href="https://github.com/trinodb/trino/pull/10837">link</a> 
  10116 | Introduce LDAP Group Provider                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/10116">link</a> 
  10215 | Lazily load hive partition information                                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10215">link</a> 
  10323 | Make CI only build/test modules with any changes                            | NULL            | <a href="https://github.com/trinodb/trino/pull/10323">link</a> 
  11183 | Add default DirectoryLister implementation                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11183">link</a> 
  11066 | Improve CBO estimates for certain scenarios                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/11066">link</a> 
  11189 | Document prepared statement compression properties.                         | NULL            | <a href="https://github.com/trinodb/trino/pull/11189">link</a> 
  11094 | Add Trino 372 release notes                                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/11094">link</a> 
  10387 | Add Snowflake JDBC Connector                                                | NULL            | <a href="https://github.com/trinodb/trino/pull/10387">link</a> 
  11108 | Migrate to BaseConnectorTest in BigQuery                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/11108">link</a> 
  11185 | Remove usage of static test classes in kuduconnectortests                   | NULL            | <a href="https://github.com/trinodb/trino/pull/11185">link</a> 
  11118 | Instantiate collection builder with factory method                          | NULL            | <a href="https://github.com/trinodb/trino/pull/11118">link</a> 
  10767 | Support for AWS Athena partition projection                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10767">link</a> 
  11174 | Implement parallel read from S3 for exchange storage                        | NULL            | <a href="https://github.com/trinodb/trino/pull/11174">link</a> 
  10845 | Support Glue catalog in Iceberg connector                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10845">link</a> 
  10059 | Refactor QueryBuilder usage and implement *char join pushdown in PostgreSQL | NULL            | <a href="https://github.com/trinodb/trino/pull/10059">link</a> 
  10843 | Use airlift json codec in http event listener, fixing airlift/airlift#983   | NULL            | <a href="https://github.com/trinodb/trino/pull/10843">link</a> 
  10790 | Document OPTIMIZE for Iceberg                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/10790">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/a550e8a7edaa3ed7a5808c47d8b951a4dbdbf5f9/sql/pr/abandoned-prs.sql)

Generated on Wed Mar  2 06:31:52 UTC 2022

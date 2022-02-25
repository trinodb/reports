Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 868 21:22:05.198 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 744 10:14:32.198 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 724 16:48:18.198 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 548 14:37:17.198 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 542 18:07:08.198 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 494 12:57:19.198 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 491 23:36:50.198 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 488 23:17:22.198 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 457 21:29:17.198 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 406 10:10:13.198 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 265 12:51:35.198 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 209 08:15:51.198 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 141 10:33:17.198 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 141 10:33:14.198 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 141 01:56:32.198 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 108 11:22:44.198 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 108 11:22:44.198 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 108 11:22:44.198 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 108 11:22:44.198 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 108 11:22:44.198 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/e2e7a555bc06c6c4779bbac47d3e690f0f1acdac/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/e2e7a555bc06c6c4779bbac47d3e690f0f1acdac/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1033 20:42:11.271 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1018 05:48:00.271 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1003 13:41:25.271 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1001 22:27:09.271 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 997 00:10:03.271  | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 933 21:37:45.271  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 933 14:29:24.271  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 920 22:00:40.271  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 913 09:40:06.271  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 869 13:49:56.271  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 869 12:23:40.271  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 862 20:13:24.271  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 861 00:32:16.271  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 840 11:58:07.271  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 829 18:07:16.271  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 807 09:23:56.271  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 791 10:41:14.271  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 772 11:56:15.271  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 769 23:45:15.271  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 765 03:11:24.271  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/e2e7a555bc06c6c4779bbac47d3e690f0f1acdac/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                        title                                        | time_since_push |                              link                              
--------+-------------------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10387 | Add Snowflake JDBC Connector                                                        | NULL            | <a href="https://github.com/trinodb/trino/pull/10387">link</a> 
  10915 | Invalidate CachingDirectoryLister when writing through Trino                        | NULL            | <a href="https://github.com/trinodb/trino/pull/10915">link</a> 
  10767 | Support for AWS Athena partition projection                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10767">link</a> 
  10825 | Dont use row block field block offsets if not needed                                | NULL            | <a href="https://github.com/trinodb/trino/pull/10825">link</a> 
  10843 | Use airlift json codec in http event listener, fixing airlift/airlift#983           | NULL            | <a href="https://github.com/trinodb/trino/pull/10843">link</a> 
  10790 | Document OPTIMIZE for Iceberg                                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/10790">link</a> 
  11037 | Improve negative date tests                                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/11037">link</a> 
  11047 | Fix EvictableCache replace                                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/11047">link</a> 
  11035 | Fix metastore impersonation for Avro tables                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/11035">link</a> 
  10215 | Lazily load hive partition information                                              | NULL            | <a href="https://github.com/trinodb/trino/pull/10215">link</a> 
  10810 | Vacuum for Iceberg together with coordinator only execute                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10810">link</a> 
  10800 | Consolidate file-based authorization docs                                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10800">link</a> 
   6180 | Fallback to an available alter table and alter partitions API in Hive Metastore 3.x | NULL            | <a href="https://github.com/trinodb/trino/pull/6180">link</a>  
  10872 | Remove unnecessary explicit handle declaration                                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10872">link</a> 
  10881 | [Test] Support Glue catalog in Iceberg connector                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10881">link</a> 
  10323 | Make CI only build/test modules with any changes                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10323">link</a> 
  10888 | Make token-cache host aware                                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10888">link</a> 
  10845 | Support Glue catalog in Iceberg connector                                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10845">link</a> 
  10432 | Allow assigning exclusive node for task execution                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10432">link</a> 
  11049 | Add allow-drop-table documentation to Hive and Cassandra                            | NULL            | <a href="https://github.com/trinodb/trino/pull/11049">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/e2e7a555bc06c6c4779bbac47d3e690f0f1acdac/sql/pr/abandoned-prs.sql)

Generated on Fri Feb 25 06:30:39 UTC 2022

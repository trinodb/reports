Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 879 21:24:51.227 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 755 10:17:18.227 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 735 16:51:04.227 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 559 14:40:03.227 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 553 18:09:54.227 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 505 13:00:05.227 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 502 23:39:36.227 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 499 23:20:08.227 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 468 21:32:03.227 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 417 10:12:59.227 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 276 12:54:21.227 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 220 08:18:37.227 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 152 10:36:03.227 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 152 10:36:00.227 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 152 01:59:18.227 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 119 11:25:30.227 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 119 11:25:30.227 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 119 11:25:30.227 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 119 11:25:30.227 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 119 11:25:30.227 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/68b2f73880a4a4dcc2270732e3a7c6dbe17855d6/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/68b2f73880a4a4dcc2270732e3a7c6dbe17855d6/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1044 20:44:53.645 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1029 05:50:42.645 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1014 13:44:07.645 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1012 22:29:51.645 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1008 00:12:45.645 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 944 21:40:27.645  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 944 14:32:06.645  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 931 22:03:22.645  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 924 09:42:48.645  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 880 13:52:38.645  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 880 12:26:22.645  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 873 20:16:06.645  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 872 00:34:58.645  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 851 12:00:49.645  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 840 18:09:58.645  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 818 09:26:38.645  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 802 10:43:56.645  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 783 11:58:57.645  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 780 23:47:57.645  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 776 03:14:06.645  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/68b2f73880a4a4dcc2270732e3a7c6dbe17855d6/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                        title                                         | time_since_push |                              link                              
--------+--------------------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  11066 | Improve CBO estimates for certain scenarios                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/11066">link</a> 
  10432 | Allow assigning exclusive node for task execution                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10432">link</a> 
  11129 | Support for killing individual task if cluster is out of memory                      | NULL            | <a href="https://github.com/trinodb/trino/pull/11129">link</a> 
  10845 | Support Glue catalog in Iceberg connector                                            | NULL            | <a href="https://github.com/trinodb/trino/pull/10845">link</a> 
  11316 | Forbid usage of static inner test classes in TestNG                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11316">link</a> 
  11174 | Implement parallel read from S3 for exchange storage                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/11174">link</a> 
  10897 | Add Delta Lake connector                                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/10897">link</a> 
  10717 | Elasticsearch connector optimize the search query of deep nesting                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10717">link</a> 
  11022 | Document support for ALTER TABLE SET PROPERTIES                                      | NULL            | <a href="https://github.com/trinodb/trino/pull/11022">link</a> 
  11308 | Add support for LIKE escape parameter in Elasticsearch connector expression pushdown | NULL            | <a href="https://github.com/trinodb/trino/pull/11308">link</a> 
  11340 | Improve ClickHouse type mapping tests                                                | NULL            | <a href="https://github.com/trinodb/trino/pull/11340">link</a> 
  11139 | Optimize queries on system.jdbc.tables when filters are specified                    | NULL            | <a href="https://github.com/trinodb/trino/pull/11139">link</a> 
  11265 | Skip certain table properties when doing create table (like including…               | NULL            | <a href="https://github.com/trinodb/trino/pull/11265">link</a> 
  10837 | Handle split weights in SourceDistributionTaskSource                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10837">link</a> 
  11040 | Making TestCassandraConnectorTest more maintainable                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11040">link</a> 
  10843 | Use airlift json codec in http event listener, fixing airlift/airlift#983            | NULL            | <a href="https://github.com/trinodb/trino/pull/10843">link</a> 
  10215 | Lazily load hive partition information                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/10215">link</a> 
  10228 | Add Hudi connector                                                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10228">link</a> 
  11291 | Let test-docs run when PR doesn't contain release-notes label                        | NULL            | <a href="https://github.com/trinodb/trino/pull/11291">link</a> 
  11301 | Update memsql plugin JDBC driver dependency                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/11301">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/68b2f73880a4a4dcc2270732e3a7c6dbe17855d6/sql/pr/abandoned-prs.sql)

Generated on Tue Mar  8 06:33:19 UTC 2022

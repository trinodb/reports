Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 883 21:24:13.940 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 759 10:16:40.940 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 739 16:50:26.940 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 563 14:39:25.940 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 557 18:09:16.940 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 509 12:59:27.940 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 506 23:38:58.940 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 503 23:19:30.940 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 472 21:31:25.940 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 421 10:12:21.940 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 280 12:53:43.940 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 224 08:17:59.940 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 156 10:35:25.940 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 156 10:35:22.940 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 156 01:58:40.940 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 123 11:24:52.940 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 123 11:24:52.940 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 123 11:24:52.940 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 123 11:24:52.940 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 123 11:24:52.940 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/3f9e231261449d995098df46fca3a6f6ab73ed09/sql/pr/stale-prs.sql)

#  Longest running PRs
<pre><code>
 number |                                          title                                          |  running_time   |                             link                              
--------+-----------------------------------------------------------------------------------------+-----------------+---------------------------------------------------------------
   9482 | Simplify Hive metastore creation and use                                                | 84 19:18:28.000 | <a href="https://github.com/trinodb/trino/pull/9482">link</a> 
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
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/3f9e231261449d995098df46fca3a6f6ab73ed09/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1048 20:44:17.362 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1033 05:50:06.362 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1018 13:43:31.362 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1016 22:29:15.362 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1012 00:12:09.362 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 948 21:39:51.362  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 948 14:31:30.362  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 935 22:02:46.362  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 928 09:42:12.362  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 884 13:52:02.362  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 884 12:25:46.362  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 877 20:15:30.362  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 876 00:34:22.362  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 855 12:00:13.362  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 844 18:09:22.362  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 822 09:26:02.362  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 806 10:43:20.362  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 787 11:58:21.362  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 784 23:47:21.362  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 780 03:13:30.362  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/3f9e231261449d995098df46fca3a6f6ab73ed09/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                 title                                 | time_since_push |                              link                              
--------+-----------------------------------------------------------------------+-----------------+----------------------------------------------------------------
   7994 | ConnectorExpression pushdown                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/7994">link</a>  
   9841 | Make map and array functions use IS DISTINCT semantics as appropriate | NULL            | <a href="https://github.com/trinodb/trino/pull/9841">link</a>  
  10767 | Support for AWS Atena partition projection                            | NULL            | <a href="https://github.com/trinodb/trino/pull/10767">link</a> 
  10856 | Correct decoding for Trino UUID partition key value                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10856">link</a> 
  10801 | Replace deprecated driver ru.yandex.clickhouse.ClickHouseDriver       | NULL            | <a href="https://github.com/trinodb/trino/pull/10801">link</a> 
  10411 | Document atop connector                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/10411">link</a> 
  10514 | Document special tables exposed by Iceberg                            | NULL            | <a href="https://github.com/trinodb/trino/pull/10514">link</a> 
  10831 | Document existing Hive properties                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/10831">link</a> 
  10802 | Gn/fix kudu tests on mac                                              | NULL            | <a href="https://github.com/trinodb/trino/pull/10802">link</a> 
  10336 | Add ScyllaDB connector                                                | NULL            | <a href="https://github.com/trinodb/trino/pull/10336">link</a> 
  11026 | Link to comparison operators page                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/11026">link</a> 
  11148 | Add support for DateTime64 in ClickHouse                              | NULL            | <a href="https://github.com/trinodb/trino/pull/11148">link</a> 
  11187 | Add CLI options table                                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/11187">link</a> 
  11012 | Add username and password section                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/11012">link</a> 
  10898 | Update SQL Server JDBC driver to 10.2.0                               | NULL            | <a href="https://github.com/trinodb/trino/pull/10898">link</a> 
  11186 | Change wording in catalog session properties section                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11186">link</a> 
  10970 | Reduce overheads related to DictionaryBlock#getSizeInBytes()          | NULL            | <a href="https://github.com/trinodb/trino/pull/10970">link</a> 
  10894 | Add Iceberg MinIO Datalake integration tests                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10894">link</a> 
  10046 | Add MariaDB connector                                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10046">link</a> 
  10816 | Add pull request template                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/10816">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/3f9e231261449d995098df46fca3a6f6ab73ed09/sql/pr/abandoned-prs.sql)

Generated on Sat Mar 12 06:32:45 UTC 2022

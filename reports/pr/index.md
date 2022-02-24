Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 868 09:20:22.717 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 743 22:12:49.717 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 724 04:46:35.717 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 548 02:35:34.717 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 542 06:05:25.717 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 494 00:55:36.717 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 491 11:35:07.717 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 488 11:15:39.717 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 457 09:27:34.717 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 405 22:08:30.717 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 265 00:49:52.717 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 208 20:14:08.717 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 140 22:31:34.717 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 140 22:31:31.717 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 140 13:54:49.717 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 107 23:21:01.717 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 107 23:21:01.717 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 107 23:21:01.717 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 107 23:21:01.717 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 107 23:21:01.717 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/175e1a53a104efe63b174b37c82b6bdd96f8787c/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/175e1a53a104efe63b174b37c82b6bdd96f8787c/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1033 08:40:24.047 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1017 17:46:13.047 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1003 01:39:38.047 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1001 10:25:22.047 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 996 12:08:16.047  | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 933 09:35:58.047  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 933 02:27:37.047  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 920 09:58:53.047  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 912 21:38:19.047  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 869 01:48:09.047  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 869 00:21:53.047  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 862 08:11:37.047  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 860 12:30:29.047  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 839 23:56:20.047  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 829 06:05:29.047  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 806 21:22:09.047  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 790 22:39:27.047  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 771 23:54:28.047  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 769 11:43:28.047  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 764 15:09:37.047  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/175e1a53a104efe63b174b37c82b6bdd96f8787c/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                     title                                      | time_since_push |                              link                              
--------+--------------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10313 | Replace deprecated Guava method createTempDir                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/10313">link</a> 
  10262 | Support passing groups in OAuth access token claim                             | NULL            | <a href="https://github.com/trinodb/trino/pull/10262">link</a> 
   7994 | ConnectorExpression pushdown                                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/7994">link</a>  
  10046 | Add MariaDB connector                                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10046">link</a> 
  10336 | Add ScyllaDB connector                                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10336">link</a> 
  10309 | Test for Hive compatibility across file formats                                | NULL            | <a href="https://github.com/trinodb/trino/pull/10309">link</a> 
  10382 | Do not hold on to mutable config object                                        | NULL            | <a href="https://github.com/trinodb/trino/pull/10382">link</a> 
   8743 | Add support for optional Kafka properties from external file                   | NULL            | <a href="https://github.com/trinodb/trino/pull/8743">link</a>  
  10381 | support hive syntax parser                                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/10381">link</a> 
  10379 | Support hive parser                                                            | NULL            | <a href="https://github.com/trinodb/trino/pull/10379">link</a> 
   9812 | Add PostgreSQL and Oracle migration files for DB backed resource group manager | NULL            | <a href="https://github.com/trinodb/trino/pull/9812">link</a>  
   9965 | Improve performance/memory overhead for Spatial Join                           | NULL            | <a href="https://github.com/trinodb/trino/pull/9965">link</a>  
   9841 | Make map and array functions use IS DISTINCT semantics as appropriate          | NULL            | <a href="https://github.com/trinodb/trino/pull/9841">link</a>  
  10367 | Migrate deprecated `rollback()` call                                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10367">link</a> 
  10297 | Document proxy configuration for OAuth 2.0 client                              | NULL            | <a href="https://github.com/trinodb/trino/pull/10297">link</a> 
  10300 | Delta lake connector - Reader                                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/10300">link</a> 
  10258 | Support Iceberg time travel                                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10258">link</a> 
  10263 | Fix incorrect negative date predicates in SQL Server and ClickHouse            | NULL            | <a href="https://github.com/trinodb/trino/pull/10263">link</a> 
  10959 | Index session catalog roles and properties using name instead of id            | NULL            | <a href="https://github.com/trinodb/trino/pull/10959">link</a> 
  10949 | Simplify evictable cache implementation                                        | NULL            | <a href="https://github.com/trinodb/trino/pull/10949">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/175e1a53a104efe63b174b37c82b6bdd96f8787c/sql/pr/abandoned-prs.sql)

Generated on Thu Feb 24 18:28:50 UTC 2022

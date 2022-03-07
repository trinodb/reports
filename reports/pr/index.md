Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 879 03:49:38.066 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 754 16:42:05.066 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 734 23:15:51.066 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 558 21:04:50.066 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 553 00:34:41.066 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 504 19:24:52.066 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 502 06:04:23.066 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 499 05:44:55.066 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 468 03:56:50.066 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 416 16:37:46.066 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 275 19:19:08.066 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 219 14:43:24.066 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 151 17:00:50.066 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 151 17:00:47.066 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 151 08:24:05.066 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 118 17:50:17.066 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 118 17:50:17.066 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 118 17:50:17.066 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9789 | allow push down join on redshift                                     | 118 17:50:17.066 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 118 17:50:17.066 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/b2398b9c9d64a29bd825e9cd1f4d5c87eabd74f3/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/b2398b9c9d64a29bd825e9cd1f4d5c87eabd74f3/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1044 03:09:38.751 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1028 12:15:27.751 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1013 20:08:52.751 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1012 04:54:36.751 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1007 06:37:30.751 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 944 04:05:12.751  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 943 20:56:51.751  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 931 04:28:07.751  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 923 16:07:33.751  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 879 20:17:23.751  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 879 18:51:07.751  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 873 02:40:51.751  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 871 06:59:43.751  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 850 18:25:34.751  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 840 00:34:43.751  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 817 15:51:23.751  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 801 17:08:41.751  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 782 18:23:42.751  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 780 06:12:42.751  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 775 09:38:51.751  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/b2398b9c9d64a29bd825e9cd1f4d5c87eabd74f3/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                 title                                 | time_since_push |                              link                              
--------+-----------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10856 | Correct decoding for Trino UUID partition key value                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10856">link</a> 
  10877 | Limit memory used by fault tolerant scheduler on coordinator          | NULL            | <a href="https://github.com/trinodb/trino/pull/10877">link</a> 
  10875 | Remove manual creation of io.trino.metadata.Catalog in tests          | NULL            | <a href="https://github.com/trinodb/trino/pull/10875">link</a> 
  10873 | Fix failure when matching empty dictionary                            | NULL            | <a href="https://github.com/trinodb/trino/pull/10873">link</a> 
  10801 | Replace deprecated driver ru.yandex.clickhouse.ClickHouseDriver       | NULL            | <a href="https://github.com/trinodb/trino/pull/10801">link</a> 
  10817 | Document hive storage table properties                                | NULL            | <a href="https://github.com/trinodb/trino/pull/10817">link</a> 
  10802 | Gn/fix kudu tests on mac                                              | NULL            | <a href="https://github.com/trinodb/trino/pull/10802">link</a> 
  10793 | Add Trino 370 release notes                                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10793">link</a> 
  10816 | Add pull request template                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/10816">link</a> 
   9781 | Fix Handling of Aggregation Expressions in Pinot Passthrough Queries  | NULL            | <a href="https://github.com/trinodb/trino/pull/9781">link</a>  
   9841 | Make map and array functions use IS DISTINCT semantics as appropriate | NULL            | <a href="https://github.com/trinodb/trino/pull/9841">link</a>  
  10461 | Correct log retention properties                                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10461">link</a> 
   7994 | ConnectorExpression pushdown                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/7994">link</a>  
  10959 | Index session catalog roles and properties using name instead of id   | NULL            | <a href="https://github.com/trinodb/trino/pull/10959">link</a> 
  10949 | Simplify evictable cache implementation                               | NULL            | <a href="https://github.com/trinodb/trino/pull/10949">link</a> 
  10943 | Add Trino 371 release notes                                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10943">link</a> 
  10953 | Add kerberos auth support to kudu connector                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10953">link</a> 
  10940 | Upgrade kudu client to 1.15.0                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10940">link</a> 
  10835 | Document ALTER TABLE and MATERIALIZED VIEW SET PROPERTIES             | NULL            | <a href="https://github.com/trinodb/trino/pull/10835">link</a> 
  10871 | Simplify interface for altering properties                            | NULL            | <a href="https://github.com/trinodb/trino/pull/10871">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/b2398b9c9d64a29bd825e9cd1f4d5c87eabd74f3/sql/pr/abandoned-prs.sql)

Generated on Mon Mar  7 12:58:04 UTC 2022

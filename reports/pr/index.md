Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 878 21:23:36.311 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 754 10:16:03.311 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 734 16:49:49.311 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 558 14:38:48.311 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 552 18:08:39.311 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 504 12:58:50.311 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 501 23:38:21.311 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 498 23:18:53.311 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 467 21:30:48.311 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 416 10:11:44.311 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 275 12:53:06.311 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 219 08:17:22.311 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 151 10:34:48.311 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 151 10:34:45.311 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 151 01:58:03.311 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 118 11:24:15.311 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 118 11:24:15.311 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 118 11:24:15.311 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 118 11:24:15.311 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 118 11:24:15.311 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/b00ddf9d2470316af1dbcffcdf21b55f6e7d8965/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/b00ddf9d2470316af1dbcffcdf21b55f6e7d8965/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1043 20:43:36.271 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1028 05:49:25.271 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1013 13:42:50.271 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1011 22:28:34.271 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1007 00:11:28.271 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 943 21:39:10.271  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 943 14:30:49.271  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 930 22:02:05.271  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 923 09:41:31.271  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 879 13:51:21.271  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 879 12:25:05.271  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 872 20:14:49.271  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 871 00:33:41.271  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 850 11:59:32.271  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 839 18:08:41.271  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 817 09:25:21.271  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 801 10:42:39.271  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 782 11:57:40.271  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 779 23:46:40.271  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 775 03:12:49.271  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/b00ddf9d2470316af1dbcffcdf21b55f6e7d8965/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                        title                                        | time_since_push |                              link                              
--------+-------------------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10898 | Update SQL server JDBC driver to 10.2.0 for Java 11                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10898">link</a> 
  10800 | Consolidate file-based authorization docs                                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10800">link</a> 
  10835 | Document ALTER MATERIALIZED VIEW SET PROPERTIES                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/10835">link</a> 
  10868 | Schedule dynamic filtering collecting task immediately                              | NULL            | <a href="https://github.com/trinodb/trino/pull/10868">link</a> 
  10506 | Improvements to Unnest Operator                                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/10506">link</a> 
  10166 | Implement flushing for partial TopNOperator                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10166">link</a> 
  10878 | Extract io.trino.testing.containers into a separate module                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10878">link</a> 
  10810 | Vacuum for Iceberg together with coordinator only execute                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10810">link</a> 
  10779 | Add hive iceberg support based on Trino created iceberg table.                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10779">link</a> 
  10404 | Remove BigInteger usage from DecimalCasts and DecimalSaturatedFloorCasts            | NULL            | <a href="https://github.com/trinodb/trino/pull/10404">link</a> 
  10881 | [Test] Support Glue catalog in Iceberg connector                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10881">link</a> 
  10845 | Support Glue catalog in Iceberg connector                                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10845">link</a> 
  10323 | Make CI only build/test modules with any changes                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10323">link</a> 
  10177 | Update jline to 3.21.0                                                              | NULL            | <a href="https://github.com/trinodb/trino/pull/10177">link</a> 
  10378 | Add function management abstractions                                                | NULL            | <a href="https://github.com/trinodb/trino/pull/10378">link</a> 
  10888 | Make token-cache host aware                                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10888">link</a> 
  10655 | Document JSON_EXISTS, JSON_VALUE and JSON_QUERY functions                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10655">link</a> 
   6180 | Fallback to an available alter table and alter partitions API in Hive Metastore 3.x | NULL            | <a href="https://github.com/trinodb/trino/pull/6180">link</a>  
  10771 | Add documentation for db resource group manager                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/10771">link</a> 
  10823 | Implement exchange spooling                                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10823">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/b00ddf9d2470316af1dbcffcdf21b55f6e7d8965/sql/pr/abandoned-prs.sql)

Generated on Mon Mar  7 06:32:00 UTC 2022

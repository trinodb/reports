Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 863 21:16:45.157 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 739 10:09:12.157 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 719 16:42:58.157 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 543 14:31:57.157 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 537 18:01:48.157 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 489 12:51:59.157 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 486 23:31:30.157 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 483 23:12:02.157 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 452 21:23:57.157 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 401 10:04:53.157 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 260 12:46:15.157 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 204 08:10:31.157 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 136 10:27:57.157 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 136 10:27:54.157 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 136 01:51:12.157 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 103 11:17:24.157 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 103 11:17:24.157 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 103 11:17:24.157 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 103 11:17:24.157 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 103 11:17:24.157 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/f3fdc62efb4e4be98fe1dfa35ca75eaa65013702/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/f3fdc62efb4e4be98fe1dfa35ca75eaa65013702/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1028 20:36:44.628 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1013 05:42:33.628 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 998 13:35:58.628  | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 996 22:21:42.628  | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 992 00:04:36.628  | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 928 21:32:18.628  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 928 14:23:57.628  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 915 21:55:13.628  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 908 09:34:39.628  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 864 13:44:29.628  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 864 12:18:13.628  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 857 20:07:57.628  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 856 00:26:49.628  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 835 11:52:40.628  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 824 18:01:49.628  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 802 09:18:29.628  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 786 10:35:47.628  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 767 11:50:48.628  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 764 23:39:48.628  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 760 03:05:57.628  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/f3fdc62efb4e4be98fe1dfa35ca75eaa65013702/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                        title                                         | time_since_push |                              link                              
--------+--------------------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
   8020 | [Connector]Add plugin for Apache Pulsar.                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/8020">link</a>  
   9641 | Support Hudi path filter and MoR queries                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/9641">link</a>  
  10283 | Use optimized Parquet writer by default                                              | NULL            | <a href="https://github.com/trinodb/trino/pull/10283">link</a> 
  10177 | Update jline to 3.21.0                                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/10177">link</a> 
  10248 | Add support for composite external auth redirect handler                             | NULL            | <a href="https://github.com/trinodb/trino/pull/10248">link</a> 
   9754 | Use RowType in decimal aggregation serde                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/9754">link</a>  
   8178 | Remove write only objects                                                            | NULL            | <a href="https://github.com/trinodb/trino/pull/8178">link</a>  
  10232 | Enhance date function                                                                | NULL            | <a href="https://github.com/trinodb/trino/pull/10232">link</a> 
  10331 | Support DEFAULT in ALTER TABLE...SET PROPERTIES...                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10331">link</a> 
   2010 | Query debugging tracer                                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/2010">link</a>  
   4313 | Implement aggregate pushdown for druid.                                              | NULL            | <a href="https://github.com/trinodb/trino/pull/4313">link</a>  
   3269 | Expose planningCpu time in QueryStats                                                | NULL            | <a href="https://github.com/trinodb/trino/pull/3269">link</a>  
   3105 | Add generic JDBC data source connector                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/3105">link</a>  
   2744 | Improve performance of FirstValue, LastValue, Lead, Lag functions with IGNORE NULLS. | NULL            | <a href="https://github.com/trinodb/trino/pull/2744">link</a>  
   2703 | Support views in iceberg connector                                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/2703">link</a>  
   2671 | Adds set session authorization as a command                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/2671">link</a>  
   2551 | Add Snowflake JDBC Connector                                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/2551">link</a>  
   2548 | Add Salesforce JDBC Connector                                                        | NULL            | <a href="https://github.com/trinodb/trino/pull/2548">link</a>  
  10404 | Remove BigInteger usage from DecimalCasts and DecimalSaturatedFloorCasts             | NULL            | <a href="https://github.com/trinodb/trino/pull/10404">link</a> 
  10303 | Prefer Stream equivalent of some of the Iterables utility methods                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10303">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/f3fdc62efb4e4be98fe1dfa35ca75eaa65013702/sql/pr/abandoned-prs.sql)

Generated on Sun Feb 20 06:25:09 UTC 2022

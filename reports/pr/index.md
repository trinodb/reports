Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 865 09:16:55.196 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 740 22:09:22.196 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 721 04:43:08.196 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 545 02:32:07.196 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 539 06:01:58.196 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 491 00:52:09.196 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 488 11:31:40.196 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 485 11:12:12.196 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 454 09:24:07.196 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 402 22:05:03.196 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 262 00:46:25.196 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 205 20:10:41.196 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 137 22:28:07.196 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 137 22:28:04.196 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 137 13:51:22.196 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 104 23:17:34.196 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 104 23:17:34.196 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 104 23:17:34.196 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9789 | allow push down join on redshift                                     | 104 23:17:34.196 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 104 23:17:34.196 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/ab19f4e6cd918704360ec77b0b12038639858d91/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/ab19f4e6cd918704360ec77b0b12038639858d91/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1030 08:36:59.200 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1014 17:42:48.200 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1000 01:36:13.200 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 998 10:21:57.200  | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 993 12:04:51.200  | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 930 09:32:33.200  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 930 02:24:12.200  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 917 09:55:28.200  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 909 21:34:54.200  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 866 01:44:44.200  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 866 00:18:28.200  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 859 08:08:12.200  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 857 12:27:04.200  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 836 23:52:55.200  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 826 06:02:04.200  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 803 21:18:44.200  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 787 22:36:02.200  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 768 23:51:03.200  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 766 11:40:03.200  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 761 15:06:12.200  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/ab19f4e6cd918704360ec77b0b12038639858d91/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                title                                | time_since_push |                              link                              
--------+---------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10323 | Make CI only build/test modules with any changes                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10323">link</a> 
  10848 | Replace presto.xml with trino.xml for provisio                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10848">link</a> 
  10166 | Implement flushing for partial TopNOperator                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10166">link</a> 
  10847 | Include less details in the query failure messsage matching         | NULL            | <a href="https://github.com/trinodb/trino/pull/10847">link</a> 
  10845 | Support Glue catalog in Iceberg connector                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10845">link</a> 
  10655 | Document JSON_EXISTS, JSON_VALUE and JSON_QUERY functions           | NULL            | <a href="https://github.com/trinodb/trino/pull/10655">link</a> 
  10432 | Allow assigning exclusive node for task execution                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10432">link</a> 
  10844 | Fix Iceberg metadata listing failure when materialized view dropped | NULL            | <a href="https://github.com/trinodb/trino/pull/10844">link</a> 
  10806 | Simplify connector handle serialization                             | NULL            | <a href="https://github.com/trinodb/trino/pull/10806">link</a> 
  10418 | Reinitialize the column writers when flushing a row group           | NULL            | <a href="https://github.com/trinodb/trino/pull/10418">link</a> 
  10800 | Consolidate file-based authorization docs                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10800">link</a> 
  10625 | Fix JDBC Driver.getPropertyInfo() and validate allowed properties   | NULL            | <a href="https://github.com/trinodb/trino/pull/10625">link</a> 
  10215 | Lazily load hive partition information                              | NULL            | <a href="https://github.com/trinodb/trino/pull/10215">link</a> 
  10228 | Add Hudi connector                                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/10228">link</a> 
  10815 | Deny DML commands on Hive bucketed tables created by Spark          | NULL            | <a href="https://github.com/trinodb/trino/pull/10815">link</a> 
  10322 | Load lazy blocks before using them in page filter/projection        | NULL            | <a href="https://github.com/trinodb/trino/pull/10322">link</a> 
  10151 | Support Glue catalog in Iceberg connector                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10151">link</a> 
  10810 | Vacuum for Iceberg together with coordinator only execute           | NULL            | <a href="https://github.com/trinodb/trino/pull/10810">link</a> 
   9482 | Simplify Hive metastore creation and use                            | NULL            | <a href="https://github.com/trinodb/trino/pull/9482">link</a>  
  10823 | Implement exchange spooling                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10823">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/ab19f4e6cd918704360ec77b0b12038639858d91/sql/pr/abandoned-prs.sql)

Generated on Mon Feb 21 18:25:28 UTC 2022

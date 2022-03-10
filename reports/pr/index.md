Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 881 21:25:26.839 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 757 10:17:53.839 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 737 16:51:39.839 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 561 14:40:38.839 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 555 18:10:29.839 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 507 13:00:40.839 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 504 23:40:11.839 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 501 23:20:43.839 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 470 21:32:38.839 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 419 10:13:34.839 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 278 12:54:56.839 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 222 08:19:12.839 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 154 10:36:38.839 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 154 10:36:35.839 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 154 01:59:53.839 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 121 11:26:05.839 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 121 11:26:05.839 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 121 11:26:05.839 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9789 | allow push down join on redshift                                     | 121 11:26:05.839 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 121 11:26:05.839 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/361cfc3a31ee19eb19d08483e8fd5d5b18872930/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/361cfc3a31ee19eb19d08483e8fd5d5b18872930/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1046 20:45:29.675 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1031 05:51:18.675 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1016 13:44:43.675 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1014 22:30:27.675 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1010 00:13:21.675 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 946 21:41:03.675  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 946 14:32:42.675  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 933 22:03:58.675  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 926 09:43:24.675  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 882 13:53:14.675  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 882 12:26:58.675  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 875 20:16:42.675  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 874 00:35:34.675  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 853 12:01:25.675  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 842 18:10:34.675  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 820 09:27:14.675  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 804 10:44:32.675  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 785 11:59:33.675  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 782 23:48:33.675  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 778 03:14:42.675  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/361cfc3a31ee19eb19d08483e8fd5d5b18872930/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                               title                               | time_since_push |                              link                              
--------+-------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10954 | Avoid reflection and services lookup for JWT processing           | NULL            | <a href="https://github.com/trinodb/trino/pull/10954">link</a> 
  10771 | Add documentation for db resource group manager                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10771">link</a> 
  10892 | Estimate BETWEEN when the value is an expression                  | NULL            | <a href="https://github.com/trinodb/trino/pull/10892">link</a> 
  11118 | Instantiate collection builder with factory method                | NULL            | <a href="https://github.com/trinodb/trino/pull/11118">link</a> 
  10482 | Add new use system truststore flag to JDBC driver and CLI         | NULL            | <a href="https://github.com/trinodb/trino/pull/10482">link</a> 
  11284 | Remove invalid, redundant comment                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/11284">link</a> 
  11094 | Add Trino 372 release notes                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/11094">link</a> 
  10845 | Support Glue catalog in Iceberg connector                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10845">link</a> 
  11270 | Add redirection awareness for SHOW GRANTS statement               | NULL            | <a href="https://github.com/trinodb/trino/pull/11270">link</a> 
  11066 | Improve CBO estimates for certain scenarios                       | NULL            | <a href="https://github.com/trinodb/trino/pull/11066">link</a> 
  10897 | Add Delta Lake connector                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10897">link</a> 
  11129 | Support for killing individual task if cluster is out of memory   | NULL            | <a href="https://github.com/trinodb/trino/pull/11129">link</a> 
   5715 | Document for add hive.metastore=file explanation                  | NULL            | <a href="https://github.com/trinodb/trino/pull/5715">link</a>  
  11259 | TRY should handle invalid value error in cast VACHAR as TIMESTAMP | NULL            | <a href="https://github.com/trinodb/trino/pull/11259">link</a> 
  11062 | Delete Iceberg table data on DROP                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/11062">link</a> 
  11045 | JDBC function predicate pushdown with PostgreSQL LIKE pushdown    | NULL            | <a href="https://github.com/trinodb/trino/pull/11045">link</a> 
  11358 | Cache accumulator factory                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/11358">link</a> 
  11083 | Fix expression predicate pushdown not firing before AddExchanges  | NULL            | <a href="https://github.com/trinodb/trino/pull/11083">link</a> 
  10956 | Add product tests for clickhouse clusters                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10956">link</a> 
  10957 | Respect target-max-file-size in Iceberg                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10957">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/361cfc3a31ee19eb19d08483e8fd5d5b18872930/sql/pr/abandoned-prs.sql)

Generated on Thu Mar 10 06:33:57 UTC 2022

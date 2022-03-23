Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 894 21:25:22.603 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 770 10:17:49.603 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 750 16:51:35.603 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 574 14:40:34.603 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 568 18:10:25.603 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 520 13:00:36.603 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 517 23:40:07.603 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 514 23:20:39.603 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 483 21:32:34.603 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 432 10:13:30.603 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 291 12:54:52.603 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 235 08:19:08.603 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 167 10:36:34.603 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 167 10:36:31.603 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 167 01:59:49.603 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 134 11:26:01.603 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 134 11:26:01.603 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 134 11:26:01.603 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 134 11:26:01.603 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 134 11:26:01.603 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/5a332a24276a99831bb70cdccff2b915cbf4c8ea/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/5a332a24276a99831bb70cdccff2b915cbf4c8ea/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1059 20:45:30.412 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1044 05:51:19.412 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1029 13:44:44.412 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1027 22:30:28.412 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1023 00:13:22.412 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 959 21:41:04.412  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 959 14:32:43.412  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 946 22:03:59.412  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 939 09:43:25.412  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 895 13:53:15.412  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 895 12:26:59.412  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 888 20:16:43.412  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 887 00:35:35.412  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 866 12:01:26.412  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 855 18:10:35.412  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 833 09:27:15.412  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 817 10:44:33.412  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 798 11:59:34.412  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 795 23:48:34.412  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 791 03:14:43.412  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/5a332a24276a99831bb70cdccff2b915cbf4c8ea/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                               title                               | time_since_push |                              link                              
--------+-------------------------------------------------------------------+-----------------+----------------------------------------------------------------
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
  11082 | Add check for used Cassandra partition columns                    | NULL            | <a href="https://github.com/trinodb/trino/pull/11082">link</a> 
  11091 | Escape the deprecated data file from Iceberg                      | NULL            | <a href="https://github.com/trinodb/trino/pull/11091">link</a> 
  10482 | Add new use system truststore flag to JDBC driver and CLI         | NULL            | <a href="https://github.com/trinodb/trino/pull/10482">link</a> 
  11098 | Compress large prepared statements headers                        | NULL            | <a href="https://github.com/trinodb/trino/pull/11098">link</a> 
  10915 | Invalidate CachingDirectoryLister when writing through Trino      | NULL            | <a href="https://github.com/trinodb/trino/pull/10915">link</a> 
  11097 | Released memory retained by ExchangeSource                        | NULL            | <a href="https://github.com/trinodb/trino/pull/11097">link</a> 
  10767 | Support for AWS Athena partition projection                       | NULL            | <a href="https://github.com/trinodb/trino/pull/10767">link</a> 
  11102 | Check all queries returned memory on query runner teardown        | NULL            | <a href="https://github.com/trinodb/trino/pull/11102">link</a> 
  11340 | Improve ClickHouse type mapping tests                             | NULL            | <a href="https://github.com/trinodb/trino/pull/11340">link</a> 
  11284 | Remove invalid, redundant comment                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/11284">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/5a332a24276a99831bb70cdccff2b915cbf4c8ea/sql/pr/abandoned-prs.sql)

Generated on Wed Mar 23 06:34:02 UTC 2022

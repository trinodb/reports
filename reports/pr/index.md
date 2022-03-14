Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 885 21:25:41.656 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 761 10:18:08.656 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 741 16:51:54.656 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 565 14:40:53.656 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 559 18:10:44.656 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 511 13:00:55.656 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 508 23:40:26.656 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 505 23:20:58.656 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 474 21:32:53.656 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 423 10:13:49.656 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 282 12:55:11.656 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 226 08:19:27.656 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 158 10:36:53.656 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 158 10:36:50.656 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 158 02:00:08.656 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 125 11:26:20.656 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 125 11:26:20.656 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 125 11:26:20.656 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 125 11:26:20.656 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 125 11:26:20.656 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/2a2012aba3cf05adc2982ccb3b579a67ca529d25/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/2a2012aba3cf05adc2982ccb3b579a67ca529d25/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1050 20:45:58.513 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1035 05:51:47.513 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1020 13:45:12.513 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1018 22:30:56.513 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1014 00:13:50.513 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 950 21:41:32.513  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 950 14:33:11.513  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 937 22:04:27.513  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 930 09:43:53.513  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 886 13:53:43.513  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 886 12:27:27.513  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 879 20:17:11.513  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 878 00:36:03.513  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 857 12:01:54.513  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 846 18:11:03.513  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 824 09:27:43.513  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 808 10:45:01.513  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 789 12:00:02.513  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 786 23:49:02.513  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 782 03:15:11.513  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/2a2012aba3cf05adc2982ccb3b579a67ca529d25/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                     title                                     | time_since_push |                              link                              
--------+-------------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  11258 | Document hash partition count property                                        | NULL            | <a href="https://github.com/trinodb/trino/pull/11258">link</a> 
  11250 | Migrate Oracle and MemSQL to BaseCaseInsensitiveMappingTest and some cleanups | NULL            | <a href="https://github.com/trinodb/trino/pull/11250">link</a> 
  10897 | Add Delta Lake connector                                                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10897">link</a> 
  11253 | Do not fail on close() if test Kudu server is not initialized                 | NULL            | <a href="https://github.com/trinodb/trino/pull/11253">link</a> 
  11198 | Add missing query transition to RUNNING state with task-level retries         | NULL            | <a href="https://github.com/trinodb/trino/pull/11198">link</a> 
  10844 | Fix Iceberg metadata listing failure when materialized view dropped           | NULL            | <a href="https://github.com/trinodb/trino/pull/10844">link</a> 
  11066 | Improve CBO estimates for certain scenarios                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/11066">link</a> 
  10947 | Replace LongDecimalWithOverflowAndLongState for decimal operators             | NULL            | <a href="https://github.com/trinodb/trino/pull/10947">link</a> 
  11174 | Implement parallel read from S3 for exchange storage                          | NULL            | <a href="https://github.com/trinodb/trino/pull/11174">link</a> 
  10892 | Estimate BETWEEN when the value is an expression                              | NULL            | <a href="https://github.com/trinodb/trino/pull/10892">link</a> 
  11133 | Disable predicate pushdown on ARRAY(CHAR) type in Phoenix                     | NULL            | <a href="https://github.com/trinodb/trino/pull/11133">link</a> 
  11134 | Fix metadata listing failure in case of concurrent table deletion in Phoenix  | NULL            | <a href="https://github.com/trinodb/trino/pull/11134">link</a> 
  10482 | Add new use system truststore flag to JDBC driver and CLI                     | NULL            | <a href="https://github.com/trinodb/trino/pull/10482">link</a> 
  11111 | Migrate Raptor to use BaseConnectorTest                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/11111">link</a> 
  11113 | Migrate Kudu to use BaseConnectorTest                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/11113">link</a> 
  11114 | Migrate Kafka to use BaseConnectorTest                                        | NULL            | <a href="https://github.com/trinodb/trino/pull/11114">link</a> 
  11122 | Support guessing BinData type as varbinary in MongoDB                         | NULL            | <a href="https://github.com/trinodb/trino/pull/11122">link</a> 
  10116 | Introduce LDAP Group Provider                                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10116">link</a> 
  11259 | TRY should handle invalid value error in cast VACHAR as TIMESTAMP             | NULL            | <a href="https://github.com/trinodb/trino/pull/11259">link</a> 
  11094 | Add Trino 372 release notes                                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/11094">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/2a2012aba3cf05adc2982ccb3b579a67ca529d25/sql/pr/abandoned-prs.sql)

Generated on Mon Mar 14 06:34:36 UTC 2022

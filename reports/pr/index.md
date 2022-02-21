Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 864 21:18:20.142 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 740 10:10:47.142 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 720 16:44:33.142 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 544 14:33:32.142 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 538 18:03:23.142 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 490 12:53:34.142 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 487 23:33:05.142 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 484 23:13:37.142 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 453 21:25:32.142 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 402 10:06:28.142 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 261 12:47:50.142 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 205 08:12:06.142 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 137 10:29:32.142 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 137 10:29:29.142 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 137 01:52:47.142 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 104 11:18:59.142 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 104 11:18:59.142 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 104 11:18:59.142 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 104 11:18:59.142 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 104 11:18:59.142 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/b169b03782a6c7047c03a03930a5a45f09bf8b93/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/b169b03782a6c7047c03a03930a5a45f09bf8b93/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1029 20:38:24.500 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1014 05:44:13.500 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 999 13:37:38.500  | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 997 22:23:22.500  | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 993 00:06:16.500  | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 929 21:33:58.500  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 929 14:25:37.500  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 916 21:56:53.500  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 909 09:36:19.500  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 865 13:46:09.500  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 865 12:19:53.500  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 858 20:09:37.500  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 857 00:28:29.500  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 836 11:54:20.500  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 825 18:03:29.500  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 803 09:20:09.500  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 787 10:37:27.500  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 768 11:52:28.500  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 765 23:41:28.500  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 761 03:07:37.500  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/b169b03782a6c7047c03a03930a5a45f09bf8b93/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                    title                                    | time_since_push |                              link                              
--------+-----------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10681 | Return exception message in HTTP header                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/10681">link</a> 
  10453 | Enable Jacoco coverage for product tests                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10453">link</a> 
  10524 | Upgrade okhttp to 4.9.3                                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/10524">link</a> 
  10614 | Enable writer scaling by default                                            | NULL            | <a href="https://github.com/trinodb/trino/pull/10614">link</a> 
  10248 | Add support for composite external auth redirect handler                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10248">link</a> 
  10059 | Refactor QueryBuilder usage and implement *char join pushdown in PostgreSQL | NULL            | <a href="https://github.com/trinodb/trino/pull/10059">link</a> 
  10588 | Support kafka timestamp pushdown for open ranges                            | NULL            | <a href="https://github.com/trinodb/trino/pull/10588">link</a> 
  10150 | Proactively enforce memory limits in distincting accumulators               | NULL            | <a href="https://github.com/trinodb/trino/pull/10150">link</a> 
  11082 | Add check for used Cassandra partition columns                              | NULL            | <a href="https://github.com/trinodb/trino/pull/11082">link</a> 
  11091 | Escape the deprecated data file from Iceberg                                | NULL            | <a href="https://github.com/trinodb/trino/pull/11091">link</a> 
  10845 | Support Glue catalog in Iceberg connector                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10845">link</a> 
  10482 | Add new use system truststore flag to JDBC driver and CLI                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10482">link</a> 
  11098 | Compress large prepared statements headers                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11098">link</a> 
  10915 | Invalidate CachingDirectoryLister when writing through Trino                | NULL            | <a href="https://github.com/trinodb/trino/pull/10915">link</a> 
  11097 | Released memory retained by ExchangeSource                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11097">link</a> 
  10767 | Support for AWS Athena partition projection                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10767">link</a> 
  11102 | Check all queries returned memory on query runner teardown                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11102">link</a> 
  11101 | Disable ganglia metrics reporter for rubix                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11101">link</a> 
  10587 | Rename table layout classes, remove 'New'                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10587">link</a> 
   9482 | Simplify Hive metastore creation and use                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/9482">link</a>  
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/b169b03782a6c7047c03a03930a5a45f09bf8b93/sql/pr/abandoned-prs.sql)

Generated on Mon Feb 21 06:26:55 UTC 2022

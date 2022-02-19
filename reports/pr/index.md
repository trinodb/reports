Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 863 09:15:35.237 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 738 22:08:02.237 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 719 04:41:48.237 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 543 02:30:47.237 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 537 06:00:38.237 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 489 00:50:49.237 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 486 11:30:20.237 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 483 11:10:52.237 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 452 09:22:47.237 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 400 22:03:43.237 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 260 00:45:05.237 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 203 20:09:21.237 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 135 22:26:47.237 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 135 22:26:44.237 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 135 13:50:02.237 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 102 23:16:14.237 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 102 23:16:14.237 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 102 23:16:14.237 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 102 23:16:14.237 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 102 23:16:14.237 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/8f971dfb095570fcadd38a08321654fa8bd5cf0a/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/8f971dfb095570fcadd38a08321654fa8bd5cf0a/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1028 08:35:38.117 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1012 17:41:27.117 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 998 01:34:52.117  | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 996 10:20:36.117  | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 991 12:03:30.117  | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 928 09:31:12.117  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 928 02:22:51.117  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 915 09:54:07.117  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 907 21:33:33.117  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 864 01:43:23.117  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 864 00:17:07.117  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 857 08:06:51.117  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 855 12:25:43.117  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 834 23:51:34.117  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 824 06:00:43.117  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 801 21:17:23.117  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 785 22:34:41.117  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 766 23:49:42.117  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 764 11:38:42.117  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 759 15:04:51.117  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/8f971dfb095570fcadd38a08321654fa8bd5cf0a/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                 title                                  | time_since_push |                              link                              
--------+------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  11038 | Migrate MongoDB tests to use BaseConnectorTest                         | NULL            | <a href="https://github.com/trinodb/trino/pull/11038">link</a> 
  10837 | Handle split weights in SourceDistributionTaskSource                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10837">link</a> 
  10823 | Implement exchange spooling                                            | NULL            | <a href="https://github.com/trinodb/trino/pull/10823">link</a> 
  10717 | Elasticsearch connector optimize the search query of deep nesting      | NULL            | <a href="https://github.com/trinodb/trino/pull/10717">link</a> 
   2548 | Add Salesforce JDBC Connector                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/2548">link</a>  
  10166 | Implement flushing for partial TopNOperator                            | NULL            | <a href="https://github.com/trinodb/trino/pull/10166">link</a> 
  10432 | Allow assigning exclusive node for task execution                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10432">link</a> 
  11035 | Fix metastore impersonation for Avro tables                            | NULL            | <a href="https://github.com/trinodb/trino/pull/11035">link</a> 
  10952 | Refactor drop schema file deletion to fix FileHiveMetastore's behavior | NULL            | <a href="https://github.com/trinodb/trino/pull/10952">link</a> 
  10702 | Expose contains_nan in partitions metadata                             | NULL            | <a href="https://github.com/trinodb/trino/pull/10702">link</a> 
  10790 | Document OPTIMIZE for Iceberg                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10790">link</a> 
  10845 | Support Glue catalog in Iceberg connector                              | NULL            | <a href="https://github.com/trinodb/trino/pull/10845">link</a> 
  10771 | Add documentation for db resource group manager                        | NULL            | <a href="https://github.com/trinodb/trino/pull/10771">link</a> 
   1780 | Remove unused binding                                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/1780">link</a>  
   1757 | add collect_set() function.                                            | NULL            | <a href="https://github.com/trinodb/trino/pull/1757">link</a>  
   1319 | Add execution statistic warnings                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/1319">link</a>  
   1318 | Add deprecated warnings                                                | NULL            | <a href="https://github.com/trinodb/trino/pull/1318">link</a>  
   1317 | Add connector table metadata warnings                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/1317">link</a>  
  10915 | Invalidate CachingDirectoryLister when writing through Trino           | NULL            | <a href="https://github.com/trinodb/trino/pull/10915">link</a> 
  11028 | Add sql type tests for cassandra                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/11028">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/8f971dfb095570fcadd38a08321654fa8bd5cf0a/sql/pr/abandoned-prs.sql)

Generated on Sat Feb 19 18:24:06 UTC 2022

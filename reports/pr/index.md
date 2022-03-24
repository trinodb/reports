Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 896 09:24:15.136 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 771 22:16:42.136 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 752 04:50:28.136 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 576 02:39:27.136 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 570 06:09:18.136 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 522 00:59:29.136 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 519 11:39:00.136 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 516 11:19:32.136 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 485 09:31:27.136 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 433 22:12:23.136 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 293 00:53:45.136 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 236 20:18:01.136 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 168 22:35:27.136 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 168 22:35:24.136 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 168 13:58:42.136 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 135 23:24:54.136 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 135 23:24:54.136 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 135 23:24:54.136 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 135 23:24:54.136 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 135 23:24:54.136 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/e578abd30f6a47d4c180bd6ec90ef064b4b58831/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/e578abd30f6a47d4c180bd6ec90ef064b4b58831/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1061 08:44:18.082 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1045 17:50:07.082 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1031 01:43:32.082 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1029 10:29:16.082 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1024 12:12:10.082 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 961 09:39:52.082  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 961 02:31:31.082  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 948 10:02:47.082  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 940 21:42:13.082  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 897 01:52:03.082  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 897 00:25:47.082  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 890 08:15:31.082  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 888 12:34:23.082  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 868 00:00:14.082  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 857 06:09:23.082  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 834 21:26:03.082  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 818 22:43:21.082  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 799 23:58:22.082  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 797 11:47:22.082  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 792 15:13:31.082  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/e578abd30f6a47d4c180bd6ec90ef064b4b58831/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                               title                               | time_since_push |                              link                              
--------+-------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  11061 | Support incremental maven builds in PTL                           | NULL            | <a href="https://github.com/trinodb/trino/pull/11061">link</a> 
  11031 | Long aggregation improvements                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/11031">link</a> 
  11069 | Avoid volatile writes for empty responses in HttpPageBufferClient | NULL            | <a href="https://github.com/trinodb/trino/pull/11069">link</a> 
  11063 | Fix listTables to include views                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/11063">link</a> 
  10046 | Add MariaDB connector                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/10046">link</a> 
  11048 | Avoid recomputing partition dynamic filters unnecessarily         | NULL            | <a href="https://github.com/trinodb/trino/pull/11048">link</a> 
  11011 | Make partial aggregation adaptive                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/11011">link</a> 
  10810 | Vacuum for Iceberg together with coordinator-only execute         | NULL            | <a href="https://github.com/trinodb/trino/pull/10810">link</a> 
  11032 | Update iceberg to 0.13.1                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/11032">link</a> 
  10300 | Delta lake connector - Reader                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/10300">link</a> 
  10965 | Aggregation improvements                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10965">link</a> 
  11055 | Use Long for representing date value in Accumulo                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11055">link</a> 
  11068 | Disable cache sharing when cache is disabled                      | NULL            | <a href="https://github.com/trinodb/trino/pull/11068">link</a> 
   9788 | Add support for OpenID connect metadata discovery mechanism       | NULL            | <a href="https://github.com/trinodb/trino/pull/9788">link</a>  
  10895 | Skip non impacted product tests                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10895">link</a> 
  10894 | Add Iceberg MinIO Datalake integration tests                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10894">link</a> 
  11046 | Remove unused methods                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/11046">link</a> 
  10953 | Add kerberos auth support to kudu connector                       | NULL            | <a href="https://github.com/trinodb/trino/pull/10953">link</a> 
  11062 | Set the Hive Managed/External table type for Iceberg Tables       | NULL            | <a href="https://github.com/trinodb/trino/pull/11062">link</a> 
   7994 | ConnectorExpression pushdown                                      | NULL            | <a href="https://github.com/trinodb/trino/pull/7994">link</a>  
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/e578abd30f6a47d4c180bd6ec90ef064b4b58831/sql/pr/abandoned-prs.sql)

Generated on Thu Mar 24 18:32:47 UTC 2022

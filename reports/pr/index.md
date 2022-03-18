Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 889 21:24:26.150 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 765 10:16:53.150 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 745 16:50:39.150 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 569 14:39:38.150 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 563 18:09:29.150 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 515 12:59:40.150 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 512 23:39:11.150 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 509 23:19:43.150 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 478 21:31:38.150 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 427 10:12:34.150 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 286 12:53:56.150 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 230 08:18:12.150 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 162 10:35:38.150 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 162 10:35:35.150 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 162 01:58:53.150 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 129 11:25:05.150 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 129 11:25:05.150 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 129 11:25:05.150 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 129 11:25:05.150 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 129 11:25:05.150 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/9722bb1acad3b28099dcfbaba635ccb5dfef7a3b/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/9722bb1acad3b28099dcfbaba635ccb5dfef7a3b/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1054 20:44:28.614 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1039 05:50:17.614 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1024 13:43:42.614 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1022 22:29:26.614 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1018 00:12:20.614 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 954 21:40:02.614  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 954 14:31:41.614  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 941 22:02:57.614  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 934 09:42:23.614  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 890 13:52:13.614  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 890 12:25:57.614  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 883 20:15:41.614  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 882 00:34:33.614  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 861 12:00:24.614  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 850 18:09:33.614  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 828 09:26:13.614  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 812 10:43:31.614  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 793 11:58:32.614  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 790 23:47:32.614  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 786 03:13:41.614  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/9722bb1acad3b28099dcfbaba635ccb5dfef7a3b/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                              title                               | time_since_push |                              link                              
--------+------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  11224 | Run engine-only tests with task level retries                    | NULL            | <a href="https://github.com/trinodb/trino/pull/11224">link</a> 
  11205 | Add intro to Procedure in the Hive connector                     | NULL            | <a href="https://github.com/trinodb/trino/pull/11205">link</a> 
  11163 | Use proper SQL identifier semantics for CALL arguments           | NULL            | <a href="https://github.com/trinodb/trino/pull/11163">link</a> 
  11235 | Allocate new Slice for VariableWidthBlockEncoding readBlock      | NULL            | <a href="https://github.com/trinodb/trino/pull/11235">link</a> 
  11211 | Add table comments interface in base JDBC and implement in MySQL | NULL            | <a href="https://github.com/trinodb/trino/pull/11211">link</a> 
  11217 | Use shared Zstd(De)Compressor in ResolvedFunction encoding       | NULL            | <a href="https://github.com/trinodb/trino/pull/11217">link</a> 
   7994 | ConnectorExpression pushdown                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/7994">link</a>  
  11233 | Remove unnecessary block                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/11233">link</a> 
  11229 | Add documentation for Delta Lake connector                       | NULL            | <a href="https://github.com/trinodb/trino/pull/11229">link</a> 
  11187 | Add CLI options table                                            | NULL            | <a href="https://github.com/trinodb/trino/pull/11187">link</a> 
  11026 | Link to comparison operators page                                | NULL            | <a href="https://github.com/trinodb/trino/pull/11026">link</a> 
  10895 | Skip non impacted product tests                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/10895">link</a> 
  11160 | Add format_data_size function                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/11160">link</a> 
  10898 | Update SQL Server JDBC driver to 10.2.0                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10898">link</a> 
  11230 | Bumped h2 from 1.4.2 to 2.1.210                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11230">link</a> 
  11226 | Add redirection awareness for RENAME COLUMN task                 | NULL            | <a href="https://github.com/trinodb/trino/pull/11226">link</a> 
   9965 | Improve performance/memory overhead for Spatial Join             | NULL            | <a href="https://github.com/trinodb/trino/pull/9965">link</a>  
  11017 | Do not use combine-hash with 0 first arg                         | NULL            | <a href="https://github.com/trinodb/trino/pull/11017">link</a> 
  11159 | Bump Coral dependency version to 2.0.53                          | NULL            | <a href="https://github.com/trinodb/trino/pull/11159">link</a> 
  11236 | Add support for ANSI SQL syntax in trim function                 | NULL            | <a href="https://github.com/trinodb/trino/pull/11236">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/9722bb1acad3b28099dcfbaba635ccb5dfef7a3b/sql/pr/abandoned-prs.sql)

Generated on Fri Mar 18 06:32:57 UTC 2022

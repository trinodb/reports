Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 900 21:27:36.337 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 776 10:20:03.337 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 756 16:53:49.337 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 580 14:42:48.337 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 574 18:12:39.337 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 526 13:02:50.337 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 523 23:42:21.337 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 520 23:22:53.337 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 489 21:34:48.337 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 438 10:15:44.337 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 297 12:57:06.337 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 241 08:21:22.337 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 173 10:38:48.337 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 173 10:38:45.337 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 173 02:02:03.337 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9789 | allow push down join on redshift                                     | 140 11:28:15.337 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 140 11:28:15.337 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 140 11:28:15.337 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 140 11:28:15.337 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 140 11:28:15.337 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/20c0720f8dffe9427835f6561c7ed865556e2ef8/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/20c0720f8dffe9427835f6561c7ed865556e2ef8/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1065 20:47:43.101 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1050 05:53:32.101 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1035 13:46:57.101 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1033 22:32:41.101 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1029 00:15:35.101 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 965 21:43:17.101  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 965 14:34:56.101  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 952 22:06:12.101  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 945 09:45:38.101  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 901 13:55:28.101  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 901 12:29:12.101  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 894 20:18:56.101  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 893 00:37:48.101  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 872 12:03:39.101  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 861 18:12:48.101  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 839 09:29:28.101  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 823 10:46:46.101  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 804 12:01:47.101  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 801 23:50:47.101  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 797 03:16:56.101  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/20c0720f8dffe9427835f6561c7ed865556e2ef8/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                       title                                        | time_since_push |                              link                              
--------+------------------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
   9965 | Improve performance/memory overhead for Spatial Join                               | NULL            | <a href="https://github.com/trinodb/trino/pull/9965">link</a>  
  11515 | Make expression type optional in pushdown DSL                                      | NULL            | <a href="https://github.com/trinodb/trino/pull/11515">link</a> 
  11530 | Add job to cancel docs job when PRs are closed or merged                           | NULL            | <a href="https://github.com/trinodb/trino/pull/11530">link</a> 
  11526 | Document ALTER TABLE EXECUTE OPTIMIZE for Delta Lake connector                     | NULL            | <a href="https://github.com/trinodb/trino/pull/11526">link</a> 
  11525 | Improve singlestore timestamp precision mapping                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/11525">link</a> 
  11187 | Add CLI options table                                                              | NULL            | <a href="https://github.com/trinodb/trino/pull/11187">link</a> 
  11529 | Support Iceberg views and materialized views with Glue Catalog                     | NULL            | <a href="https://github.com/trinodb/trino/pull/11529">link</a> 
  11049 | Describe allow-* properties in Hive and Cassandra                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11049">link</a> 
   8743 | Add support for optional Kafka properties from external file                       | NULL            | <a href="https://github.com/trinodb/trino/pull/8743">link</a>  
  11217 | Use shared Zstd(De)Compressor in ResolvedFunction encoding                         | NULL            | <a href="https://github.com/trinodb/trino/pull/11217">link</a> 
  11468 | Test Iceberg Glue API invocation counts                                            | NULL            | <a href="https://github.com/trinodb/trino/pull/11468">link</a> 
  11206 | Add all_files system table to the Iceberg connector                                | NULL            | <a href="https://github.com/trinodb/trino/pull/11206">link</a> 
  11279 | Allow passing extra credentials details to AWS Glue in customAWSCredntialProvider  | NULL            | <a href="https://github.com/trinodb/trino/pull/11279">link</a> 
   9781 | Fix Handling of Aggregation Expressions in Pinot Passthrough Queries               | NULL            | <a href="https://github.com/trinodb/trino/pull/9781">link</a>  
  10336 | Add ScyllaDB connector                                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/10336">link</a> 
  11026 | Link to comparison operators page                                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11026">link</a> 
  11148 | Add support for DateTime64 in ClickHouse                                           | NULL            | <a href="https://github.com/trinodb/trino/pull/11148">link</a> 
  11012 | Add username and password section                                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11012">link</a> 
  11533 | Push down IF in PostgreSQL connector                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/11533">link</a> 
  11444 | Fix style in Kudu documentation                                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/11444">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/20c0720f8dffe9427835f6561c7ed865556e2ef8/sql/pr/abandoned-prs.sql)

Generated on Tue Mar 29 06:36:15 UTC 2022

Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 905 21:26:58.860 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 781 10:19:25.860 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 761 16:53:11.860 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 585 14:42:10.860 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 579 18:12:01.860 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 531 13:02:12.860 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 528 23:41:43.860 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 525 23:22:15.860 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 494 21:34:10.860 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 443 10:15:06.860 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 302 12:56:28.860 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 246 08:20:44.860 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 178 10:38:10.860 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 178 10:38:07.860 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 178 02:01:25.860 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 145 11:27:37.860 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 145 11:27:37.860 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 145 11:27:37.860 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9789 | allow push down join on redshift                                     | 145 11:27:37.860 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 145 11:27:37.860 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/8795e507b8a6aab368dbd36b7ee9192eb16313e6/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/8795e507b8a6aab368dbd36b7ee9192eb16313e6/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1070 20:47:12.644 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1055 05:53:01.644 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1040 13:46:26.644 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1038 22:32:10.644 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1034 00:15:04.644 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 970 21:42:46.644  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 970 14:34:25.644  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 957 22:05:41.644  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 950 09:45:07.644  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 906 13:54:57.644  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 906 12:28:41.644  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 899 20:18:25.644  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 898 00:37:17.644  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 877 12:03:08.644  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 866 18:12:17.644  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 844 09:28:57.644  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 828 10:46:15.644  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 809 12:01:16.644  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 806 23:50:16.644  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 802 03:16:25.644  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/8795e507b8a6aab368dbd36b7ee9192eb16313e6/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                title                                 | time_since_push |                              link                              
--------+----------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  11387 | Update maven wrapper `0.5.6` -&gt; `3.1.0`                              | NULL            | <a href="https://github.com/trinodb/trino/pull/11387">link</a> 
   9781 | Fix Handling of Aggregation Expressions in Pinot Passthrough Queries | NULL            | <a href="https://github.com/trinodb/trino/pull/9781">link</a>  
  10895 | Skip non impacted product tests                                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10895">link</a> 
   9965 | Improve performance/memory overhead for Spatial Join                 | NULL            | <a href="https://github.com/trinodb/trino/pull/9965">link</a>  
  10817 | Document hive storage table properties                               | NULL            | <a href="https://github.com/trinodb/trino/pull/10817">link</a> 
  10793 | Add Trino 370 release notes                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10793">link</a> 
  10816 | Add pull request template                                            | NULL            | <a href="https://github.com/trinodb/trino/pull/10816">link</a> 
   7994 | ConnectorExpression pushdown                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/7994">link</a>  
  10795 | Document allow-drop-table property in JDBC connectors                | NULL            | <a href="https://github.com/trinodb/trino/pull/10795">link</a> 
  10767 | Support for AWS Atena partition projection                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10767">link</a> 
  10802 | Gn/fix kudu tests on mac                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/10802">link</a> 
   8743 | Add support for optional Kafka properties from external file         | NULL            | <a href="https://github.com/trinodb/trino/pull/8743">link</a>  
  10749 | Fix incorrect date handling in Phoenix 4 &amp; 5                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10749">link</a> 
  10811 | Fix Jwt &amp; OAuth2 authenticators seperation issue                     | NULL            | <a href="https://github.com/trinodb/trino/pull/10811">link</a> 
  10831 | Document existing Hive properties                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10831">link</a> 
  10835 | Document ALTER TABLE and MATERIALIZED VIEW SET PROPERTIES            | NULL            | <a href="https://github.com/trinodb/trino/pull/10835">link</a> 
  10258 | Support Iceberg time travel                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10258">link</a> 
  10509 | Run Error Prone without forking compiler                             | NULL            | <a href="https://github.com/trinodb/trino/pull/10509">link</a> 
  11235 | Allocate new Slice for VariableWidthBlockEncoding readBlock          | NULL            | <a href="https://github.com/trinodb/trino/pull/11235">link</a> 
  11396 | Translate IN predicate to connector expression                       | NULL            | <a href="https://github.com/trinodb/trino/pull/11396">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/8795e507b8a6aab368dbd36b7ee9192eb16313e6/sql/pr/abandoned-prs.sql)

Generated on Sun Apr  3 06:35:51 UTC 2022

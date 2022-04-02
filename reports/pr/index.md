Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 905 09:21:17.729 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 780 22:13:44.729 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 761 04:47:30.729 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 585 02:36:29.729 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 579 06:06:20.729 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 531 00:56:31.729 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 528 11:36:02.729 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 525 11:16:34.729 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 494 09:28:29.729 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 442 22:09:25.729 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 302 00:50:47.729 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 245 20:15:03.729 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 177 22:32:29.729 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 177 22:32:26.729 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 177 13:55:44.729 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 144 23:21:56.729 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 144 23:21:56.729 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 144 23:21:56.729 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 144 23:21:56.729 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 144 23:21:56.729 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/de8c937439b24d5848faf1939933a40dced30b3f/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/de8c937439b24d5848faf1939933a40dced30b3f/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1070 08:41:30.849 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1054 17:47:19.849 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1040 01:40:44.849 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1038 10:26:28.849 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1033 12:09:22.849 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 970 09:37:04.849  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 970 02:28:43.849  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 957 09:59:59.849  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 949 21:39:25.849  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 906 01:49:15.849  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 906 00:22:59.849  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 899 08:12:43.849  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 897 12:31:35.849  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 876 23:57:26.849  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 866 06:06:35.849  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 843 21:23:15.849  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 827 22:40:33.849  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 808 23:55:34.849  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 806 11:44:34.849  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 801 15:10:43.849  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/de8c937439b24d5848faf1939933a40dced30b3f/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                         title                                          | time_since_push |                              link                              
--------+----------------------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10949 | Simplify evictable cache implementation                                                | NULL            | <a href="https://github.com/trinodb/trino/pull/10949">link</a> 
  11324 | Improve CBO estimates for correlated columns                                           | NULL            | <a href="https://github.com/trinodb/trino/pull/11324">link</a> 
  11396 | Translate IN predicate to connector expression                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/11396">link</a> 
  10984 | Gib prune pt matrix                                                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10984">link</a> 
  11264 | Gn/fix kudu schemas table race                                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/11264">link</a> 
  11390 | Normalize generated SQL queries IN list length                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/11390">link</a> 
  11217 | Use shared Zstd(De)Compressor in ResolvedFunction encoding                             | NULL            | <a href="https://github.com/trinodb/trino/pull/11217">link</a> 
  11235 | Allocate new Slice for VariableWidthBlockEncoding readBlock                            | NULL            | <a href="https://github.com/trinodb/trino/pull/11235">link</a> 
  11387 | Update maven wrapper `0.5.6` -&gt; `3.1.0`                                                | NULL            | <a href="https://github.com/trinodb/trino/pull/11387">link</a> 
  11412 | Improve Phoenix type mapping tests                                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/11412">link</a> 
  11014 | Support GET method on user info endpoint (oauth)                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/11014">link</a> 
  11125 | DSL for JDBC expression rewrites                                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/11125">link</a> 
  11410 | Re-enable Delta ADLS smoke test                                                        | NULL            | <a href="https://github.com/trinodb/trino/pull/11410">link</a> 
  11401 | rename tables support for delta tables                                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/11401">link</a> 
  11356 | Add support to redirect table operations from Iceberg to Hive                          | NULL            | <a href="https://github.com/trinodb/trino/pull/11356">link</a> 
  11332 | Add catalog.skip-load-error config param for silent catalog file loading               | NULL            | <a href="https://github.com/trinodb/trino/pull/11332">link</a> 
  10895 | Skip non impacted product tests                                                        | NULL            | <a href="https://github.com/trinodb/trino/pull/10895">link</a> 
  11282 | Preserve table catalog/schema in ALTER TABLE qualified_name RENAME TO unqualified_name | NULL            | <a href="https://github.com/trinodb/trino/pull/11282">link</a> 
  10706 | Row wise group by on fixed width types                                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10706">link</a> 
  10922 | Small improvements to spooling exchange and documentation                              | NULL            | <a href="https://github.com/trinodb/trino/pull/10922">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/de8c937439b24d5848faf1939933a40dced30b3f/sql/pr/abandoned-prs.sql)

Generated on Sat Apr  2 18:30:08 UTC 2022

Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 884 09:24:03.312 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 759 22:16:30.312 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 740 04:50:16.312 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 564 02:39:15.312 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 558 06:09:06.312 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 510 00:59:17.312 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 507 11:38:48.312 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 504 11:19:20.312 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 473 09:31:15.312 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 421 22:12:11.312 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 281 00:53:33.312 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 224 20:17:49.312 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 156 22:35:15.312 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 156 22:35:12.312 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 156 13:58:30.312 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 123 23:24:42.312 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 123 23:24:42.312 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 123 23:24:42.312 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 123 23:24:42.312 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 123 23:24:42.312 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/06f8b778de7751711323fea7c95ca9ae675e7203/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/06f8b778de7751711323fea7c95ca9ae675e7203/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1049 08:44:08.086 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1033 17:49:57.086 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1019 01:43:22.086 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1017 10:29:06.086 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1012 12:12:00.086 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 949 09:39:42.086  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 949 02:31:21.086  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 936 10:02:37.086  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 928 21:42:03.086  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 885 01:51:53.086  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 885 00:25:37.086  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 878 08:15:21.086  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 876 12:34:13.086  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 856 00:00:04.086  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 845 06:09:13.086  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 822 21:25:53.086  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 806 22:43:11.086  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 787 23:58:12.086  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 785 11:47:12.086  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 780 15:13:21.086  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/06f8b778de7751711323fea7c95ca9ae675e7203/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                       title                                       | time_since_push |                              link                              
--------+-----------------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10969 | Document query.max-cpu-time property                                              | NULL            | <a href="https://github.com/trinodb/trino/pull/10969">link</a> 
  10940 | Upgrade kudu client to 1.15.0                                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/10940">link</a> 
  11335 | Clean extra output files when overwriting a partition                             | NULL            | <a href="https://github.com/trinodb/trino/pull/11335">link</a> 
  11011 | Make partial aggregation adaptive                                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/11011">link</a> 
   9788 | Add support for OpenID connect metadata discovery mechanism                       | NULL            | <a href="https://github.com/trinodb/trino/pull/9788">link</a>  
  11342 | Optimize array_distinct(array_agg(…))                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/11342">link</a> 
  10895 | Skip non impacted product tests                                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10895">link</a> 
  11351 | Deny wrong null replacement of array type in Phoenix connector                    | NULL            | <a href="https://github.com/trinodb/trino/pull/11351">link</a> 
  11277 | Add redirection awareness for RENAME table operation                              | NULL            | <a href="https://github.com/trinodb/trino/pull/11277">link</a> 
  11159 | Bump Coral dependency version to 2.0.55                                           | NULL            | <a href="https://github.com/trinodb/trino/pull/11159">link</a> 
  11322 | Add an override method `read` for class HdfsInputStream to avoid poor performance | NULL            | <a href="https://github.com/trinodb/trino/pull/11322">link</a> 
  10810 | Vacuum for Iceberg together with coordinator-only execute                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10810">link</a> 
  11145 | Only mark dictionaries as compacted when they are not nested                      | NULL            | <a href="https://github.com/trinodb/trino/pull/11145">link</a> 
  11059 | Track Glue API calls that were untracked                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/11059">link</a> 
  11092 | Handle missing StorageDescriptor in Hive Glue tables                              | NULL            | <a href="https://github.com/trinodb/trino/pull/11092">link</a> 
  11146 | Replace row-wise DefaultPagePartitioner with ColumnarPagePartitioner              | NULL            | <a href="https://github.com/trinodb/trino/pull/11146">link</a> 
  10817 | Document hive storage table properties                                            | NULL            | <a href="https://github.com/trinodb/trino/pull/10817">link</a> 
  11147 | Fix int128 xxhash64                                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/11147">link</a> 
  10949 | Simplify evictable cache implementation                                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10949">link</a> 
  11014 | Support GET method on user info endpoint (oauth)                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11014">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/06f8b778de7751711323fea7c95ca9ae675e7203/sql/pr/abandoned-prs.sql)

Generated on Sat Mar 12 18:32:36 UTC 2022

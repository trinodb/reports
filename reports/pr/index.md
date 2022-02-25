Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 869 04:19:52.313 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 744 17:12:19.313 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 724 23:46:05.313 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 548 21:35:04.313 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 543 01:04:55.313 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 494 19:55:06.313 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 492 06:34:37.313 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 489 06:15:09.313 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 458 04:27:04.313 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 406 17:08:00.313 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 265 19:49:22.313 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 209 15:13:38.313 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 141 17:31:04.313 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 141 17:31:01.313 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 141 08:54:19.313 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 108 18:20:31.313 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 108 18:20:31.313 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 108 18:20:31.313 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 108 18:20:31.313 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 108 18:20:31.313 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/a0874f3380cc58c5913d70698190c58e356c0912/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/a0874f3380cc58c5913d70698190c58e356c0912/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1034 03:39:53.935 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1018 12:45:42.935 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1003 20:39:07.935 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1002 05:24:51.935 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 997 07:07:45.935  | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 934 04:35:27.935  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 933 21:27:06.935  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 921 04:58:22.935  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 913 16:37:48.935  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 869 20:47:38.935  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 869 19:21:22.935  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 863 03:11:06.935  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 861 07:29:58.935  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 840 18:55:49.935  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 830 01:04:58.935  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 807 16:21:38.935  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 791 17:38:56.935  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 772 18:53:57.935  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 770 06:42:57.935  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 765 10:09:06.935  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/a0874f3380cc58c5913d70698190c58e356c0912/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                              title                               | time_since_push |                              link                              
--------+------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  11032 | Update iceberg to 0.13.1                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/11032">link</a> 
  10004 | Run all tests on JDK 17                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10004">link</a> 
  11167 | Remove unnecessary purgeData parameter of TrinoCatalog.dropTable | NULL            | <a href="https://github.com/trinodb/trino/pull/11167">link</a> 
  11160 | Add format_data_size function                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/11160">link</a> 
  10413 | Add a healthcheck to the Docker container image                  | NULL            | <a href="https://github.com/trinodb/trino/pull/10413">link</a> 
   9871 | Add Parquet decryption feature                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/9871">link</a>  
  10895 | Skip non impacted product tests                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/10895">link</a> 
  11159 | Bump Coral dependency version to 2.0.53                          | NULL            | <a href="https://github.com/trinodb/trino/pull/11159">link</a> 
  10965 | Aggregation improvements                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10965">link</a> 
  11072 | Add redirection awareness for table tasks                        | NULL            | <a href="https://github.com/trinodb/trino/pull/11072">link</a> 
  11063 | Fix listTables to include views                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11063">link</a> 
  11023 | Join intermediate tasks for small partitions                     | NULL            | <a href="https://github.com/trinodb/trino/pull/11023">link</a> 
  11164 | Small test code cleanup                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/11164">link</a> 
  10894 | Add Iceberg MinIO Datalake integration tests                     | NULL            | <a href="https://github.com/trinodb/trino/pull/10894">link</a> 
  10831 | Document existing Hive properties                                | NULL            | <a href="https://github.com/trinodb/trino/pull/10831">link</a> 
  10586 | Add primary key to selectors table                               | NULL            | <a href="https://github.com/trinodb/trino/pull/10586">link</a> 
  11096 | Support registering catalog dynamically with RESTful API         | NULL            | <a href="https://github.com/trinodb/trino/pull/11096">link</a> 
  11104 | Fix query iceberg column with comments                           | NULL            | <a href="https://github.com/trinodb/trino/pull/11104">link</a> 
  10949 | Simplify evictable cache implementation                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10949">link</a> 
  10953 | Add kerberos auth support to kudu connector                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10953">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/a0874f3380cc58c5913d70698190c58e356c0912/sql/pr/abandoned-prs.sql)

Generated on Fri Feb 25 13:28:18 UTC 2022

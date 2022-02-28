Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 872 09:21:32.240 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 747 22:13:59.240 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 728 04:47:45.240 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 552 02:36:44.240 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 546 06:06:35.240 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 498 00:56:46.240 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 495 11:36:17.240 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 492 11:16:49.240 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 461 09:28:44.240 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 409 22:09:40.240 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 269 00:51:02.240 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 212 20:15:18.240 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 144 22:32:44.240 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 144 22:32:41.240 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 144 13:55:59.240 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 111 23:22:11.240 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 111 23:22:11.240 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 111 23:22:11.240 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 111 23:22:11.240 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 111 23:22:11.240 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/dba949ab3ec0c422c86e9cc3ed58d7e9db0b4a05/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/dba949ab3ec0c422c86e9cc3ed58d7e9db0b4a05/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1037 08:41:32.621 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1021 17:47:21.621 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1007 01:40:46.621 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1005 10:26:30.621 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1000 12:09:24.621 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 937 09:37:06.621  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 937 02:28:45.621  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 924 10:00:01.621  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 916 21:39:27.621  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 873 01:49:17.621  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 873 00:23:01.621  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 866 08:12:45.621  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 864 12:31:37.621  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 843 23:57:28.621  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 833 06:06:37.621  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 810 21:23:17.621  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 794 22:40:35.621  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 775 23:55:36.621  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 773 11:44:36.621  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 768 15:10:45.621  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/dba949ab3ec0c422c86e9cc3ed58d7e9db0b4a05/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                              title                              | time_since_push |                              link                              
--------+-----------------------------------------------------------------+-----------------+----------------------------------------------------------------
  11105 | Refactor TestingMySqlServer constructor to take version numbers | NULL            | <a href="https://github.com/trinodb/trino/pull/11105">link</a> 
  11104 | Fix query iceberg column with comments                          | NULL            | <a href="https://github.com/trinodb/trino/pull/11104">link</a> 
  10953 | Add kerberos auth support to kudu connector                     | NULL            | <a href="https://github.com/trinodb/trino/pull/10953">link</a> 
   7994 | ConnectorExpression pushdown                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/7994">link</a>  
  10894 | Add Iceberg MinIO Datalake integration tests                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10894">link</a> 
  11026 | Link to comparison operators page                               | NULL            | <a href="https://github.com/trinodb/trino/pull/11026">link</a> 
  11072 | Add redirection awareness for table tasks                       | NULL            | <a href="https://github.com/trinodb/trino/pull/11072">link</a> 
  10817 | Document hive storage table properties                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10817">link</a> 
  11059 | Track Glue API calls that were untracked                        | NULL            | <a href="https://github.com/trinodb/trino/pull/11059">link</a> 
  11023 | Join intermediate tasks for small partitions                    | NULL            | <a href="https://github.com/trinodb/trino/pull/11023">link</a> 
  10810 | Vacuum for Iceberg together with coordinator-only execute       | NULL            | <a href="https://github.com/trinodb/trino/pull/10810">link</a> 
  11063 | Fix listTables to include views                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/11063">link</a> 
  11081 | rename AggregateFunction#inputs to arguments                    | NULL            | <a href="https://github.com/trinodb/trino/pull/11081">link</a> 
  11061 | Support incremental maven builds in PTL                         | NULL            | <a href="https://github.com/trinodb/trino/pull/11061">link</a> 
  11092 | Handle missing StorageDescriptor in Hive Glue tables            | NULL            | <a href="https://github.com/trinodb/trino/pull/11092">link</a> 
  11068 | Disable cache sharing when cache is disabled                    | NULL            | <a href="https://github.com/trinodb/trino/pull/11068">link</a> 
  11086 | OR expression pushdown                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/11086">link</a> 
  11090 | Allow reading Zstandard compressed Avro files                   | NULL            | <a href="https://github.com/trinodb/trino/pull/11090">link</a> 
  10046 | Add MariaDB connector                                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10046">link</a> 
  11106 | Add MySQL connector test for version 5.7                        | NULL            | <a href="https://github.com/trinodb/trino/pull/11106">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/dba949ab3ec0c422c86e9cc3ed58d7e9db0b4a05/sql/pr/abandoned-prs.sql)

Generated on Mon Feb 28 18:29:57 UTC 2022

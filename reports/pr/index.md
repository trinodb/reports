Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 868 01:50:06.460 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 743 14:42:33.460 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 723 21:16:19.460 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 547 19:05:18.460 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 541 22:35:09.460 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 493 17:25:20.460 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 491 04:04:51.460 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 488 03:45:23.460 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 457 01:57:18.460 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 405 14:38:14.460 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 264 17:19:36.460 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 208 12:43:52.460 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 140 15:01:18.460 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 140 15:01:15.460 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 140 06:24:33.460 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 107 15:50:45.460 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 107 15:50:45.460 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 107 15:50:45.460 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 107 15:50:45.460 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 107 15:50:45.460 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/75d1cc1c339c952ebd15e8aa66862609c6cfe1b6/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/75d1cc1c339c952ebd15e8aa66862609c6cfe1b6/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1033 01:10:08.560 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1017 10:15:57.560 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1002 18:09:22.560 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1001 02:55:06.560 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 996 04:38:00.560  | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 933 02:05:42.560  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 932 18:57:21.560  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 920 02:28:37.560  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 912 14:08:03.560  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 868 18:17:53.560  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 868 16:51:37.560  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 862 00:41:21.560  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 860 05:00:13.560  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 839 16:26:04.560  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 828 22:35:13.560  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 806 13:51:53.560  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 790 15:09:11.560  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 771 16:24:12.560  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 769 04:13:12.560  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 764 07:39:21.560  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/75d1cc1c339c952ebd15e8aa66862609c6cfe1b6/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                      title                                      | time_since_push |                              link                              
--------+---------------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10943 | Add Trino 371 release notes                                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/10943">link</a> 
  10953 | Add kerberos auth support to kudu connector                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/10953">link</a> 
  10940 | Upgrade kudu client to 1.15.0                                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10940">link</a> 
  10969 | Document query.max-cpu-time property                                            | NULL            | <a href="https://github.com/trinodb/trino/pull/10969">link</a> 
   9841 | Make map and array functions use IS DISTINCT semantics as appropriate           | NULL            | <a href="https://github.com/trinodb/trino/pull/9841">link</a>  
  11026 | Link to comparison operators page                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/11026">link</a> 
  10535 | Retry STS Throttling error codes in TrinoS3FileSystem                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10535">link</a> 
   9788 | Add support for OpenID connect metadata discovery mechanism                     | NULL            | <a href="https://github.com/trinodb/trino/pull/9788">link</a>  
  10997 | Make Iceberg Dynamic Filter test more resilient                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10997">link</a> 
  11018 | Fix wrong row values in column channel in tpcds queries q05, q14, q49, q76, q80 | NULL            | <a href="https://github.com/trinodb/trino/pull/11018">link</a> 
  11011 | Make partial aggregation adaptive                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/11011">link</a> 
  11012 | Add username and password section                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/11012">link</a> 
  10264 | Optimize null checking in DictionaryBlock                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/10264">link</a> 
  10894 | Add Iceberg MinIO Datalake integration tests                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10894">link</a> 
  11017 | Do not use combine-hash with 0 first arg                                        | NULL            | <a href="https://github.com/trinodb/trino/pull/11017">link</a> 
  11014 | Support GET method on user info endpoint (oauth)                                | NULL            | <a href="https://github.com/trinodb/trino/pull/11014">link</a> 
  10706 | Row wise group by on fixed width types                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10706">link</a> 
  10622 | Enable failure recovery for Iceberg connector                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10622">link</a> 
  10895 | Skip non impacted product tests                                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10895">link</a> 
  11005 | Add support to load cluster config in Alluxio                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/11005">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/75d1cc1c339c952ebd15e8aa66862609c6cfe1b6/sql/pr/abandoned-prs.sql)

Generated on Thu Feb 24 10:58:33 UTC 2022

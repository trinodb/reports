Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 888 21:24:25.107 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 764 10:16:52.107 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 744 16:50:38.107 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 568 14:39:37.107 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 562 18:09:28.107 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 514 12:59:39.107 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 511 23:39:10.107 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 508 23:19:42.107 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 477 21:31:37.107 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 426 10:12:33.107 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 285 12:53:55.107 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 229 08:18:11.107 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 161 10:35:37.107 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 161 10:35:34.107 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 161 01:58:52.107 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 128 11:25:04.107 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 128 11:25:04.107 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 128 11:25:04.107 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 128 11:25:04.107 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 128 11:25:04.107 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/1ab95ecf8019ffa4b2c7d26db291a503c7d65d83/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/1ab95ecf8019ffa4b2c7d26db291a503c7d65d83/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1053 20:44:26.900 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1038 05:50:15.900 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1023 13:43:40.900 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1021 22:29:24.900 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1017 00:12:18.900 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 953 21:40:00.900  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 953 14:31:39.900  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 940 22:02:55.900  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 933 09:42:21.900  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 889 13:52:11.900  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 889 12:25:55.900  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 882 20:15:39.900  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 881 00:34:31.900  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 860 12:00:22.900  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 849 18:09:31.900  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 827 09:26:11.900  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 811 10:43:29.900  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 792 11:58:30.900  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 789 23:47:30.900  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 785 03:13:39.900  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/1ab95ecf8019ffa4b2c7d26db291a503c7d65d83/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                       title                                        | time_since_push |                              link                              
--------+------------------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10801 | Replace deprecated driver ru.yandex.clickhouse.ClickHouseDriver                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10801">link</a> 
  10749 | Fix incorrect date handling in Phoenix 4 &amp; 5                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/10749">link</a> 
  10856 | Correct decoding for Trino UUID partition key value                                | NULL            | <a href="https://github.com/trinodb/trino/pull/10856">link</a> 
  10854 | [WIP] Add comments at column level for views                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/10854">link</a> 
   7994 | ConnectorExpression pushdown                                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/7994">link</a>  
   9868 | Allow ValueSet expansion into a discrete set for Bloom filtering                   | NULL            | <a href="https://github.com/trinodb/trino/pull/9868">link</a>  
  10460 | Fix inserting into transactional table when task_writer_count &gt; 1 (v2)             | NULL            | <a href="https://github.com/trinodb/trino/pull/10460">link</a> 
  10452 | Migrate DataTypeTest to SqlDataTypeTest in Phoenix                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10452">link</a> 
  10456 | Migrate DataTypeTest to SqlDataTypeTest in MySQL                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10456">link</a> 
  10459 | Fix iceberg connector bug not returning external location with `show create table` | NULL            | <a href="https://github.com/trinodb/trino/pull/10459">link</a> 
  10441 | Disallow querying iceberg tables in hive                                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10441">link</a> 
  10447 | Disallow querying delta lake properties table                                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10447">link</a> 
   9628 | Remove TableLayout from TPCDS connector                                            | NULL            | <a href="https://github.com/trinodb/trino/pull/9628">link</a>  
  10461 | Correct log retention properties                                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10461">link</a> 
  10433 | Add Trino 368 release notes                                                        | NULL            | <a href="https://github.com/trinodb/trino/pull/10433">link</a> 
  10411 | Document atop connector                                                            | NULL            | <a href="https://github.com/trinodb/trino/pull/10411">link</a> 
  10445 | Add Java 17 as not supported                                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/10445">link</a> 
   9788 | Add support for OpenID connect metadata discovery mechanism                        | NULL            | <a href="https://github.com/trinodb/trino/pull/9788">link</a>  
  10858 | Do not require registration of handle classes                                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10858">link</a> 
  10859 | Cleanup property management                                                        | NULL            | <a href="https://github.com/trinodb/trino/pull/10859">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/1ab95ecf8019ffa4b2c7d26db291a503c7d65d83/sql/pr/abandoned-prs.sql)

Generated on Thu Mar 17 06:32:55 UTC 2022

Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 890 09:23:44.954 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 765 22:16:11.954 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 746 04:49:57.954 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 570 02:38:56.954 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 564 06:08:47.954 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 516 00:58:58.954 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 513 11:38:29.954 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 510 11:19:01.954 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 479 09:30:56.954 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 427 22:11:52.954 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 287 00:53:14.954 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 230 20:17:30.954 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 162 22:34:56.954 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 162 22:34:53.954 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 162 13:58:11.954 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 129 23:24:23.954 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 129 23:24:23.954 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 129 23:24:23.954 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 129 23:24:23.954 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 129 23:24:23.954 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/559f822ac254c334e7986f29586d08ca3ef8b3c2/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/559f822ac254c334e7986f29586d08ca3ef8b3c2/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1055 08:43:53.720 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1039 17:49:42.720 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1025 01:43:07.720 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1023 10:28:51.720 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1018 12:11:45.720 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 955 09:39:27.720  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 955 02:31:06.720  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 942 10:02:22.720  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 934 21:41:48.720  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 891 01:51:38.720  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 891 00:25:22.720  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 884 08:15:06.720  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 882 12:33:58.720  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 861 23:59:49.720  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 851 06:08:58.720  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 828 21:25:38.720  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 812 22:42:56.720  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 793 23:57:57.720  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 791 11:46:57.720  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 786 15:13:06.720  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/559f822ac254c334e7986f29586d08ca3ef8b3c2/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                       title                                        | time_since_push |                              link                              
--------+------------------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
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
  10376 | [WIP] Implement exchange spooling                                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/10376">link</a> 
  10437 | Add more tests for column masking                                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/10437">link</a> 
  10343 | Use correct configuration property for orc bloom filter                            | NULL            | <a href="https://github.com/trinodb/trino/pull/10343">link</a> 
  10391 | Enable TRUNCATE TABLE for Hive Connector                                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10391">link</a> 
  10412 | 10007 test row filtering on null column                                            | NULL            | <a href="https://github.com/trinodb/trino/pull/10412">link</a> 
  10403 | Allow access to Postgres partitioned tables                                        | NULL            | <a href="https://github.com/trinodb/trino/pull/10403">link</a> 
  10455 | Enable prioritize-utilization by default                                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10455">link</a> 
   9868 | Allow ValueSet expansion into a discrete set for Bloom filtering                   | NULL            | <a href="https://github.com/trinodb/trino/pull/9868">link</a>  
  10460 | Fix inserting into transactional table when task_writer_count &gt; 1 (v2)             | NULL            | <a href="https://github.com/trinodb/trino/pull/10460">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/559f822ac254c334e7986f29586d08ca3ef8b3c2/sql/pr/abandoned-prs.sql)

Generated on Fri Mar 18 18:32:28 UTC 2022

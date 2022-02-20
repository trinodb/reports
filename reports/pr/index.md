Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 864 09:16:25.191 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 739 22:08:52.191 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 720 04:42:38.191 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 544 02:31:37.191 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 538 06:01:28.191 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 490 00:51:39.191 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 487 11:31:10.191 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 484 11:11:42.191 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 453 09:23:37.191 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 401 22:04:33.191 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 261 00:45:55.191 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 204 20:10:11.191 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 136 22:27:37.191 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 136 22:27:34.191 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 136 13:50:52.191 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 103 23:17:04.191 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 103 23:17:04.191 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 103 23:17:04.191 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 103 23:17:04.191 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 103 23:17:04.191 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/caf597de8507691a6bbec493a2f78fe107ac9af3/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/caf597de8507691a6bbec493a2f78fe107ac9af3/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1029 08:36:26.030 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1013 17:42:15.030 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 999 01:35:40.030  | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 997 10:21:24.030  | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 992 12:04:18.030  | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 929 09:32:00.030  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 929 02:23:39.030  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 916 09:54:55.030  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 908 21:34:21.030  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 865 01:44:11.030  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 865 00:17:55.030  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 858 08:07:39.030  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 856 12:26:31.030  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 835 23:52:22.030  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 825 06:01:31.030  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 802 21:18:11.030  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 786 22:35:29.030  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 767 23:50:30.030  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 765 11:39:30.030  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 760 15:05:39.030  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/caf597de8507691a6bbec493a2f78fe107ac9af3/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                   title                                   | time_since_push |                              link                              
--------+---------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10923 | Set transactions idle when query completes                                | NULL            | <a href="https://github.com/trinodb/trino/pull/10923">link</a> 
  10524 | Upgrade okhttp to 4.9.3                                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10524">link</a> 
  10810 | Vacuum for Iceberg together with coordinator only execute                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10810">link</a> 
  10937 | Fix typo in `hideInaccesibleColumns`                                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10937">link</a> 
  10939 | Authorize table parameters in CTAS and remove deprecated check methods    | NULL            | <a href="https://github.com/trinodb/trino/pull/10939">link</a> 
  10815 | Deny DML commands on Hive bucketed tables created by Spark                | NULL            | <a href="https://github.com/trinodb/trino/pull/10815">link</a> 
  10837 | Handle split weights in SourceDistributionTaskSource                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10837">link</a> 
  10790 | Document OPTIMIZE for Iceberg                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/10790">link</a> 
  10844 | Fix Iceberg metadata listing failure when materialized view dropped       | NULL            | <a href="https://github.com/trinodb/trino/pull/10844">link</a> 
  10931 | Extract caches implementation for use in client                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10931">link</a> 
  10845 | Support Glue catalog in Iceberg connector                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10845">link</a> 
  10934 | Add PR label based conditional CI tests execution                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10934">link</a> 
  10888 | Make token-cache host aware                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/10888">link</a> 
  10892 | Estimate BETWEEN when the value is an expression                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10892">link</a> 
  10323 | Make CI only build/test modules with any changes                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10323">link</a> 
  10843 | Use airlift json codec in http event listener, fixing airlift/airlift#983 | NULL            | <a href="https://github.com/trinodb/trino/pull/10843">link</a> 
  10378 | Add function management abstractions                                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10378">link</a> 
  10779 | Add hive iceberg support based on Trino created iceberg table.            | NULL            | <a href="https://github.com/trinodb/trino/pull/10779">link</a> 
  10823 | Implement exchange spooling                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/10823">link</a> 
  10387 | Add Snowflake JDBC Connector                                              | NULL            | <a href="https://github.com/trinodb/trino/pull/10387">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/caf597de8507691a6bbec493a2f78fe107ac9af3/sql/pr/abandoned-prs.sql)

Generated on Sun Feb 20 18:24:51 UTC 2022

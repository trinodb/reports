Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 895 21:22:23.585 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 771 10:14:50.585 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 751 16:48:36.585 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 575 14:37:35.585 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 569 18:07:26.585 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 521 12:57:37.585 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 518 23:37:08.585 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 515 23:17:40.585 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 484 21:29:35.585 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 433 10:10:31.585 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 292 12:51:53.585 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 236 08:16:09.585 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 168 10:33:35.585 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 168 10:33:32.585 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 168 01:56:50.585 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 135 11:23:02.585 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9789 | allow push down join on redshift                                     | 135 11:23:02.585 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 135 11:23:02.585 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 135 11:23:02.585 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 135 11:23:02.585 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/6bb28fabaa17ae4a61d27ecd608a4d782d154a40/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/6bb28fabaa17ae4a61d27ecd608a4d782d154a40/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1060 20:42:31.584 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1045 05:48:20.584 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1030 13:41:45.584 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1028 22:27:29.584 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1024 00:10:23.584 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 960 21:38:05.584  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 960 14:29:44.584  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 947 22:01:00.584  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 940 09:40:26.584  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 896 13:50:16.584  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 896 12:24:00.584  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 889 20:13:44.584  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 888 00:32:36.584  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 867 11:58:27.584  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 856 18:07:36.584  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 834 09:24:16.584  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 818 10:41:34.584  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 799 11:56:35.584  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 796 23:45:35.584  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 792 03:11:44.584  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/6bb28fabaa17ae4a61d27ecd608a4d782d154a40/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                title                                 | time_since_push |                              link                              
--------+----------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10979 | Delay removal of containers during Docker image tests                | NULL            | <a href="https://github.com/trinodb/trino/pull/10979">link</a> 
  10586 | Add primary key to selectors table                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10586">link</a> 
  10046 | Add MariaDB connector                                                | NULL            | <a href="https://github.com/trinodb/trino/pull/10046">link</a> 
  10973 | #7656 Link format_datetime function in list.rst to actual docs       | NULL            | <a href="https://github.com/trinodb/trino/pull/10973">link</a> 
  11014 | Support GET method on user info endpoint (oauth)                     | NULL            | <a href="https://github.com/trinodb/trino/pull/11014">link</a> 
  10969 | Document query.max-cpu-time property                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10969">link</a> 
  10940 | Upgrade kudu client to 1.15.0                                        | NULL            | <a href="https://github.com/trinodb/trino/pull/10940">link</a> 
  10810 | Vacuum for Iceberg together with coordinator-only execute            | NULL            | <a href="https://github.com/trinodb/trino/pull/10810">link</a> 
  11354 | Use assignments instead of variable name in Elasticsearch            | NULL            | <a href="https://github.com/trinodb/trino/pull/11354">link</a> 
  11011 | Make partial aggregation adaptive                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/11011">link</a> 
  11353 | Enable aggregation spill only when all aggregations are spillable    | NULL            | <a href="https://github.com/trinodb/trino/pull/11353">link</a> 
  11086 | OR expression pushdown                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/11086">link</a> 
  11290 | Add Trino 373 release notes                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/11290">link</a> 
  11342 | Optimize array_distinct(array_agg(…))                                | NULL            | <a href="https://github.com/trinodb/trino/pull/11342">link</a> 
   8925 | Minor improvements to DictionaryBlock                                | NULL            | <a href="https://github.com/trinodb/trino/pull/8925">link</a>  
   8880 | Add Doc Example test cases for FileBasedSystemAccessControl          | NULL            | <a href="https://github.com/trinodb/trino/pull/8880">link</a>  
   8840 | Implement array_average function                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/8840">link</a>  
   8749 | Correct getRetainedBytes() in SliceDictionaryColumnWriter            | NULL            | <a href="https://github.com/trinodb/trino/pull/8749">link</a>  
   9781 | Fix Handling of Aggregation Expressions in Pinot Passthrough Queries | NULL            | <a href="https://github.com/trinodb/trino/pull/9781">link</a>  
   9965 | Improve performance/memory overhead for Spatial Join                 | NULL            | <a href="https://github.com/trinodb/trino/pull/9965">link</a>  
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/6bb28fabaa17ae4a61d27ecd608a4d782d154a40/sql/pr/abandoned-prs.sql)

Generated on Thu Mar 24 06:31:05 UTC 2022

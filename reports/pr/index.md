Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 904 21:26:53.253 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 780 10:19:20.253 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 760 16:53:06.253 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 584 14:42:05.253 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 578 18:11:56.253 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 530 13:02:07.253 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 527 23:41:38.253 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 524 23:22:10.253 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 493 21:34:05.253 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 442 10:15:01.253 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 301 12:56:23.253 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 245 08:20:39.253 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 177 10:38:05.253 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 177 10:38:02.253 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 177 02:01:20.253 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 144 11:27:32.253 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 144 11:27:32.253 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 144 11:27:32.253 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9789 | allow push down join on redshift                                     | 144 11:27:32.253 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 144 11:27:32.253 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/7da72e2a6aaca6755ea61fd63273098ce2ba7171/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/7da72e2a6aaca6755ea61fd63273098ce2ba7171/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1069 20:47:00.508 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1054 05:52:49.508 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1039 13:46:14.508 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1037 22:31:58.508 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1033 00:14:52.508 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 969 21:42:34.508  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 969 14:34:13.508  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 956 22:05:29.508  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 949 09:44:55.508  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 905 13:54:45.508  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 905 12:28:29.508  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 898 20:18:13.508  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 897 00:37:05.508  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 876 12:02:56.508  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 865 18:12:05.508  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 843 09:28:45.508  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 827 10:46:03.508  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 808 12:01:04.508  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 805 23:50:04.508  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 801 03:16:13.508  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/7da72e2a6aaca6755ea61fd63273098ce2ba7171/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                     title                                     | time_since_push |                              link                              
--------+-------------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  11238 | Add trim_array function                                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/11238">link</a> 
  10845 | Support Glue catalog in Iceberg connector                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/10845">link</a> 
  11232 | Cleanup documentation for views and materialized views                        | NULL            | <a href="https://github.com/trinodb/trino/pull/11232">link</a> 
  11094 | Add Trino 372 release notes                                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/11094">link</a> 
  11198 | Add missing query transition to RUNNING state with task-level retries         | NULL            | <a href="https://github.com/trinodb/trino/pull/11198">link</a> 
  11241 | Add null handling for contains_nan field in partition summaries               | NULL            | <a href="https://github.com/trinodb/trino/pull/11241">link</a> 
  11185 | Remove usage of static test classes in kuduconnectortests                     | NULL            | <a href="https://github.com/trinodb/trino/pull/11185">link</a> 
  10432 | Allow assigning exclusive node for task execution                             | NULL            | <a href="https://github.com/trinodb/trino/pull/10432">link</a> 
   8523 | Add support for dynamic filters in jdbc client                                | NULL            | <a href="https://github.com/trinodb/trino/pull/8523">link</a>  
   8532 | Implement getSystemMemoryUsage in GenericHiveRecordCursor                     | NULL            | <a href="https://github.com/trinodb/trino/pull/8532">link</a>  
   8534 | Iceberg: support Parquet read with delete filter                              | NULL            | <a href="https://github.com/trinodb/trino/pull/8534">link</a>  
   8557 | Fix the result structure of DescribeInputRewrite and DescribeOutputRewrite    | NULL            | <a href="https://github.com/trinodb/trino/pull/8557">link</a>  
   8558 | Allow testing OAuth with a remote Docker daemon                               | NULL            | <a href="https://github.com/trinodb/trino/pull/8558">link</a>  
   8632 | Mark TestHiveStorageFormats:: testTimestampCreatedFromTrino as flaky          | NULL            | <a href="https://github.com/trinodb/trino/pull/8632">link</a>  
   8642 | Add remainder function                                                        | NULL            | <a href="https://github.com/trinodb/trino/pull/8642">link</a>  
   8826 | Add Hive query runner with HDP docker container                               | NULL            | <a href="https://github.com/trinodb/trino/pull/8826">link</a>  
   4727 | WIP: Try upgrading to TestNG 7.3.0                                            | NULL            | <a href="https://github.com/trinodb/trino/pull/4727">link</a>  
   5101 | avro.schema.literal support and some related patches                          | NULL            | <a href="https://github.com/trinodb/trino/pull/5101">link</a>  
  11066 | Improve CBO estimates for certain scenarios                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/11066">link</a> 
  11250 | Migrate Oracle and MemSQL to BaseCaseInsensitiveMappingTest and some cleanups | NULL            | <a href="https://github.com/trinodb/trino/pull/11250">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/7da72e2a6aaca6755ea61fd63273098ce2ba7171/sql/pr/abandoned-prs.sql)

Generated on Sat Apr  2 06:35:32 UTC 2022

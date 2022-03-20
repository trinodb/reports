Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 892 09:24:53.066 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 767 22:17:20.066 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 748 04:51:06.066 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 572 02:40:05.066 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 566 06:09:56.066 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 518 01:00:07.066 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 515 11:39:38.066 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 512 11:20:10.066 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 481 09:32:05.066 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 429 22:13:01.066 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 289 00:54:23.066 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 232 20:18:39.066 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 164 22:36:05.066 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 164 22:36:02.066 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 164 13:59:20.066 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 131 23:25:32.066 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 131 23:25:32.066 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 131 23:25:32.066 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 131 23:25:32.066 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 131 23:25:32.066 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/c90ea54cc362318568a967b891019184ee7fdd4d/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/c90ea54cc362318568a967b891019184ee7fdd4d/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1057 08:44:56.703 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1041 17:50:45.703 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1027 01:44:10.703 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1025 10:29:54.703 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1020 12:12:48.703 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 957 09:40:30.703  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 957 02:32:09.703  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 944 10:03:25.703  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 936 21:42:51.703  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 893 01:52:41.703  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 893 00:26:25.703  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 886 08:16:09.703  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 884 12:35:01.703  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 864 00:00:52.703  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 853 06:10:01.703  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 830 21:26:41.703  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 814 22:43:59.703  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 795 23:59:00.703  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 793 11:48:00.703  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 788 15:14:09.703  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/c90ea54cc362318568a967b891019184ee7fdd4d/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                     title                                     | time_since_push |                              link                              
--------+-------------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10790 | Document OPTIMIZE for Iceberg                                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10790">link</a> 
  11037 | Improve negative date tests                                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/11037">link</a> 
  11062 | Delete Iceberg table data on DROP                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/11062">link</a> 
  10845 | Support Glue catalog in Iceberg connector                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/10845">link</a> 
  10897 | Add Delta Lake connector                                                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10897">link</a> 
  11265 | Skip certain table properties when doing create table (like including…        | NULL            | <a href="https://github.com/trinodb/trino/pull/11265">link</a> 
  11174 | Implement parallel read from S3 for exchange storage                          | NULL            | <a href="https://github.com/trinodb/trino/pull/11174">link</a> 
  11129 | Support for killing individual task if cluster is out of memory               | NULL            | <a href="https://github.com/trinodb/trino/pull/11129">link</a> 
  11198 | Add missing query transition to RUNNING state with task-level retries         | NULL            | <a href="https://github.com/trinodb/trino/pull/11198">link</a> 
  11094 | Add Trino 372 release notes                                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/11094">link</a> 
  11258 | Document hash partition count property                                        | NULL            | <a href="https://github.com/trinodb/trino/pull/11258">link</a> 
  11066 | Improve CBO estimates for certain scenarios                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/11066">link</a> 
  11250 | Migrate Oracle and MemSQL to BaseCaseInsensitiveMappingTest and some cleanups | NULL            | <a href="https://github.com/trinodb/trino/pull/11250">link</a> 
  10844 | Fix Iceberg metadata listing failure when materialized view dropped           | NULL            | <a href="https://github.com/trinodb/trino/pull/10844">link</a> 
  11259 | TRY should handle invalid value error in cast VACHAR as TIMESTAMP             | NULL            | <a href="https://github.com/trinodb/trino/pull/11259">link</a> 
  11414 | Add missing release notes entry for 373                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/11414">link</a> 
  11398 | Retained block size improvements                                              | NULL            | <a href="https://github.com/trinodb/trino/pull/11398">link</a> 
  11405 | Allow starting Elasticsearch container with VM options in query runner        | NULL            | <a href="https://github.com/trinodb/trino/pull/11405">link</a> 
  10432 | Allow assigning exclusive node for task execution                             | NULL            | <a href="https://github.com/trinodb/trino/pull/10432">link</a> 
  10843 | Use airlift json codec in http event listener, fixing airlift/airlift#983     | NULL            | <a href="https://github.com/trinodb/trino/pull/10843">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/c90ea54cc362318568a967b891019184ee7fdd4d/sql/pr/abandoned-prs.sql)

Generated on Sun Mar 20 18:33:25 UTC 2022

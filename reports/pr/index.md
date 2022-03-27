Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 898 21:23:42.303 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 774 10:16:09.303 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 754 16:49:55.303 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 578 14:38:54.303 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 572 18:08:45.303 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 524 12:58:56.303 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 521 23:38:27.303 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 518 23:18:59.303 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 487 21:30:54.303 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 436 10:11:50.303 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 295 12:53:12.303 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 239 08:17:28.303 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 171 10:34:54.303 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 171 10:34:51.303 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 171 01:58:09.303 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 138 11:24:21.303 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 138 11:24:21.303 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 138 11:24:21.303 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 138 11:24:21.303 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 138 11:24:21.303 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/3d65f1938ad6bd218a2eb664dc39616805d3b064/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/3d65f1938ad6bd218a2eb664dc39616805d3b064/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1063 20:43:53.033 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1048 05:49:42.033 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1033 13:43:07.033 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1031 22:28:51.033 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1027 00:11:45.033 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 963 21:39:27.033  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 963 14:31:06.033  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 950 22:02:22.033  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 943 09:41:48.033  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 899 13:51:38.033  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 899 12:25:22.033  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 892 20:15:06.033  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 891 00:33:58.033  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 870 11:59:49.033  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 859 18:08:58.033  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 837 09:25:38.033  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 821 10:42:56.033  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 802 11:57:57.033  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 799 23:46:57.033  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 795 03:13:06.033  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/3d65f1938ad6bd218a2eb664dc39616805d3b064/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                          title                                          | time_since_push |                              link                              
--------+-----------------------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  11301 | Update memsql plugin JDBC driver dependency                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/11301">link</a> 
  11321 | Add redirection awareness in retrieving the KDB index table in extracting spatial joins | NULL            | <a href="https://github.com/trinodb/trino/pull/11321">link</a> 
  11308 | Add support for LIKE escape parameter in Elasticsearch connector expression pushdown    | NULL            | <a href="https://github.com/trinodb/trino/pull/11308">link</a> 
   9893 | Derive more precise types for EXTRACT                                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/9893">link</a>  
   3602 | Add editing-mode option to CLI                                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/3602">link</a>  
   9482 | Simplify Hive metastore creation and use                                                | NULL            | <a href="https://github.com/trinodb/trino/pull/9482">link</a>  
  10823 | Implement exchange spooling                                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/10823">link</a> 
  11066 | Improve CBO estimates for certain scenarios                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/11066">link</a> 
  11532 | Push down NULLIF in PostgreSQL connector                                                | NULL            | <a href="https://github.com/trinodb/trino/pull/11532">link</a> 
  10166 | Implement flushing for partial TopNOperator                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/10166">link</a> 
  11423 | Support renaming table in MongoDB                                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/11423">link</a> 
  11405 | Allow starting Elasticsearch container with VM options in query runner                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11405">link</a> 
  11528 | Add Trino 375 release notes                                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/11528">link</a> 
  11514 | Push down NOT, IS NULL, NOT IS NULL in PostgreSQL connector                             | NULL            | <a href="https://github.com/trinodb/trino/pull/11514">link</a> 
  11287 | Add client and source tags to resource group documentation                              | NULL            | <a href="https://github.com/trinodb/trino/pull/11287">link</a> 
  11265 | Skip certain table properties when doing create table (like including…                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11265">link</a> 
  11521 | Remove server RPM                                                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/11521">link</a> 
  11522 | Translate CAST to connector expression                                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11522">link</a> 
  11333 | Improve estimation of row count from partition samples                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11333">link</a> 
  11129 | Support for killing individual task if cluster is out of memory                         | NULL            | <a href="https://github.com/trinodb/trino/pull/11129">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/3d65f1938ad6bd218a2eb664dc39616805d3b064/sql/pr/abandoned-prs.sql)

Generated on Sun Mar 27 06:32:29 UTC 2022

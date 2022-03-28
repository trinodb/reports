Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 900 09:25:15.382 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 775 22:17:42.382 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 756 04:51:28.382 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 580 02:40:27.382 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 574 06:10:18.382 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 526 01:00:29.382 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 523 11:40:00.382 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 520 11:20:32.382 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 489 09:32:27.382 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 437 22:13:23.382 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 297 00:54:45.382 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 240 20:19:01.382 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 172 22:36:27.382 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 172 22:36:24.382 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 172 13:59:42.382 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 139 23:25:54.382 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 139 23:25:54.382 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 139 23:25:54.382 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 139 23:25:54.382 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 139 23:25:54.382 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/7afef59f0c15c4c1a07c936d0429c1785bd57539/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/7afef59f0c15c4c1a07c936d0429c1785bd57539/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1065 08:45:22.130 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1049 17:51:11.130 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1035 01:44:36.130 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1033 10:30:20.130 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1028 12:13:14.130 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 965 09:40:56.130  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 965 02:32:35.130  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 952 10:03:51.130  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 944 21:43:17.130  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 901 01:53:07.130  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 901 00:26:51.130  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 894 08:16:35.130  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 892 12:35:27.130  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 872 00:01:18.130  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 861 06:10:27.130  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 838 21:27:07.130  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 822 22:44:25.130  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 803 23:59:26.130  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 801 11:48:26.130  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 796 15:14:35.130  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/7afef59f0c15c4c1a07c936d0429c1785bd57539/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                           title                                            | time_since_push |                              link                              
--------+--------------------------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10954 | Avoid reflection and services lookup for JWT processing                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10954">link</a> 
  11414 | Add missing release notes entry for 373                                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/11414">link</a> 
  11398 | Retained block size improvements                                                           | NULL            | <a href="https://github.com/trinodb/trino/pull/11398">link</a> 
  11405 | Allow starting Elasticsearch container with VM options in query runner                     | NULL            | <a href="https://github.com/trinodb/trino/pull/11405">link</a> 
  11265 | Skip certain table properties when doing create table (like including…                     | NULL            | <a href="https://github.com/trinodb/trino/pull/11265">link</a> 
  11409 | Support creating and dropping schema in MongoDB                                            | NULL            | <a href="https://github.com/trinodb/trino/pull/11409">link</a> 
  11406 | Use Sphinx default width in documentation                                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11406">link</a> 
  11301 | Update memsql plugin JDBC driver dependency                                                | NULL            | <a href="https://github.com/trinodb/trino/pull/11301">link</a> 
  11370 | [WIP] Stress test OAuth2                                                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/11370">link</a> 
  11083 | Fix expression predicate pushdown not firing before AddExchanges                           | NULL            | <a href="https://github.com/trinodb/trino/pull/11083">link</a> 
  10810 | Expire Snapshot and Remove Orphan files for Iceberg together with coordinator-only execute | NULL            | <a href="https://github.com/trinodb/trino/pull/10810">link</a> 
  11359 | Add support for COMMENT ON VIEW statement                                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11359">link</a> 
  11358 | Cache accumulator factory                                                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11358">link</a> 
  10228 | Add Hudi connector                                                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10228">link</a> 
  10823 | Implement exchange spooling                                                                | NULL            | <a href="https://github.com/trinodb/trino/pull/10823">link</a> 
  10387 | Add Snowflake JDBC Connector                                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/10387">link</a> 
  10876 | Disable ClickHouse smoke tests temporarily                                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10876">link</a> 
  10872 | Remove unnecessary explicit handle declaration                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/10872">link</a> 
  10956 | Add product tests for clickhouse clusters                                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/10956">link</a> 
  10957 | Respect target-max-file-size in Iceberg                                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10957">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/7afef59f0c15c4c1a07c936d0429c1785bd57539/sql/pr/abandoned-prs.sql)

Generated on Mon Mar 28 18:33:54 UTC 2022

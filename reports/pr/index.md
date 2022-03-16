Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 887 21:24:04.770 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 763 10:16:31.770 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 743 16:50:17.770 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 567 14:39:16.770 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 561 18:09:07.770 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 513 12:59:18.770 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 510 23:38:49.770 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 507 23:19:21.770 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 476 21:31:16.770 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 425 10:12:12.770 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 284 12:53:34.770 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 228 08:17:50.770 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 160 10:35:16.770 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 160 10:35:13.770 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 160 01:58:31.770 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 127 11:24:43.770 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 127 11:24:43.770 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 127 11:24:43.770 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9789 | allow push down join on redshift                                     | 127 11:24:43.770 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 127 11:24:43.770 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/2673533b66efa4841c12b13e9fa35b480ed7be12/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/2673533b66efa4841c12b13e9fa35b480ed7be12/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1052 20:44:08.263 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1037 05:49:57.263 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1022 13:43:22.263 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1020 22:29:06.263 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1016 00:12:00.263 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 952 21:39:42.263  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 952 14:31:21.263  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 939 22:02:37.263  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 932 09:42:03.263  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 888 13:51:53.263  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 888 12:25:37.263  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 881 20:15:21.263  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 880 00:34:13.263  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 859 12:00:04.263  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 848 18:09:13.263  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 826 09:25:53.263  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 810 10:43:11.263  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 791 11:58:12.263  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 788 23:47:12.263  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 784 03:13:21.263  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/2673533b66efa4841c12b13e9fa35b480ed7be12/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                title                                 | time_since_push |                              link                              
--------+----------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10898 | Update SQL Server JDBC driver to 10.2.0                              | NULL            | <a href="https://github.com/trinodb/trino/pull/10898">link</a> 
  10411 | Document atop connector                                              | NULL            | <a href="https://github.com/trinodb/trino/pull/10411">link</a> 
  10831 | Document existing Hive properties                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10831">link</a> 
  10894 | Add Iceberg MinIO Datalake integration tests                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10894">link</a> 
  10953 | Add kerberos auth support to kudu connector                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10953">link</a> 
  10817 | Document hive storage table properties                               | NULL            | <a href="https://github.com/trinodb/trino/pull/10817">link</a> 
  10968 | Leave only single startOAuth2Challenge method in OAuth2Service class | NULL            | <a href="https://github.com/trinodb/trino/pull/10968">link</a> 
  10969 | Document query.max-cpu-time property                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10969">link</a> 
  10943 | Add Trino 371 release notes                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10943">link</a> 
  10900 | Use Dockerized LDAP server for LdapAuthenticator UTs                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10900">link</a> 
  11290 | Add Trino 373 release notes                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/11290">link</a> 
  11211 | Add table comments interface in base JDBC and implement in MySQL     | NULL            | <a href="https://github.com/trinodb/trino/pull/11211">link</a> 
  11351 | Deny wrong null replacement of array type in Phoenix connector       | NULL            | <a href="https://github.com/trinodb/trino/pull/11351">link</a> 
  11236 | Add support for ANSI SQL syntax in trim function                     | NULL            | <a href="https://github.com/trinodb/trino/pull/11236">link</a> 
  11264 | Gn/fix kudu schemas table race                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/11264">link</a> 
  11187 | Add CLI options table                                                | NULL            | <a href="https://github.com/trinodb/trino/pull/11187">link</a> 
  11011 | Make partial aggregation adaptive                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/11011">link</a> 
  11235 | Allocate new Slice for VariableWidthBlockEncoding readBlock          | NULL            | <a href="https://github.com/trinodb/trino/pull/11235">link</a> 
   9781 | Fix Handling of Aggregation Expressions in Pinot Passthrough Queries | NULL            | <a href="https://github.com/trinodb/trino/pull/9781">link</a>  
  10942 | Implement maxDriversPerQuery                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10942">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/2673533b66efa4841c12b13e9fa35b480ed7be12/sql/pr/abandoned-prs.sql)

Generated on Wed Mar 16 06:32:36 UTC 2022

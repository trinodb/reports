Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 901 09:26:49.821 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 776 22:19:16.821 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 757 04:53:02.821 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 581 02:42:01.821 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 575 06:11:52.821 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 527 01:02:03.821 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 524 11:41:34.821 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 521 11:22:06.821 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 490 09:34:01.821 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 438 22:14:57.821 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 298 00:56:19.821 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 241 20:20:35.821 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 173 22:38:01.821 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 173 22:37:58.821 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 173 14:01:16.821 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 140 23:27:28.821 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 140 23:27:28.821 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 140 23:27:28.821 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 140 23:27:28.821 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 140 23:27:28.821 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/b07d2cb03e2bfdbbe589886de4c62d02a943afef/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/b07d2cb03e2bfdbbe589886de4c62d02a943afef/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1066 08:46:56.747 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1050 17:52:45.747 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1036 01:46:10.747 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1034 10:31:54.747 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1029 12:14:48.747 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 966 09:42:30.747  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 966 02:34:09.747  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 953 10:05:25.747  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 945 21:44:51.747  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 902 01:54:41.747  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 902 00:28:25.747  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 895 08:18:09.747  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 893 12:37:01.747  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 873 00:02:52.747  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 862 06:12:01.747  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 839 21:28:41.747  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 823 22:45:59.747  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 805 00:01:00.747  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 802 11:50:00.747  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 797 15:16:09.747  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/b07d2cb03e2bfdbbe589886de4c62d02a943afef/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                 title                                 | time_since_push |                              link                              
--------+-----------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10393 | trino-postgresql add Array                                            | NULL            | <a href="https://github.com/trinodb/trino/pull/10393">link</a> 
  10894 | Add Iceberg MinIO Datalake integration tests                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10894">link</a> 
  10943 | Add Trino 371 release notes                                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10943">link</a> 
  10411 | Document atop connector                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/10411">link</a> 
  10940 | Upgrade kudu client to 1.15.0                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10940">link</a> 
  10942 | Implement maxDriversPerQuery                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10942">link</a> 
  10922 | Small improvements to spooling exchange and documentation             | NULL            | <a href="https://github.com/trinodb/trino/pull/10922">link</a> 
  10831 | Document existing Hive properties                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/10831">link</a> 
  10817 | Document hive storage table properties                                | NULL            | <a href="https://github.com/trinodb/trino/pull/10817">link</a> 
  10898 | Update SQL Server JDBC driver to 10.2.0                               | NULL            | <a href="https://github.com/trinodb/trino/pull/10898">link</a> 
  10914 | Consider user groups in db resource groups manager                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10914">link</a> 
  10935 | Fix testConcurrentSchemaCreateAndDrop flakiness                       | NULL            | <a href="https://github.com/trinodb/trino/pull/10935">link</a> 
  10900 | Use Dockerized LDAP server for LdapAuthenticator UTs                  | NULL            | <a href="https://github.com/trinodb/trino/pull/10900">link</a> 
   7994 | ConnectorExpression pushdown                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/7994">link</a>  
   9965 | Improve performance/memory overhead for Spatial Join                  | NULL            | <a href="https://github.com/trinodb/trino/pull/9965">link</a>  
   9841 | Make map and array functions use IS DISTINCT semantics as appropriate | NULL            | <a href="https://github.com/trinodb/trino/pull/9841">link</a>  
  10767 | Support for AWS Atena partition projection                            | NULL            | <a href="https://github.com/trinodb/trino/pull/10767">link</a> 
  10706 | Row wise group by on fixed width types                                | NULL            | <a href="https://github.com/trinodb/trino/pull/10706">link</a> 
  10912 | Use IcebergFileFormat enum for better validation                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10912">link</a> 
  10406 | Make type explicit in decimal tests                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10406">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/b07d2cb03e2bfdbbe589886de4c62d02a943afef/sql/pr/abandoned-prs.sql)

Generated on Tue Mar 29 18:35:28 UTC 2022

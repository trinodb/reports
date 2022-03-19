Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 891 09:22:31.574 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 766 22:14:58.574 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 747 04:48:44.574 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 571 02:37:43.574 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 565 06:07:34.574 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 517 00:57:45.574 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 514 11:37:16.574 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 511 11:17:48.574 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 480 09:29:43.574 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 428 22:10:39.574 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 288 00:52:01.574 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 231 20:16:17.574 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 163 22:33:43.574 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 163 22:33:40.574 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 163 13:56:58.574 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 130 23:23:10.574 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 130 23:23:10.574 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 130 23:23:10.574 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 130 23:23:10.574 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 130 23:23:10.574 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/af6e1fb0fbefd6ae8667cb47a847f70f6f039074/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/af6e1fb0fbefd6ae8667cb47a847f70f6f039074/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1056 08:42:34.319 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1040 17:48:23.319 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1026 01:41:48.319 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1024 10:27:32.319 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1019 12:10:26.319 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 956 09:38:08.319  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 956 02:29:47.319  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 943 10:01:03.319  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 935 21:40:29.319  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 892 01:50:19.319  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 892 00:24:03.319  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 885 08:13:47.319  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 883 12:32:39.319  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 862 23:58:30.319  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 852 06:07:39.319  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 829 21:24:19.319  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 813 22:41:37.319  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 794 23:56:38.319  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 792 11:45:38.319  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 787 15:11:47.319  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/af6e1fb0fbefd6ae8667cb47a847f70f6f039074/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                              title                               | time_since_push |                              link                              
--------+------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  11211 | Add table comments interface in base JDBC and implement in MySQL | NULL            | <a href="https://github.com/trinodb/trino/pull/11211">link</a> 
   7722 | Migrate BigQuery tests to use BaseConnectorTest                  | NULL            | <a href="https://github.com/trinodb/trino/pull/7722">link</a>  
   7714 | Migrate Hive tests to use BaseConnectorTest                      | NULL            | <a href="https://github.com/trinodb/trino/pull/7714">link</a>  
   7675 | Migrate Iceberg tests to use BaseConnectorTest                   | NULL            | <a href="https://github.com/trinodb/trino/pull/7675">link</a>  
   7647 | Migrate Raptor tests to use BaseConnectorTest                    | NULL            | <a href="https://github.com/trinodb/trino/pull/7647">link</a>  
   7630 | Support Mixed Case Pinot Tables                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/7630">link</a>  
   7623 | Migrate Mongo to BaseConnectorTest                               | NULL            | <a href="https://github.com/trinodb/trino/pull/7623">link</a>  
   7524 | Support metadata query optimization for UNIION ALL queries       | NULL            | <a href="https://github.com/trinodb/trino/pull/7524">link</a>  
   7392 | Replace fail+catch pattern with assertThatThrownBy in trino-main | NULL            | <a href="https://github.com/trinodb/trino/pull/7392">link</a>  
   7358 | WIP: add config for defaulting to INVOKER for hive views         | NULL            | <a href="https://github.com/trinodb/trino/pull/7358">link</a>  
   7278 | Display token on Web OAuth2 success                              | NULL            | <a href="https://github.com/trinodb/trino/pull/7278">link</a>  
   7162 | [WIP] Pinot insert                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/7162">link</a>  
   7127 | Add Kudu unit test class against latest 1.14.0                   | NULL            | <a href="https://github.com/trinodb/trino/pull/7127">link</a>  
   7074 | add kafka limit push down                                        | NULL            | <a href="https://github.com/trinodb/trino/pull/7074">link</a>  
   6829 | Add support for FreeBSD                                          | NULL            | <a href="https://github.com/trinodb/trino/pull/6829">link</a>  
   6564 | Make trino-cli available in Trino test containers                | NULL            | <a href="https://github.com/trinodb/trino/pull/6564">link</a>  
  10264 | Optimize null checking in DictionaryBlock                        | NULL            | <a href="https://github.com/trinodb/trino/pull/10264">link</a> 
  10226 | Bump Coral dependency version to 2.0.24                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10226">link</a> 
  11335 | Clean extra output files when overwriting a partition            | NULL            | <a href="https://github.com/trinodb/trino/pull/11335">link</a> 
  10965 | Aggregation improvements                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10965">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/af6e1fb0fbefd6ae8667cb47a847f70f6f039074/sql/pr/abandoned-prs.sql)

Generated on Sat Mar 19 18:31:03 UTC 2022

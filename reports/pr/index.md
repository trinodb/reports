Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 884 21:25:45.511 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 760 10:18:12.511 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 740 16:51:58.511 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 564 14:40:57.511 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 558 18:10:48.511 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 510 13:00:59.511 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 507 23:40:30.511 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 504 23:21:02.511 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 473 21:32:57.511 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 422 10:13:53.511 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 281 12:55:15.511 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 225 08:19:31.511 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 157 10:36:57.511 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 157 10:36:54.511 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 157 02:00:12.511 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 124 11:26:24.511 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 124 11:26:24.511 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 124 11:26:24.511 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9789 | allow push down join on redshift                                     | 124 11:26:24.511 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 124 11:26:24.511 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/799cdc5b74e35da50b91a311d09cfcf295dac609/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/799cdc5b74e35da50b91a311d09cfcf295dac609/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1049 20:45:46.690 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1034 05:51:35.690 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1019 13:45:00.690 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1017 22:30:44.690 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1013 00:13:38.690 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 949 21:41:20.690  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 949 14:32:59.690  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 936 22:04:15.690  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 929 09:43:41.690  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 885 13:53:31.690  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 885 12:27:15.690  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 878 20:16:59.690  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 877 00:35:51.690  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 856 12:01:42.690  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 845 18:10:51.690  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 823 09:27:31.690  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 807 10:44:49.690  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 788 11:59:50.690  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 785 23:48:50.690  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 781 03:14:59.690  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/799cdc5b74e35da50b91a311d09cfcf295dac609/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                    title                                    | time_since_push |                              link                              
--------+-----------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  11011 | Make partial aggregation adaptive                                           | NULL            | <a href="https://github.com/trinodb/trino/pull/11011">link</a> 
  11353 | Enable aggregation spill only when all aggregations are spillable           | NULL            | <a href="https://github.com/trinodb/trino/pull/11353">link</a> 
  11086 | OR expression pushdown                                                      | NULL            | <a href="https://github.com/trinodb/trino/pull/11086">link</a> 
  11290 | Add Trino 373 release notes                                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/11290">link</a> 
  11342 | Optimize array_distinct(array_agg(…))                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/11342">link</a> 
   9019 | mongodb add note for explicitly quoting fields when manually setting schema | NULL            | <a href="https://github.com/trinodb/trino/pull/9019">link</a>  
  11017 | Do not use combine-hash with 0 first arg                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/11017">link</a> 
  11029 | Expose table properties in ClickHouse                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/11029">link</a> 
  10816 | Add pull request template                                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10816">link</a> 
   7994 | ConnectorExpression pushdown                                                | NULL            | <a href="https://github.com/trinodb/trino/pull/7994">link</a>  
   9841 | Make map and array functions use IS DISTINCT semantics as appropriate       | NULL            | <a href="https://github.com/trinodb/trino/pull/9841">link</a>  
  10767 | Support for AWS Atena partition projection                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/10767">link</a> 
  10856 | Correct decoding for Trino UUID partition key value                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10856">link</a> 
  10801 | Replace deprecated driver ru.yandex.clickhouse.ClickHouseDriver             | NULL            | <a href="https://github.com/trinodb/trino/pull/10801">link</a> 
  10411 | Document atop connector                                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/10411">link</a> 
  10514 | Document special tables exposed by Iceberg                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/10514">link</a> 
  10831 | Document existing Hive properties                                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10831">link</a> 
  10802 | Gn/fix kudu tests on mac                                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10802">link</a> 
  10810 | Vacuum for Iceberg together with coordinator-only execute                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10810">link</a> 
  11354 | Use assignments instead of variable name in Elasticsearch                   | NULL            | <a href="https://github.com/trinodb/trino/pull/11354">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/799cdc5b74e35da50b91a311d09cfcf295dac609/sql/pr/abandoned-prs.sql)

Generated on Sun Mar 13 06:34:13 UTC 2022

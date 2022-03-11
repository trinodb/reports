Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 882 21:25:16.672 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 758 10:17:43.672 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 738 16:51:29.672 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 562 14:40:28.672 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 556 18:10:19.672 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 508 13:00:30.672 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 505 23:40:01.672 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 502 23:20:33.672 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 471 21:32:28.672 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 420 10:13:24.672 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 279 12:54:46.672 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 223 08:19:02.672 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 155 10:36:28.672 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 155 10:36:25.672 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 155 01:59:43.672 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 122 11:25:55.672 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 122 11:25:55.672 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 122 11:25:55.672 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9789 | allow push down join on redshift                                     | 122 11:25:55.672 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 122 11:25:55.672 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/2063561efc3a9aae031ba78a87b7ab1f5c60cf3f/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/2063561efc3a9aae031ba78a87b7ab1f5c60cf3f/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1047 20:45:19.466 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1032 05:51:08.466 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1017 13:44:33.466 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1015 22:30:17.466 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1011 00:13:11.466 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 947 21:40:53.466  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 947 14:32:32.466  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 934 22:03:48.466  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 927 09:43:14.466  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 883 13:53:04.466  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 883 12:26:48.466  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 876 20:16:32.466  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 875 00:35:24.466  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 854 12:01:15.466  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 843 18:10:24.466  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 821 09:27:04.466  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 805 10:44:22.466  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 786 11:59:23.466  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 783 23:48:23.466  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 779 03:14:32.466  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/2063561efc3a9aae031ba78a87b7ab1f5c60cf3f/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                   title                                   | time_since_push |                              link                              
--------+---------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10867 | Fix information_schema with IS NOT NULL predicate                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10867">link</a> 
  10764 | Implement shallowEquals() for SampledRelation                             | NULL            | <a href="https://github.com/trinodb/trino/pull/10764">link</a> 
   9447 | Support correlated subqueries for DELETE                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/9447">link</a>  
  10844 | Fix Iceberg metadata listing failure when materialized view dropped       | NULL            | <a href="https://github.com/trinodb/trino/pull/10844">link</a> 
  10810 | Vacuum for Iceberg together with coordinator only execute                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10810">link</a> 
  10790 | Document OPTIMIZE for Iceberg                                             | NULL            | <a href="https://github.com/trinodb/trino/pull/10790">link</a> 
  10825 | Rk/dont use row block field block offsets                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10825">link</a> 
  10166 | Implement flushing for partial TopNOperator                               | NULL            | <a href="https://github.com/trinodb/trino/pull/10166">link</a> 
  10215 | Lazily load hive partition information                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10215">link</a> 
  10689 | Silence QueryRunner startup logs in tests                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10689">link</a> 
  10506 | Improvements to Unnest Operator                                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10506">link</a> 
  10815 | Deny DML commands on Hive bucketed tables created by Spark                | NULL            | <a href="https://github.com/trinodb/trino/pull/10815">link</a> 
  10843 | Use airlift json codec in http event listener, fixing airlift/airlift#983 | NULL            | <a href="https://github.com/trinodb/trino/pull/10843">link</a> 
  10956 | Add product tests for clickhouse clusters                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10956">link</a> 
  10823 | Implement exchange spooling                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/10823">link</a> 
  10378 | Add function management abstractions                                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10378">link</a> 
  10587 | Rename table layout classes, remove 'New'                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/10587">link</a> 
   9482 | Simplify Hive metastore creation and use                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/9482">link</a>  
  10866 | Migrate to UBI8 based Docker image                                        | NULL            | <a href="https://github.com/trinodb/trino/pull/10866">link</a> 
  10865 | Fix NPE when hiding Delta tables and Glue table lacks parameters          | NULL            | <a href="https://github.com/trinodb/trino/pull/10865">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/2063561efc3a9aae031ba78a87b7ab1f5c60cf3f/sql/pr/abandoned-prs.sql)

Generated on Fri Mar 11 06:33:47 UTC 2022

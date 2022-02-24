Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 868 03:08:38.608 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 743 16:01:05.608 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 723 22:34:51.608 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 547 20:23:50.608 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 541 23:53:41.608 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 493 18:43:52.608 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 491 05:23:23.608 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 488 05:03:55.608 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 457 03:15:50.608 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 405 15:56:46.608 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 264 18:38:08.608 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 208 14:02:24.608 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 140 16:19:50.608 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 140 16:19:47.608 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 140 07:43:05.608 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 107 17:09:17.608 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 107 17:09:17.608 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 107 17:09:17.608 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9789 | allow push down join on redshift                                     | 107 17:09:17.608 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 107 17:09:17.608 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/0121e74d072dc5a80c91746c8209d9137e4c05c9/sql/pr/stale-prs.sql)

#  Longest running PRs
<pre><code>
 number |                                          title                                          |  running_time   |                             link                              
--------+-----------------------------------------------------------------------------------------+-----------------+---------------------------------------------------------------
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
   9951 | Add WKB Support for PostGIS Geometry Columns                                            | 55 04:26:35.000 | <a href="https://github.com/trinodb/trino/pull/9951">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/0121e74d072dc5a80c91746c8209d9137e4c05c9/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1033 02:28:43.430 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1017 11:34:32.430 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1002 19:27:57.430 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1001 04:13:41.430 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 996 05:56:35.430  | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 933 03:24:17.430  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 932 20:15:56.430  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 920 03:47:12.430  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 912 15:26:38.430  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 868 19:36:28.430  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 868 18:10:12.430  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 862 01:59:56.430  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 860 06:18:48.430  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 839 17:44:39.430  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 828 23:53:48.430  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 806 15:10:28.430  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 790 16:27:46.430  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 771 17:42:47.430  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 769 05:31:47.430  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 764 08:57:56.430  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/0121e74d072dc5a80c91746c8209d9137e4c05c9/sql/pr/awaiting-review.sql)

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
  10771 | Add documentation for db resource group manager                           | NULL            | <a href="https://github.com/trinodb/trino/pull/10771">link</a> 
  10915 | Invalidate CachingDirectoryLister when writing through Trino              | NULL            | <a href="https://github.com/trinodb/trino/pull/10915">link</a> 
  10866 | Migrate to UBI8 based Docker image                                        | NULL            | <a href="https://github.com/trinodb/trino/pull/10866">link</a> 
  10865 | Fix NPE when hiding Delta tables and Glue table lacks parameters          | NULL            | <a href="https://github.com/trinodb/trino/pull/10865">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/0121e74d072dc5a80c91746c8209d9137e4c05c9/sql/pr/abandoned-prs.sql)

Generated on Thu Feb 24 12:17:10 UTC 2022

Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 870 21:22:16.662 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 746 10:14:43.662 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 726 16:48:29.662 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 550 14:37:28.662 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 544 18:07:19.662 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 496 12:57:30.662 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 493 23:37:01.662 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 490 23:17:33.662 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 459 21:29:28.662 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 408 10:10:24.662 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 267 12:51:46.662 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 211 08:16:02.662 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 143 10:33:28.662 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 143 10:33:25.662 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 143 01:56:43.662 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 110 11:22:55.662 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 110 11:22:55.662 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 110 11:22:55.662 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9789 | allow push down join on redshift                                     | 110 11:22:55.662 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 110 11:22:55.662 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/f12778106603fbd988aa9fcc3d2c9d23edea351d/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/f12778106603fbd988aa9fcc3d2c9d23edea351d/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1035 20:42:17.048 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1020 05:48:06.048 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1005 13:41:31.048 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1003 22:27:15.048 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 999 00:10:09.048  | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 935 21:37:51.048  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 935 14:29:30.048  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 922 22:00:46.048  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 915 09:40:12.048  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 871 13:50:02.048  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 871 12:23:46.048  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 864 20:13:30.048  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 863 00:32:22.048  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 842 11:58:13.048  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 831 18:07:22.048  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 809 09:24:02.048  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 793 10:41:20.048  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 774 11:56:21.048  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 771 23:45:21.048  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 767 03:11:30.048  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/f12778106603fbd988aa9fcc3d2c9d23edea351d/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                              title                              | time_since_push |                              link                              
--------+-----------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10801 | Replace deprecated driver ru.yandex.clickhouse.ClickHouseDriver | NULL            | <a href="https://github.com/trinodb/trino/pull/10801">link</a> 
  10749 | Fix incorrect date handling in Phoenix 4 &amp; 5                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10749">link</a> 
  10856 | Correct decoding for Trino UUID partition key value             | NULL            | <a href="https://github.com/trinodb/trino/pull/10856">link</a> 
  10854 | [WIP] Add comments at column level for views                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10854">link</a> 
   7994 | ConnectorExpression pushdown                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/7994">link</a>  
  10706 | Row wise group by on fixed width types                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10706">link</a> 
  10894 | Add Iceberg MinIO Datalake integration tests                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10894">link</a> 
  10922 | Small improvements to spooling exchange and documentation       | NULL            | <a href="https://github.com/trinodb/trino/pull/10922">link</a> 
  10942 | Implement maxDriversPerQuery                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/10942">link</a> 
  10914 | Consider user groups in db resource groups manager              | NULL            | <a href="https://github.com/trinodb/trino/pull/10914">link</a> 
  10817 | Document hive storage table properties                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10817">link</a> 
  10514 | Document special tables exposed by Iceberg                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10514">link</a> 
  10169 | Allow to specify the STS endpoint for hive connector on S3      | NULL            | <a href="https://github.com/trinodb/trino/pull/10169">link</a> 
  10723 | Make communication of dynamic filters to/from workers re-usable | NULL            | <a href="https://github.com/trinodb/trino/pull/10723">link</a> 
  10579 | Move cipher note from kerb to tls page                          | NULL            | <a href="https://github.com/trinodb/trino/pull/10579">link</a> 
  10264 | Optimize null checking in DictionaryBlock                       | NULL            | <a href="https://github.com/trinodb/trino/pull/10264">link</a> 
  10765 | Use narrower modernizer exclusions                              | NULL            | <a href="https://github.com/trinodb/trino/pull/10765">link</a> 
  10721 | Do not consider stages which are still executing as completed   | NULL            | <a href="https://github.com/trinodb/trino/pull/10721">link</a> 
  10858 | Do not require registration of handle classes                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10858">link</a> 
  10859 | Cleanup property management                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/10859">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/f12778106603fbd988aa9fcc3d2c9d23edea351d/sql/pr/abandoned-prs.sql)

Generated on Sun Feb 27 06:30:41 UTC 2022

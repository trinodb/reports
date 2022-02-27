Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 871 09:21:58.958 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 746 22:14:25.958 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 727 04:48:11.958 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 551 02:37:10.958 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 545 06:07:01.958 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 497 00:57:12.958 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 494 11:36:43.958 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 491 11:17:15.958 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 460 09:29:10.958 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 408 22:10:06.958 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 268 00:51:28.958 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 211 20:15:44.958 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 143 22:33:10.958 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 143 22:33:07.958 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 143 13:56:25.958 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 110 23:22:37.958 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9789 | allow push down join on redshift                                     | 110 23:22:37.958 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 110 23:22:37.958 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 110 23:22:37.958 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 110 23:22:37.958 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/39b0d923c61969b1db021e301ffda8d173a389f7/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/39b0d923c61969b1db021e301ffda8d173a389f7/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1036 08:41:59.076 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1020 17:47:48.076 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1006 01:41:13.076 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1004 10:26:57.076 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 999 12:09:51.076  | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 936 09:37:33.076  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 936 02:29:12.076  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 923 10:00:28.076  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 915 21:39:54.076  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 872 01:49:44.076  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 872 00:23:28.076  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 865 08:13:12.076  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 863 12:32:04.076  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 842 23:57:55.076  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 832 06:07:04.076  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 809 21:23:44.076  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 793 22:41:02.076  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 774 23:56:03.076  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 772 11:45:03.076  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 767 15:11:12.076  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/39b0d923c61969b1db021e301ffda8d173a389f7/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                             title                             | time_since_push |                              link                              
--------+---------------------------------------------------------------+-----------------+----------------------------------------------------------------
  10922 | Small improvements to spooling exchange and documentation     | NULL            | <a href="https://github.com/trinodb/trino/pull/10922">link</a> 
  10942 | Implement maxDriversPerQuery                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/10942">link</a> 
  10914 | Consider user groups in db resource groups manager            | NULL            | <a href="https://github.com/trinodb/trino/pull/10914">link</a> 
  10817 | Document hive storage table properties                        | NULL            | <a href="https://github.com/trinodb/trino/pull/10817">link</a> 
  10949 | Simplify evictable cache implementation                       | NULL            | <a href="https://github.com/trinodb/trino/pull/10949">link</a> 
  11031 | Long aggregation improvements                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/11031">link</a> 
  10810 | Vacuum for Iceberg together with coordinator-only execute     | NULL            | <a href="https://github.com/trinodb/trino/pull/10810">link</a> 
  11032 | Update iceberg to 0.13.1                                      | NULL            | <a href="https://github.com/trinodb/trino/pull/11032">link</a> 
  10895 | Skip non impacted product tests                               | NULL            | <a href="https://github.com/trinodb/trino/pull/10895">link</a> 
  11055 | Use Long for representing date value in Accumulo              | NULL            | <a href="https://github.com/trinodb/trino/pull/11055">link</a> 
  11048 | Avoid recomputing partition dynamic filters unnecessarily     | NULL            | <a href="https://github.com/trinodb/trino/pull/11048">link</a> 
  11061 | Support incremental maven builds in PTL                       | NULL            | <a href="https://github.com/trinodb/trino/pull/11061">link</a> 
  10965 | Aggregation improvements                                      | NULL            | <a href="https://github.com/trinodb/trino/pull/10965">link</a> 
  11053 | Add test for KuduClientConfig                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/11053">link</a> 
  10953 | Add kerberos auth support to kudu connector                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10953">link</a> 
  10046 | Add MariaDB connector                                         | NULL            | <a href="https://github.com/trinodb/trino/pull/10046">link</a> 
  10602 | Remove Block writePositionTo and BlockBuilder appendStructure | NULL            | <a href="https://github.com/trinodb/trino/pull/10602">link</a> 
  10793 | Add Trino 370 release notes                                   | NULL            | <a href="https://github.com/trinodb/trino/pull/10793">link</a> 
  10706 | Row wise group by on fixed width types                        | NULL            | <a href="https://github.com/trinodb/trino/pull/10706">link</a> 
  10894 | Add Iceberg MinIO Datalake integration tests                  | NULL            | <a href="https://github.com/trinodb/trino/pull/10894">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/39b0d923c61969b1db021e301ffda8d173a389f7/sql/pr/abandoned-prs.sql)

Generated on Sun Feb 27 18:30:22 UTC 2022

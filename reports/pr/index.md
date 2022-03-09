Trino PR Reports
=======

#  Stale PRs
<pre><code>
 number |                                title                                 |  untouched_for   |                             link                              
--------+----------------------------------------------------------------------+------------------+---------------------------------------------------------------
   1364 | Filter tables based on table privilege of user                       | 880 21:24:10.366 | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   2786 | Categorize user errors when parsing data via GenericHiveRecordCursor | 756 10:16:37.366 | <a href="https://github.com/trinodb/trino/pull/2786">link</a> 
   2832 | Use file extension based on the file format                          | 736 16:50:23.366 | <a href="https://github.com/trinodb/trino/pull/2832">link</a> 
   4834 | Reuse containers in product tests                                    | 560 14:39:22.366 | <a href="https://github.com/trinodb/trino/pull/4834">link</a> 
   4872 | CachingHiveMetastore: refactor cache creation and flushCache()       | 554 18:09:13.366 | <a href="https://github.com/trinodb/trino/pull/4872">link</a> 
   2976 | [WIP] Add sybase connector                                           | 506 12:59:24.366 | <a href="https://github.com/trinodb/trino/pull/2976">link</a> 
   4426 | Fix type mismatch between partition and table                        | 503 23:38:55.366 | <a href="https://github.com/trinodb/trino/pull/4426">link</a> 
   5624 | Ability to run product tests from IntelliJ                           | 500 23:19:27.366 | <a href="https://github.com/trinodb/trino/pull/5624">link</a> 
   4413 | Add deterministic UUID functions uuid_v3 and uuid_v5                 | 469 21:31:22.366 | <a href="https://github.com/trinodb/trino/pull/4413">link</a> 
   5699 | Add support for HDFS only iceberg tables                             | 418 10:12:18.366 | <a href="https://github.com/trinodb/trino/pull/5699">link</a> 
   7870 | Isaac Scafe Writing Exercises                                        | 277 12:53:40.366 | <a href="https://github.com/trinodb/trino/pull/7870">link</a> 
   5834 | Throw SQLException in getTime                                        | 221 08:17:56.366 | <a href="https://github.com/trinodb/trino/pull/5834">link</a> 
   8255 | Add aggregation push down into Oracle                                | 153 10:35:22.366 | <a href="https://github.com/trinodb/trino/pull/8255">link</a> 
   1832 | Feature/add sortkey distkey redshift                                 | 153 10:35:19.366 | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   5767 | add missing jars when `hive.s3-file-system-type=HADOOP_DEFAULT`      | 153 01:58:37.366 | <a href="https://github.com/trinodb/trino/pull/5767">link</a> 
   9804 | Not implement GroupedAccumulator in generateGroupedStateClass        | 120 11:24:49.366 | <a href="https://github.com/trinodb/trino/pull/9804">link</a> 
   9789 | allow push down join on redshift                                     | 120 11:24:49.366 | <a href="https://github.com/trinodb/trino/pull/9789">link</a> 
   9817 | Fix bug in iceberg connector with external table locations           | 120 11:24:49.366 | <a href="https://github.com/trinodb/trino/pull/9817">link</a> 
   9758 | Print error when DateTimeZoneIndex init with failure for debug       | 120 11:24:49.366 | <a href="https://github.com/trinodb/trino/pull/9758">link</a> 
   9851 | Use smaller load factors for small join hash arrays                  | 120 11:24:49.366 | <a href="https://github.com/trinodb/trino/pull/9851">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/ada1724cf04f1bbc3887c047f20121c6ad4ae75e/sql/pr/stale-prs.sql)

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
[query](https://github.com/nineinchnick/trino-cicd/blob/ada1724cf04f1bbc3887c047f20121c6ad4ae75e/sql/pr/running-prs.sql)

#  Longest time since review
<pre><code>
 number |                                         title                                         | time_since_review |                             link                              
--------+---------------------------------------------------------------------------------------+-------------------+---------------------------------------------------------------
    685 | Add SampleNode stats and cost rule                                                    | 1045 20:44:11.765 | <a href="https://github.com/trinodb/trino/pull/685">link</a>  
    624 | Optimize distinct aggregation on multiple columns                                     | 1030 05:50:00.765 | <a href="https://github.com/trinodb/trino/pull/624">link</a>  
    821 | Distributed sort for unpartitioned window functions                                   | 1015 13:43:25.765 | <a href="https://github.com/trinodb/trino/pull/821">link</a>  
    855 | Change client to assume types are encoded as text                                     | 1013 22:29:09.765 | <a href="https://github.com/trinodb/trino/pull/855">link</a>  
    819 | Remove TableLayout from TPCDS connector                                               | 1009 00:12:03.765 | <a href="https://github.com/trinodb/trino/pull/819">link</a>  
   1255 | Remove no longer needed ConnectorSplitSource#isFinished                               | 945 21:39:45.765  | <a href="https://github.com/trinodb/trino/pull/1255">link</a> 
   1224 | Add graceful shutdown script for Docker                                               | 945 14:31:24.765  | <a href="https://github.com/trinodb/trino/pull/1224">link</a> 
   1319 | Add execution statistic warnings                                                      | 932 22:02:40.765  | <a href="https://github.com/trinodb/trino/pull/1319">link</a> 
   1317 | Add connector table metadata warnings                                                 | 925 09:42:06.765  | <a href="https://github.com/trinodb/trino/pull/1317">link</a> 
   1364 | Filter tables based on table privilege of user                                        | 881 13:51:56.765  | <a href="https://github.com/trinodb/trino/pull/1364">link</a> 
   1637 | [WIP] patch to add support for array by table subquery                                | 881 12:25:40.765  | <a href="https://github.com/trinodb/trino/pull/1637">link</a> 
   1606 | Improve property derivation for FULL JOIN                                             | 874 20:15:24.765  | <a href="https://github.com/trinodb/trino/pull/1606">link</a> 
   1780 | Remove unused binding                                                                 | 873 00:34:16.765  | <a href="https://github.com/trinodb/trino/pull/1780">link</a> 
   1965 | Node local partition pruning                                                          | 852 12:00:07.765  | <a href="https://github.com/trinodb/trino/pull/1965">link</a> 
   2026 | Add pattern for files ending with &lt;query_id&gt;.&lt;number&gt; to cleanup them during rollback | 841 18:09:16.765  | <a href="https://github.com/trinodb/trino/pull/2026">link</a> 
   1832 | Feature/add sortkey distkey redshift                                                  | 819 09:25:56.765  | <a href="https://github.com/trinodb/trino/pull/1832">link</a> 
   2227 | Adding changes for adding _timestamp field in kafka topic metadata.                   | 803 10:43:14.765  | <a href="https://github.com/trinodb/trino/pull/2227">link</a> 
   2489 | Derive non-null from symbol-to-symbol comparisons in domain translator                | 784 11:58:15.765  | <a href="https://github.com/trinodb/trino/pull/2489">link</a> 
   2010 | Query debugging tracer                                                                | 781 23:47:15.765  | <a href="https://github.com/trinodb/trino/pull/2010">link</a> 
   2397 | Influx Connector                                                                      | 777 03:13:24.765  | <a href="https://github.com/trinodb/trino/pull/2397">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/ada1724cf04f1bbc3887c047f20121c6ad4ae75e/sql/pr/awaiting-review.sql)

#  Abandoned PRs
<pre><code>
 number |                                          title                                          | time_since_push |                              link                              
--------+-----------------------------------------------------------------------------------------+-----------------+----------------------------------------------------------------
  11274 | Fix incorrect result of sql server tinyint                                              | NULL            | <a href="https://github.com/trinodb/trino/pull/11274">link</a> 
  11279 | Allow passing extra credentials details to AWS Glue in customAWSCredntialProvider       | NULL            | <a href="https://github.com/trinodb/trino/pull/11279">link</a> 
  11255 | Add S3 Http Proxy configuration support                                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/11255">link</a> 
  11235 | Allocate new Slice for VariableWidthBlockEncoding readBlock                             | NULL            | <a href="https://github.com/trinodb/trino/pull/11235">link</a> 
  11217 | Use shared Zstd(De)Compressor in ResolvedFunction encoding                              | NULL            | <a href="https://github.com/trinodb/trino/pull/11217">link</a> 
  11254 | Avoid building tarball in every PT job                                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11254">link</a> 
  11276 | Add debug log to BigQuery ReadRowsHelper                                                | NULL            | <a href="https://github.com/trinodb/trino/pull/11276">link</a> 
  11277 | Add redirection awareness for RENAME table operation                                    | NULL            | <a href="https://github.com/trinodb/trino/pull/11277">link</a> 
  11269 | Drop table after verifying the behavior in testRenameTable                              | NULL            | <a href="https://github.com/trinodb/trino/pull/11269">link</a> 
  11206 | Add all_files system table to the Iceberg connector                                     | NULL            | <a href="https://github.com/trinodb/trino/pull/11206">link</a> 
  11219 | Add Iceberg MinIO connector smoke test                                                  | NULL            | <a href="https://github.com/trinodb/trino/pull/11219">link</a> 
  11211 | Add table comments interface in base JDBC and implement in MySQL                        | NULL            | <a href="https://github.com/trinodb/trino/pull/11211">link</a> 
   9788 | Add support for OpenID connect metadata discovery mechanism                             | NULL            | <a href="https://github.com/trinodb/trino/pull/9788">link</a>  
  11261 | Document the hive.fs.cache.max-size property                                            | NULL            | <a href="https://github.com/trinodb/trino/pull/11261">link</a> 
  11159 | Bump Coral dependency version to 2.0.53                                                 | NULL            | <a href="https://github.com/trinodb/trino/pull/11159">link</a> 
  10575 | Increase OrcReader#MAX_BATCH_SIZE to 8196                                               | NULL            | <a href="https://github.com/trinodb/trino/pull/10575">link</a> 
  10767 | Support for AWS Atena partition projection                                              | NULL            | <a href="https://github.com/trinodb/trino/pull/10767">link</a> 
   8202 | Fixed #2748 - Metadata for alias in elasticsearch connector only uses the first mapping | NULL            | <a href="https://github.com/trinodb/trino/pull/8202">link</a>  
  11011 | Make partial aggregation adaptive                                                       | NULL            | <a href="https://github.com/trinodb/trino/pull/11011">link</a> 
  11146 | Replace row-wise DefaultPagePartitioner with ColumnarPagePartitioner                    | NULL            | <a href="https://github.com/trinodb/trino/pull/11146">link</a> 
(20 rows)
</code></pre>
[query](https://github.com/nineinchnick/trino-cicd/blob/ada1724cf04f1bbc3887c047f20121c6ad4ae75e/sql/pr/abandoned-prs.sql)

Generated on Wed Mar  9 06:32:38 UTC 2022

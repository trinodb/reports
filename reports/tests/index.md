---
title: Trino Tests Reports
---

## Tests failing in the merge queue and nightly runs

Tests that failed at least twice in the last 30 days in the merge queue or the nightly run, after the code passed its own checks, so they are broken or flaky. Fix the top rows first.
Failed runs is of the runs of the test's job, one chart character is one day (oldest on the left, a dot for none), In PRs counts pull request branches with the same failure, and Last links to the latest one.

<pre><code>
                                   Test                                   | Failed runs |     Failures per day chart     | First  | In PRs |  Last  
--------------------------------------------------------------------------+-------------+--------------------------------+--------+--------+--------
 TestHiveDynamicRowFiltering.testJoinWithMultipleDynamicFilters           | 8 of 334    | ..................▂█.▆........ | Nov 09 |      6 | <a href="https://github.com/trinodb/trino/actions/runs/43187874314/job/131080341970">Nov 12</a> 
 TestAtLocal.testTime                                                     | 7 of 264    | ..........█▂.................. | Nov 01 |      4 | <a href="https://github.com/trinodb/trino/actions/runs/41365932744/job/125026379957">Nov 02</a> 
 TestAtLocal.testTimeWithTimeZone                                         | 7 of 264    | ..........█▂.................. | Nov 01 |      4 | <a href="https://github.com/trinodb/trino/actions/runs/41365932744/job/125026379957">Nov 02</a> 
 TestWorkerRestart.testStartDuringQuery                                   | 6 of 333    | .....▂.▂................▂...▆. | Oct 27 |      8 | <a href="https://github.com/trinodb/trino/actions/runs/44640749635/job/135971562565">Nov 19</a> 
 TestWorkerRestart.testRestartDuringQuery                                 | 6 of 333    | .......▂.......▂..▆▂.......... | Oct 29 |     24 | <a href="https://github.com/trinodb/trino/actions/runs/42822485808/job/129852067424">Nov 10</a> 
 TestMemoryConnectorTest.testSemiJoinLargeBuildSideDynamicFiltering       | 5 of 401    | ...................█▂......... | Nov 10 |     13 | <a href="https://github.com/trinodb/trino/actions/runs/42982636482/job/130397019713">Nov 11</a> 
 TestMemoryConnectorTest.testJoinLargeBuildSideDynamicFiltering           | 5 of 401    | ...................█▂......... | Nov 10 |     13 | <a href="https://github.com/trinodb/trino/actions/runs/42982636482/job/130397019713">Nov 11</a> 
 TestSystemCachedKnownToken.testGetTokenConcurrentWithSetupToken          | 4 of 461    | .........................▂..▄▂ | Nov 16 |      1 | <a href="https://github.com/trinodb/trino/actions/runs/44642662558/job/135977517086">Nov 20</a> 
 TestHive3OnDataLake.testFlushPartitionCache                              | 4 of 334    | ......▂.......▂....▂▂......... | Oct 28 |      1 | <a href="https://github.com/trinodb/trino/actions/runs/42929383265/job/130224672041">Nov 11</a> 
 TestThreadPerDriverTaskExecutor.testLeafAdmissionRotatesAcrossTasks      | 4 of 264    | ........▂...▂▂.▂.............. | Oct 30 |      4 | <a href="https://github.com/trinodb/trino/actions/runs/42135011951/job/127621593426">Nov 06</a> 
 TestBigQueryAvroConnectorTest.testExecuteProcedure                       | 3 of 324    | ..................▂▂........▂. | Nov 09 |      1 | <a href="https://github.com/trinodb/trino/actions/runs/44567263991/job/135713400523">Nov 19</a> 
 TestBigQueryAvroConnectorTest.testLimitPushdownWithExternalTable         | 3 of 324    | ......▂.......▂.......▂....... | Oct 28 |      1 | <a href="https://github.com/trinodb/trino/actions/runs/43527042097/job/132235998697">Nov 13</a> 
 TestFakerQueries.testCreateTableAsSelect                                 | 3 of 401    | .............▂.....▂.▂........ | Nov 04 |      0 | <a href="https://github.com/trinodb/trino/actions/runs/43167732658/job/131014106147">Nov 12</a> 
 TestFakerQueries.testZipfDistribution                                    | 3 of 401    | ............▂▂..▂............. | Nov 03 |      1 | <a href="https://github.com/trinodb/trino/actions/runs/42323554038/job/128253957825">Nov 07</a> 
 TestIcebergBigLakeVendedCredentials.initializationError                  | 3 of 418    | ............▆................. | Nov 03 |      1 | <a href="https://github.com/trinodb/trino/actions/runs/41564403847/job/125682889148">Nov 03</a> 
 TestIcebergBigLakeMetastoreConnectorSmokeTest.testCommentView            | 3 of 418    | ....▆......................... | Oct 26 |      1 | <a href="https://github.com/trinodb/trino/actions/runs/40285903889/job/121449864631">Oct 26</a> 
 TestIcebergBigLakeMetastoreConnectorSmokeTest.testView                   | 3 of 418    | ....▆......................... | Oct 26 |      1 | <a href="https://github.com/trinodb/trino/actions/runs/40285903889/job/121449864631">Oct 26</a> 
 TestIcebergBigLakeMetastoreConnectorSmokeTest.testCommentViewColumn      | 3 of 418    | ....▆......................... | Oct 26 |      1 | <a href="https://github.com/trinodb/trino/actions/runs/40285903889/job/121449864631">Oct 26</a> 
 TestBigQueryAvroConnectorTest.testBigQueryExternalTable                  | 2 of 324    | ...............▂.....▂........ | Nov 06 |      0 | <a href="https://github.com/trinodb/trino/actions/runs/43176846399/job/131043733443">Nov 12</a> 
 TestOracleConnectorTest.testInsertRowConcurrently                        | 2 of 314    | ......▂............▂.......... | Oct 28 |      0 | <a href="https://github.com/trinodb/trino/actions/runs/42726296593/job/129533377136">Nov 10</a> 
 TestBigQueryQueryFailureRecoveryTest.testOrderBy                         | 2 of 30     | ............▂..▂.............. | Nov 03 |      0 | <a href="https://github.com/trinodb/trino/actions/runs/42135011951/job/127621593616">Nov 06</a> 
 TestIcebergBigLakeMetastoreConnectorSmokeTest.initializationError        | 2 of 418    | ............▄................. | Nov 03 |      1 | <a href="https://github.com/trinodb/trino/actions/runs/41564403847/job/125682889148">Nov 03</a> 
 TestHiveConnectorTest.te...rTaskCountLimitPartitionedScaleWritersEnabled | 2 of 334    | ......▄....................... | Oct 28 |      9 | <a href="https://github.com/trinodb/trino/actions/runs/40648974388/job/122684975436">Oct 28</a> 
 TestHiveRoles.testRevokeRoleMultipleTimes                                | 2 of 334    | .....▄........................ | Oct 27 |      1 | <a href="https://github.com/trinodb/trino/actions/runs/40471390302/job/122079674328">Oct 27</a> 
 TestHiveRoles.testDropRole                                               | 2 of 334    | .....▄........................ | Oct 27 |      3 | <a href="https://github.com/trinodb/trino/actions/runs/40471390302/job/122079674328">Oct 27</a> 
 TestHiveRoles.testGrantRoleMultipleTimes                                 | 2 of 334    | .....▄........................ | Oct 27 |      2 | <a href="https://github.com/trinodb/trino/actions/runs/40467775244/job/122067806567">Oct 27</a> 
 TestHiveRoles.testCreateRole                                             | 2 of 334    | .....▄........................ | Oct 27 |      2 | <a href="https://github.com/trinodb/trino/actions/runs/40467775244/job/122067806567">Oct 27</a> 
 TestHive4OnDataLake.testUnsupportedDropSchemaCascadeWithNonHiveTable     | 2 of 334    | ....▂▂........................ | Oct 26 |      7 | <a href="https://github.com/trinodb/trino/actions/runs/40460602316/job/122044482835">Oct 27</a> 
 TestBigQueryAvroTypeMapping.testJson                                     | 2 of 30     | ▂▂............................ | Oct 22 |      0 | <a href="https://github.com/trinodb/trino/actions/runs/39877255747/job/120166183757">Oct 23</a> 
 TestBigQueryArrowTypeMapping.testJson                                    | 2 of 30     | ▂▂............................ | Oct 22 |      0 | <a href="https://github.com/trinodb/trino/actions/runs/39877255747/job/120166183757">Oct 23</a> 
(30 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/5ff0dc721288b2af0d3c69361fa4aa310e66b0f2/sql/tests/01-failing-tests.sql)

## Is a test failure in my pull request known?

Tests that are flaky or broken for everyone: if your pull request fails in one of them with the same error, re-run the job and mention the test in the pull request.
Retried counts failures where the same job then passed on the same commit, which shows that the test is flaky; In PRs and In master count pull request branches and merge queue or nightly runs with the failure, in the last 30 days. Listed are tests with a pass on retry, or with failures in 3 changes including a pull request.

<table>
<thead>
<tr><th>Test</th><th style="text-align: right">Retried</th><th style="text-align: right">In PRs</th><th style="text-align: right">In master</th><th>Job</th><th>Latest error</th><th>Last failed</th></tr>
</thead>
<tbody>
<tr><td>TestWorkerRestart.testRestartDuringQuery</td><td style="text-align: right">11</td><td style="text-align: right">24</td><td style="text-align: right">6</td><td>testing/trino-tests</td><td>testRestartDuringQuery() timed out after 90 seconds</td><td><a href="https://github.com/trinodb/trino/actions/runs/42853752706/job/129961952299">Nov 10</a></td></tr>
<tr><td>TestMemoryConnectorTest.testSemiJoinLargeBuildSideDynamicFiltering</td><td style="text-align: right">6</td><td style="text-align: right">13</td><td style="text-align: right">5</td><td>plugin/trino-base-jdbc, plugin/trino-faker, plugin/trino-geospatial, plugin/trino-memory, plugin/trino-openlineage, plugin/trino-thrift</td><td>expected: [60139, 3977] but was: [60175, 3977]</td><td><a href="https://github.com/trinodb/trino/actions/runs/43212839825/job/131165334696">Nov 12</a></td></tr>
<tr><td>TestMemoryConnectorTest.testJoinLargeBuildSideDynamicFiltering</td><td style="text-align: right">6</td><td style="text-align: right">13</td><td style="text-align: right">5</td><td>plugin/trino-base-jdbc, plugin/trino-faker, plugin/trino-geospatial, plugin/trino-memory, plugin/trino-openlineage, plugin/trino-thrift</td><td>expected: [60139, 3977] but was: [60175, 3977]</td><td><a href="https://github.com/trinodb/trino/actions/runs/43212839825/job/131165334696">Nov 12</a></td></tr>
<tr><td>TestHiveDynamicRowFiltering.testJoinWithMultipleDynamicFilters</td><td style="text-align: right">5</td><td style="text-align: right">6</td><td style="text-align: right">8</td><td>plugin/trino-hive</td><td>Expecting actual: 1500L to be less than: 1500L</td><td><a href="https://github.com/trinodb/trino/actions/runs/43216434632/job/131180200309">Nov 12</a></td></tr>
<tr><td>TestWorkerRestart.testStartDuringQuery</td><td style="text-align: right">4</td><td style="text-align: right">8</td><td style="text-align: right">6</td><td>testing/trino-tests</td><td>io.trino.testing.QueryFailedException: Could not communicate with the remote task. The node may have crashed or be under</td><td><a href="https://github.com/trinodb/trino/actions/runs/44653194343/job/136013615294">Nov 20</a></td></tr>
<tr><td>TestHiveConnectorTest.testWriterTaskCountLimitPartitionedScaleWritersEnabled</td><td style="text-align: right">2</td><td style="text-align: right">9</td><td style="text-align: right">2</td><td>plugin/trino-hive</td><td>expected: 4L but was: 3L</td><td><a href="https://github.com/trinodb/trino/actions/runs/40669116381/job/122751784666">Oct 28</a></td></tr>
<tr><td>TestAtLocal.testTime</td><td style="text-align: right">1</td><td style="text-align: right">4</td><td style="text-align: right">7</td><td>core/trino-main</td><td>Multiple Failures (1 failure) -- failure 1 -- expected: 12:34:56-07:00 [picos = 45296000000000000, offset = -420] but wa</td><td><a href="https://github.com/trinodb/trino/actions/runs/41384754861/job/125083399509">Nov 02</a></td></tr>
<tr><td>TestAtLocal.testTimeWithTimeZone</td><td style="text-align: right">1</td><td style="text-align: right">4</td><td style="text-align: right">7</td><td>core/trino-main</td><td>Multiple Failures (1 failure) -- failure 1 -- expected: 22:25:56-07:00 [picos = 80756000000000000, offset = -420] but wa</td><td><a href="https://github.com/trinodb/trino/actions/runs/41384754861/job/125083399509">Nov 02</a></td></tr>
<tr><td>TestThreadPerDriverTaskExecutor.testLeafAdmissionRotatesAcrossTasks</td><td style="text-align: right">3</td><td style="text-align: right">4</td><td style="text-align: right">4</td><td>core/trino-main</td><td>expected: 1 but was: 0</td><td><a href="https://github.com/trinodb/trino/actions/runs/42507561301/job/128813751676">Nov 08</a></td></tr>
<tr><td>TestHive4OnDataLake.testUnsupportedDropSchemaCascadeWithNonHiveTable</td><td style="text-align: right">2</td><td style="text-align: right">7</td><td style="text-align: right">2</td><td>plugin/trino-hive</td><td>Expecting HashSet: ["default", "functions", "information_schema", "hive_datalake", "tpch"] to contain: ["test_unsupporte</td><td><a href="https://github.com/trinodb/trino/actions/runs/40500149779/job/122176086687">Oct 27</a></td></tr>
<tr><td>TestIcebergV2.testOptimizeNotNullViolation</td><td style="text-align: right">4</td><td style="text-align: right">4</td><td style="text-align: right">2</td><td>plugin/trino-iceberg</td><td>Data files after failed optimize do not match: 1 unexpected, 0 missing (actual count: 3, expected count: 2) Unexpected: </td><td><a href="https://github.com/trinodb/trino/actions/runs/40019142407/job/120639922887">Oct 23</a></td></tr>
<tr><td>TestHive3OnDataLake.testFlushPartitionCache</td><td style="text-align: right">3</td><td style="text-align: right">1</td><td style="text-align: right">4</td><td>plugin/trino-hive</td><td>[Rows for query [SELECT name FROM hive.hive_datalake.nation_6rgdwk591z WHERE regionkey=0]] Expecting empty but was: (ALG</td><td><a href="https://github.com/trinodb/trino/actions/runs/44045324257/job/133910574269">Nov 17</a></td></tr>
<tr><td>TestHiveRoles.testDropRole</td><td style="text-align: right">3</td><td style="text-align: right">3</td><td style="text-align: right">2</td><td>plugin/trino-hive</td><td>expected: ["role1", "admin"] but was: ["role1", "grant_revoke_role_existing_1", "admin"]</td><td><a href="https://github.com/trinodb/trino/actions/runs/40485809703/job/122145176065">Oct 27</a></td></tr>
<tr><td>TestLegacyHiveRoles.testDropRole</td><td style="text-align: right">3</td><td style="text-align: right">3</td><td style="text-align: right">1</td><td>plugin/trino-hive</td><td>expected: ["role1", "admin"] but was: ["role1", "grant_revoke_role_existing_1", "admin"]</td><td><a href="https://github.com/trinodb/trino/actions/runs/40485809703/job/122145176065">Oct 27</a></td></tr>
<tr><td>TestSystemCachedKnownToken.testGetTokenConcurrentWithSetupToken</td><td style="text-align: right">0</td><td style="text-align: right">1</td><td style="text-align: right">4</td><td>test-other-modules</td><td>testGetTokenConcurrentWithSetupToken(java.nio.file.Path) timed out after 30 seconds</td><td><a href="https://github.com/trinodb/trino/actions/runs/44642662558/job/135977517086">Nov 20</a></td></tr>
<tr><td>TestBigQueryAvroConnectorTest.testLimitPushdownWithExternalTable</td><td style="text-align: right">1</td><td style="text-align: right">1</td><td style="text-align: right">3</td><td>plugin/trino-bigquery</td><td>Already Exists: Table sep-bq-cicd:_504da3ba97a95b3ba8ecf5ea2dd9656b0c9b77fb._pbc_02ea4d3750d14e6eb2783298a351cb1c</td><td><a href="https://github.com/trinodb/trino/actions/runs/43527042097/job/132235998697">Nov 13</a></td></tr>
<tr><td>TestFakerQueries.testCreateTableAsSelect</td><td style="text-align: right">2</td><td style="text-align: right">0</td><td style="text-align: right">3</td><td>plugin/trino-base-jdbc, plugin/trino-faker, plugin/trino-geospatial, plugin/trino-memory, plugin/trino-openlineage, plugin/trino-thrift</td><td>Rows for query 20261112_063557_01468_k2j69 [SELECT count(distinct rnd_tinyint) FROM ctas_rnd_tinyintt0vy4uklcr] do not m</td><td><a href="https://github.com/trinodb/trino/actions/runs/43167732658/job/131014106147">Nov 12</a></td></tr>
<tr><td>TestFakerQueries.testZipfDistribution</td><td style="text-align: right">1</td><td style="text-align: right">1</td><td style="text-align: right">3</td><td>plugin/trino-base-jdbc, plugin/trino-faker, plugin/trino-geospatial, plugin/trino-memory, plugin/trino-openlineage, plugin/trino-thrift</td><td>Rows for query 20261107_013308_00505_ysa7j [SELECT min(x) = CAST('-128' AS tinyint) AND max(x) &lt;= CAST('127' AS tinyint)</td><td><a href="https://github.com/trinodb/trino/actions/runs/42323554038/job/128253957825">Nov 07</a></td></tr>
<tr><td>TestIcebergBigLakeVendedCredentials.initializationError</td><td style="text-align: right">1</td><td style="text-align: right">1</td><td style="text-align: right">3</td><td>plugin/trino-iceberg, cloud-tests</td><td>Failed to initialize Iceberg REST catalog</td><td><a href="https://github.com/trinodb/trino/actions/runs/41564403847/job/125682889148">Nov 03</a></td></tr>
<tr><td>TestHiveRoles.testCreateRole</td><td style="text-align: right">1</td><td style="text-align: right">2</td><td style="text-align: right">2</td><td>plugin/trino-hive</td><td>expected: ["role1", "admin"] but was: ["role1", "grant_revoke_role_existing_1", "admin"]</td><td><a href="https://github.com/trinodb/trino/actions/runs/40478607863/job/122120179777">Oct 27</a></td></tr>
<tr><td>TestBigQueryAvroConnectorTest.testExecuteProcedure</td><td style="text-align: right">0</td><td style="text-align: right">1</td><td style="text-align: right">3</td><td>plugin/trino-bigquery</td><td>Multiple Failures (1 failure) -- failure 1 --Rows for query [CALL system.execute('INSERT INTO tpch.test_execute3vzc8laqt</td><td><a href="https://github.com/trinodb/trino/actions/runs/44583613834/job/135771637161">Nov 19</a></td></tr>
<tr><td>TestHiveRoles.testGrantRoleMultipleTimes</td><td style="text-align: right">0</td><td style="text-align: right">2</td><td style="text-align: right">2</td><td>plugin/trino-hive</td><td>Could not write roleGrants</td><td><a href="https://github.com/trinodb/trino/actions/runs/43284803691/job/131416275309">Nov 12</a></td></tr>
<tr><td>TestSqlServerConnectorTest.testInsertWriteBulkiness</td><td style="text-align: right">0</td><td style="text-align: right">3</td><td style="text-align: right">1</td><td>plugin/trino-sqlserver</td><td>expected: 1500 but was: 236</td><td><a href="https://github.com/trinodb/trino/actions/runs/40633533889/job/122636184691">Oct 28</a></td></tr>
<tr><td>TestLegacyHiveRoles.testCreateRole</td><td style="text-align: right">1</td><td style="text-align: right">2</td><td style="text-align: right">1</td><td>plugin/trino-hive</td><td>expected: ["role1", "admin"] but was: ["role1", "grant_revoke_role_existing_1", "admin"]</td><td><a href="https://github.com/trinodb/trino/actions/runs/40478607863/job/122120179777">Oct 27</a></td></tr>
<tr><td>TestHive3OnDataLake.testUnsupportedDropSchemaCascadeWithNonHiveTable</td><td style="text-align: right">1</td><td style="text-align: right">2</td><td style="text-align: right">1</td><td>plugin/trino-hive</td><td>Expecting HashSet: ["default", "functions", "information_schema", "hive_datalake", "tpch"] to contain: ["test_unsupporte</td><td><a href="https://github.com/trinodb/trino/actions/runs/40478607863/job/122103502473">Oct 27</a></td></tr>
<tr><td>TestLegacyHiveRoles.testGrantNonExistingRole</td><td style="text-align: right">0</td><td style="text-align: right">3</td><td style="text-align: right">1</td><td>plugin/trino-hive</td><td>Expected query to fail: GRANT grant_revoke_role_existing_1 TO USER grant_revoke_existing_user_1 [QueryId: 20261027_09024</td><td><a href="https://github.com/trinodb/trino/actions/runs/40474722932/job/122090636620">Oct 27</a></td></tr>
<tr><td>TestHiveRoles.testGrantNonExistingRole</td><td style="text-align: right">0</td><td style="text-align: right">3</td><td style="text-align: right">1</td><td>plugin/trino-hive</td><td>Expected query to fail: GRANT grant_revoke_role_existing_1 TO USER grant_revoke_existing_user_1 IN hive [QueryId: 202610</td><td><a href="https://github.com/trinodb/trino/actions/runs/40474722932/job/122090636620">Oct 27</a></td></tr>
<tr><td>TestIcebergBigLakeMetastoreConnectorSmokeTest.testCommentViewColumn</td><td style="text-align: right">0</td><td style="text-align: right">1</td><td style="text-align: right">3</td><td>plugin/trino-iceberg, cloud-tests</td><td>Expecting throwable message: "Method not found." to contain: "Server does not support endpoint: POST /v1/{prefix}/namesp</td><td><a href="https://github.com/trinodb/trino/actions/runs/40321181551/job/121567328661">Oct 26</a></td></tr>
<tr><td>TestIcebergBigLakeMetastoreConnectorSmokeTest.testCommentView</td><td style="text-align: right">0</td><td style="text-align: right">1</td><td style="text-align: right">3</td><td>plugin/trino-iceberg, cloud-tests</td><td>Expecting throwable message: "Method not found." to contain: "Server does not support endpoint: POST /v1/{prefix}/namesp</td><td><a href="https://github.com/trinodb/trino/actions/runs/40321181551/job/121567328661">Oct 26</a></td></tr>
<tr><td>TestIcebergBigLakeMetastoreConnectorSmokeTest.testView</td><td style="text-align: right">0</td><td style="text-align: right">1</td><td style="text-align: right">3</td><td>plugin/trino-iceberg, cloud-tests</td><td>Expecting throwable message: "Method not found." to contain: "Server does not support endpoint: POST /v1/{prefix}/namesp</td><td><a href="https://github.com/trinodb/trino/actions/runs/40321181551/job/121567328661">Oct 26</a></td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/5ff0dc721288b2af0d3c69361fa4aa310e66b0f2/sql/tests/02-flaky-tests.sql)

## New test failures

Test classes whose tests started to fail in the last 7 days, after no failures in the 4 weeks before, in at least 2 changes. When many tests of a class fail from the same day, one change or an outside service broke them: find it, and fix or revert it.
Columns count as in the report above.

<table>
<thead>
<tr><th>Test class</th><th style="text-align: right">New failing tests</th><th>For example</th><th>First failed</th><th style="text-align: right">In master</th><th style="text-align: right">In PRs</th><th style="text-align: right">Retried</th><th>Latest error</th><th>Last failed</th></tr>
</thead>
<tbody>
<tr><td>TestSystemCachedKnownToken</td><td style="text-align: right">1</td><td>testGetTokenConcurrentWithSetupToken</td><td>Nov 16</td><td style="text-align: right">4</td><td style="text-align: right">1</td><td style="text-align: right">0</td><td>testGetTokenConcurrentWithSetupToken(java.nio.file.Path) timed out after 30 seconds</td><td><a href="https://github.com/trinodb/trino/actions/runs/44642662558/job/135977517086">Nov 20</a></td></tr>
<tr><td>TestBigQueryAvroConnectorTest</td><td style="text-align: right">4</td><td>initializationError, testCreateSchemaWithNonLowercaseOwnerName, testEmptyProjectionExternalTable</td><td>Nov 16</td><td style="text-align: right">4</td><td style="text-align: right">0</td><td style="text-align: right">0</td><td>Table 'test.views_system_table_view_he32zqn5du$view_definition' not found</td><td><a href="https://github.com/trinodb/trino/actions/runs/44643752167/job/135981635125">Nov 20</a></td></tr>
<tr><td>TestCassandraConnectorTest</td><td style="text-align: right">2</td><td>testDeleteWithVarcharPredicate, testLikeWithBackslash</td><td>Nov 16</td><td style="text-align: right">0</td><td style="text-align: right">2</td><td style="text-align: right">0</td><td>Duplicate column 'id' declaration for table 'tpch.test_like_backslashddj1qew7h8'</td><td><a href="https://github.com/trinodb/trino/actions/runs/44440411076/job/135280044251">Nov 19</a></td></tr>
<tr><td>TestIcebergBigLakeMetastoreConnectorSmokeTest</td><td style="text-align: right">4</td><td>testRowLevelUpdate, testShowStatsAfterUpdateAndExpireSnapshots, testTableChangesFunction</td><td>Nov 19</td><td style="text-align: right">2</td><td style="text-align: right">0</td><td style="text-align: right">0</td><td>Execution of 'actual' query 20261119_172809_00081_qs67p failed: SELECT nationkey, name, _change_type, _change_version_id</td><td><a href="https://github.com/trinodb/trino/actions/runs/44574844575/job/135740568247">Nov 19</a></td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/5ff0dc721288b2af0d3c69361fa4aa310e66b0f2/sql/tests/03-new-failures.sql)

## Flaky jobs

Jobs that failed in the last 30 days and then passed on the same commit, in a re-run or in another run. Rate is such failures of all the runs of the job, and Time lost the runner time of the failed attempts; few failures are retried on the same commit, so the real rates are higher.
Attempts where more than 4 jobs failed like this are outages, and are left out. One chart character is one day (oldest on the left, a dot for none); open the latest failures to find the flaky test or step.

<pre><code>
                   Job                    | Flaky | Runs | Rate | Time lost |         Per day chart          |   Latest flaky failures   
------------------------------------------+-------+------+------+-----------+--------------------------------+---------------------------
 test (testing/trino-tests)               |    17 | 1364 | 1.2% | 8h 20m    | .▃......▃▃...▃▃▃.▃▆█........█▃ | <a href="https://github.com/trinodb/trino/actions/runs/44653194343/job/136013615294">Nov 20 01:24</a> <a href="https://github.com/trinodb/trino/actions/runs/44638034583/job/135962444860">Nov 19 23:31</a> 
 test (plugin/trino-hive)                 |    14 | 1197 | 1.2% | 4h 58m    | .....█▆...........▃▆▆▃....▃... | <a href="https://github.com/trinodb/trino/actions/runs/44045324257/job/133910574269">Nov 17 08:18</a> <a href="https://github.com/trinodb/trino/actions/runs/43216434632/job/131180200309">Nov 12 12:23</a> 
 test (plugin/trino-base-jdbc, plugin/... |     9 | 1400 | 0.6% | 1h 32m    | .............▆....▃█▆▃........ | <a href="https://github.com/trinodb/trino/actions/runs/43197750832/job/131113654984">Nov 12 10:10</a> <a href="https://github.com/trinodb/trino/actions/runs/43046518360/job/130612694612">Nov 11 15:16</a> 
 pt (SuiteAzure)                          |     5 | 1107 | 0.5% | 1h 17m    | .▃..▆..▃....▃................. | <a href="https://github.com/trinodb/trino/actions/runs/41551034125/job/125642009868">Nov 03 00:20</a> <a href="https://github.com/trinodb/trino/actions/runs/40959822621/job/123753350140">Oct 29 21:49</a> 
 pt (SuiteTwoHives)                       |     5 | 1321 | 0.4% | 39m 02s   | █▆............................ | <a href="https://github.com/trinodb/trino/actions/runs/39989694144/job/120542275116">Oct 23 16:56</a> <a href="https://github.com/trinodb/trino/actions/runs/39877255747/job/120167797812">Oct 23 00:23</a> 
 test (plugin/trino-iceberg)              |     4 | 1313 | 0.3% | 1h 41m    | ▃█............................ | <a href="https://github.com/trinodb/trino/actions/runs/40019142407/job/120639922887">Oct 23 20:28</a> <a href="https://github.com/trinodb/trino/actions/runs/39977345778/job/120496016297">Oct 23 15:21</a> 
 test (core/trino-main)                   |     4 |  898 | 0.4% | 1h 33m    | ...........▃▃▃.▃.............. | <a href="https://github.com/trinodb/trino/actions/runs/42135011951/job/127621593426">Nov 06 00:13</a> <a href="https://github.com/trinodb/trino/actions/runs/41800523708/job/126475475179">Nov 04 08:35</a> 
 test (plugin/trino-bigquery)             |     3 | 1114 | 0.3% | 50m 48s   | ....▃.......▃..▃.............. | <a href="https://github.com/trinodb/trino/actions/runs/42135011951/job/127621593954">Nov 06 00:13</a> <a href="https://github.com/trinodb/trino/actions/runs/41551034125/job/125639034379">Nov 03 00:13</a> 
 test (testing/trino-faulttolerant-tes... |     2 | 1487 | 0.1% | 1h 19m    | .....▃.......▃................ | <a href="https://github.com/trinodb/trino/actions/runs/41800523708/job/126475475537">Nov 04 08:35</a> <a href="https://github.com/trinodb/trino/actions/runs/40506787644/job/122199091484">Oct 27 12:51</a> 
 pt (SuiteIcebergVariants)                |     2 | 1309 | 0.2% | 1h 18m    | ..▃.......................▃... | <a href="https://github.com/trinodb/trino/actions/runs/44118445667/job/134167643895">Nov 17 15:55</a> <a href="https://github.com/trinodb/trino/actions/runs/40075809594/job/120820549266">Oct 24 08:01</a> 
 test (plugin/trino-oracle)               |     2 | 1038 | 0.2% | 33m 30s   | ...............▃...▃.......... | <a href="https://github.com/trinodb/trino/actions/runs/42726296593/job/129533377136">Nov 10 00:12</a> <a href="https://github.com/trinodb/trino/actions/runs/42206429177/job/127854725666">Nov 06 10:57</a> 
 test (plugin/trino-sqlserver)            |     2 | 1083 | 0.2% | 24m 28s   | ..............▃.............▃. | <a href="https://github.com/trinodb/trino/actions/runs/44428862952/job/135241361980">Nov 19 00:26</a> <a href="https://github.com/trinodb/trino/actions/runs/42020495041/job/127223288672">Nov 05 11:41</a> 
 pt (SuiteHmsOnly)                        |     2 | 1490 | 0.1% | 20m 53s   | .............▃......▃......... | <a href="https://github.com/trinodb/trino/actions/runs/42967602313/job/130350493983">Nov 11 05:49</a> <a href="https://github.com/trinodb/trino/actions/runs/41747690536/job/126308439058">Nov 04 00:42</a> 
 pt (SuiteHiveSpark)                      |     2 | 1310 | 0.2% | 16m 09s   | .▃.......................▃.... | <a href="https://github.com/trinodb/trino/actions/runs/43855044187/job/133260832967">Nov 16 11:15</a> <a href="https://github.com/trinodb/trino/actions/runs/39950234797/job/120406058078">Oct 23 12:10</a> 
 test (plugin/trino-elasticsearch)        |     2 | 1106 | 0.2% | 12m 02s   | ...........▃................▃. | <a href="https://github.com/trinodb/trino/actions/runs/44468153644/job/135371404799">Nov 19 05:54</a> <a href="https://github.com/trinodb/trino/actions/runs/41365932744/job/125026379882">Nov 02 00:14</a> 
(15 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/5ff0dc721288b2af0d3c69361fa4aa310e66b0f2/sql/tests/04-flaky-jobs.sql)

## Why CI jobs fail

Failed jobs of the `ci` workflow per week, by the cause in their error messages: █ tests (product test jobs included), ▓ compile errors and code checks, ▒ infrastructure (runners, downloads, containers), ░ timeouts, · other (mostly test jobs that failed without naming a test).
In pull requests most failures come from unfinished changes; in the merge queue and nightly runs the code already passed its checks, so failing tests there are flaky or broken. Jobs cancelled by a newer push or by another failed job are not counted, and the newest week is not complete.

<pre><code>
    Week    |       Runs of        | Failed runs | Failed jobs | Tests | Compile | Infra | Timeouts | Other |          Causes chart          
------------+----------------------+-------------+-------------+-------+---------+-------+----------+-------+--------------------------------
 2026-11-16 | merge queue, nightly |          29 |          29 | 62%   | 21%     | 10%   | 0%       | 7%    | ███████████████████▓▓▓▓▓▓▒▒▒·· 
 2026-11-16 | pull requests        |          82 |         341 | 12%   | 83%     | 2%    | 2%       | 1%    | ████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░ 
 2026-11-09 | merge queue, nightly |          40 |          46 | 89%   | 7%      | 2%    | 2%       | 0%    | ███████████████████████████▓▓░ 
 2026-11-09 | pull requests        |         126 |         592 | 23%   | 64%     | 1%    | 2%       | 10%   | ███████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░··· 
 2026-11-02 | merge queue, nightly |          25 |          32 | 84%   | 0%      | 9%    | 6%       | 0%    | █████████████████████████▒▒▒░░ 
 2026-11-02 | pull requests        |         111 |         396 | 15%   | 67%     | 0%    | 3%       | 15%   | █████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓····· 
 2026-10-26 | merge queue, nightly |          42 |          42 | 81%   | 2%      | 17%   | 0%       | 0%    | ████████████████████████▓▒▒▒▒▒ 
 2026-10-26 | pull requests        |         148 |         771 | 10%   | 79%     | 1%    | 1%       | 9%    | ███▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓··· 
 2026-10-19 | merge queue, nightly |          45 |          53 | 42%   | 0%      | 55%   | 4%       | 0%    | ████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░ 
 2026-10-19 | pull requests        |         138 |         580 | 10%   | 73%     | 5%    | 1%       | 10%   | ███▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒··· 
 2026-10-12 | merge queue, nightly |          38 |          42 | 83%   | 0%      | 5%    | 12%      | 0%    | █████████████████████████▒░░░░ 
 2026-10-12 | pull requests        |         100 |         265 | 32%   | 41%     | 2%    | 2%       | 22%   | ██████████▓▓▓▓▓▓▓▓▓▓▓▓▒······· 
 2026-10-05 | merge queue, nightly |          52 |          55 | 87%   | 2%      | 9%    | 2%       | 0%    | ██████████████████████████▓▒▒░ 
 2026-10-05 | pull requests        |         114 |         468 | 23%   | 48%     | 27%   | 2%       | 0%    | ███████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒░ 
 2026-09-28 | merge queue, nightly |          29 |          33 | 67%   | 0%      | 12%   | 18%      | 3%    | ████████████████████▒▒▒▒░░░░░· 
 2026-09-28 | pull requests        |         163 |         781 | 22%   | 66%     | 1%    | 2%       | 9%    | ██████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒··· 
 2026-09-21 | merge queue, nightly |          31 |          32 | 75%   | 0%      | 3%    | 19%      | 3%    | ███████████████████████░░░░░░· 
 2026-09-21 | pull requests        |         139 |         486 | 23%   | 51%     | 4%    | 6%       | 17%   | ███████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░····· 
 2026-09-14 | merge queue, nightly |         185 |         210 | 84%   | 9%      | 7%    | 0%       | 0%    | █████████████████████████▓▓▓▒▒ 
 2026-09-14 | pull requests        |         195 |        1468 | 12%   | 59%     | 6%    | 3%       | 20%   | ████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒░······ 
 2026-09-07 | merge queue, nightly |          95 |         159 | 45%   | 1%      | 50%   | 1%       | 4%    | █████████████▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒· 
 2026-09-07 | pull requests        |         156 |        1419 | 10%   | 43%     | 8%    | 1%       | 37%   | ███▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒░··········· 
 2026-08-31 | merge queue, nightly |          33 |          93 | 16%   | 0%      | 9%    | 3%       | 72%   | █████▒▒░······················ 
 2026-08-31 | pull requests        |         120 |         426 | 31%   | 52%     | 13%   | 3%       | 0%    | █████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒░ 
 2026-08-24 | merge queue, nightly |          46 |          60 | 57%   | 0%      | 38%   | 5%       | 0%    | █████████████████▒▒▒▒▒▒▒▒▒▒▒▒░ 
 2026-08-24 | pull requests        |         185 |         917 | 34%   | 41%     | 15%   | 3%       | 6%    | ██████████▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒░·· 
(26 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/5ff0dc721288b2af0d3c69361fa4aa310e66b0f2/sql/tests/05-failure-categories.sql)

Generated on Fri Nov 20 06:15:33 UTC 2026

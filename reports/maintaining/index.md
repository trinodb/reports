---
title: Maintaining Trino
---

## Open pull requests by who has to act next

Work from the top: the first three rows wait on maintainers and reviewers. Approved: the last verdict is an approval, and only approvers spoke after it. No response yet: nobody who reviews in this project commented or reviewed. Waiting on reviewers or on the author: who spoke or pushed last. CLA not signed: it can't be merged until the author signs.
The age columns count from when the pull request got into its state. Newcomers have no merged pull request yet. The stale bot closes pull requests 21 days after marking them stale, unless someone acts, and never closes those labeled stale-ignore. Bots' pull requests are not counted.

<table>
<thead>
<tr><th>State</th><th>Next step by</th><th style="text-align: right">Pull requests</th><th style="text-align: right">From newcomers</th><th style="text-align: right">Under 1 week</th><th style="text-align: right">1 to 4 weeks</th><th style="text-align: right">1 to 3 months</th><th style="text-align: right">3 to 12 months</th><th style="text-align: right">Over 1 year</th><th>Median wait</th><th style="text-align: right">Marked stale</th><th style="text-align: right">Labeled stale-ignore</th></tr>
</thead>
<tbody>
<tr><td>Approved, not merged</td><td>Maintainers</td><td style="text-align: right">41</td><td style="text-align: right">7</td><td style="text-align: right">13</td><td style="text-align: right">11</td><td style="text-align: right">5</td><td style="text-align: right">7</td><td style="text-align: right">5</td><td>17d 15h</td><td style="text-align: right">3</td><td style="text-align: right">9</td></tr>
<tr><td>No response yet</td><td>Reviewers</td><td style="text-align: right">49</td><td style="text-align: right">14</td><td style="text-align: right">7</td><td style="text-align: right">20</td><td style="text-align: right">12</td><td style="text-align: right">10</td><td style="text-align: right">0</td><td>23d 21h</td><td style="text-align: right">8</td><td style="text-align: right">7</td></tr>
<tr><td>Author replied, waiting on reviewers</td><td>Reviewers</td><td style="text-align: right">63</td><td style="text-align: right">21</td><td style="text-align: right">8</td><td style="text-align: right">11</td><td style="text-align: right">26</td><td style="text-align: right">10</td><td style="text-align: right">8</td><td>49d 4h</td><td style="text-align: right">12</td><td style="text-align: right">22</td></tr>
<tr><td>Reviewer replied, waiting on the author</td><td>Author</td><td style="text-align: right">61</td><td style="text-align: right">12</td><td style="text-align: right">11</td><td style="text-align: right">12</td><td style="text-align: right">12</td><td style="text-align: right">9</td><td style="text-align: right">17</td><td>44d 23h</td><td style="text-align: right">11</td><td style="text-align: right">33</td></tr>
<tr><td>CLA not signed</td><td>Author</td><td style="text-align: right">48</td><td style="text-align: right">48</td><td style="text-align: right">10</td><td style="text-align: right">28</td><td style="text-align: right">9</td><td style="text-align: right">0</td><td style="text-align: right">1</td><td>16d 2h</td><td style="text-align: right">6</td><td style="text-align: right">1</td></tr>
<tr><td>Draft</td><td>Author</td><td style="text-align: right">36</td><td style="text-align: right">7</td><td style="text-align: right">10</td><td style="text-align: right">14</td><td style="text-align: right">7</td><td style="text-align: right">4</td><td style="text-align: right">1</td><td>16d 17h</td><td style="text-align: right">9</td><td style="text-align: right">11</td></tr>
<tr><td>All open pull requests</td><td></td><td style="text-align: right">298</td><td style="text-align: right">109</td><td style="text-align: right">59</td><td style="text-align: right">96</td><td style="text-align: right">71</td><td style="text-align: right">40</td><td style="text-align: right">32</td><td>25d 6h</td><td style="text-align: right">49</td><td style="text-align: right">83</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/c1a59d49140c985e9daa31737b2647bd9102da87/sql/maintaining/01-triage.sql)

## First pull requests without any response

Pull requests of people with no merged pull request yet, with a signed CLA, that no one who reviews in this project has commented on or reviewed. Newcomers whose first pull request gets no response open another one less often than those who get one, so reply here first, even if only to say who will review it.
Marked stale: the stale bot closes it 21 days after marking it, unless someone acts.

<table>
<thead>
<tr><th>Pull request</th><th>Title</th><th>Author</th><th style="text-align: right">Days waiting</th><th>Size</th><th>Areas</th><th>Requested reviewers</th><th>Stale bot</th></tr>
</thead>
<tbody>
<tr><td><a href="https://github.com/trinodb/trino/pull/30024">#30024</a></td><td>Store authenticated OAuth2 access token in session extra credentials</td><td><a href="https://github.com/louis-pie">louis-pie</a></td><td style="text-align: right">142</td><td>M</td><td>docs</td><td>electrum, dain</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30436">#30436</a></td><td>Add cache to ldap group provider (issue #29134)</td><td><a href="https://github.com/mwullink">mwullink</a></td><td style="text-align: right">112</td><td>M</td><td>docs</td><td>gertjanal, ebyhr</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30681">#30681</a></td><td>Add scaffolding for Couchbase connector</td><td><a href="https://github.com/chedim">chedim</a></td><td style="text-align: right">92</td><td>XL</td><td></td><td>findepi, electrum</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30688">#30688</a></td><td>Resolve secrets in S3 security mapping JSON</td><td><a href="https://github.com/schjan79">schjan79</a></td><td style="text-align: right">92</td><td>M</td><td></td><td>electrum, wendigo</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30707">#30707</a></td><td>Add ExtraCredentialsProvider SPI for server-side per-user credentials</td><td><a href="https://github.com/PascalThesing">PascalThesing</a></td><td style="text-align: right">91</td><td>XL</td><td>docs</td><td>dain</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30824">#30824</a></td><td>Skip Dependabot PRs for secrets-requiring test jobs</td><td><a href="https://github.com/zhang-arvin">zhang-arvin</a></td><td style="text-align: right">85</td><td>S</td><td></td><td></td><td>marked stale</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30864">#30864</a></td><td>Propagate Hudi split loader failures from isFinished</td><td><a href="https://github.com/slachiewicz">slachiewicz</a></td><td style="text-align: right">82</td><td>M</td><td>hudi</td><td></td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31036">#31036</a></td><td>Clarify UDF access in file-based access control docs</td><td><a href="https://github.com/mommo-codes">mommo-codes</a></td><td style="text-align: right">66</td><td>S</td><td>docs</td><td>dain</td><td>marked stale</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31463">#31463</a></td><td>Add JWT groups-field to map a token claim to user groups</td><td><a href="https://github.com/vinzee">vinzee</a></td><td style="text-align: right">37</td><td>M</td><td>docs</td><td></td><td>marked stale</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31687">#31687</a></td><td>Remove unused argument from ANTLR grammar's predicate rule</td><td><a href="https://github.com/BobDu">BobDu</a></td><td style="text-align: right">23</td><td>S</td><td></td><td>martint, kasiafi</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31907">#31907</a></td><td>Fix bloom filter pruning of signed zeros</td><td><a href="https://github.com/wombatu-kun">wombatu-kun</a></td><td style="text-align: right">14</td><td>M</td><td></td><td></td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31909">#31909</a></td><td>Fix query failure on unsigned Parquet integers</td><td><a href="https://github.com/wombatu-kun">wombatu-kun</a></td><td style="text-align: right">13</td><td>M</td><td></td><td></td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31949">#31949</a></td><td>Fix pruning of decimal over Parquet integer column</td><td><a href="https://github.com/wombatu-kun">wombatu-kun</a></td><td style="text-align: right">11</td><td>M</td><td>hive</td><td></td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/32110">#32110</a></td><td>Add Iceberg REST remote signing for S3</td><td><a href="https://github.com/baptistegh">baptistegh</a></td><td style="text-align: right">0</td><td>XL</td><td>docs, iceberg</td><td></td><td></td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/c1a59d49140c985e9daa31737b2647bd9102da87/sql/maintaining/02-newcomers-without-response.sql)

## Approved, not merged

Pull requests whose last verdict is an approval, where only the approvers spoke after it. Those approved by a maintainer come first, then the oldest approval. If a maintainer approved, merge it or say what is missing; if not, a maintainer has to review it.
Check that the author answered all comments and that CI passed. Bots' pull requests are not included.

<table>
<thead>
<tr><th>Pull request</th><th>Title</th><th>Author</th><th style="text-align: right">Days since approval</th><th>Approved by maintainers</th><th>Approved by others</th><th>Acted last</th><th>Size</th><th>Areas</th><th>Stale bot</th></tr>
</thead>
<tbody>
<tr><td><a href="https://github.com/trinodb/trino/pull/22519">#22519</a></td><td>Enable JDBC statistics cache by default</td><td><a href="https://github.com/raunaqmorarka">raunaqmorarka</a></td><td style="text-align: right">868</td><td>hashhar, findepi</td><td></td><td>author</td><td>M</td><td>docs, postgresql, sqlserver</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/18457">#18457</a></td><td>Use Aircompressor in Avro library code</td><td><a href="https://github.com/jklamer">jklamer</a></td><td style="text-align: right">770</td><td>wendigo</td><td></td><td>author</td><td>L</td><td>hudi, iceberg, hive</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/19365">#19365</a></td><td>Load default Java truststore for --use-system-truststore</td><td><a href="https://github.com/oneonestar">oneonestar</a></td><td style="text-align: right">695</td><td>electrum</td><td></td><td>author</td><td>S</td><td></td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/25968">#25968</a></td><td>Remove Teradata functions plugin from binaries</td><td><a href="https://github.com/mosabua">mosabua</a></td><td style="text-align: right">475</td><td>electrum</td><td></td><td>author</td><td>S</td><td>docs</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/27666">#27666</a></td><td>Minor improvement for Iceberg S3 Tables</td><td><a href="https://github.com/ebyhr">ebyhr</a></td><td style="text-align: right">326</td><td>findepi, chenjian2664</td><td></td><td>reviewer</td><td>M</td><td>iceberg</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/29207">#29207</a></td><td>Add support for customer-supplied encryption keys (CSEK) to the GCS fi</td><td><a href="https://github.com/kaveti">kaveti</a></td><td style="text-align: right">127</td><td>wendigo</td><td>findinpath</td><td>author</td><td>L</td><td>docs, iceberg</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30838">#30838</a></td><td>Cancel Redshift UNLOAD statement when split source is closed</td><td><a href="https://github.com/jayceslesar">jayceslesar</a></td><td style="text-align: right">71</td><td>findepi, ebyhr</td><td></td><td>reviewer</td><td>M</td><td>redshift</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30875">#30875</a></td><td>Add file-based access control for table procedures</td><td><a href="https://github.com/hashhar">hashhar</a></td><td style="text-align: right">38</td><td>kokosing</td><td></td><td>reviewer</td><td>M</td><td>docs</td><td>marked stale</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31693">#31693</a></td><td>Close HTTP responses when local redirects are rejected</td><td><a href="https://github.com/fallintoplace">fallintoplace</a></td><td style="text-align: right">23</td><td>wendigo</td><td></td><td>author</td><td>S</td><td></td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31786">#31786</a></td><td>Add backoff between JUnit flaky test retries</td><td><a href="https://github.com/bvolpato">bvolpato</a></td><td style="text-align: right">17</td><td>findepi</td><td></td><td>author</td><td>M</td><td></td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31866">#31866</a></td><td>Fix flaky materialized view rename test</td><td><a href="https://github.com/ksobolew">ksobolew</a></td><td style="text-align: right">15</td><td>findepi</td><td></td><td>reviewer</td><td>XS</td><td></td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30891">#30891</a></td><td>Support REST catalog server-side scan planning in loadTable</td><td><a href="https://github.com/JohnEarle">JohnEarle</a></td><td style="text-align: right">14</td><td>chenjian2664</td><td>JohnFitzpatrick44</td><td>author</td><td>M</td><td>iceberg</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31893">#31893</a></td><td>Fix TPC-H partitioning during worker changes</td><td><a href="https://github.com/wendigo">wendigo</a></td><td style="text-align: right">14</td><td>raunaqmorarka</td><td></td><td>author</td><td>M</td><td></td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31509">#31509</a></td><td>Treat now() as a current time function in materialized views</td><td><a href="https://github.com/okayhooni">okayhooni</a></td><td style="text-align: right">10</td><td>hashhar</td><td>findinpath</td><td>reviewer</td><td>M</td><td>iceberg</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31537">#31537</a></td><td>Fix language function leak on workers</td><td><a href="https://github.com/hqbhoho">hqbhoho</a></td><td style="text-align: right">9</td><td>electrum</td><td></td><td>author</td><td>M</td><td></td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30977">#30977</a></td><td>Use table schema when reading Iceberg branches</td><td><a href="https://github.com/stefan-toubia">stefan-toubia</a></td><td style="text-align: right">5</td><td>raunaqmorarka</td><td></td><td>reviewer</td><td>M</td><td>docs, iceberg</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31718">#31718</a></td><td>Optimize decimal and temporal JSON encoding</td><td><a href="https://github.com/wendigo">wendigo</a></td><td style="text-align: right">4</td><td>raunaqmorarka</td><td></td><td>author</td><td>L</td><td></td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/32028">#32028</a></td><td>Keep Iceberg and Hive split generation spans in query trace</td><td><a href="https://github.com/jiwen624">jiwen624</a></td><td style="text-align: right">4</td><td>wendigo</td><td></td><td>author</td><td></td><td>iceberg, hive</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/32000">#32000</a></td><td>Add agent mode to Trino CLI</td><td><a href="https://github.com/wendigo">wendigo</a></td><td style="text-align: right">4</td><td>raunaqmorarka</td><td></td><td>reviewer</td><td>XL</td><td>docs</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31389">#31389</a></td><td>Fix stats failure for IN with constant value and item</td><td><a href="https://github.com/jiwen624">jiwen624</a></td><td style="text-align: right">3</td><td>raunaqmorarka</td><td></td><td>reviewer</td><td>M</td><td></td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/32007">#32007</a></td><td>Add columnar scalar function implementations</td><td><a href="https://github.com/wendigo">wendigo</a></td><td style="text-align: right">3</td><td>electrum</td><td></td><td>author</td><td>XL</td><td>docs</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/32066">#32066</a></td><td>Enforce Guava immutable collections in plugin toolkit</td><td><a href="https://github.com/kokosing">kokosing</a></td><td style="text-align: right">2</td><td>wendigo, findepi</td><td></td><td>author</td><td>M</td><td></td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/32080">#32080</a></td><td>Avoid beginning table writes in EXPLAIN</td><td><a href="https://github.com/maswin">maswin</a></td><td style="text-align: right">0</td><td>raunaqmorarka</td><td></td><td>author</td><td>M</td><td>iceberg</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/32107">#32107</a></td><td>Omit time distributions from summarized task info</td><td><a href="https://github.com/raunaqmorarka">raunaqmorarka</a></td><td style="text-align: right">0</td><td>wendigo</td><td></td><td>author</td><td>S</td><td></td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30596">#30596</a></td><td>Derive scan constraints from filters above projections</td><td><a href="https://github.com/guyco33">guyco33</a></td><td style="text-align: right">0</td><td>martint</td><td></td><td>author</td><td>XL</td><td>iceberg, hive</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/32113">#32113</a></td><td>Compute Parquet writer retained size per page</td><td><a href="https://github.com/wendigo">wendigo</a></td><td style="text-align: right">0</td><td>raunaqmorarka</td><td></td><td>reviewer</td><td>S</td><td></td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/32116">#32116</a></td><td>Refactor delta table handles to use table type enum</td><td><a href="https://github.com/JohnFitzpatrick44">JohnFitzpatrick44</a></td><td style="text-align: right">0</td><td>chenjian2664</td><td></td><td>reviewer</td><td>M</td><td>delta-lake</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/21027">#21027</a></td><td>Add client option to disable following redirects</td><td><a href="https://github.com/alprusty">alprusty</a></td><td style="text-align: right">940</td><td>none</td><td>oneonestar</td><td>author</td><td>M</td><td>docs, jdbc</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/26702">#26702</a></td><td>Fix 'IS NOT DISTINCT FROM' not working in JOIN when nulls are used</td><td><a href="https://github.com/codluca">codluca</a></td><td style="text-align: right">281</td><td>none</td><td>kasiafi</td><td>reviewer</td><td>M</td><td></td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/27922">#27922</a></td><td>Support region, endpoint, and cross-region access from Iceberg REST ca</td><td><a href="https://github.com/kaveti">kaveti</a></td><td style="text-align: right">260</td><td>none</td><td>kekwan</td><td>author</td><td>XL</td><td>5 areas</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/28793">#28793</a></td><td>Support vended SSE encryption keys from Iceberg REST catalog</td><td><a href="https://github.com/kaveti">kaveti</a></td><td style="text-align: right">205</td><td>none</td><td>findinpath</td><td>author</td><td>XL</td><td>docs, iceberg</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/27830">#27830</a></td><td>Enable Kafka Transport for OpenLineage Event Listener </td><td><a href="https://github.com/kekwan">kekwan</a></td><td style="text-align: right">114</td><td>none</td><td>mgorsk1, dolfinus, kaveti</td><td>reviewer</td><td>L</td><td>docs</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30402">#30402</a></td><td>Add register_view procedure to Iceberg connector</td><td><a href="https://github.com/bbreak">bbreak</a></td><td style="text-align: right">93</td><td>none</td><td>findinpath</td><td>author</td><td>L</td><td>docs, iceberg</td><td>marked stale</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30911">#30911</a></td><td>Fix the Web UI authentication status endpoint incorrectly reporting JW</td><td><a href="https://github.com/a-narsudinov">a-narsudinov</a></td><td style="text-align: right">77</td><td>none</td><td>koszti</td><td>author</td><td>S</td><td></td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30330">#30330</a></td><td>Restore Hive HTTP/HTTPS Thrift metastore support</td><td><a href="https://github.com/niteshy">niteshy</a></td><td style="text-align: right">34</td><td>none</td><td>findinpath</td><td>author</td><td>XL</td><td>docs, hudi, hive</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31313">#31313</a></td><td>Add query queue position to query info and web ui</td><td><a href="https://github.com/gertjanal">gertjanal</a></td><td style="text-align: right">28</td><td>none</td><td>RoeyoOgen, koszti</td><td>author</td><td>M</td><td>ui</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30691">#30691</a></td><td>Make paths relative in the Trino Web UI to support path-based reverse </td><td><a href="https://github.com/jhatcher1">jhatcher1</a></td><td style="text-align: right">27</td><td>none</td><td>koszti</td><td>author</td><td>M</td><td>ui</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31695">#31695</a></td><td>Fix CLI Markdown widths for supplementary Unicode characters</td><td><a href="https://github.com/fallintoplace">fallintoplace</a></td><td style="text-align: right">23</td><td>none</td><td>nineinchnick, utafrali</td><td>author</td><td>S</td><td></td><td>marked stale</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31643">#31643</a></td><td>Add read support for encrypted deletion vectors (DVs) in the Iceberg c</td><td><a href="https://github.com/tbaeg">tbaeg</a></td><td style="text-align: right">17</td><td>none</td><td>findinpath</td><td>author</td><td>L</td><td>iceberg</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31774">#31774</a></td><td>Migrate Faker and BlackHole views to SaveMode</td><td><a href="https://github.com/nanjeshramesh">nanjeshramesh</a></td><td style="text-align: right">13</td><td>none</td><td>nineinchnick</td><td>author</td><td>M</td><td>blackhole, faker</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31999">#31999</a></td><td>Expose bounded fault-tolerant scheduling wait diagnostics</td><td><a href="https://github.com/zhangxinyao88">zhangxinyao88</a></td><td style="text-align: right">6</td><td>none</td><td>p3tr0sz</td><td>author</td><td>M</td><td></td><td></td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/c1a59d49140c985e9daa31737b2647bd9102da87/sql/maintaining/03-approved-not-merged.sql)

## Waiting on reviewers: pick from the top

Pull requests where the next step is a review: nobody reviewed them yet, or the author replied or pushed after the last review. Days waiting count from that reply. Newcomers' first pull requests without a response are listed above.
First come authors with fewer than 10 merged pull requests whose pull request the stale bot already marked, because it will close it although the author is not the one who has to act; then their other pull requests; then everyone else's. The longest wait comes first in each group. Pull requests labeled stale-ignore come last.

<table>
<thead>
<tr><th>Pull request</th><th>Title</th><th>Author</th><th>Author has</th><th style="text-align: right">Days waiting</th><th>State</th><th>Size</th><th>Requested reviewers</th><th>Areas</th><th>Stale bot</th></tr>
</thead>
<tbody>
<tr><td><a href="https://github.com/trinodb/trino/pull/30602">#30602</a></td><td>Always write compression codec to Iceberg table metadata</td><td><a href="https://github.com/bbreak">bbreak</a></td><td>1-9 merged PRs</td><td style="text-align: right">99</td><td>no response yet</td><td>M</td><td>pettyjamesm, SongChujun, ebyhr</td><td>iceberg, lakehouse</td><td>marked stale</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30421">#30421</a></td><td>Add Array type support to ClickHouse connector</td><td><a href="https://github.com/wonju-dev">wonju-dev</a></td><td>no merged PRs yet</td><td style="text-align: right">77</td><td>author replied</td><td>L</td><td>krvikash</td><td>docs, clickhouse</td><td>marked stale</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31112">#31112</a></td><td>Fix width_bucket arithmetic overflow</td><td><a href="https://github.com/laserninja">laserninja</a></td><td>1-9 merged PRs</td><td style="text-align: right">61</td><td>no response yet</td><td>S</td><td>findepi</td><td></td><td>marked stale</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31042">#31042</a></td><td>Prevent CREATE TABLE over an existing view</td><td><a href="https://github.com/Yash-Ambekar">Yash-Ambekar</a></td><td>no merged PRs yet</td><td style="text-align: right">49</td><td>author replied</td><td>M</td><td></td><td>iceberg, faker</td><td>marked stale</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31350">#31350</a></td><td>Fix reading decimals stored at a higher scale</td><td><a href="https://github.com/wgzhao">wgzhao</a></td><td>1-9 merged PRs</td><td style="text-align: right">46</td><td>no response yet</td><td>M</td><td>losipiuk, dain</td><td>hive</td><td>marked stale</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31348">#31348</a></td><td>Drop ClickHouse partitions with a table procedure</td><td><a href="https://github.com/wgzhao">wgzhao</a></td><td>1-9 merged PRs</td><td style="text-align: right">37</td><td>author replied</td><td>M</td><td></td><td>docs, clickhouse</td><td>marked stale</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30797">#30797</a></td><td>Refine EXTRACT function return type resolution</td><td><a href="https://github.com/zhang-arvin">zhang-arvin</a></td><td>no merged PRs yet</td><td style="text-align: right">35</td><td>author replied</td><td>XL</td><td></td><td></td><td>marked stale</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/29166">#29166</a></td><td>Preserve Iceberg table privileges on metastore commits</td><td><a href="https://github.com/laserninja">laserninja</a></td><td>1-9 merged PRs</td><td style="text-align: right">35</td><td>author replied</td><td>M</td><td></td><td>iceberg</td><td>marked stale</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31702">#31702</a></td><td>Add array_is_sorted function</td><td><a href="https://github.com/fallintoplace">fallintoplace</a></td><td>1-9 merged PRs</td><td style="text-align: right">22</td><td>author replied</td><td>M</td><td></td><td>docs</td><td>marked stale</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/28958">#28958</a></td><td>Add copy-on-write mode for Iceberg row-level DELETE, UPDATE, and MERGE</td><td><a href="https://github.com/kaveti">kaveti</a></td><td>1-9 merged PRs</td><td style="text-align: right">207</td><td>author replied</td><td>XL</td><td>electrum, findinpath, dain, xkrogen, hashhar, jackye1995</td><td>docs, iceberg, lakehouse</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30677">#30677</a></td><td>Add custom headers in gcs read for audit purpose</td><td><a href="https://github.com/Abhijeetsng97">Abhijeetsng97</a></td><td>no merged PRs yet</td><td style="text-align: right">91</td><td>author replied</td><td>M</td><td></td><td>docs</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30545">#30545</a></td><td>Fix Parquet predicate on a type-mismatched column</td><td><a href="https://github.com/wombatu-kun">wombatu-kun</a></td><td>no merged PRs yet</td><td style="text-align: right">83</td><td>author replied</td><td>XL</td><td>Praveen2112, raunaqmorarka</td><td>hive</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30881">#30881</a></td><td>Resolve Pinot server host from instance config</td><td><a href="https://github.com/xiangfu0">xiangfu0</a></td><td>1-9 merged PRs</td><td style="text-align: right">79</td><td>no response yet</td><td>L</td><td>wendigo, electrum</td><td>docs, pinot</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30781">#30781</a></td><td>Add Teradata connector</td><td><a href="https://github.com/sc250072">sc250072</a></td><td>no merged PRs yet</td><td style="text-align: right">65</td><td>author replied</td><td>XL</td><td>electrum, findepi, chenjian2664, ssheikin</td><td>docs</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/28962">#28962</a></td><td>Add view redirection support for Iceberg connector</td><td><a href="https://github.com/kaveti">kaveti</a></td><td>1-9 merged PRs</td><td style="text-align: right">58</td><td>author replied</td><td>XL</td><td>chenjian2664, findepi, electrum, martint, liianghuang, soooojinlee</td><td>4 areas</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31235">#31235</a></td><td>Allow S3 security mappings to set client options</td><td><a href="https://github.com/kaveti">kaveti</a></td><td>1-9 merged PRs</td><td style="text-align: right">55</td><td>no response yet</td><td>XL</td><td>0eu, wendigo, findinpath, krvikash, Praveen2112</td><td>docs</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30682">#30682</a></td><td>Move Hudi connector implementation to org.apache.hudi:hudi-trino</td><td><a href="https://github.com/voonhous">voonhous</a></td><td>no merged PRs yet</td><td style="text-align: right">55</td><td>author replied</td><td>XL</td><td>electrum, chenjian2664, findinpath</td><td>hudi, lakehouse</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/29954">#29954</a></td><td>Add support for DateTime64(precision[, timezone]) in ClickHouse</td><td><a href="https://github.com/k3rnL">k3rnL</a></td><td>no merged PRs yet</td><td style="text-align: right">45</td><td>author replied</td><td>M</td><td>chenjian2664, Praveen2112</td><td>docs, clickhouse</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31208">#31208</a></td><td>Add start and end values to query periods</td><td><a href="https://github.com/lovasoa">lovasoa</a></td><td>no merged PRs yet</td><td style="text-align: right">42</td><td>author replied</td><td>M</td><td>martint</td><td>docs</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30973">#30973</a></td><td>Prevent query failure after transaction commit starts</td><td><a href="https://github.com/BackendArchitectX">BackendArchitectX</a></td><td>no merged PRs yet</td><td style="text-align: right">36</td><td>author replied</td><td>XL</td><td>dain, electrum</td><td>hive</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31015">#31015</a></td><td>Support PostgreSQL in DB session property manager</td><td><a href="https://github.com/RoeyoOgen">RoeyoOgen</a></td><td>no merged PRs yet</td><td style="text-align: right">25</td><td>author replied</td><td>XL</td><td>electrum, mosabua, vishalya, Chaho12, andythsu</td><td>docs</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31691">#31691</a></td><td>Fix legacy day-time interval decimal separator parsing</td><td><a href="https://github.com/fallintoplace">fallintoplace</a></td><td>1-9 merged PRs</td><td style="text-align: right">23</td><td>no response yet</td><td>S</td><td></td><td></td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31692">#31692</a></td><td>Cap HTTP event listener first retry delay</td><td><a href="https://github.com/fallintoplace">fallintoplace</a></td><td>1-9 merged PRs</td><td style="text-align: right">23</td><td>no response yet</td><td>S</td><td></td><td></td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31721">#31721</a></td><td>[WIP] Add Arrow IPC encoding to spooling protocol</td><td><a href="https://github.com/choseungyoon">choseungyoon</a></td><td>1-9 merged PRs</td><td style="text-align: right">22</td><td>no response yet</td><td>L</td><td></td><td>docs</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31727">#31727</a></td><td>Migrate Hive view creation to SaveMode</td><td><a href="https://github.com/nanjeshramesh">nanjeshramesh</a></td><td>1-9 merged PRs</td><td style="text-align: right">22</td><td>no response yet</td><td>S</td><td></td><td>4 areas</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31762">#31762</a></td><td>Support writing unknown type in Iceberg</td><td><a href="https://github.com/zhangxinyao88">zhangxinyao88</a></td><td>1-9 merged PRs</td><td style="text-align: right">20</td><td>no response yet</td><td>L</td><td>ebyhr</td><td>docs, iceberg</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31830">#31830</a></td><td>Allow multiple input files for CLI execution</td><td><a href="https://github.com/dedyoc">dedyoc</a></td><td>1-9 merged PRs</td><td style="text-align: right">16</td><td>no response yet</td><td>M</td><td>wendigo</td><td>docs</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31870">#31870</a></td><td>Report oversized join hashes as insufficient resources</td><td><a href="https://github.com/jalpan-randeri">jalpan-randeri</a></td><td>1-9 merged PRs</td><td style="text-align: right">15</td><td>no response yet</td><td>S</td><td>findepi</td><td></td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31896">#31896</a></td><td>Fail on exceptions in Pinot gRPC metadata block</td><td><a href="https://github.com/nanjeshramesh">nanjeshramesh</a></td><td>1-9 merged PRs</td><td style="text-align: right">14</td><td>no response yet</td><td>M</td><td></td><td>pinot</td><td></td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/31918">#31918</a></td><td>Read Iceberg partition statistics for row counts</td><td><a href="https://github.com/sdaberdaku">sdaberdaku</a></td><td>1-9 merged PRs</td><td style="text-align: right">13</td><td>no response yet</td><td>XL</td><td></td><td>docs, iceberg, lakehouse</td><td></td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/c1a59d49140c985e9daa31737b2647bd9102da87/sql/maintaining/04-waiting-on-reviewers.sql)

## Waiting on the author for over 4 weeks

Pull requests where a reviewer spoke last, the CLA is not signed, or the draft has not changed, for over 4 weeks, oldest first. Ping the author, offer to take the pull request over, or close it.
The stale bot closes inactive pull requests by itself, but never those labeled stale-ignore, so most of the oldest ones here are kept open on purpose: decide if they still should be.

<table>
<thead>
<tr><th>Pull request</th><th>Title</th><th>Author</th><th>State</th><th style="text-align: right">Days waiting</th><th>Last reviewer</th><th>Size</th><th>Stale bot</th></tr>
</thead>
<tbody>
<tr><td><a href="https://github.com/trinodb/trino/pull/19161">#19161</a></td><td>Reintroduce HiveTableRedirectionsProvider interface</td><td><a href="https://github.com/architgyl">architgyl</a></td><td>reviewer replied</td><td style="text-align: right">1119</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>M</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/20203">#20203</a></td><td>Add timestamp with tz to JSON cast</td><td><a href="https://github.com/CapCaWork">CapCaWork</a></td><td>reviewer replied</td><td style="text-align: right">1036</td><td><a href="https://github.com/findepi">findepi</a></td><td>M</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/15288">#15288</a></td><td>Add a new optimization rule: query fusion</td><td><a href="https://github.com/weiatwork">weiatwork</a></td><td>reviewer replied</td><td style="text-align: right">1036</td><td><a href="https://github.com/SongChujun">SongChujun</a></td><td>XL</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/16558">#16558</a></td><td>add header authentication support for the web-ui</td><td><a href="https://github.com/kenandominic">kenandominic</a></td><td>reviewer replied</td><td style="text-align: right">996</td><td><a href="https://github.com/Chaho12">Chaho12</a></td><td>S</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/21243">#21243</a></td><td>include null audience only if no additional audiences configured</td><td><a href="https://github.com/PratikDeshpande">PratikDeshpande</a></td><td>CLA not signed</td><td style="text-align: right">962</td><td></td><td>XS</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/17288">#17288</a></td><td>Fill TupleDomain and expression in Constraint passed to ConnectorSplit</td><td><a href="https://github.com/findepi">findepi</a></td><td>reviewer replied</td><td style="text-align: right">951</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>S</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/21060">#21060</a></td><td>Add writer and scale writer stats</td><td><a href="https://github.com/gaurav8297">gaurav8297</a></td><td>reviewer replied</td><td style="text-align: right">947</td><td><a href="https://github.com/sopel39">sopel39</a></td><td>M</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/21196">#21196</a></td><td>Use only single-parameter argument conventions</td><td><a href="https://github.com/kasiafi">kasiafi</a></td><td>reviewer replied</td><td style="text-align: right">920</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>S</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/21558">#21558</a></td><td>Fix table function execution without partitioning (v2)</td><td><a href="https://github.com/findepi">findepi</a></td><td>reviewer replied</td><td style="text-align: right">896</td><td><a href="https://github.com/tbaeg">tbaeg</a></td><td>M</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/21892">#21892</a></td><td>Allow complex expression rewrites with approximate numeric constant</td><td><a href="https://github.com/Praveen2112">Praveen2112</a></td><td>reviewer replied</td><td style="text-align: right">861</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>M</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/23206">#23206</a></td><td>Adaptive broadcast to partitioned</td><td><a href="https://github.com/gaurav8297">gaurav8297</a></td><td>reviewer replied</td><td style="text-align: right">773</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>L</td><td>marked stale</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/12369">#12369</a></td><td>Write statistics to ORC file for TINYINT</td><td><a href="https://github.com/oneonestar">oneonestar</a></td><td>reviewer replied</td><td style="text-align: right">765</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>S</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/23619">#23619</a></td><td>Support setting content md5 to validate upload content</td><td><a href="https://github.com/zhaner08">zhaner08</a></td><td>reviewer replied</td><td style="text-align: right">744</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>S</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/24616">#24616</a></td><td>Add like_regex predicate to JSON path</td><td><a href="https://github.com/piotrrzysko">piotrrzysko</a></td><td>reviewer replied</td><td style="text-align: right">653</td><td><a href="https://github.com/wendigo">wendigo</a></td><td>XL</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/21550">#21550</a></td><td>Add declared decomposition to aggregate functions</td><td><a href="https://github.com/dain">dain</a></td><td>reviewer replied</td><td style="text-align: right">632</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>XL</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/25276">#25276</a></td><td>Add map literal syntax</td><td><a href="https://github.com/dain">dain</a></td><td>reviewer replied</td><td style="text-align: right">609</td><td><a href="https://github.com/findepi">findepi</a></td><td>M</td><td>marked stale</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/25009">#25009</a></td><td>Use bloom filters to collect large DFs</td><td><a href="https://github.com/raunaqmorarka">raunaqmorarka</a></td><td>draft</td><td style="text-align: right">597</td><td></td><td>XL</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/25259">#25259</a></td><td>Add support for PostgreSQL `::` style casts</td><td><a href="https://github.com/dain">dain</a></td><td>reviewer replied</td><td style="text-align: right">518</td><td><a href="https://github.com/findepi">findepi</a></td><td>S</td><td>marked stale</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/25961">#25961</a></td><td>JDBC fetch size</td><td><a href="https://github.com/wendigo">wendigo</a></td><td>reviewer replied</td><td style="text-align: right">397</td><td><a href="https://github.com/chenjian2664">chenjian2664</a></td><td>S</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/25735">#25735</a></td><td>Switch documentation theme to immaterial (w/ support for dark mode)</td><td><a href="https://github.com/kumiDa">kumiDa</a></td><td>reviewer replied</td><td style="text-align: right">321</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>M</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/27026">#27026</a></td><td>Support Iceberg Identifier fields</td><td><a href="https://github.com/7hong">7hong</a></td><td>reviewer replied</td><td style="text-align: right">319</td><td><a href="https://github.com/raunaqmorarka">raunaqmorarka</a></td><td>M</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/28782">#28782</a></td><td>Coerce NUMBER to DOUBLE</td><td><a href="https://github.com/findepi">findepi</a></td><td>draft</td><td style="text-align: right">237</td><td></td><td>S</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/28811">#28811</a></td><td>Parquet reader - avoid redundant dictionary reads</td><td><a href="https://github.com/ShubhamChaurasia">ShubhamChaurasia</a></td><td>reviewer replied</td><td style="text-align: right">232</td><td><a href="https://github.com/raunaqmorarka">raunaqmorarka</a></td><td>L</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/28917">#28917</a></td><td>Retain precision when casting JSON number to VARCHAR</td><td><a href="https://github.com/findepi">findepi</a></td><td>draft</td><td style="text-align: right">205</td><td></td><td>M</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/28791">#28791</a></td><td>Prefer the most specific function overload during coercion</td><td><a href="https://github.com/dain">dain</a></td><td>reviewer replied</td><td style="text-align: right">205</td><td><a href="https://github.com/martint">martint</a></td><td>L</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/29758">#29758</a></td><td>Allow OAuth2 authenticated user tokens to be used with Iceberg REST ca</td><td><a href="https://github.com/louis-pie">louis-pie</a></td><td>draft</td><td style="text-align: right">142</td><td></td><td>XL</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30182">#30182</a></td><td>Support NFS-backed table storage for local/file:// filesystem</td><td><a href="https://github.com/wendigo">wendigo</a></td><td>reviewer replied</td><td style="text-align: right">133</td><td><a href="https://github.com/findepi">findepi</a></td><td>L</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30113">#30113</a></td><td>Convert SQL examples to interactive trysql.io ones</td><td><a href="https://github.com/wendigo">wendigo</a></td><td>reviewer replied</td><td style="text-align: right">133</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>XL</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30289">#30289</a></td><td>Dissolve boolean CASE/COALESCE</td><td><a href="https://github.com/wendigo">wendigo</a></td><td>reviewer replied</td><td style="text-align: right">122</td><td><a href="https://github.com/findepi">findepi</a></td><td>L</td><td>stale-ignore</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/pull/30292">#30292</a></td><td>Search flat hash control bytes with the Vector API</td><td><a href="https://github.com/wendigo">wendigo</a></td><td>draft</td><td style="text-align: right">112</td><td></td><td>L</td><td>stale-ignore</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/c1a59d49140c985e9daa31737b2647bd9102da87/sql/maintaining/05-waiting-on-author.sql)

## Review requests and review load per person

Open, non-draft pull requests that request a review from each person, and how many pull requests they reviewed in the last 90 days. Waiting on you counts the requests where the next step is a review; find yours, and if someone has many more requests than reviews, ask others to take some over.
GitHub drops a request once the person reviews, so old requests mean nobody answered them. Team requests are not counted. All maintainers are listed, and others with open requests.

<table>
<thead>
<tr><th>Reviewer</th><th>Role</th><th style="text-align: right">Waiting on you</th><th style="text-align: right">All open requests</th><th style="text-align: right">Longest wait in days</th><th style="text-align: right">Reviewed PRs, last 90 days</th><th>Change</th><th>Reviewed PRs</th></tr>
</thead>
<tbody>
<tr><td><a href="https://github.com/dain">dain</a></td><td>maintainer</td><td style="text-align: right">25</td><td style="text-align: right">29</td><td style="text-align: right">940</td><td style="text-align: right">20</td><td>▼ -39%</td><td>█</td></tr>
<tr><td><a href="https://github.com/electrum">electrum</a></td><td>maintainer</td><td style="text-align: right">24</td><td style="text-align: right">33</td><td style="text-align: right">940</td><td style="text-align: right">21</td><td>▼ -54%</td><td>█</td></tr>
<tr><td><a href="https://github.com/wendigo">wendigo</a></td><td>maintainer</td><td style="text-align: right">22</td><td style="text-align: right">30</td><td style="text-align: right">940</td><td style="text-align: right">187</td><td>▼ -26%</td><td>████████████</td></tr>
<tr><td><a href="https://github.com/ebyhr">ebyhr</a></td><td>maintainer</td><td style="text-align: right">21</td><td style="text-align: right">30</td><td style="text-align: right">378</td><td style="text-align: right">324</td><td>= 0%</td><td>████████████████████</td></tr>
<tr><td><a href="https://github.com/martint">martint</a></td><td>maintainer</td><td style="text-align: right">20</td><td style="text-align: right">41</td><td style="text-align: right">912</td><td style="text-align: right">32</td><td>▼ -11%</td><td>██</td></tr>
<tr><td><a href="https://github.com/findepi">findepi</a></td><td>maintainer</td><td style="text-align: right">15</td><td style="text-align: right">26</td><td style="text-align: right">912</td><td style="text-align: right">159</td><td>▲ +38%</td><td>██████████</td></tr>
<tr><td><a href="https://github.com/raunaqmorarka">raunaqmorarka</a></td><td>maintainer</td><td style="text-align: right">13</td><td style="text-align: right">19</td><td style="text-align: right">965</td><td style="text-align: right">230</td><td>▲ +125%</td><td>██████████████</td></tr>
<tr><td><a href="https://github.com/chenjian2664">chenjian2664</a></td><td>maintainer</td><td style="text-align: right">13</td><td style="text-align: right">19</td><td style="text-align: right">378</td><td style="text-align: right">85</td><td>▲ +240%</td><td>█████</td></tr>
<tr><td><a href="https://github.com/Praveen2112">Praveen2112</a></td><td>maintainer</td><td style="text-align: right">12</td><td style="text-align: right">16</td><td style="text-align: right">378</td><td style="text-align: right">35</td><td>▲ +3%</td><td>██</td></tr>
<tr><td><a href="https://github.com/losipiuk">losipiuk</a></td><td>maintainer</td><td style="text-align: right">10</td><td style="text-align: right">15</td><td style="text-align: right">912</td><td style="text-align: right">48</td><td>▲ +50%</td><td>███</td></tr>
<tr><td><a href="https://github.com/findinpath">findinpath</a></td><td>regular contributor</td><td style="text-align: right">7</td><td style="text-align: right">12</td><td style="text-align: right">207</td><td style="text-align: right">43</td><td>▼ -22%</td><td>███</td></tr>
<tr><td><a href="https://github.com/kasiafi">kasiafi</a></td><td>regular contributor</td><td style="text-align: right">6</td><td style="text-align: right">13</td><td style="text-align: right">24</td><td style="text-align: right">6</td><td>▼ -25%</td><td>▏</td></tr>
<tr><td><a href="https://github.com/sopel39">sopel39</a></td><td>regular contributor</td><td style="text-align: right">5</td><td style="text-align: right">8</td><td style="text-align: right">965</td><td style="text-align: right">0</td><td>▼ -100%</td><td></td></tr>
<tr><td><a href="https://github.com/pettyjamesm">pettyjamesm</a></td><td>maintainer</td><td style="text-align: right">4</td><td style="text-align: right">6</td><td style="text-align: right">912</td><td style="text-align: right">4</td><td>▼ -43%</td><td>▏</td></tr>
<tr><td><a href="https://github.com/hashhar">hashhar</a></td><td>maintainer</td><td style="text-align: right">3</td><td style="text-align: right">5</td><td style="text-align: right">912</td><td style="text-align: right">16</td><td>▲ +433%</td><td>█</td></tr>
<tr><td><a href="https://github.com/krvikash">krvikash</a></td><td>regular contributor</td><td style="text-align: right">3</td><td style="text-align: right">4</td><td style="text-align: right">260</td><td style="text-align: right">8</td><td>▲ +167%</td><td>▏</td></tr>
<tr><td><a href="https://github.com/koszti">koszti</a></td><td>regular contributor</td><td style="text-align: right">2</td><td style="text-align: right">2</td><td style="text-align: right">77</td><td style="text-align: right">7</td><td>▼ -13%</td><td>▏</td></tr>
<tr><td><a href="https://github.com/lukasz-stec">lukasz-stec</a></td><td>regular contributor</td><td style="text-align: right">2</td><td style="text-align: right">4</td><td style="text-align: right">37</td><td style="text-align: right">7</td><td>= 0%</td><td>▏</td></tr>
<tr><td><a href="https://github.com/mosabua">mosabua</a></td><td>maintainer</td><td style="text-align: right">2</td><td style="text-align: right">6</td><td style="text-align: right">940</td><td style="text-align: right">7</td><td>▼ -50%</td><td>▏</td></tr>
<tr><td><a href="https://github.com/ssheikin">ssheikin</a></td><td>regular contributor</td><td style="text-align: right">2</td><td style="text-align: right">2</td><td style="text-align: right">65</td><td style="text-align: right">3</td><td>▲ +200%</td><td>▏</td></tr>
<tr><td><a href="https://github.com/lukasz-walkiewicz">lukasz-walkiewicz</a></td><td>regular contributor</td><td style="text-align: right">2</td><td style="text-align: right">4</td><td style="text-align: right">29</td><td style="text-align: right">2</td><td>▲ +100%</td><td>▏</td></tr>
<tr><td><a href="https://github.com/alexjo2144">alexjo2144</a></td><td>regular contributor</td><td style="text-align: right">2</td><td style="text-align: right">3</td><td style="text-align: right">205</td><td style="text-align: right">0</td><td></td><td></td></tr>
<tr><td><a href="https://github.com/nineinchnick">nineinchnick</a></td><td>regular contributor</td><td style="text-align: right">1</td><td style="text-align: right">2</td><td style="text-align: right">940</td><td style="text-align: right">8</td><td>▲ +300%</td><td>▏</td></tr>
<tr><td><a href="https://github.com/Chaho12">Chaho12</a></td><td>regular contributor</td><td style="text-align: right">1</td><td style="text-align: right">1</td><td style="text-align: right">25</td><td style="text-align: right">2</td><td></td><td>▏</td></tr>
<tr><td><a href="https://github.com/andythsu">andythsu</a></td><td>contributor</td><td style="text-align: right">1</td><td style="text-align: right">1</td><td style="text-align: right">25</td><td style="text-align: right">1</td><td></td><td>▏</td></tr>
<tr><td><a href="https://github.com/0eu">0eu</a></td><td>contributor</td><td style="text-align: right">1</td><td style="text-align: right">1</td><td style="text-align: right">55</td><td style="text-align: right">0</td><td></td><td></td></tr>
<tr><td><a href="https://github.com/Dith3r">Dith3r</a></td><td>regular contributor</td><td style="text-align: right">1</td><td style="text-align: right">1</td><td style="text-align: right">912</td><td style="text-align: right">0</td><td></td><td></td></tr>
<tr><td><a href="https://github.com/Parth-Brahmbhatt">Parth-Brahmbhatt</a></td><td>contributor</td><td style="text-align: right">1</td><td style="text-align: right">1</td><td style="text-align: right">64</td><td style="text-align: right">0</td><td></td><td></td></tr>
<tr><td><a href="https://github.com/SongChujun">SongChujun</a></td><td>regular contributor</td><td style="text-align: right">1</td><td style="text-align: right">1</td><td style="text-align: right">99</td><td style="text-align: right">0</td><td></td><td></td></tr>
<tr><td><a href="https://github.com/alprusty">alprusty</a></td><td>contributor</td><td style="text-align: right">1</td><td style="text-align: right">1</td><td style="text-align: right">114</td><td style="text-align: right">0</td><td></td><td></td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/c1a59d49140c985e9daa31737b2647bd9102da87/sql/maintaining/06-review-queue.sql)

## Is the backlog growing?

Pull requests opened, merged, and closed without merging per month, and how many were open at the end of the month. When the net change stays above zero, the project gets more pull requests than it can review: look at what waits on reviewers above.
Closed by the stale bot is part of closed. Bots' pull requests are not counted. The current month is not complete.

<pre><code>
  Month  | Opened | Merged | Closed | By stale bot | Net change | Open at end |       Open at the end of the month       
---------+--------+--------+--------+--------------+------------+-------------+------------------------------------------
 2026-11 |    142 |    104 |     49 |           15 | ▼ -11      |         298 | █████████████████████████████████████    
 2026-10 |    384 |    265 |    128 |           58 | ▼ -9       |         309 | ██████████████████████████████████████   
 2026-09 |    305 |    218 |     91 |           49 | ▼ -4       |         318 | ████████████████████████████████████████ 
 2026-08 |    277 |    144 |     89 |           31 | ▲ +44      |         322 | ████████████████████████████████████████ 
 2026-07 |    274 |    167 |     66 |           30 | ▲ +41      |         278 | ███████████████████████████████████      
 2026-06 |    266 |    193 |     82 |           53 | ▼ -9       |         237 | █████████████████████████████            
 2026-05 |    225 |    145 |     39 |            4 | ▲ +41      |         246 | ███████████████████████████████          
 2026-04 |    199 |    116 |     85 |           32 | ▼ -2       |         205 | █████████████████████████                
 2026-03 |    271 |    170 |     75 |           18 | ▲ +26      |         207 | ██████████████████████████               
 2026-02 |    186 |    133 |     42 |           13 | ▲ +11      |         181 | ██████████████████████                   
 2026-01 |    137 |    104 |     36 |           20 | ▼ -3       |         170 | █████████████████████                    
 2025-12 |    179 |    120 |     57 |           25 | ▲ +2       |         173 | █████████████████████                    
 2025-11 |    190 |    137 |     44 |           12 | ▲ +9       |         171 | █████████████████████                    
 2025-10 |    210 |    150 |     51 |           16 | ▲ +9       |         162 | ████████████████████                     
 2025-09 |    179 |    131 |     48 |           20 | = 0        |         153 | ███████████████████                      
 2025-08 |    137 |     89 |     38 |           16 | ▲ +10      |         153 | ███████████████████                      
 2025-07 |    143 |    104 |     35 |           13 | ▲ +4       |         143 | ██████████████████                       
 2025-06 |    142 |    112 |     48 |           24 | ▼ -18      |         139 | █████████████████                        
 2025-05 |    118 |     84 |     42 |           17 | ▼ -8       |         157 | ████████████████████                     
 2025-04 |    149 |    115 |     58 |           29 | ▼ -24      |         165 | ████████████████████                     
 2025-03 |    172 |    148 |     76 |           56 | ▼ -52      |         189 | ███████████████████████                  
 2025-02 |    229 |    175 |     48 |            7 | ▲ +6       |         241 | ██████████████████████████████           
 2025-01 |    183 |    166 |     36 |            6 | ▼ -19      |         235 | █████████████████████████████            
 2024-12 |    195 |    141 |     44 |           15 | ▲ +10      |         254 | ████████████████████████████████         
(24 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/c1a59d49140c985e9daa31737b2647bd9102da87/sql/maintaining/07-backlog-trend.sql)

## How fast do reviewers respond?

Time from an author's update (opening the pull request, a push, or a reply) to the next review, comment, or merge by someone who reviews in this project, for responses in the last 12 months. Cumulative shows the share of updates answered within that time.
Authors who wait days for each round lose context and interest; if the share answered within a day drops, review more often in smaller sessions. Updates still without a response are not counted; they are in the lists above. Draft periods count as waiting, because the data has no record of them.

<pre><code>
    Response time    | Responses | Share | Cumulative |                Histogram                 
---------------------+-----------+-------+------------+------------------------------------------
 under 1 hour        |      1598 | 27%   | 27%        | ████████████████████████████████████████ 
 1 to 4 hours        |      1281 | 22%   | 49%        | ████████████████████████████████         
 4 to 24 hours       |      1507 | 26%   | 74%        | ██████████████████████████████████████   
 1 to 2 days         |       375 | 6%    | 81%        | █████████                                
 2 to 4 days         |       350 | 6%    | 86%        | █████████                                
 4 to 7 days         |       221 | 4%    | 90%        | ██████                                   
 1 to 2 weeks        |       199 | 3%    | 94%        | █████                                    
 2 to 4 weeks        |       183 | 3%    | 97%        | █████                                    
 4 weeks to 3 months |       145 | 2%    | 99%        | ████                                     
 over 3 months       |        50 | 1%    | 100%       | █                                        
(10 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/c1a59d49140c985e9daa31737b2647bd9102da87/sql/maintaining/08-reviewer-response-time.sql)

## Reviews per merged pull request

How many people reviewed each pull request merged in the month, how many were merged without a review by a person, and how fast reviewers responded to authors' updates in the month (median and P90, as in the section above).
A rising share merged without a review means changes go in unchecked; a single reviewer on most pull requests means one person carries each change. Bots' pull requests and bot reviews are not counted. The current month is not complete.

<pre><code>
  Month  | Merged | No review | 1 reviewer |  2  | 3 or more |     None ·, 1 ▒, 2 ▓, 3+ █     | Median response | P90 response 
---------+--------+-----------+------------+-----+-----------+--------------------------------+-----------------+--------------
 2026-11 |    104 | 0%        | 68%        | 28% | 4%        | ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓█ | 6h 02m          | 6d 16h       
 2026-10 |    265 | 0%        | 64%        | 28% | 8%        | ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓██ | 4h 45m          | 7d 14h       
 2026-09 |    218 | 0%        | 62%        | 31% | 6%        | ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓██ | 5h 41m          | 6d 16h       
 2026-08 |    144 | 0%        | 54%        | 37% | 9%        | ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓███ | 5h 51m          | 9d 20h       
 2026-07 |    167 | 0%        | 54%        | 32% | 13%       | ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓████ | 3h 41m          | 15d 22h      
 2026-06 |    193 | 0%        | 63%        | 26% | 11%       | ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓███ | 5h 13m          | 6d 21h       
 2026-05 |    145 | 0%        | 59%        | 29% | 12%       | ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓████ | 4h 41m          | 4d 6h        
 2026-04 |    116 | 0%        | 45%        | 35% | 20%       | ▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓██████ | 3h 34m          | 5d 5h        
 2026-03 |    170 | 1%        | 48%        | 26% | 25%       | ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓███████ | 2h 43m          | 4d 8h        
 2026-02 |    133 | 0%        | 55%        | 34% | 11%       | ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓███ | 2h 50m          | 8d 16h       
 2026-01 |    104 | 0%        | 38%        | 39% | 22%       | ▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓███████ | 7h 18m          | 6d 21h       
 2025-12 |    120 | 0%        | 51%        | 37% | 13%       | ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓████ | 5h 21m          | 8d 18h       
(12 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/c1a59d49140c985e9daa31737b2647bd9102da87/sql/maintaining/09-review-coverage.sql)

## How concentrated is reviewing?

Share of reviews done by the 5 and the 10 busiest reviewers per quarter, and how many people did half of all reviews. One review is one person reviewing one pull request in the quarter, however many comments they left. Bots and authors replying in their own pull requests are not counted.
When a few people do most reviews, the project stalls when they are away, and they burn out: if the shares grow, ask regular contributors to review more in their areas. The current quarter is not complete.

<pre><code>
 Quarter | Reviewers | Reviews | Top 5 | Top 10 | Half done by |    Top 5 █, next 5 ▓, everyone else ░    
---------+-----------+---------+-------+--------+--------------+------------------------------------------
 2026 Q4 |        41 |     741 | 73%   | 87%    |            3 | █████████████████████████████▓▓▓▓▓▓░░░░░ 
 2026 Q3 |        49 |    1219 | 69%   | 86%    |            3 | ████████████████████████████▓▓▓▓▓▓░░░░░░ 
 2026 Q2 |        49 |    1110 | 69%   | 88%    |            3 | ███████████████████████████▓▓▓▓▓▓▓▓░░░░░ 
 2026 Q1 |        55 |    1230 | 74%   | 89%    |            3 | █████████████████████████████▓▓▓▓▓▓▓░░░░ 
 2025 Q4 |        58 |    1171 | 75%   | 88%    |            3 | ██████████████████████████████▓▓▓▓▓░░░░░ 
 2025 Q3 |        49 |     680 | 74%   | 85%    |            3 | █████████████████████████████▓▓▓▓▓░░░░░░ 
 2025 Q2 |        47 |     594 | 68%   | 84%    |            3 | ███████████████████████████▓▓▓▓▓▓░░░░░░░ 
 2025 Q1 |        53 |     864 | 63%   | 80%    |            4 | █████████████████████████▓▓▓▓▓▓▓░░░░░░░░ 
(8 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/c1a59d49140c985e9daa31737b2647bd9102da87/sql/maintaining/10-review-concentration.sql)

## Who reviews

Reviews per month by the role of the reviewer, as shares of all reviews, drawn as maintainers █, regular contributors ▓, contributors ▒, newcomers ░, and bots ·. One review is one reviewer reviewing one pull request in the month. Roles are as of today: maintainers merged pull requests of others in the last year, regular contributors have 10 or more merged pull requests, contributors 1 to 9, newcomers none.
A growing share of regular contributors and contributors takes load off maintainers. A growing share of bots adds comments for authors to read, but does not replace a review by a person.

<pre><code>
  Month  | Reviews | Maintainers | Regular | Contributors | Newcomers | Bots |             Share of reviews             
---------+---------+-------------+---------+--------------+-----------+------+------------------------------------------
 2026-11 |     283 | 70%         | 5%      | 0%           | 0%        | 25%  | ████████████████████████████▓▓·········· 
 2026-10 |     764 | 62%         | 8%      | 1%           | 1%        | 28%  | █████████████████████████▓▓▓░··········· 
 2026-09 |     455 | 85%         | 9%      | 2%           | 0%        | 4%   | ██████████████████████████████████▓▓▓▓░· 
 2026-08 |     414 | 83%         | 7%      | 2%           | 3%        | 4%   | █████████████████████████████████▓▓▓▒░·· 
 2026-07 |     463 | 80%         | 10%     | 1%           | 1%        | 9%   | ████████████████████████████████▓▓▓▓···· 
 2026-06 |     494 | 79%         | 10%     | 1%           | 1%        | 9%   | ████████████████████████████████▓▓▓▒···· 
 2026-05 |     404 | 77%         | 11%     | 1%           | 1%        | 11%  | ███████████████████████████████▓▓▓▓░···· 
 2026-04 |     375 | 75%         | 9%      | 1%           | 1%        | 13%  | ██████████████████████████████▓▓▓▓░····· 
 2026-03 |     550 | 79%         | 7%      | 2%           | 1%        | 11%  | ████████████████████████████████▓▓▒░···· 
 2026-02 |     475 | 87%         | 7%      | 1%           | 0%        | 5%   | ███████████████████████████████████▓▓▒·· 
 2026-01 |     351 | 81%         | 11%     | 3%           | 1%        | 3%   | █████████████████████████████████▓▓▓▓▒░· 
 2025-12 |     392 | 87%         | 9%      | 1%           | 1%        | 3%   | ███████████████████████████████████▓▓▓░· 
 2025-11 |     417 | 83%         | 8%      | 1%           | 1%        | 6%   | █████████████████████████████████▓▓▓▓░·· 
 2025-10 |     630 | 66%         | 3%      | 1%           | 1%        | 29%  | ███████████████████████████▓░··········· 
 2025-09 |     310 | 84%         | 6%      | 1%           | 2%        | 7%   | ██████████████████████████████████▓▓▒··· 
 2025-08 |     241 | 82%         | 10%     | 1%           | 0%        | 6%   | █████████████████████████████████▓▓▓▓░·· 
 2025-07 |     208 | 85%         | 9%      | 1%           | 1%        | 3%   | ██████████████████████████████████▓▓▓▓░· 
 2025-06 |     221 | 82%         | 9%      | 1%           | 1%        | 7%   | █████████████████████████████████▓▓▓▒··· 
 2025-05 |     202 | 75%         | 13%     | 2%           | 1%        | 7%   | ██████████████████████████████▓▓▓▓▓▒░··· 
 2025-04 |     240 | 83%         | 10%     | 1%           | 1%        | 5%   | █████████████████████████████████▓▓▓▓▒·· 
 2025-03 |     266 | 79%         | 15%     | 2%           | 0%        | 4%   | ████████████████████████████████▓▓▓▓▓▓·· 
 2025-02 |     339 | 86%         | 12%     | 1%           | 0%        | 0%   | ██████████████████████████████████▓▓▓▓▓▒ 
 2025-01 |     305 | 83%         | 14%     | 2%           | 1%        | 0%   | █████████████████████████████████▓▓▓▓▓▓▒ 
 2024-12 |     298 | 77%         | 22%     | 1%           | 1%        | 0%   | ███████████████████████████████▓▓▓▓▓▓▓▓▒ 
(24 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/c1a59d49140c985e9daa31737b2647bd9102da87/sql/maintaining/11-reviews-by-role.sql)

## What bots do

Pull requests opened by bots, and reviews and comments bots wrote in pull requests, in the last 12 months. Bots are counted nowhere else on this page. Use it to judge the load of dependency updates and how many bot comments authors and reviewers have to read.
Activity is the number of pull requests, reviews, and comments per month, one character per month, oldest first, scaled to each bot's busiest month. Time to merge is the median of merged pull requests.

<pre><code>
                Bot                 | PRs opened | Merged | Closed | Open | Time to merge | Reviews | Comments | Activity, 12 months 
------------------------------------+------------+--------+--------+------+---------------+---------+----------+---------------------
 coderabbitai[bot]                  |          0 |      0 |      0 |    0 |               |     920 |      981 | ...▁▂▁▁▂▁▁█▂        
 github-actions[bot]                |          0 |      0 |      0 |    0 |               |       0 |     1818 | ▄▃▃▄▅▃█▆▇▇█▃        
 dependabot[bot]                    |       1043 |    808 |    231 |    4 | 3h 09m        |       0 |      246 | ▆▄████▇▅▅▃▅▂        
 cla-bot[bot]                       |          0 |      0 |      0 |    0 |               |       0 |      638 | ▃▇▅██▁......        
 copilot-pull-request-reviewer[bot] |          0 |      0 |      0 |    0 |               |     208 |        0 | ▃▃▅█▄▇▄▁▁▁▃▁        
 starburstdata-automation           |          0 |      0 |      0 |    0 |               |       0 |      202 | ▃▂▇▇▃.▂█....        
 chatgpt-codex-connector[bot]       |          0 |      0 |      0 |    0 |               |      61 |      132 | ...▁▂▁▂▄▂██▅        
 sourcery-ai[bot]                   |          0 |      0 |      0 |    0 |               |       1 |        0 | █...........        
(8 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/c1a59d49140c985e9daa31737b2647bd9102da87/sql/maintaining/12-automation.sql)

Generated on Fri Nov 13 07:42:54 UTC 2026

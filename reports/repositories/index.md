---
title: Trino Clients and Tools
---

## Activity per repository

Pull requests and issues of people in the clients and tools of Trino in the last 12 months, what is open now, and the median time until another person commented or reviewed a pull request. Pull requests of bots, like dependency updates, are counted on their own.
A repository with many open pull requests or issues, or a slow first response, needs more maintainers; ask for help in #dev on Slack.

<pre><code>
     Repository      | People | PRs | Merged | First response | Open PRs | Issues | Open issues | Bot PRs / open | PRs per month, 24 months chart 
---------------------+--------+-----+--------+----------------+----------+--------+-------------+----------------+--------------------------------
 trino-gateway       |     77 | 190 |    123 | 14h 42m        |       45 |     57 |         120 | 416 / 2        | ▄▄▅▃▂▂▄▅▃▂▃▂▃▆▅▃▂▂▃▃▂▄█▆       
 trino-go-client     |      8 |  99 |     87 | 3d 14h         |       10 |     39 |           2 | 0 / 0          | .▁▁▁▁▁.▁▁▁.▂▁...▁..▁▁▄█▄       
 charts              |     46 |  60 |     39 | 1d 13h         |        5 |     16 |          11 | 20 / 4         | ▄▆▃▆▄█▃▄.▃..▂▄▁▄▆▃▄▂▂▂█.       
 trino-python-client |     36 |  53 |     29 | 4d 1h          |       28 |     18 |          33 | 0 / 0          | ▆▆▆▂▃▂▃▃▂.▁.▂▃▁▃▃▂▅█▆▅▄▂       
 trino-query-ui      |      8 |  44 |     39 | 21h 39m        |        2 |      6 |           5 | 28 / 3         | ....▃▁.▁.▁▁▁▅....▂▂▂▇█▂▁       
 grafana-trino       |     25 |  30 |     24 | 3d 23h         |        4 |      9 |           3 | 33 / 0         | ▁.▁.▂▁.▂.▂▂▁▂..▁▁..▁▄▂█▃       
 trino-js-client     |     16 |  17 |     11 | 1d 5h          |        5 |      7 |          12 | 44 / 8         | ..▁▁▂..▁▂.▁▅▁....▄..▁█▁.       
 trino-csharp-client |     10 |   4 |      0 | 7h 46m         |       11 |      3 |          14 | 0 / 0          | █▄▄▅▅.....▂..▂▂......▄..       
(8 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/5ff0dc721288b2af0d3c69361fa4aa310e66b0f2/sql/repositories/01-activity.sql)

## Open pull requests

Pull requests of people that aren't drafts, at most 8 per repository: approved ones first, because they only need a merge, then the ones without any response, oldest first, and then the ones that waited the longest since another person last commented or reviewed. Without commits, it doesn't show whether the author pushed changes since then.
Merge or close approved pull requests, answer the ones without a response, and ask the authors of the others whether they still work on them.

<table>
<thead>
<tr><th>Repository</th><th>PR</th><th>Title</th><th>Author</th><th>Open for</th><th>Review</th><th>Last response</th></tr>
</thead>
<tbody>
<tr><td>charts</td><td><a href="https://github.com/trinodb/charts/pull/468">#468</a></td><td>Release Trino Gateway chart 1.23.0</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>30d 10h</td><td>no response</td><td></td></tr>
<tr><td>charts</td><td><a href="https://github.com/trinodb/charts/pull/471">#471</a></td><td>Add HTTPRoute support to the Trino Gateway chart</td><td><a href="https://github.com/sdaberdaku">sdaberdaku</a></td><td>22d 11h</td><td>no response</td><td></td></tr>
<tr><td>charts</td><td><a href="https://github.com/trinodb/charts/pull/472">#472</a></td><td>Allow an existing Secret for the Trino Gateway configuration</td><td><a href="https://github.com/sdaberdaku">sdaberdaku</a></td><td>22d 10h</td><td>no response</td><td></td></tr>
<tr><td>charts</td><td><a href="https://github.com/trinodb/charts/pull/178">#178</a></td><td>Test with dynamic catalogs</td><td><a href="https://github.com/nineinchnick">nineinchnick</a></td><td>901d 18h</td><td>commented</td><td>899d 14h</td></tr>
<tr><td>charts</td><td><a href="https://github.com/trinodb/charts/pull/409">#409</a></td><td>Add query-manager.required-workers guidance to KEDA documentation</td><td><a href="https://github.com/jmealo">jmealo</a></td><td>237d 11h</td><td>commented</td><td>40d 16h</td></tr>
<tr><td>grafana-trino</td><td><a href="https://github.com/trinodb/grafana-trino/pull/395">#395</a></td><td>Add optional username suffix removal for impersonation</td><td><a href="https://github.com/laserninja">laserninja</a></td><td>2d 7h</td><td>no response</td><td></td></tr>
<tr><td>grafana-trino</td><td><a href="https://github.com/trinodb/grafana-trino/pull/365">#365</a></td><td>Add optional asynchronous query polling</td><td><a href="https://github.com/Flgado">Flgado</a></td><td>44d 11h</td><td>commented</td><td>3d 7h</td></tr>
<tr><td>grafana-trino</td><td><a href="https://github.com/trinodb/grafana-trino/pull/389">#389</a></td><td>Add a setting to limit the rows read from a query</td><td><a href="https://github.com/MaelNedellec">MaelNedellec</a></td><td>7d 13h</td><td>commented</td><td>18h 24m</td></tr>
<tr><td>grafana-trino</td><td><a href="https://github.com/trinodb/grafana-trino/pull/382">#382</a></td><td>Fall back to the other attribute when impersonating</td><td><a href="https://github.com/vinzee">vinzee</a></td><td>23d 4h</td><td>commented</td><td>5h 42m</td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/pull/4">#4</a></td><td>Add release labelling</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>701d 9h</td><td>approved</td><td>699d 5h</td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/pull/15">#15</a></td><td>Fix error deserialization with non-empty suppressed filed</td><td><a href="https://github.com/stelmukhov">stelmukhov</a></td><td>629d 19h</td><td>approved</td><td>607d 10h</td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/pull/21">#21</a></td><td>Add the toString override to build the role header string</td><td><a href="https://github.com/SaravananPrasadh-SP">SaravananPrasadh-SP</a></td><td>605d 15h</td><td>approved</td><td>598d 9h</td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/pull/26">#26</a></td><td>Fix httpClient initialization in StatementClientV1 class.</td><td><a href="https://github.com/Szychulski">Szychulski</a></td><td>569d 19h</td><td>approved</td><td>518d 10h</td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/pull/13">#13</a></td><td>Fix NaN values handling in the progressPercentage property</td><td><a href="https://github.com/stelmukhov">stelmukhov</a></td><td>636d 19h</td><td>approved</td><td>273d 16h</td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/pull/34">#34</a></td><td>Add release flow for nuget.org</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>273d 3h</td><td>approved</td><td>272d 20h</td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/pull/33">#33</a></td><td>bugfix: json response fails because of wrong field type "suppressed"</td><td><a href="https://github.com/razgaou">razgaou</a></td><td>295d 19h</td><td>no response</td><td></td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/pull/25">#25</a></td><td>Fix case when cancellation token was requested but query was not ca...</td><td><a href="https://github.com/MAF1N">MAF1N</a></td><td>587d 15h</td><td>commented</td><td>579d 12h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/pull/923">#923</a></td><td>Refactor routing logics and remove unused lookups</td><td><a href="https://github.com/oneonestar">oneonestar</a></td><td>275d 22h</td><td>approved</td><td>24d 12h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/pull/1380">#1380</a></td><td>Tighten routing fallback tests and error responses</td><td><a href="https://github.com/Chaho12">Chaho12</a></td><td>22d 22h</td><td>approved</td><td>22d 16h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/pull/1223">#1223</a></td><td>Support current Trino in cluster stats monitors</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>107d 0h</td><td>approved</td><td>21d 3h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/pull/1341">#1341</a></td><td>Add option to link queries to the Trino 483 Web UI</td><td><a href="https://github.com/developer-Bushido">developer-Bushido</a></td><td>34d 19h</td><td>approved</td><td>8d 21h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/pull/1342">#1342</a></td><td>Add option to take the user from a userinfo claim</td><td><a href="https://github.com/developer-Bushido">developer-Bushido</a></td><td>34d 19h</td><td>approved</td><td>8d 17h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/pull/1279">#1279</a></td><td>Fix corruption and truncation of proxied responses</td><td><a href="https://github.com/nandaqmr">nandaqmr</a></td><td>60d 11h</td><td>approved</td><td>4d 4h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/pull/794">#794</a></td><td>Introduce query history write buffer for DB resiliency</td><td><a href="https://github.com/Peiyingy">Peiyingy</a></td><td>374d 5h</td><td>approved</td><td>2d 3h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/pull/1351">#1351</a></td><td>Add Trino Gateway 23 release notes</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>30d 10h</td><td>no response</td><td></td></tr>
<tr><td>trino-go-client</td><td><a href="https://github.com/trinodb/trino-go-client/pull/283">#283</a></td><td>Cancel queries with a DELETE to their nextUri</td><td><a href="https://github.com/lucargir">lucargir</a></td><td>14d 7h</td><td>approved</td><td>11d 12h</td></tr>
<tr><td>trino-go-client</td><td><a href="https://github.com/trinodb/trino-go-client/pull/281">#281</a></td><td>Add validateConnection to skip the credentials check in Ping</td><td><a href="https://github.com/lucargir">lucargir</a></td><td>14d 7h</td><td>approved</td><td>18h 39m</td></tr>
<tr><td>trino-go-client</td><td><a href="https://github.com/trinodb/trino-go-client/pull/304">#304</a></td><td>Skip the cancel on Close when the server has ended the query</td><td><a href="https://github.com/slachiewicz">slachiewicz</a></td><td>11d 6h</td><td>no response</td><td></td></tr>
<tr><td>trino-go-client</td><td><a href="https://github.com/trinodb/trino-go-client/pull/305">#305</a></td><td>Fail spooled data that arrives before its columns</td><td><a href="https://github.com/slachiewicz">slachiewicz</a></td><td>6d 6h</td><td>no response</td><td></td></tr>
<tr><td>trino-go-client</td><td><a href="https://github.com/trinodb/trino-go-client/pull/306">#306</a></td><td>Keep the progress channel open after the rows are closed</td><td><a href="https://github.com/slachiewicz">slachiewicz</a></td><td>6d 6h</td><td>no response</td><td></td></tr>
<tr><td>trino-go-client</td><td><a href="https://github.com/trinodb/trino-go-client/pull/307">#307</a></td><td>Reject VARIANT objects that repeat a field</td><td><a href="https://github.com/slachiewicz">slachiewicz</a></td><td>6d 6h</td><td>no response</td><td></td></tr>
<tr><td>trino-go-client</td><td><a href="https://github.com/trinodb/trino-go-client/pull/308">#308</a></td><td>Destroy the Kerberos client a connection logged in when it closes</td><td><a href="https://github.com/slachiewicz">slachiewicz</a></td><td>6d 6h</td><td>no response</td><td></td></tr>
<tr><td>trino-go-client</td><td><a href="https://github.com/trinodb/trino-go-client/pull/309">#309</a></td><td>Bound ROLLBACK like a query cancellation</td><td><a href="https://github.com/slachiewicz">slachiewicz</a></td><td>6d 6h</td><td>no response</td><td></td></tr>
<tr><td>trino-js-client</td><td><a href="https://github.com/trinodb/trino-js-client/pull/994">#994</a></td><td>Export the Trino header names</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>52d 6h</td><td>no response</td><td></td></tr>
<tr><td>trino-js-client</td><td><a href="https://github.com/trinodb/trino-js-client/pull/1003">#1003</a></td><td>Add AbortSignal support to query</td><td><a href="https://github.com/arcman7">arcman7</a></td><td>42d 9h</td><td>no response</td><td></td></tr>
<tr><td>trino-js-client</td><td><a href="https://github.com/trinodb/trino-js-client/pull/855">#855</a></td><td>feat: add jwt auth (#524)</td><td><a href="https://github.com/emmc15">emmc15</a></td><td>490d 2h</td><td>commented</td><td>295d 13h</td></tr>
<tr><td>trino-js-client</td><td><a href="https://github.com/trinodb/trino-js-client/pull/944">#944</a></td><td>add abortSignal support to query()</td><td><a href="https://github.com/SamBove">SamBove</a></td><td>360d 9h</td><td>commented</td><td>77d 6h</td></tr>
<tr><td>trino-js-client</td><td><a href="https://github.com/trinodb/trino-js-client/pull/956">#956</a></td><td>Remove axios in favor of native fetch + undici</td><td><a href="https://github.com/GeoBradDev">GeoBradDev</a></td><td>183d 5h</td><td>commented</td><td>41d 6h</td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/pull/400">#400</a></td><td>add an option to deferred fetch result in Cursor.execute()</td><td><a href="https://github.com/dungdm93">dungdm93</a></td><td>1199d 20h</td><td>approved</td><td>1148d 21h</td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/pull/322">#322</a></td><td>Add type hints for sqlalchemy</td><td><a href="https://github.com/damian3031">damian3031</a></td><td>1406d 20h</td><td>no response</td><td></td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/pull/631">#631</a></td><td>Add literal_processor to TIMESTAMP, TIME and DATE SQLAlchemy types</td><td><a href="https://github.com/hashhar">hashhar</a></td><td>93d 15h</td><td>no response</td><td></td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/pull/645">#645</a></td><td>Acknowledge spooled segments once decoded</td><td><a href="https://github.com/aminghadersohi">aminghadersohi</a></td><td>54d 16h</td><td>no response</td><td></td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/pull/646">#646</a></td><td>Use GitHub App token in Python versions update workflow</td><td><a href="https://github.com/hashhar">hashhar</a></td><td>48d 13h</td><td>no response</td><td></td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/pull/647">#647</a></td><td>Enable SQL compilation caching for the ignore-nulls window functions</td><td><a href="https://github.com/rebkwok">rebkwok</a></td><td>34d 15h</td><td>no response</td><td></td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/pull/648">#648</a></td><td>docs: document all Connection parameters in docstring and README</td><td><a href="https://github.com/Shahzeb-DataEngineer">Shahzeb-DataEngineer</a></td><td>28d 1h</td><td>no response</td><td></td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/pull/650">#650</a></td><td>Quote schema and table in SQLAlchemy partitions lookup</td><td><a href="https://github.com/RaphaelFakhri">RaphaelFakhri</a></td><td>25d 22h</td><td>no response</td><td></td></tr>
<tr><td>trino-query-ui</td><td><a href="https://github.com/trinodb/trino-query-ui/pull/93">#93</a></td><td>Verify formatted SQL with the lexer</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>36d 1h</td><td>no response</td><td></td></tr>
<tr><td>trino-query-ui</td><td><a href="https://github.com/trinodb/trino-query-ui/pull/100">#100</a></td><td>Remove the duplicate Ctrl+Enter command</td><td><a href="https://github.com/BobDu">BobDu</a></td><td>2d 0h</td><td>no response</td><td></td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/5ff0dc721288b2af0d3c69361fa4aa310e66b0f2/sql/repositories/02-open-pull-requests.sql)

## Issues without an answer

Issues of people opened in the last 12 months that are still open and that no other person commented on, at most 8 per repository, oldest first. Older ones are counted in "Activity per repository".
An answer, even a question or a label, tells the reporter that someone read it. Close the ones that are fixed or can't be reproduced.

<table>
<thead>
<tr><th>Repository</th><th>Issue</th><th>Title</th><th>Author</th><th>Open for</th></tr>
</thead>
<tbody>
<tr><td>charts</td><td><a href="https://github.com/trinodb/charts/issues/473">#473</a></td><td>`maxHeapSize: null` is ignored with Helm `4.2+` when Trino is a subchart</td><td><a href="https://github.com/didinator">didinator</a></td><td>21d 9h</td></tr>
<tr><td>grafana-trino</td><td><a href="https://github.com/trinodb/grafana-trino/issues/390">#390</a></td><td>Queries returning millions of rows can exhaust the Grafana server's memory</td><td><a href="https://github.com/MaelNedellec">MaelNedellec</a></td><td>7d 13h</td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/issues/32">#32</a></td><td>bug: failed json response parsing (Hive metastore connector)</td><td><a href="https://github.com/razgaou">razgaou</a></td><td>295d 19h</td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/issues/35">#35</a></td><td>IsTimeout check is not platform independent</td><td><a href="https://github.com/petr-pokorny-absa">petr-pokorny-absa</a></td><td>225d 22h</td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/issues/36">#36</a></td><td>Nuget package</td><td><a href="https://github.com/jzabroski">jzabroski</a></td><td>217d 12h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/issues/822">#822</a></td><td>Avoid FixedHostPortGenericContainer in TestOIDC</td><td><a href="https://github.com/ebyhr">ebyhr</a></td><td>320d 20h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/issues/878">#878</a></td><td>Routing rules execute all matching rules' actions instead of stopping at firs...</td><td><a href="https://github.com/Setsushin">Setsushin</a></td><td>294d 20h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/issues/1171">#1171</a></td><td>Extending Trino Gateway to route to Kyuubi (and beyond Trino)</td><td><a href="https://github.com/Chaho12">Chaho12</a></td><td>133d 2h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/issues/1217">#1217</a></td><td>Allow a backend cluster to belong to multiple routing groups (1:1 -&gt; 1:N)</td><td><a href="https://github.com/Chaho12">Chaho12</a></td><td>107d 23h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/issues/1219">#1219</a></td><td>ClusterStatsHttpMonitor is broken with Trino 483+</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>107d 2h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/issues/1235">#1235</a></td><td>Routing group follow-up requests fail in multi-pod trino-gateway's</td><td><a href="https://github.com/hpopuri2">hpopuri2</a></td><td>98d 21h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/issues/1241">#1241</a></td><td>searchAllBackendForQuery fails to locate running queries due to non-blocking ...</td><td><a href="https://github.com/alisanguo">alisanguo</a></td><td>93d 21h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/issues/1276">#1276</a></td><td>Make Flyway the only source of the database schema</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>63d 0h</td></tr>
<tr><td>trino-go-client</td><td><a href="https://github.com/trinodb/trino-go-client/issues/280">#280</a></td><td>Ping fails on Starburst Galaxy with external authentication</td><td><a href="https://github.com/lucargir">lucargir</a></td><td>14d 7h</td></tr>
<tr><td>trino-go-client</td><td><a href="https://github.com/trinodb/trino-go-client/issues/282">#282</a></td><td>Closing rows cancels the query with DELETE /v1/query, which gateways answer w...</td><td><a href="https://github.com/lucargir">lucargir</a></td><td>14d 7h</td></tr>
<tr><td>trino-js-client</td><td><a href="https://github.com/trinodb/trino-js-client/issues/979">#979</a></td><td>Track the downstream move to @trinodb/trino-js-client</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>77d 6h</td></tr>
<tr><td>trino-js-client</td><td><a href="https://github.com/trinodb/trino-js-client/issues/992">#992</a></td><td>Session statements are dropped when their iterator is never drained</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>52d 10h</td></tr>
<tr><td>trino-js-client</td><td><a href="https://github.com/trinodb/trino-js-client/issues/993">#993</a></td><td>Columns omits typeSignature, and next() yields any</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>52d 10h</td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/issues/602">#602</a></td><td>SQLAlchemy bulk insert is executed per row</td><td><a href="https://github.com/varvarvarvar">varvarvarvar</a></td><td>203d 20h</td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/issues/643">#643</a></td><td>KerberosAuthentication default MUTUAL_REQUIRED always fails against Trino (no...</td><td><a href="https://github.com/aminghadersohi">aminghadersohi</a></td><td>54d 19h</td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/issues/644">#644</a></td><td>Final spooled segment is not acknowledged when reading stops at the last row</td><td><a href="https://github.com/aminghadersohi">aminghadersohi</a></td><td>54d 16h</td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/issues/649">#649</a></td><td>SQLAlchemy get_indexes returns no partition index when the schema name needs ...</td><td><a href="https://github.com/RaphaelFakhri">RaphaelFakhri</a></td><td>25d 22h</td></tr>
<tr><td>trino-query-ui</td><td><a href="https://github.com/trinodb/trino-query-ui/issues/91">#91</a></td><td>Format SQL ignores the selection</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>36d 2h</td></tr>
<tr><td>trino-query-ui</td><td><a href="https://github.com/trinodb/trino-query-ui/issues/92">#92</a></td><td>Verify that formatting preserves the query tokens</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>36d 2h</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/5ff0dc721288b2af0d3c69361fa4aa310e66b0f2/sql/repositories/03-unanswered-issues.sql)

## First-time contributors

People whose first pull request to a repository was opened in the last 12 months, newest first, what happened to it, and how long it waited for a first response.
A quick first response keeps new people coming back. Thank them, and point them to issues they could help with next.

<table>
<thead>
<tr><th>Repository</th><th>Author</th><th>First PR</th><th>Opened</th><th>State</th><th>First response</th></tr>
</thead>
<tbody>
<tr><td>trino-gateway</td><td><a href="https://github.com/U-Ar">U-Ar</a></td><td><a href="https://github.com/trinodb/trino-gateway/pull/1433">#1433</a></td><td>2026-11-16</td><td>merged</td><td>5h 36m</td></tr>
<tr><td>grafana-trino</td><td><a href="https://github.com/MaelNedellec">MaelNedellec</a></td><td><a href="https://github.com/trinodb/grafana-trino/pull/389">#389</a></td><td>2026-11-12</td><td>open</td><td>6d 19h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/Yutong-1424">Yutong-1424</a></td><td><a href="https://github.com/trinodb/trino-gateway/pull/1408">#1408</a></td><td>2026-11-06</td><td>closed</td><td>none</td></tr>
<tr><td>trino-go-client</td><td><a href="https://github.com/lucargir">lucargir</a></td><td><a href="https://github.com/trinodb/trino-go-client/pull/281">#281</a></td><td>2026-11-05</td><td>open</td><td>27m 51s</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/partamonov">partamonov</a></td><td><a href="https://github.com/trinodb/trino-gateway/pull/1403">#1403</a></td><td>2026-11-03</td><td>open</td><td>16d 0h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/sdaberdaku">sdaberdaku</a></td><td><a href="https://github.com/trinodb/trino-gateway/pull/1381">#1381</a></td><td>2026-10-28</td><td>merged</td><td>1d 12h</td></tr>
<tr><td>grafana-trino</td><td><a href="https://github.com/vinzee">vinzee</a></td><td><a href="https://github.com/trinodb/grafana-trino/pull/382">#382</a></td><td>2026-10-28</td><td>open</td><td>5d 15h</td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/Kayvan-Zahiri">Kayvan-Zahiri</a></td><td><a href="https://github.com/trinodb/trino-python-client/pull/651">#651</a></td><td>2026-10-27</td><td>draft</td><td>none yet</td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/RaphaelFakhri">RaphaelFakhri</a></td><td><a href="https://github.com/trinodb/trino-python-client/pull/650">#650</a></td><td>2026-10-25</td><td>open</td><td>none yet</td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/Shahzeb-DataEngineer">Shahzeb-DataEngineer</a></td><td><a href="https://github.com/trinodb/trino-python-client/pull/648">#648</a></td><td>2026-10-23</td><td>open</td><td>none yet</td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/rebkwok">rebkwok</a></td><td><a href="https://github.com/trinodb/trino-python-client/pull/647">#647</a></td><td>2026-10-16</td><td>open</td><td>none yet</td></tr>
<tr><td>charts</td><td><a href="https://github.com/yrosemacbs">yrosemacbs</a></td><td><a href="https://github.com/trinodb/charts/pull/463">#463</a></td><td>2026-10-12</td><td>closed</td><td>50m 07s</td></tr>
<tr><td>trino-js-client</td><td><a href="https://github.com/arcman7">arcman7</a></td><td><a href="https://github.com/trinodb/trino-js-client/pull/1003">#1003</a></td><td>2026-10-08</td><td>open</td><td>none yet</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/Shivamrut">Shivamrut</a></td><td><a href="https://github.com/trinodb/trino-gateway/pull/1320">#1320</a></td><td>2026-10-08</td><td>merged</td><td>1d 0h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/owenmonn">owenmonn</a></td><td><a href="https://github.com/trinodb/trino-gateway/pull/1312">#1312</a></td><td>2026-10-03</td><td>merged</td><td>6d 11h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/developer-Bushido">developer-Bushido</a></td><td><a href="https://github.com/trinodb/trino-gateway/pull/1294">#1294</a></td><td>2026-09-28</td><td>closed</td><td>1h 50m</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/heehehe">heehehe</a></td><td><a href="https://github.com/trinodb/trino-gateway/pull/1289">#1289</a></td><td>2026-09-26</td><td>merged</td><td>2d 12h</td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/aminghadersohi">aminghadersohi</a></td><td><a href="https://github.com/trinodb/trino-python-client/pull/639">#639</a></td><td>2026-09-17</td><td>closed</td><td>none</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/nandaqmr">nandaqmr</a></td><td><a href="https://github.com/trinodb/trino-gateway/pull/1269">#1269</a></td><td>2026-09-15</td><td>closed</td><td>none</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/adityaanikam">adityaanikam</a></td><td><a href="https://github.com/trinodb/trino-gateway/pull/1258">#1258</a></td><td>2026-09-05</td><td>open</td><td>17d 16h</td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/tgmdimauro">tgmdimauro</a></td><td><a href="https://github.com/trinodb/trino-csharp-client/pull/37">#37</a></td><td>2026-09-02</td><td>closed</td><td>none</td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/lozbrown">lozbrown</a></td><td><a href="https://github.com/trinodb/trino-python-client/pull/637">#637</a></td><td>2026-09-02</td><td>merged</td><td>21d 1h</td></tr>
<tr><td>charts</td><td><a href="https://github.com/bochengyang">bochengyang</a></td><td><a href="https://github.com/trinodb/charts/pull/448">#448</a></td><td>2026-08-31</td><td>closed</td><td>26d 7h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/AzazelSensei">AzazelSensei</a></td><td><a href="https://github.com/trinodb/trino-gateway/pull/1248">#1248</a></td><td>2026-08-30</td><td>closed</td><td>18m 46s</td></tr>
<tr><td>grafana-trino</td><td><a href="https://github.com/MarcoAP">MarcoAP</a></td><td><a href="https://github.com/trinodb/grafana-trino/pull/348">#348</a></td><td>2026-08-24</td><td>merged</td><td>4m 24s</td></tr>
<tr><td>charts</td><td><a href="https://github.com/talsh-oasis">talsh-oasis</a></td><td><a href="https://github.com/trinodb/charts/pull/447">#447</a></td><td>2026-08-19</td><td>closed</td><td>52d 6h</td></tr>
<tr><td>trino-go-client</td><td><a href="https://github.com/slachiewicz">slachiewicz</a></td><td><a href="https://github.com/trinodb/trino-go-client/pull/182">#182</a></td><td>2026-08-10</td><td>merged</td><td>13h 37m</td></tr>
<tr><td>trino-go-client</td><td><a href="https://github.com/akgerber">akgerber</a></td><td><a href="https://github.com/trinodb/trino-go-client/pull/180">#180</a></td><td>2026-07-30</td><td>closed</td><td>51d 6h</td></tr>
<tr><td>trino-query-ui</td><td><a href="https://github.com/gertjanal">gertjanal</a></td><td><a href="https://github.com/trinodb/trino-query-ui/pull/40">#40</a></td><td>2026-07-29</td><td>merged</td><td>1d 19h</td></tr>
<tr><td>charts</td><td><a href="https://github.com/etolbakov">etolbakov</a></td><td><a href="https://github.com/trinodb/charts/pull/443">#443</a></td><td>2026-07-16</td><td>merged</td><td>85d 17h</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/5ff0dc721288b2af0d3c69361fa4aa310e66b0f2/sql/repositories/04-first-time-contributors.sql)

## Who reviews

People who reviewed or commented on pull requests of other people in the last 12 months, per repository, and the share of reviewed pull requests the top reviewer saw.
When one person reviews almost everything, the repository stops when they're away. Reviews from users of a client count too: ask them to review.

<table>
<thead>
<tr><th>Repository</th><th style="text-align: right">Reviewed PRs</th><th style="text-align: right">Reviewers</th><th>Seen by the top reviewer</th><th>Top reviewers (PRs)</th></tr>
</thead>
<tbody>
<tr><td>trino-gateway</td><td style="text-align: right">174</td><td style="text-align: right">33</td><td>47%</td><td>ebyhr (81), Chaho12 (76), mosabua (73), wendigo (28)</td></tr>
<tr><td>trino-go-client</td><td style="text-align: right">55</td><td style="text-align: right">3</td><td>87%</td><td>nineinchnick (48), Flgado (11), slachiewicz (6)</td></tr>
<tr><td>charts</td><td style="text-align: right">45</td><td style="text-align: right">5</td><td>93%</td><td>nineinchnick (42), wendigo (2), electrum (1), lozbrown (1)</td></tr>
<tr><td>trino-python-client</td><td style="text-align: right">42</td><td style="text-align: right">10</td><td>45%</td><td>azawlocki-sbdt (19), hashhar (16), wendigo (14), damian3031 (5)</td></tr>
<tr><td>trino-query-ui</td><td style="text-align: right">33</td><td style="text-align: right">3</td><td>61%</td><td>mosabua (20), koszti (16), wendigo (3)</td></tr>
<tr><td>grafana-trino</td><td style="text-align: right">18</td><td style="text-align: right">13</td><td>94%</td><td>nineinchnick (17), Flgado (3), vfauth (2), ForTheYin (1)</td></tr>
<tr><td>trino-js-client</td><td style="text-align: right">14</td><td style="text-align: right">5</td><td>36%</td><td>mosabua (5), wendigo (5), koszti (4), martint (1)</td></tr>
<tr><td>trino-csharp-client</td><td style="text-align: right">4</td><td style="text-align: right">3</td><td>50%</td><td>stephen-zhao (2), wendigo (2), QimbE (1)</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/5ff0dc721288b2af0d3c69361fa4aa310e66b0f2/sql/repositories/05-reviewers.sql)

Generated on Fri Nov 20 06:16:05 UTC 2026

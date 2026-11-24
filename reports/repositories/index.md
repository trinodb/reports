---
title: Trino Clients and Tools
---

## Activity per repository

Pull requests and issues of people in the clients and tools of Trino in the last 12 months, what is open now, and the median time until another person commented or reviewed a pull request. Pull requests of bots, like dependency updates, are counted on their own.
A repository with many open pull requests or issues, or a slow first response, needs more maintainers; ask for help in #dev on Slack.

<pre><code>
     Repository      | People | PRs | Merged | First response | Open PRs | Issues | Open issues | Bot PRs / open | PRs per month, 24 months chart 
---------------------+--------+-----+--------+----------------+----------+--------+-------------+----------------+--------------------------------
 trino-gateway       |     79 | 195 |    133 | 15h 08m        |       38 |     59 |         119 | 429 / 1        | ▄▄▅▃▂▂▄▅▃▂▃▂▃▆▅▃▂▂▃▃▂▄██       
 trino-go-client     |      8 |  99 |     96 | 5d 1h          |        1 |     39 |           0 | 0 / 0          | .▁▁▁▁▁.▁▁▁.▂▁...▁..▁▁▄█▄       
 charts              |     46 |  60 |     39 | 1d 13h         |        5 |     15 |          11 | 20 / 4         | ▄▆▃▆▄█▃▄.▃..▂▄▁▄▆▃▄▂▂▂█.       
 trino-python-client |     36 |  53 |     29 | 4d 1h          |       28 |     18 |          33 | 0 / 0          | ▆▆▆▂▃▂▃▃▂.▁.▂▃▁▃▃▂▅█▆▅▄▂       
 trino-query-ui      |      8 |  44 |     39 | 21h 39m        |        2 |      6 |           5 | 31 / 4         | ....▃▁.▁.▁▁▁▅....▂▂▂▇█▂▁       
 grafana-trino       |     25 |  30 |     27 | 3d 16h         |        1 |      9 |           2 | 35 / 1         | ▁.▁.▂▁.▂.▂▂▁▂..▁▁..▁▄▂█▃       
 trino-js-client     |     16 |  17 |     11 | 1d 5h          |        5 |      7 |          12 | 42 / 8         | ..▁▁▂..▁▂.▁▅▁....▄..▁█▁.       
 trino-csharp-client |      9 |   4 |      0 | 7h 46m         |       11 |      3 |          14 | 0 / 0          | █▄▄▅▅.....▂..▂▂......▄..       
(8 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/8d8b96358ecf0faee9462e571270dca2f2057018/sql/repositories/01-activity.sql)

## Open pull requests

Pull requests of people that aren't drafts, at most 8 per repository: approved ones first, because they only need a merge, then the ones without any response, oldest first, and then the ones that waited the longest since another person last commented or reviewed. Without commits, it doesn't show whether the author pushed changes since then.
Merge or close approved pull requests, answer the ones without a response, and ask the authors of the others whether they still work on them.

<table>
<thead>
<tr><th>Repository</th><th>PR</th><th>Title</th><th>Author</th><th>Open for</th><th>Review</th><th>Last response</th></tr>
</thead>
<tbody>
<tr><td>charts</td><td><a href="https://github.com/trinodb/charts/pull/468">#468</a></td><td>Release Trino Gateway chart 1.23.0</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>34d 10h</td><td>no response</td><td></td></tr>
<tr><td>charts</td><td><a href="https://github.com/trinodb/charts/pull/471">#471</a></td><td>Add HTTPRoute support to the Trino Gateway chart</td><td><a href="https://github.com/sdaberdaku">sdaberdaku</a></td><td>26d 11h</td><td>no response</td><td></td></tr>
<tr><td>charts</td><td><a href="https://github.com/trinodb/charts/pull/472">#472</a></td><td>Allow an existing Secret for the Trino Gateway configuration</td><td><a href="https://github.com/sdaberdaku">sdaberdaku</a></td><td>26d 10h</td><td>no response</td><td></td></tr>
<tr><td>charts</td><td><a href="https://github.com/trinodb/charts/pull/178">#178</a></td><td>Test with dynamic catalogs</td><td><a href="https://github.com/nineinchnick">nineinchnick</a></td><td>905d 18h</td><td>commented</td><td>903d 14h</td></tr>
<tr><td>charts</td><td><a href="https://github.com/trinodb/charts/pull/409">#409</a></td><td>Add query-manager.required-workers guidance to KEDA documentation</td><td><a href="https://github.com/jmealo">jmealo</a></td><td>241d 11h</td><td>commented</td><td>44d 16h</td></tr>
<tr><td>grafana-trino</td><td><a href="https://github.com/trinodb/grafana-trino/pull/382">#382</a></td><td>Fall back to the other attribute when impersonating</td><td><a href="https://github.com/vinzee">vinzee</a></td><td>27d 4h</td><td>commented</td><td>2d 16h</td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/pull/4">#4</a></td><td>Add release labelling</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>705d 9h</td><td>approved</td><td>703d 5h</td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/pull/15">#15</a></td><td>Fix error deserialization with non-empty suppressed filed</td><td><a href="https://github.com/stelmukhov">stelmukhov</a></td><td>633d 19h</td><td>approved</td><td>611d 10h</td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/pull/21">#21</a></td><td>Add the toString override to build the role header string</td><td><a href="https://github.com/SaravananPrasadh-SP">SaravananPrasadh-SP</a></td><td>609d 15h</td><td>approved</td><td>602d 9h</td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/pull/26">#26</a></td><td>Fix httpClient initialization in StatementClientV1 class.</td><td><a href="https://github.com/Szychulski">Szychulski</a></td><td>573d 19h</td><td>approved</td><td>522d 10h</td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/pull/13">#13</a></td><td>Fix NaN values handling in the progressPercentage property</td><td><a href="https://github.com/stelmukhov">stelmukhov</a></td><td>640d 19h</td><td>approved</td><td>277d 16h</td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/pull/34">#34</a></td><td>Add release flow for nuget.org</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>277d 3h</td><td>approved</td><td>276d 20h</td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/pull/33">#33</a></td><td>bugfix: json response fails because of wrong field type "suppressed"</td><td><a href="https://github.com/razgaou">razgaou</a></td><td>299d 19h</td><td>no response</td><td></td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/pull/25">#25</a></td><td>Fix case when cancellation token was requested but query was not ca...</td><td><a href="https://github.com/MAF1N">MAF1N</a></td><td>591d 15h</td><td>commented</td><td>583d 12h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/pull/923">#923</a></td><td>Refactor routing logics and remove unused lookups</td><td><a href="https://github.com/oneonestar">oneonestar</a></td><td>279d 22h</td><td>approved</td><td>28d 12h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/pull/1342">#1342</a></td><td>Add option to take the user from a userinfo claim</td><td><a href="https://github.com/developer-Bushido">developer-Bushido</a></td><td>38d 19h</td><td>approved</td><td>12d 17h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/pull/1330">#1330</a></td><td>Add a timeout to the userinfo request</td><td><a href="https://github.com/developer-Bushido">developer-Bushido</a></td><td>42d 17h</td><td>approved</td><td>2d 0h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/pull/1404">#1404</a></td><td>Add option to health check inactive backends</td><td><a href="https://github.com/Chaho12">Chaho12</a></td><td>20d 0h</td><td>no response</td><td></td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/pull/1409">#1409</a></td><td>Add HTTPS and authentication dev runner</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>16d 17h</td><td>no response</td><td></td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/pull/1419">#1419</a></td><td>Match external routing headers case-insensitively</td><td><a href="https://github.com/Chaho12">Chaho12</a></td><td>11d 17h</td><td>no response</td><td></td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/pull/1420">#1420</a></td><td>Add blocked users management</td><td><a href="https://github.com/prakhar10">prakhar10</a></td><td>11d 7h</td><td>no response</td><td></td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/pull/1421">#1421</a></td><td>Add user_name index to query history</td><td><a href="https://github.com/Chaho12">Chaho12</a></td><td>11d 3h</td><td>no response</td><td></td></tr>
<tr><td>trino-go-client</td><td><a href="https://github.com/trinodb/trino-go-client/pull/304">#304</a></td><td>Skip the cancel on Close when the server has ended the query</td><td><a href="https://github.com/slachiewicz">slachiewicz</a></td><td>15d 6h</td><td>commented</td><td>3d 20h</td></tr>
<tr><td>trino-js-client</td><td><a href="https://github.com/trinodb/trino-js-client/pull/994">#994</a></td><td>Export the Trino header names</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>56d 6h</td><td>no response</td><td></td></tr>
<tr><td>trino-js-client</td><td><a href="https://github.com/trinodb/trino-js-client/pull/1003">#1003</a></td><td>Add AbortSignal support to query</td><td><a href="https://github.com/arcman7">arcman7</a></td><td>46d 9h</td><td>no response</td><td></td></tr>
<tr><td>trino-js-client</td><td><a href="https://github.com/trinodb/trino-js-client/pull/855">#855</a></td><td>feat: add jwt auth (#524)</td><td><a href="https://github.com/emmc15">emmc15</a></td><td>494d 2h</td><td>commented</td><td>299d 13h</td></tr>
<tr><td>trino-js-client</td><td><a href="https://github.com/trinodb/trino-js-client/pull/944">#944</a></td><td>add abortSignal support to query()</td><td><a href="https://github.com/SamBove">SamBove</a></td><td>364d 9h</td><td>commented</td><td>81d 6h</td></tr>
<tr><td>trino-js-client</td><td><a href="https://github.com/trinodb/trino-js-client/pull/956">#956</a></td><td>Remove axios in favor of native fetch + undici</td><td><a href="https://github.com/GeoBradDev">GeoBradDev</a></td><td>187d 5h</td><td>commented</td><td>45d 6h</td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/pull/400">#400</a></td><td>add an option to deferred fetch result in Cursor.execute()</td><td><a href="https://github.com/dungdm93">dungdm93</a></td><td>1203d 20h</td><td>approved</td><td>1152d 21h</td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/pull/322">#322</a></td><td>Add type hints for sqlalchemy</td><td><a href="https://github.com/damian3031">damian3031</a></td><td>1410d 20h</td><td>no response</td><td></td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/pull/631">#631</a></td><td>Add literal_processor to TIMESTAMP, TIME and DATE SQLAlchemy types</td><td><a href="https://github.com/hashhar">hashhar</a></td><td>97d 15h</td><td>no response</td><td></td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/pull/645">#645</a></td><td>Acknowledge spooled segments once decoded</td><td><a href="https://github.com/aminghadersohi">aminghadersohi</a></td><td>58d 16h</td><td>no response</td><td></td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/pull/646">#646</a></td><td>Use GitHub App token in Python versions update workflow</td><td><a href="https://github.com/hashhar">hashhar</a></td><td>52d 13h</td><td>no response</td><td></td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/pull/647">#647</a></td><td>Enable SQL compilation caching for the ignore-nulls window functions</td><td><a href="https://github.com/rebkwok">rebkwok</a></td><td>38d 15h</td><td>no response</td><td></td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/pull/648">#648</a></td><td>docs: document all Connection parameters in docstring and README</td><td><a href="https://github.com/Shahzeb-DataEngineer">Shahzeb-DataEngineer</a></td><td>32d 1h</td><td>no response</td><td></td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/pull/650">#650</a></td><td>Quote schema and table in SQLAlchemy partitions lookup</td><td><a href="https://github.com/RaphaelFakhri">RaphaelFakhri</a></td><td>29d 22h</td><td>no response</td><td></td></tr>
<tr><td>trino-query-ui</td><td><a href="https://github.com/trinodb/trino-query-ui/pull/93">#93</a></td><td>Verify formatted SQL with the lexer</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>40d 1h</td><td>no response</td><td></td></tr>
<tr><td>trino-query-ui</td><td><a href="https://github.com/trinodb/trino-query-ui/pull/100">#100</a></td><td>Remove the duplicate Ctrl+Enter command</td><td><a href="https://github.com/BobDu">BobDu</a></td><td>6d 0h</td><td>no response</td><td></td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/8d8b96358ecf0faee9462e571270dca2f2057018/sql/repositories/02-open-pull-requests.sql)

## Issues without an answer

Issues of people opened in the last 12 months that are still open and that no other person commented on, at most 8 per repository, oldest first. Older ones are counted in "Activity per repository".
An answer, even a question or a label, tells the reporter that someone read it. Close the ones that are fixed or can't be reproduced.

<table>
<thead>
<tr><th>Repository</th><th>Issue</th><th>Title</th><th>Author</th><th>Open for</th></tr>
</thead>
<tbody>
<tr><td>charts</td><td><a href="https://github.com/trinodb/charts/issues/473">#473</a></td><td>`maxHeapSize: null` is ignored with Helm `4.2+` when Trino is a subchart</td><td><a href="https://github.com/didinator">didinator</a></td><td>25d 9h</td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/issues/32">#32</a></td><td>bug: failed json response parsing (Hive metastore connector)</td><td><a href="https://github.com/razgaou">razgaou</a></td><td>299d 19h</td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/issues/35">#35</a></td><td>IsTimeout check is not platform independent</td><td><a href="https://github.com/petr-pokorny-absa">petr-pokorny-absa</a></td><td>229d 22h</td></tr>
<tr><td>trino-csharp-client</td><td><a href="https://github.com/trinodb/trino-csharp-client/issues/36">#36</a></td><td>Nuget package</td><td><a href="https://github.com/jzabroski">jzabroski</a></td><td>221d 12h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/issues/822">#822</a></td><td>Avoid FixedHostPortGenericContainer in TestOIDC</td><td><a href="https://github.com/ebyhr">ebyhr</a></td><td>324d 20h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/issues/878">#878</a></td><td>Routing rules execute all matching rules' actions instead of stopping at firs...</td><td><a href="https://github.com/Setsushin">Setsushin</a></td><td>298d 20h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/issues/1171">#1171</a></td><td>Extending Trino Gateway to route to Kyuubi (and beyond Trino)</td><td><a href="https://github.com/Chaho12">Chaho12</a></td><td>137d 2h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/issues/1217">#1217</a></td><td>Allow a backend cluster to belong to multiple routing groups (1:1 -&gt; 1:N)</td><td><a href="https://github.com/Chaho12">Chaho12</a></td><td>111d 23h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/issues/1219">#1219</a></td><td>ClusterStatsHttpMonitor is broken with Trino 483+</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>111d 2h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/issues/1235">#1235</a></td><td>Routing group follow-up requests fail in multi-pod trino-gateway's</td><td><a href="https://github.com/hpopuri2">hpopuri2</a></td><td>102d 21h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/issues/1241">#1241</a></td><td>searchAllBackendForQuery fails to locate running queries due to non-blocking ...</td><td><a href="https://github.com/alisanguo">alisanguo</a></td><td>97d 21h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/trinodb/trino-gateway/issues/1334">#1334</a></td><td>Pass `EXECUTE ... USING` parameter values to routing rules and external routers</td><td><a href="https://github.com/Chaho12">Chaho12</a></td><td>40d 20h</td></tr>
<tr><td>trino-js-client</td><td><a href="https://github.com/trinodb/trino-js-client/issues/979">#979</a></td><td>Track the downstream move to @trinodb/trino-js-client</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>81d 6h</td></tr>
<tr><td>trino-js-client</td><td><a href="https://github.com/trinodb/trino-js-client/issues/992">#992</a></td><td>Session statements are dropped when their iterator is never drained</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>56d 10h</td></tr>
<tr><td>trino-js-client</td><td><a href="https://github.com/trinodb/trino-js-client/issues/993">#993</a></td><td>Columns omits typeSignature, and next() yields any</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>56d 10h</td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/issues/602">#602</a></td><td>SQLAlchemy bulk insert is executed per row</td><td><a href="https://github.com/varvarvarvar">varvarvarvar</a></td><td>207d 20h</td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/issues/643">#643</a></td><td>KerberosAuthentication default MUTUAL_REQUIRED always fails against Trino (no...</td><td><a href="https://github.com/aminghadersohi">aminghadersohi</a></td><td>58d 19h</td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/issues/644">#644</a></td><td>Final spooled segment is not acknowledged when reading stops at the last row</td><td><a href="https://github.com/aminghadersohi">aminghadersohi</a></td><td>58d 16h</td></tr>
<tr><td>trino-python-client</td><td><a href="https://github.com/trinodb/trino-python-client/issues/649">#649</a></td><td>SQLAlchemy get_indexes returns no partition index when the schema name needs ...</td><td><a href="https://github.com/RaphaelFakhri">RaphaelFakhri</a></td><td>29d 22h</td></tr>
<tr><td>trino-query-ui</td><td><a href="https://github.com/trinodb/trino-query-ui/issues/91">#91</a></td><td>Format SQL ignores the selection</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>40d 2h</td></tr>
<tr><td>trino-query-ui</td><td><a href="https://github.com/trinodb/trino-query-ui/issues/92">#92</a></td><td>Verify that formatting preserves the query tokens</td><td><a href="https://github.com/mosabua">mosabua</a></td><td>40d 2h</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/8d8b96358ecf0faee9462e571270dca2f2057018/sql/repositories/03-unanswered-issues.sql)

## First-time contributors

People whose first pull request to a repository was opened in the last 12 months, newest first, what happened to it, and how long it waited for a first response.
A quick first response keeps new people coming back. Thank them, and point them to issues they could help with next.

<table>
<thead>
<tr><th>Repository</th><th>Author</th><th>First PR</th><th>Opened</th><th>State</th><th>First response</th></tr>
</thead>
<tbody>
<tr><td>trino-gateway</td><td><a href="https://github.com/aryankalantri">aryankalantri</a></td><td><a href="https://github.com/trinodb/trino-gateway/pull/1461">#1461</a></td><td>2026-11-22</td><td>open</td><td>4h 16m</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/U-Ar">U-Ar</a></td><td><a href="https://github.com/trinodb/trino-gateway/pull/1433">#1433</a></td><td>2026-11-16</td><td>merged</td><td>5h 36m</td></tr>
<tr><td>grafana-trino</td><td><a href="https://github.com/MaelNedellec">MaelNedellec</a></td><td><a href="https://github.com/trinodb/grafana-trino/pull/389">#389</a></td><td>2026-11-12</td><td>merged</td><td>6d 19h</td></tr>
<tr><td>trino-gateway</td><td><a href="https://github.com/Yutong-1424">Yutong-1424</a></td><td><a href="https://github.com/trinodb/trino-gateway/pull/1408">#1408</a></td><td>2026-11-06</td><td>closed</td><td>none</td></tr>
<tr><td>trino-go-client</td><td><a href="https://github.com/lucargir">lucargir</a></td><td><a href="https://github.com/trinodb/trino-go-client/pull/281">#281</a></td><td>2026-11-05</td><td>merged</td><td>27m 51s</td></tr>
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
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/8d8b96358ecf0faee9462e571270dca2f2057018/sql/repositories/04-first-time-contributors.sql)

## Who reviews

People who reviewed or commented on pull requests of other people in the last 12 months, per repository, and the share of reviewed pull requests the top reviewer saw.
When one person reviews almost everything, the repository stops when they're away. Reviews from users of a client count too: ask them to review.

<table>
<thead>
<tr><th>Repository</th><th style="text-align: right">Reviewed PRs</th><th style="text-align: right">Reviewers</th><th>Seen by the top reviewer</th><th>Top reviewers (PRs)</th></tr>
</thead>
<tbody>
<tr><td>trino-gateway</td><td style="text-align: right">184</td><td style="text-align: right">33</td><td>46%</td><td>ebyhr (84), mosabua (83), Chaho12 (78), wendigo (28)</td></tr>
<tr><td>trino-go-client</td><td style="text-align: right">63</td><td style="text-align: right">3</td><td>89%</td><td>nineinchnick (56), Flgado (11), slachiewicz (6)</td></tr>
<tr><td>charts</td><td style="text-align: right">45</td><td style="text-align: right">5</td><td>93%</td><td>nineinchnick (42), wendigo (2), electrum (1), lozbrown (1)</td></tr>
<tr><td>trino-python-client</td><td style="text-align: right">42</td><td style="text-align: right">10</td><td>45%</td><td>azawlocki-sbdt (19), hashhar (16), wendigo (14), damian3031 (5)</td></tr>
<tr><td>trino-query-ui</td><td style="text-align: right">33</td><td style="text-align: right">3</td><td>61%</td><td>mosabua (20), koszti (16), wendigo (3)</td></tr>
<tr><td>grafana-trino</td><td style="text-align: right">19</td><td style="text-align: right">13</td><td>95%</td><td>nineinchnick (18), Flgado (3), vfauth (2), ForTheYin (1)</td></tr>
<tr><td>trino-js-client</td><td style="text-align: right">14</td><td style="text-align: right">5</td><td>36%</td><td>mosabua (5), wendigo (5), koszti (4), martint (1)</td></tr>
<tr><td>trino-csharp-client</td><td style="text-align: right">2</td><td style="text-align: right">2</td><td>100%</td><td>wendigo (2), QimbE (1)</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/8d8b96358ecf0faee9462e571270dca2f2057018/sql/repositories/05-reviewers.sql)

Generated on Tue Nov 24 06:16:20 UTC 2026

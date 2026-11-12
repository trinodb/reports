---
title: Trino Clients and Tools
---

## Activity per repository

Pull requests and issues of people in the clients and tools of Trino in the last 12 months, what is open now, and the median time until another person commented or reviewed a pull request. Pull requests of bots, like dependency updates, are counted on their own.
A repository with many open pull requests or issues, or a slow first response, needs more maintainers; ask for help in #dev on Slack.

<pre><code>
     Repository      | People | PRs | Merged | First response | Open PRs | Issues | Open issues | Bot PRs / open | PRs per month, 24 months chart 
---------------------+--------+-----+--------+----------------+----------+--------+-------------+----------------+--------------------------------
 trino-gateway       |     74 | 170 |    115 | 14h 28m        |       35 |     52 |         119 | 401 / 0        | ▄▄▅▃▂▂▄▅▃▂▃▂▃▆▅▃▂▂▃▃▂▄█▂       
 trino-go-client     |      8 |  94 |     87 | 2d 17h         |        3 |     39 |           2 | 0 / 0          | .▁▁▁▁▁.▁▁▁.▂▁...▁..▁▁▄█▃       
 charts              |     46 |  60 |     39 | 1d 13h         |        5 |     16 |          11 | 18 / 3         | ▄▆▃▆▄█▃▄.▃..▂▄▁▄▆▃▄▂▂▂█.       
 trino-python-client |     37 |  52 |     29 | 4d 1h          |       27 |     20 |          33 | 0 / 0          | ▆▆▆▂▃▂▃▃▂.▁.▂▃▁▃▃▂▅█▆▅▄▁       
 trino-query-ui      |      8 |  43 |     39 | 21h 39m        |        1 |      6 |           5 | 27 / 3         | ....▃▁.▁.▁▁▁▅....▂▂▂▇█▂.       
 grafana-trino       |     27 |  27 |     23 | 3d 23h         |        2 |      9 |           2 | 30 / 0         | ▁.▁.▂▁.▂.▂▂▁▂..▁▁..▁▄▂█▁       
 trino-js-client     |     16 |  21 |     14 | 12h 32m        |        5 |      7 |          12 | 50 / 8         | ..▁▁▂..▁▂.▁▅▁....▄..▁█▁.       
 trino-csharp-client |     10 |   4 |      0 | 7h 46m         |       11 |      3 |          14 | 0 / 0          | █▄▄▅▅.....▂..▂▂......▄..       
(8 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/repositories/01-activity.sql)

## Open pull requests

Pull requests of people that aren't drafts, at most 8 per repository: approved ones first, because they only need a merge, then the ones without any response, oldest first, and then the ones that waited the longest since another person last commented or reviewed. Without commits, it doesn't show whether the author pushed changes since then.
Merge or close approved pull requests, answer the ones without a response, and ask the authors of the others whether they still work on them.

| Repository          | PR                                                               | Title                                                                  | Author                                                          | Open for | Review      | Last response |
| ------------------- | ---------------------------------------------------------------- | ---------------------------------------------------------------------- | --------------------------------------------------------------- | -------- | ----------- | ------------- |
| charts              | <a href="https://github.com/trinodb/charts/pull/468">\#468</a>               | Release Trino Gateway chart 1.23.0                                     | <a href="https://github.com/mosabua">mosabua</a>                            | 22d 13h  | no response |               |
| charts              | <a href="https://github.com/trinodb/charts/pull/471">\#471</a>               | Add HTTPRoute support to the Trino Gateway chart                       | <a href="https://github.com/sdaberdaku">sdaberdaku</a>                      | 14d 15h  | no response |               |
| charts              | <a href="https://github.com/trinodb/charts/pull/472">\#472</a>               | Allow an existing Secret for the Trino Gateway configuration           | <a href="https://github.com/sdaberdaku">sdaberdaku</a>                      | 14d 14h  | no response |               |
| charts              | <a href="https://github.com/trinodb/charts/pull/178">\#178</a>               | Test with dynamic catalogs                                             | <a href="https://github.com/nineinchnick">nineinchnick</a>                  | 893d 22h | commented   | 891d 17h      |
| charts              | <a href="https://github.com/trinodb/charts/pull/409">\#409</a>               | Add query-manager.required-workers guidance to KEDA documentation      | <a href="https://github.com/jmealo">jmealo</a>                              | 229d 15h | commented   | 32d 20h       |
| grafana-trino       | <a href="https://github.com/trinodb/grafana-trino/pull/382">\#382</a>        | Allow excluding impersonation for Grafana alerts                       | <a href="https://github.com/vinzee">vinzee</a>                              | 15d 8h   | commented   | 9d 16h        |
| grafana-trino       | <a href="https://github.com/trinodb/grafana-trino/pull/365">\#365</a>        | Add optional asynchronous query polling                                | <a href="https://github.com/Flgado">Flgado</a>                              | 36d 14h  | commented   | 1d 23h        |
| trino-csharp-client | <a href="https://github.com/trinodb/trino-csharp-client/pull/4">\#4</a>      | Add release labelling                                                  | <a href="https://github.com/mosabua">mosabua</a>                            | 693d 13h | approved    | 691d 9h       |
| trino-csharp-client | <a href="https://github.com/trinodb/trino-csharp-client/pull/15">\#15</a>    | Fix error deserialization with non-empty suppressed filed              | <a href="https://github.com/stelmukhov">stelmukhov</a>                      | 621d 22h | approved    | 599d 14h      |
| trino-csharp-client | <a href="https://github.com/trinodb/trino-csharp-client/pull/21">\#21</a>    | Add the toString override to build the role header string              | <a href="https://github.com/SaravananPrasadh-SP">SaravananPrasadh-SP</a>    | 597d 19h | approved    | 590d 12h      |
| trino-csharp-client | <a href="https://github.com/trinodb/trino-csharp-client/pull/26">\#26</a>    | Fix httpClient initialization in StatementClientV1 class.              | <a href="https://github.com/Szychulski">Szychulski</a>                      | 561d 23h | approved    | 510d 14h      |
| trino-csharp-client | <a href="https://github.com/trinodb/trino-csharp-client/pull/13">\#13</a>    | Fix NaN values handling in the progressPercentage property             | <a href="https://github.com/stelmukhov">stelmukhov</a>                      | 628d 22h | approved    | 265d 19h      |
| trino-csharp-client | <a href="https://github.com/trinodb/trino-csharp-client/pull/34">\#34</a>    | Add release flow for nuget.org                                         | <a href="https://github.com/mosabua">mosabua</a>                            | 265d 7h  | approved    | 264d 23h      |
| trino-csharp-client | <a href="https://github.com/trinodb/trino-csharp-client/pull/33">\#33</a>    | bugfix: json response fails because of wrong field type "suppressed"   | <a href="https://github.com/razgaou">razgaou</a>                            | 287d 22h | no response |               |
| trino-csharp-client | <a href="https://github.com/trinodb/trino-csharp-client/pull/25">\#25</a>    | Fix case when cancellation token was requested but query was not ca... | <a href="https://github.com/MAF1N">MAF1N</a>                                | 579d 18h | commented   | 571d 15h      |
| trino-gateway       | <a href="https://github.com/trinodb/trino-gateway/pull/923">\#923</a>        | Refactor routing logics and remove unused lookups                      | <a href="https://github.com/oneonestar">oneonestar</a>                      | 268d 2h  | approved    | 16d 16h       |
| trino-gateway       | <a href="https://github.com/trinodb/trino-gateway/pull/1380">\#1380</a>      | Tighten routing fallback tests and error responses                     | <a href="https://github.com/Chaho12">Chaho12</a>                            | 15d 2h   | approved    | 14d 20h       |
| trino-gateway       | <a href="https://github.com/trinodb/trino-gateway/pull/1223">\#1223</a>      | Support current Trino in cluster stats monitors                        | <a href="https://github.com/mosabua">mosabua</a>                            | 99d 3h   | approved    | 13d 7h        |
| trino-gateway       | <a href="https://github.com/trinodb/trino-gateway/pull/1279">\#1279</a>      | Fix corruption and truncation of proxied responses                     | <a href="https://github.com/nandaqmr">nandaqmr</a>                          | 52d 15h  | approved    | 9d 11h        |
| trino-gateway       | <a href="https://github.com/trinodb/trino-gateway/pull/1341">\#1341</a>      | Add option to link queries to the Trino 483 Web UI                     | <a href="https://github.com/developer-Bushido">developer-Bushido</a>        | 26d 22h  | approved    | 1d 1h         |
| trino-gateway       | <a href="https://github.com/trinodb/trino-gateway/pull/1342">\#1342</a>      | Add option to take the user from a userinfo claim                      | <a href="https://github.com/developer-Bushido">developer-Bushido</a>        | 26d 22h  | approved    | 20h 40m       |
| trino-gateway       | <a href="https://github.com/trinodb/trino-gateway/pull/1306">\#1306</a>      | Route spooled segment requests to the producing cluster                | <a href="https://github.com/nandaqmr">nandaqmr</a>                          | 42d 3h   | no response |               |
| trino-gateway       | <a href="https://github.com/trinodb/trino-gateway/pull/1307">\#1307</a>      | Keep the webapp session in an HttpOnly cookie                          | <a href="https://github.com/maswin">maswin</a>                              | 42d 3h   | no response |               |
| trino-go-client     | <a href="https://github.com/trinodb/trino-go-client/pull/281">\#281</a>      | Add validateConnection to skip the credentials check in Ping           | <a href="https://github.com/lucargir">lucargir</a>                          | 6d 11h   | approved    | 3d 16h        |
| trino-go-client     | <a href="https://github.com/trinodb/trino-go-client/pull/283">\#283</a>      | Cancel queries with a DELETE to their nextUri                          | <a href="https://github.com/lucargir">lucargir</a>                          | 6d 10h   | approved    | 3d 16h        |
| trino-go-client     | <a href="https://github.com/trinodb/trino-go-client/pull/304">\#304</a>      | Skip the cancel on Close when the server has ended the query           | <a href="https://github.com/slachiewicz">slachiewicz</a>                    | 3d 9h    | no response |               |
| trino-js-client     | <a href="https://github.com/trinodb/trino-js-client/pull/994">\#994</a>      | Export the Trino header names                                          | <a href="https://github.com/mosabua">mosabua</a>                            | 44d 9h   | no response |               |
| trino-js-client     | <a href="https://github.com/trinodb/trino-js-client/pull/1003">\#1003</a>    | Add AbortSignal support to query                                       | <a href="https://github.com/arcman7">arcman7</a>                            | 34d 13h  | no response |               |
| trino-js-client     | <a href="https://github.com/trinodb/trino-js-client/pull/855">\#855</a>      | feat: add jwt auth \(\#524\)                                           | <a href="https://github.com/emmc15">emmc15</a>                              | 482d 5h  | commented   | 287d 16h      |
| trino-js-client     | <a href="https://github.com/trinodb/trino-js-client/pull/944">\#944</a>      | add abortSignal support to query\(\)                                   | <a href="https://github.com/SamBove">SamBove</a>                            | 352d 12h | commented   | 69d 10h       |
| trino-js-client     | <a href="https://github.com/trinodb/trino-js-client/pull/956">\#956</a>      | Remove axios in favor of native fetch \+ undici                        | <a href="https://github.com/GeoBradDev">GeoBradDev</a>                      | 175d 8h  | commented   | 33d 9h        |
| trino-python-client | <a href="https://github.com/trinodb/trino-python-client/pull/400">\#400</a>  | add an option to deferred fetch result in Cursor.execute\(\)           | <a href="https://github.com/dungdm93">dungdm93</a>                          | 1192d 0h | approved    | 1141d 1h      |
| trino-python-client | <a href="https://github.com/trinodb/trino-python-client/pull/322">\#322</a>  | Add type hints for sqlalchemy                                          | <a href="https://github.com/damian3031">damian3031</a>                      | 1399d 0h | no response |               |
| trino-python-client | <a href="https://github.com/trinodb/trino-python-client/pull/631">\#631</a>  | Add literal\_processor to TIMESTAMP, TIME and DATE SQLAlchemy types    | <a href="https://github.com/hashhar">hashhar</a>                            | 85d 19h  | no response |               |
| trino-python-client | <a href="https://github.com/trinodb/trino-python-client/pull/645">\#645</a>  | Acknowledge spooled segments once decoded                              | <a href="https://github.com/aminghadersohi">aminghadersohi</a>              | 46d 19h  | no response |               |
| trino-python-client | <a href="https://github.com/trinodb/trino-python-client/pull/646">\#646</a>  | Use GitHub App token in Python versions update workflow                | <a href="https://github.com/hashhar">hashhar</a>                            | 40d 17h  | no response |               |
| trino-python-client | <a href="https://github.com/trinodb/trino-python-client/pull/647">\#647</a>  | Enable SQL compilation caching for the ignore-nulls window functions   | <a href="https://github.com/rebkwok">rebkwok</a>                            | 26d 19h  | no response |               |
| trino-python-client | <a href="https://github.com/trinodb/trino-python-client/pull/648">\#648</a>  | docs: document all Connection parameters in docstring and README       | <a href="https://github.com/Shahzeb-DataEngineer">Shahzeb-DataEngineer</a>  | 20d 4h   | no response |               |
| trino-python-client | <a href="https://github.com/trinodb/trino-python-client/pull/650">\#650</a>  | Quote schema and table in SQLAlchemy partitions lookup                 | <a href="https://github.com/RaphaelFakhri">RaphaelFakhri</a>                | 18d 1h   | no response |               |
| trino-query-ui      | <a href="https://github.com/trinodb/trino-query-ui/pull/93">\#93</a>         | Verify formatted SQL with the lexer                                    | <a href="https://github.com/mosabua">mosabua</a>                            | 28d 5h   | no response |               |

[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/repositories/02-open-pull-requests.sql)

## Issues without an answer

Issues of people opened in the last 12 months that are still open and that no other person commented on, at most 8 per repository, oldest first. Older ones are counted in "Activity per repository".
An answer, even a question or a label, tells the reporter that someone read it. Close the ones that are fixed or can't be reproduced.

| Repository          | Issue                                                              | Title                                                                              | Author                                                    | Open for |
| ------------------- | ------------------------------------------------------------------ | ---------------------------------------------------------------------------------- | --------------------------------------------------------- | -------- |
| charts              | <a href="https://github.com/trinodb/charts/issues/473">\#473</a>               | \`maxHeapSize: null\` is ignored with Helm \`4.2\+\` when Trino is a subchart      | <a href="https://github.com/didinator">didinator</a>                  | 13d 12h  |
| trino-csharp-client | <a href="https://github.com/trinodb/trino-csharp-client/issues/32">\#32</a>    | bug: failed json response parsing \(Hive metastore connector\)                     | <a href="https://github.com/razgaou">razgaou</a>                      | 287d 23h |
| trino-csharp-client | <a href="https://github.com/trinodb/trino-csharp-client/issues/35">\#35</a>    | IsTimeout check is not platform independent                                        | <a href="https://github.com/petr-pokorny-absa">petr-pokorny-absa</a>  | 218d 1h  |
| trino-csharp-client | <a href="https://github.com/trinodb/trino-csharp-client/issues/36">\#36</a>    | Nuget package                                                                      | <a href="https://github.com/jzabroski">jzabroski</a>                  | 209d 16h |
| trino-gateway       | <a href="https://github.com/trinodb/trino-gateway/issues/822">\#822</a>        | Avoid FixedHostPortGenericContainer in TestOIDC                                    | <a href="https://github.com/ebyhr">ebyhr</a>                          | 313d 0h  |
| trino-gateway       | <a href="https://github.com/trinodb/trino-gateway/issues/878">\#878</a>        | Routing rules execute all matching rules' actions instead of stopping at firs...   | <a href="https://github.com/Setsushin">Setsushin</a>                  | 286d 23h |
| trino-gateway       | <a href="https://github.com/trinodb/trino-gateway/issues/1171">\#1171</a>      | Extending Trino Gateway to route to Kyuubi \(and beyond Trino\)                    | <a href="https://github.com/Chaho12">Chaho12</a>                      | 125d 6h  |
| trino-gateway       | <a href="https://github.com/trinodb/trino-gateway/issues/1217">\#1217</a>      | Allow a backend cluster to belong to multiple routing groups \(1:1 -\&gt; 1:N\)       | <a href="https://github.com/Chaho12">Chaho12</a>                      | 100d 2h  |
| trino-gateway       | <a href="https://github.com/trinodb/trino-gateway/issues/1219">\#1219</a>      | ClusterStatsHttpMonitor is broken with Trino 483\+                                 | <a href="https://github.com/mosabua">mosabua</a>                      | 99d 5h   |
| trino-gateway       | <a href="https://github.com/trinodb/trino-gateway/issues/1235">\#1235</a>      | Routing group follow-up requests fail in multi-pod trino-gateway's                 | <a href="https://github.com/hpopuri2">hpopuri2</a>                    | 91d 1h   |
| trino-gateway       | <a href="https://github.com/trinodb/trino-gateway/issues/1241">\#1241</a>      | searchAllBackendForQuery fails to locate running queries due to non-blocking ...   | <a href="https://github.com/alisanguo">alisanguo</a>                  | 86d 1h   |
| trino-gateway       | <a href="https://github.com/trinodb/trino-gateway/issues/1276">\#1276</a>      | Make Flyway the only source of the database schema                                 | <a href="https://github.com/mosabua">mosabua</a>                      | 55d 3h   |
| trino-go-client     | <a href="https://github.com/trinodb/trino-go-client/issues/280">\#280</a>      | Ping fails on Starburst Galaxy with external authentication                        | <a href="https://github.com/lucargir">lucargir</a>                    | 6d 11h   |
| trino-go-client     | <a href="https://github.com/trinodb/trino-go-client/issues/282">\#282</a>      | Closing rows cancels the query with DELETE /v1/query, which gateways answer w...   | <a href="https://github.com/lucargir">lucargir</a>                    | 6d 10h   |
| trino-js-client     | <a href="https://github.com/trinodb/trino-js-client/issues/979">\#979</a>      | Track the downstream move to @trinodb/trino-js-client                              | <a href="https://github.com/mosabua">mosabua</a>                      | 69d 10h  |
| trino-js-client     | <a href="https://github.com/trinodb/trino-js-client/issues/992">\#992</a>      | Session statements are dropped when their iterator is never drained                | <a href="https://github.com/mosabua">mosabua</a>                      | 44d 14h  |
| trino-js-client     | <a href="https://github.com/trinodb/trino-js-client/issues/993">\#993</a>      | Columns omits typeSignature, and next\(\) yields any                               | <a href="https://github.com/mosabua">mosabua</a>                      | 44d 14h  |
| trino-python-client | <a href="https://github.com/trinodb/trino-python-client/issues/602">\#602</a>  | SQLAlchemy bulk insert is executed per row                                         | <a href="https://github.com/varvarvarvar">varvarvarvar</a>            | 196d 0h  |
| trino-python-client | <a href="https://github.com/trinodb/trino-python-client/issues/643">\#643</a>  | KerberosAuthentication default MUTUAL\_REQUIRED always fails against Trino \(no... | <a href="https://github.com/aminghadersohi">aminghadersohi</a>        | 46d 22h  |
| trino-python-client | <a href="https://github.com/trinodb/trino-python-client/issues/644">\#644</a>  | Final spooled segment is not acknowledged when reading stops at the last row       | <a href="https://github.com/aminghadersohi">aminghadersohi</a>        | 46d 19h  |
| trino-python-client | <a href="https://github.com/trinodb/trino-python-client/issues/649">\#649</a>  | SQLAlchemy get\_indexes returns no partition index when the schema name needs ...  | <a href="https://github.com/RaphaelFakhri">RaphaelFakhri</a>          | 18d 1h   |
| trino-query-ui      | <a href="https://github.com/trinodb/trino-query-ui/issues/91">\#91</a>         | Format SQL ignores the selection                                                   | <a href="https://github.com/mosabua">mosabua</a>                      | 28d 6h   |
| trino-query-ui      | <a href="https://github.com/trinodb/trino-query-ui/issues/92">\#92</a>         | Verify that formatting preserves the query tokens                                  | <a href="https://github.com/mosabua">mosabua</a>                      | 28d 6h   |

[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/repositories/03-unanswered-issues.sql)

## First-time contributors

People whose first pull request to a repository was opened in the last 12 months, newest first, what happened to it, and how long it waited for a first response.
A quick first response keeps new people coming back. Thank them, and point them to issues they could help with next.

| Repository          | Author                                                          | First PR                                                         | Opened     | State  | First response |
| ------------------- | --------------------------------------------------------------- | ---------------------------------------------------------------- | ---------- | ------ | -------------- |
| trino-gateway       | <a href="https://github.com/Yutong-1424">Yutong-1424</a>                    | <a href="https://github.com/trinodb/trino-gateway/pull/1408">\#1408</a>      | 2026-11-06 | open   | none yet       |
| trino-go-client     | <a href="https://github.com/lucargir">lucargir</a>                          | <a href="https://github.com/trinodb/trino-go-client/pull/281">\#281</a>      | 2026-11-05 | open   | 27m 51s        |
| trino-gateway       | <a href="https://github.com/partamonov">partamonov</a>                      | <a href="https://github.com/trinodb/trino-gateway/pull/1403">\#1403</a>      | 2026-11-03 | open   | none yet       |
| trino-gateway       | <a href="https://github.com/sdaberdaku">sdaberdaku</a>                      | <a href="https://github.com/trinodb/trino-gateway/pull/1381">\#1381</a>      | 2026-10-28 | merged | 1d 12h         |
| grafana-trino       | <a href="https://github.com/vinzee">vinzee</a>                              | <a href="https://github.com/trinodb/grafana-trino/pull/382">\#382</a>        | 2026-10-28 | open   | 5d 15h         |
| trino-python-client | <a href="https://github.com/Kayvan-Zahiri">Kayvan-Zahiri</a>                | <a href="https://github.com/trinodb/trino-python-client/pull/651">\#651</a>  | 2026-10-27 | draft  | none yet       |
| trino-python-client | <a href="https://github.com/RaphaelFakhri">RaphaelFakhri</a>                | <a href="https://github.com/trinodb/trino-python-client/pull/650">\#650</a>  | 2026-10-25 | open   | none yet       |
| trino-python-client | <a href="https://github.com/Shahzeb-DataEngineer">Shahzeb-DataEngineer</a>  | <a href="https://github.com/trinodb/trino-python-client/pull/648">\#648</a>  | 2026-10-23 | open   | none yet       |
| trino-python-client | <a href="https://github.com/rebkwok">rebkwok</a>                            | <a href="https://github.com/trinodb/trino-python-client/pull/647">\#647</a>  | 2026-10-16 | open   | none yet       |
| charts              | <a href="https://github.com/yrosemacbs">yrosemacbs</a>                      | <a href="https://github.com/trinodb/charts/pull/463">\#463</a>               | 2026-10-12 | closed | 50m 07s        |
| trino-js-client     | <a href="https://github.com/arcman7">arcman7</a>                            | <a href="https://github.com/trinodb/trino-js-client/pull/1003">\#1003</a>    | 2026-10-08 | open   | none yet       |
| trino-gateway       | <a href="https://github.com/Shivamrut">Shivamrut</a>                        | <a href="https://github.com/trinodb/trino-gateway/pull/1320">\#1320</a>      | 2026-10-08 | merged | 1d 0h          |
| trino-gateway       | <a href="https://github.com/owenmonn">owenmonn</a>                          | <a href="https://github.com/trinodb/trino-gateway/pull/1312">\#1312</a>      | 2026-10-03 | merged | 6d 11h         |
| trino-gateway       | <a href="https://github.com/developer-Bushido">developer-Bushido</a>        | <a href="https://github.com/trinodb/trino-gateway/pull/1294">\#1294</a>      | 2026-09-28 | closed | 1h 50m         |
| trino-gateway       | <a href="https://github.com/heehehe">heehehe</a>                            | <a href="https://github.com/trinodb/trino-gateway/pull/1289">\#1289</a>      | 2026-09-26 | merged | 2d 12h         |
| trino-python-client | <a href="https://github.com/aminghadersohi">aminghadersohi</a>              | <a href="https://github.com/trinodb/trino-python-client/pull/639">\#639</a>  | 2026-09-17 | closed | none           |
| trino-gateway       | <a href="https://github.com/nandaqmr">nandaqmr</a>                          | <a href="https://github.com/trinodb/trino-gateway/pull/1269">\#1269</a>      | 2026-09-15 | closed | none           |
| trino-gateway       | <a href="https://github.com/adityaanikam">adityaanikam</a>                  | <a href="https://github.com/trinodb/trino-gateway/pull/1258">\#1258</a>      | 2026-09-05 | open   | 17d 16h        |
| trino-csharp-client | <a href="https://github.com/tgmdimauro">tgmdimauro</a>                      | <a href="https://github.com/trinodb/trino-csharp-client/pull/37">\#37</a>    | 2026-09-02 | closed | none           |
| trino-python-client | <a href="https://github.com/lozbrown">lozbrown</a>                          | <a href="https://github.com/trinodb/trino-python-client/pull/637">\#637</a>  | 2026-09-02 | merged | 21d 1h         |
| charts              | <a href="https://github.com/bochengyang">bochengyang</a>                    | <a href="https://github.com/trinodb/charts/pull/448">\#448</a>               | 2026-08-31 | closed | 26d 7h         |
| trino-gateway       | <a href="https://github.com/AzazelSensei">AzazelSensei</a>                  | <a href="https://github.com/trinodb/trino-gateway/pull/1248">\#1248</a>      | 2026-08-30 | closed | 18m 46s        |
| grafana-trino       | <a href="https://github.com/MarcoAP">MarcoAP</a>                            | <a href="https://github.com/trinodb/grafana-trino/pull/348">\#348</a>        | 2026-08-24 | merged | 4m 24s         |
| charts              | <a href="https://github.com/talsh-oasis">talsh-oasis</a>                    | <a href="https://github.com/trinodb/charts/pull/447">\#447</a>               | 2026-08-19 | closed | 52d 6h         |
| trino-go-client     | <a href="https://github.com/slachiewicz">slachiewicz</a>                    | <a href="https://github.com/trinodb/trino-go-client/pull/182">\#182</a>      | 2026-08-10 | merged | 13h 37m        |
| trino-go-client     | <a href="https://github.com/akgerber">akgerber</a>                          | <a href="https://github.com/trinodb/trino-go-client/pull/180">\#180</a>      | 2026-07-30 | closed | 51d 6h         |
| trino-query-ui      | <a href="https://github.com/gertjanal">gertjanal</a>                        | <a href="https://github.com/trinodb/trino-query-ui/pull/40">\#40</a>         | 2026-07-29 | merged | 1d 19h         |
| charts              | <a href="https://github.com/etolbakov">etolbakov</a>                        | <a href="https://github.com/trinodb/charts/pull/443">\#443</a>               | 2026-07-16 | merged | 85d 17h        |
| grafana-trino       | <a href="https://github.com/srstrickland">srstrickland</a>                  | <a href="https://github.com/trinodb/grafana-trino/pull/337">\#337</a>        | 2026-07-15 | merged | 15h 52m        |
| trino-gateway       | <a href="https://github.com/OmerRaifler">OmerRaifler</a>                    | <a href="https://github.com/trinodb/trino-gateway/pull/1174">\#1174</a>      | 2026-07-11 | closed | 17h 58m        |

[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/repositories/04-first-time-contributors.sql)

## Who reviews

People who reviewed or commented on pull requests of other people in the last 12 months, per repository, and the share of reviewed pull requests the top reviewer saw.
When one person reviews almost everything, the repository stops when they're away. Reviews from users of a client count too: ask them to review.

| Repository          | Reviewed PRs | Reviewers | Seen by the top reviewer | Top reviewers (PRs)                                                     |
| ------------------- | ------------:| ---------:| ------------------------ | ----------------------------------------------------------------------- |
| trino-gateway       |          162 |        30 | 49%                      | ebyhr \(79\), mosabua \(73\), Chaho12 \(71\), wendigo \(26\)            |
| trino-go-client     |           53 |         3 | 91%                      | nineinchnick \(48\), Flgado \(11\), slachiewicz \(4\)                   |
| charts              |           45 |         5 | 93%                      | nineinchnick \(42\), wendigo \(2\), electrum \(1\), lozbrown \(1\)      |
| trino-python-client |           42 |        10 | 45%                      | azawlocki-sbdt \(19\), hashhar \(16\), wendigo \(14\), damian3031 \(5\) |
| trino-query-ui      |           33 |         3 | 61%                      | mosabua \(20\), koszti \(16\), wendigo \(3\)                            |
| trino-js-client     |           18 |         6 | 44%                      | wendigo \(8\), mosabua \(5\), koszti \(4\), ebyhr \(1\)                 |
| grafana-trino       |           16 |        14 | 94%                      | nineinchnick \(15\), Flgado \(3\), vfauth \(2\), RoeyoOgen \(1\)        |
| trino-csharp-client |            4 |         3 | 50%                      | stephen-zhao \(2\), wendigo \(2\), QimbE \(1\)                          |

[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/repositories/05-reviewers.sql)

Generated on Thu Nov 12 09:48:52 UTC 2026

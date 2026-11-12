---
title: Maintaining Trino
---

## Open pull requests by who has to act next

Work from the top: the first three rows wait on maintainers and reviewers. Approved: the last verdict is an approval, and only approvers spoke after it. No response yet: nobody who reviews in this project commented or reviewed. Waiting on reviewers or on the author: who spoke or pushed last. CLA not signed: it can't be merged until the author signs.
The age columns count from when the pull request got into its state. Newcomers have no merged pull request yet. The stale bot closes pull requests 21 days after marking them stale, unless someone acts, and never closes those labeled stale-ignore. Bots' pull requests are not counted.

| State                                   | Next step by | Pull requests | From newcomers | Under 1 week | 1 to 4 weeks | 1 to 3 months | 3 to 12 months | Over 1 year | Median wait | Marked stale | Labeled stale-ignore |
| --------------------------------------- | ------------ | -------------:| --------------:| ------------:| ------------:| -------------:| --------------:| -----------:| ----------- | ------------:| --------------------:|
| Approved, not merged                    | Maintainers  |            47 |              8 |           16 |           13 |             6 |              7 |           5 | 16d 14h     |            4 |                    9 |
| No response yet                         | Reviewers    |            46 |             13 |            5 |           19 |            14 |              8 |           0 | 23d 1h      |            9 |                    7 |
| Author replied, waiting on reviewers    | Reviewers    |            66 |             22 |            8 |           13 |            27 |             10 |           8 | 44d 20h     |           14 |                   22 |
| Reviewer replied, waiting on the author | Author       |            58 |             10 |            8 |           12 |            12 |              9 |          17 | 63d 21h     |           10 |                   33 |
| CLA not signed                          | Author       |            48 |             48 |           11 |           28 |             8 |              0 |           1 | 15d 4h      |            5 |                    1 |
| Draft                                   | Author       |            32 |              4 |            6 |           14 |             7 |              4 |           1 | 19d 17h     |            7 |                   11 |
| All open pull requests                  |              |           297 |            105 |           54 |           99 |            74 |             38 |          32 | 26d 16h     |           49 |                   83 |

[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/maintaining/01-triage.sql)

## First pull requests without any response

Pull requests of people with no merged pull request yet, with a signed CLA, that no one who reviews in this project has commented on or reviewed. Newcomers whose first pull request gets no response open another one less often than those who get one, so reply here first, even if only to say who will review it.
Marked stale: the stale bot closes it 21 days after marking it, unless someone acts.

| Pull request                                           | Title                                                                 | Author                                            | Days waiting | Size | Areas | Requested reviewers | Stale bot    |
| ------------------------------------------------------ | --------------------------------------------------------------------- | ------------------------------------------------- | ------------:| ---- | ----- | ------------------- | ------------ |
| <a href="https://github.com/trinodb/trino/pull/30024">\#30024</a>  | Store authenticated OAuth2 access token in session extra credentials  | <a href="https://github.com/louis-pie">louis-pie</a>          |          141 | M    | docs  | electrum, dain      |              |
| <a href="https://github.com/trinodb/trino/pull/30436">\#30436</a>  | Add cache to ldap group provider \(issue \#29134\)                    | <a href="https://github.com/mwullink">mwullink</a>            |          111 | M    | docs  | gertjanal, ebyhr    |              |
| <a href="https://github.com/trinodb/trino/pull/30681">\#30681</a>  | Add scaffolding for Couchbase connector                               | <a href="https://github.com/chedim">chedim</a>                |           91 | XL   |       | findepi, electrum   |              |
| <a href="https://github.com/trinodb/trino/pull/30688">\#30688</a>  | Resolve secrets in S3 security mapping JSON                           | <a href="https://github.com/schjan79">schjan79</a>            |           91 | M    |       | electrum, wendigo   |              |
| <a href="https://github.com/trinodb/trino/pull/30707">\#30707</a>  | Add ExtraCredentialsProvider SPI for server-side per-user credentials | <a href="https://github.com/PascalThesing">PascalThesing</a>  |           90 | XL   | docs  | dain                |              |
| <a href="https://github.com/trinodb/trino/pull/30824">\#30824</a>  | Skip Dependabot PRs for secrets-requiring test jobs                   | <a href="https://github.com/zhang-arvin">zhang-arvin</a>      |           84 | S    |       |                     | marked stale |
| <a href="https://github.com/trinodb/trino/pull/30864">\#30864</a>  | Propagate Hudi split loader failures from isFinished                  | <a href="https://github.com/slachiewicz">slachiewicz</a>      |           81 | M    | hudi  |                     |              |
| <a href="https://github.com/trinodb/trino/pull/31036">\#31036</a>  | Clarify UDF access in file-based access control docs                  | <a href="https://github.com/mommo-codes">mommo-codes</a>      |           65 | S    | docs  | dain                | marked stale |
| <a href="https://github.com/trinodb/trino/pull/31463">\#31463</a>  | Add JWT groups-field to map a token claim to user groups              | <a href="https://github.com/vinzee">vinzee</a>                |           36 | M    | docs  |                     | marked stale |
| <a href="https://github.com/trinodb/trino/pull/31687">\#31687</a>  | Remove unused argument from ANTLR grammar's predicate rule            | <a href="https://github.com/BobDu">BobDu</a>                  |           23 | S    |       | martint, kasiafi    |              |
| <a href="https://github.com/trinodb/trino/pull/31907">\#31907</a>  | Fix bloom filter pruning of signed zeros                              | <a href="https://github.com/wombatu-kun">wombatu-kun</a>      |           13 | M    |       |                     |              |
| <a href="https://github.com/trinodb/trino/pull/31909">\#31909</a>  | Fix query failure on unsigned Parquet integers                        | <a href="https://github.com/wombatu-kun">wombatu-kun</a>      |           13 | M    |       |                     |              |
| <a href="https://github.com/trinodb/trino/pull/31949">\#31949</a>  | Fix pruning of decimal over Parquet integer column                    | <a href="https://github.com/wombatu-kun">wombatu-kun</a>      |           10 | M    | hive  |                     |              |

[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/maintaining/02-newcomers-without-response.sql)

## Approved, not merged

Pull requests whose last verdict is an approval, where only the approvers spoke after it. Those approved by a maintainer come first, then the oldest approval. If a maintainer approved, merge it or say what is missing; if not, a maintainer has to review it.
Check that the author answered all comments and that CI passed. Bots' pull requests are not included.

| Pull request                                           | Title                                                                    | Author                                                | Days since approval | Approved by maintainers     | Approved by others        | Acted last | Size | Areas                       | Stale bot    |
| ------------------------------------------------------ | ------------------------------------------------------------------------ | ----------------------------------------------------- | -------------------:| --------------------------- | ------------------------- | ---------- | ---- | --------------------------- | ------------ |
| <a href="https://github.com/trinodb/trino/pull/22519">\#22519</a>  | Enable JDBC statistics cache by default                                  | <a href="https://github.com/raunaqmorarka">raunaqmorarka</a>      |                 867 | findepi, hashhar            |                           | author     | M    | docs, postgresql, sqlserver | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/18457">\#18457</a>  | Use Aircompressor in Avro library code                                   | <a href="https://github.com/jklamer">jklamer</a>                  |                 769 | wendigo                     |                           | author     | L    | hudi, iceberg, hive         | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/19365">\#19365</a>  | Load default Java truststore for --use-system-truststore                 | <a href="https://github.com/oneonestar">oneonestar</a>            |                 694 | electrum                    |                           | author     | S    |                             | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/25968">\#25968</a>  | Remove Teradata functions plugin from binaries                           | <a href="https://github.com/mosabua">mosabua</a>                  |                 474 | electrum                    |                           | author     | S    | docs                        | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/27666">\#27666</a>  | Minor improvement for Iceberg S3 Tables                                  | <a href="https://github.com/ebyhr">ebyhr</a>                      |                 325 | findepi, chenjian2664       |                           | reviewer   | M    | iceberg                     | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/29207">\#29207</a>  | Add support for customer-supplied encryption keys \(CSEK\) to the GCS fi | <a href="https://github.com/kaveti">kaveti</a>                    |                 126 | wendigo                     | findinpath                | author     | L    | docs, iceberg               |              |
| <a href="https://github.com/trinodb/trino/pull/30838">\#30838</a>  | Cancel Redshift UNLOAD statement when split source is closed             | <a href="https://github.com/jayceslesar">jayceslesar</a>          |                  70 | findepi, ebyhr              |                           | reviewer   | M    | redshift                    |              |
| <a href="https://github.com/trinodb/trino/pull/31094">\#31094</a>  | Add key-pair authentication for Iceberg Snowflake catalog                | <a href="https://github.com/vlad-lyutenko">vlad-lyutenko</a>      |                  58 | ebyhr                       | findinpath                | author     | M    | docs, iceberg               | marked stale |
| <a href="https://github.com/trinodb/trino/pull/30875">\#30875</a>  | Add file-based access control for table procedures                       | <a href="https://github.com/hashhar">hashhar</a>                  |                  37 | kokosing                    |                           | reviewer   | M    | docs                        | marked stale |
| <a href="https://github.com/trinodb/trino/pull/31693">\#31693</a>  | Close HTTP responses when local redirects are rejected                   | <a href="https://github.com/fallintoplace">fallintoplace</a>      |                  22 | wendigo                     |                           | author     | S    |                             |              |
| <a href="https://github.com/trinodb/trino/pull/31786">\#31786</a>  | Add backoff between JUnit flaky test retries                             | <a href="https://github.com/bvolpato">bvolpato</a>                |                  16 | findepi                     |                           | author     | M    |                             |              |
| <a href="https://github.com/trinodb/trino/pull/31866">\#31866</a>  | Fix flaky materialized view rename test                                  | <a href="https://github.com/ksobolew">ksobolew</a>                |                  14 | findepi                     |                           | reviewer   | XS   |                             |              |
| <a href="https://github.com/trinodb/trino/pull/30891">\#30891</a>  | Support REST catalog server-side scan planning in loadTable              | <a href="https://github.com/JohnEarle">JohnEarle</a>              |                  14 | chenjian2664                | JohnFitzpatrick44         | author     | M    | iceberg                     |              |
| <a href="https://github.com/trinodb/trino/pull/31893">\#31893</a>  | Fix TPC-H partitioning during worker changes                             | <a href="https://github.com/wendigo">wendigo</a>                  |                  13 | raunaqmorarka               |                           | author     | M    |                             |              |
| <a href="https://github.com/trinodb/trino/pull/31509">\#31509</a>  | Treat now\(\) as a current time function in materialized views           | <a href="https://github.com/okayhooni">okayhooni</a>              |                   9 | hashhar                     | findinpath                | reviewer   | M    | iceberg                     |              |
| <a href="https://github.com/trinodb/trino/pull/31957">\#31957</a>  | Write column orders in the Parquet footer                                | <a href="https://github.com/nanjeshramesh">nanjeshramesh</a>      |                   9 | raunaqmorarka, chenjian2664 |                           | reviewer   | M    | delta-lake                  |              |
| <a href="https://github.com/trinodb/trino/pull/31537">\#31537</a>  | Fix language function leak on workers                                    | <a href="https://github.com/hqbhoho">hqbhoho</a>                  |                   8 | electrum                    |                           | author     | M    |                             |              |
| <a href="https://github.com/trinodb/trino/pull/30977">\#30977</a>  | Use table schema when reading Iceberg branches                           | <a href="https://github.com/stefan-toubia">stefan-toubia</a>      |                   4 | raunaqmorarka               |                           | reviewer   | M    | docs, iceberg               |              |
| <a href="https://github.com/trinodb/trino/pull/31718">\#31718</a>  | Optimize decimal and temporal JSON encoding                              | <a href="https://github.com/wendigo">wendigo</a>                  |                   3 | raunaqmorarka               |                           | author     | L    |                             |              |
| <a href="https://github.com/trinodb/trino/pull/32028">\#32028</a>  | Keep Iceberg and Hive split generation spans in query trace              | <a href="https://github.com/jiwen624">jiwen624</a>                |                   3 | wendigo                     |                           | author     | NULL | iceberg, hive               |              |
| <a href="https://github.com/trinodb/trino/pull/32000">\#32000</a>  | Add agent mode to Trino CLI                                              | <a href="https://github.com/wendigo">wendigo</a>                  |                   3 | raunaqmorarka               |                           | reviewer   | XL   | docs                        |              |
| <a href="https://github.com/trinodb/trino/pull/31389">\#31389</a>  | Fix stats failure for IN with constant value and item                    | <a href="https://github.com/jiwen624">jiwen624</a>                |                   2 | raunaqmorarka               |                           | reviewer   | M    |                             |              |
| <a href="https://github.com/trinodb/trino/pull/32007">\#32007</a>  | Add columnar scalar function implementations                             | <a href="https://github.com/wendigo">wendigo</a>                  |                   2 | electrum                    |                           | author     | XL   | docs                        |              |
| <a href="https://github.com/trinodb/trino/pull/32066">\#32066</a>  | Enforce Guava immutable collections in plugin toolkit                    | <a href="https://github.com/kokosing">kokosing</a>                |                   1 | wendigo, findepi            |                           | reviewer   | NULL |                             |              |
| <a href="https://github.com/trinodb/trino/pull/32077">\#32077</a>  | Write levels of null RLE blocks in one run                               | <a href="https://github.com/wendigo">wendigo</a>                  |                   0 | raunaqmorarka               |                           | author     | L    |                             |              |
| <a href="https://github.com/trinodb/trino/pull/32070">\#32070</a>  | Migrate AST visitors to switch over sealed Node                          | <a href="https://github.com/wendigo">wendigo</a>                  |                   0 | electrum                    |                           | reviewer   | XL   |                             |              |
| <a href="https://github.com/trinodb/trino/pull/32082">\#32082</a>  | Skip Parquet page index for fully matching row groups                    | <a href="https://github.com/wendigo">wendigo</a>                  |                   0 | raunaqmorarka               |                           | reviewer   | M    |                             |              |
| <a href="https://github.com/trinodb/trino/pull/32096">\#32096</a>  | Fix flaky TestHiveDynamicRowFiltering                                    | <a href="https://github.com/chenjian2664">chenjian2664</a>        |                   0 | raunaqmorarka               |                           | reviewer   | XS   | hive                        |              |
| <a href="https://github.com/trinodb/trino/pull/32081">\#32081</a>  | Read Parquet Bloom filter with a single request                          | <a href="https://github.com/wendigo">wendigo</a>                  |                   0 | raunaqmorarka               |                           | reviewer   | M    |                             |              |
| <a href="https://github.com/trinodb/trino/pull/31979">\#31979</a>  | Support transforms in Iceberg sorted\_by table property                  | <a href="https://github.com/findinpath">findinpath</a>            |                   0 | raunaqmorarka               |                           | author     | L    | docs, iceberg, hive         |              |
| <a href="https://github.com/trinodb/trino/pull/32091">\#32091</a>  | Add HTTP proxy support to Iceberg REST catalog                           | <a href="https://github.com/findinpath">findinpath</a>            |                   0 | raunaqmorarka               |                           | author     | L    | docs, iceberg               |              |
| <a href="https://github.com/trinodb/trino/pull/32080">\#32080</a>  | Avoid beginning table writes in EXPLAIN                                  | <a href="https://github.com/maswin">maswin</a>                    |                   0 | raunaqmorarka               |                           | reviewer   | M    | iceberg                     |              |
| <a href="https://github.com/trinodb/trino/pull/21027">\#21027</a>  | Add client option to disable following redirects                         | <a href="https://github.com/alprusty">alprusty</a>                |                 939 | none                        | oneonestar                | author     | M    | docs, jdbc                  | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/26702">\#26702</a>  | Fix 'IS NOT DISTINCT FROM' not working in JOIN when nulls are used       | <a href="https://github.com/codluca">codluca</a>                  |                 281 | none                        | kasiafi                   | reviewer   | M    |                             | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/27922">\#27922</a>  | Support region, endpoint, and cross-region access from Iceberg REST ca   | <a href="https://github.com/kaveti">kaveti</a>                    |                 259 | none                        | kekwan                    | author     | XL   | 5 areas                     | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/28793">\#28793</a>  | Support vended SSE encryption keys from Iceberg REST catalog             | <a href="https://github.com/kaveti">kaveti</a>                    |                 204 | none                        | findinpath                | author     | XL   | docs, iceberg               |              |
| <a href="https://github.com/trinodb/trino/pull/27830">\#27830</a>  | Enable Kafka Transport for OpenLineage Event Listener                    | <a href="https://github.com/kekwan">kekwan</a>                    |                 113 | none                        | dolfinus, mgorsk1, kaveti | reviewer   | L    | docs                        | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/30402">\#30402</a>  | Add register\_view procedure to Iceberg connector                        | <a href="https://github.com/bbreak">bbreak</a>                    |                  92 | none                        | findinpath                | author     | L    | docs, iceberg               | marked stale |
| <a href="https://github.com/trinodb/trino/pull/30911">\#30911</a>  | Fix the Web UI authentication status endpoint incorrectly reporting JW   | <a href="https://github.com/a-narsudinov">a-narsudinov</a>        |                  76 | none                        | koszti                    | author     | S    |                             |              |
| <a href="https://github.com/trinodb/trino/pull/31378">\#31378</a>  | Add Iceberg REST remote signing for S3                                   | <a href="https://github.com/aarushigupta132">aarushigupta132</a>  |                  34 | none                        | findinpath                | reviewer   | XL   | docs, iceberg               |              |
| <a href="https://github.com/trinodb/trino/pull/30330">\#30330</a>  | Restore Hive HTTP/HTTPS Thrift metastore support                         | <a href="https://github.com/niteshy">niteshy</a>                  |                  33 | none                        | findinpath                | author     | XL   | docs, hudi, hive            |              |
| <a href="https://github.com/trinodb/trino/pull/31313">\#31313</a>  | Add query queue position to query info and web ui                        | <a href="https://github.com/gertjanal">gertjanal</a>              |                  27 | none                        | RoeyoOgen, koszti         | author     | M    | ui                          |              |
| <a href="https://github.com/trinodb/trino/pull/30691">\#30691</a>  | Make paths relative in the Trino Web UI to support path-based reverse    | <a href="https://github.com/jhatcher1">jhatcher1</a>              |                  26 | none                        | koszti                    | author     | M    | ui                          |              |
| <a href="https://github.com/trinodb/trino/pull/31695">\#31695</a>  | Fix CLI Markdown widths for supplementary Unicode characters             | <a href="https://github.com/fallintoplace">fallintoplace</a>      |                  22 | none                        | nineinchnick, utafrali    | author     | S    |                             | marked stale |
| <a href="https://github.com/trinodb/trino/pull/31643">\#31643</a>  | Add read support for encrypted deletion vectors \(DVs\) in the Iceberg c | <a href="https://github.com/tbaeg">tbaeg</a>                      |                  16 | none                        | findinpath                | author     | L    | iceberg                     |              |
| <a href="https://github.com/trinodb/trino/pull/31774">\#31774</a>  | Migrate Faker and BlackHole views to SaveMode                            | <a href="https://github.com/nanjeshramesh">nanjeshramesh</a>      |                  12 | none                        | nineinchnick              | author     | M    | blackhole, faker            |              |
| <a href="https://github.com/trinodb/trino/pull/31999">\#31999</a>  | Expose bounded fault-tolerant scheduling wait diagnostics                | <a href="https://github.com/zhangxinyao88">zhangxinyao88</a>      |                   5 | none                        | p3tr0sz                   | author     | M    |                             |              |

[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/maintaining/03-approved-not-merged.sql)

## Waiting on reviewers: pick from the top

Pull requests where the next step is a review: nobody reviewed them yet, or the author replied or pushed after the last review. Days waiting count from that reply. Newcomers' first pull requests without a response are listed above.
First come authors with fewer than 10 merged pull requests whose pull request the stale bot already marked, because it will close it although the author is not the one who has to act; then their other pull requests; then everyone else's. The longest wait comes first in each group. Pull requests labeled stale-ignore come last.

| Pull request                                           | Title                                                                  | Author                                                    | Author has        | Days waiting | State           | Size | Requested reviewers                                                | Areas                    | Stale bot    |
| ------------------------------------------------------ | ---------------------------------------------------------------------- | --------------------------------------------------------- | ----------------- | ------------:| --------------- | ---- | ------------------------------------------------------------------ | ------------------------ | ------------ |
| <a href="https://github.com/trinodb/trino/pull/30602">\#30602</a>  | Always write compression codec to Iceberg table metadata               | <a href="https://github.com/bbreak">bbreak</a>                        | 1-9 merged PRs    |           98 | no response yet | M    | pettyjamesm, SongChujun, ebyhr                                     | iceberg, lakehouse       | marked stale |
| <a href="https://github.com/trinodb/trino/pull/30421">\#30421</a>  | Add Array type support to ClickHouse connector                         | <a href="https://github.com/wonju-dev">wonju-dev</a>                  | no merged PRs yet |           76 | author replied  | L    | krvikash                                                           | docs, clickhouse         | marked stale |
| <a href="https://github.com/trinodb/trino/pull/31112">\#31112</a>  | Fix width\_bucket arithmetic overflow                                  | <a href="https://github.com/laserninja">laserninja</a>                | 1-9 merged PRs    |           60 | no response yet | S    | findepi                                                            |                          | marked stale |
| <a href="https://github.com/trinodb/trino/pull/31042">\#31042</a>  | Prevent CREATE TABLE over an existing view                             | <a href="https://github.com/Yash-Ambekar">Yash-Ambekar</a>            | no merged PRs yet |           48 | author replied  | M    |                                                                    | iceberg, faker           | marked stale |
| <a href="https://github.com/trinodb/trino/pull/31350">\#31350</a>  | Fix reading decimals stored at a higher scale                          | <a href="https://github.com/wgzhao">wgzhao</a>                        | 1-9 merged PRs    |           45 | no response yet | M    | losipiuk, dain                                                     | hive                     | marked stale |
| <a href="https://github.com/trinodb/trino/pull/31348">\#31348</a>  | Drop ClickHouse partitions with a table procedure                      | <a href="https://github.com/wgzhao">wgzhao</a>                        | 1-9 merged PRs    |           37 | author replied  | M    |                                                                    | docs, clickhouse         | marked stale |
| <a href="https://github.com/trinodb/trino/pull/30797">\#30797</a>  | Refine EXTRACT function return type resolution                         | <a href="https://github.com/zhang-arvin">zhang-arvin</a>              | no merged PRs yet |           34 | author replied  | XL   |                                                                    |                          | marked stale |
| <a href="https://github.com/trinodb/trino/pull/29166">\#29166</a>  | Preserve Iceberg table privileges on metastore commits                 | <a href="https://github.com/laserninja">laserninja</a>                | 1-9 merged PRs    |           34 | author replied  | M    |                                                                    | iceberg                  | marked stale |
| <a href="https://github.com/trinodb/trino/pull/31015">\#31015</a>  | Support PostgreSQL in DB session property manager                      | <a href="https://github.com/RoeyoOgen">RoeyoOgen</a>                  | no merged PRs yet |           24 | author replied  | XL   | electrum, mosabua, vishalya, Chaho12, andythsu                     | docs                     | marked stale |
| <a href="https://github.com/trinodb/trino/pull/31702">\#31702</a>  | Add array\_is\_sorted function                                         | <a href="https://github.com/fallintoplace">fallintoplace</a>          | 1-9 merged PRs    |           22 | author replied  | M    |                                                                    | docs                     | marked stale |
| <a href="https://github.com/trinodb/trino/pull/28958">\#28958</a>  | Add copy-on-write mode for Iceberg row-level DELETE, UPDATE, and MERGE | <a href="https://github.com/kaveti">kaveti</a>                        | 1-9 merged PRs    |          206 | author replied  | XL   | electrum, findinpath, dain, xkrogen, hashhar, jackye1995           | docs, iceberg, lakehouse |              |
| <a href="https://github.com/trinodb/trino/pull/30677">\#30677</a>  | Add custom headers in gcs read for audit purpose                       | <a href="https://github.com/Abhijeetsng97">Abhijeetsng97</a>          | no merged PRs yet |           90 | author replied  | M    |                                                                    | docs                     |              |
| <a href="https://github.com/trinodb/trino/pull/30545">\#30545</a>  | Fix Parquet predicate on a type-mismatched column                      | <a href="https://github.com/wombatu-kun">wombatu-kun</a>              | no merged PRs yet |           83 | author replied  | XL   | Praveen2112, raunaqmorarka                                         | hive                     |              |
| <a href="https://github.com/trinodb/trino/pull/30781">\#30781</a>  | Add Teradata connector                                                 | <a href="https://github.com/sc250072">sc250072</a>                    | no merged PRs yet |           65 | author replied  | XL   | electrum, findepi, chenjian2664, ssheikin                          | docs                     |              |
| <a href="https://github.com/trinodb/trino/pull/28962">\#28962</a>  | Add view redirection support for Iceberg connector                     | <a href="https://github.com/kaveti">kaveti</a>                        | 1-9 merged PRs    |           58 | author replied  | XL   | chenjian2664, findepi, electrum, martint, liianghuang, soooojinlee | 4 areas                  |              |
| <a href="https://github.com/trinodb/trino/pull/31235">\#31235</a>  | Allow S3 security mappings to set client options                       | <a href="https://github.com/kaveti">kaveti</a>                        | 1-9 merged PRs    |           54 | no response yet | XL   | 0eu, wendigo, findinpath, krvikash, Praveen2112                    | docs                     |              |
| <a href="https://github.com/trinodb/trino/pull/30682">\#30682</a>  | Move Hudi connector implementation to org.apache.hudi:hudi-trino       | <a href="https://github.com/voonhous">voonhous</a>                    | no merged PRs yet |           54 | author replied  | XL   | electrum, chenjian2664, findinpath                                 | hudi, lakehouse          |              |
| <a href="https://github.com/trinodb/trino/pull/29954">\#29954</a>  | Add support for DateTime64\(precision\[, timezone\]\) in ClickHouse    | <a href="https://github.com/k3rnL">k3rnL</a>                          | no merged PRs yet |           44 | author replied  | M    | chenjian2664, Praveen2112                                          | docs, clickhouse         |              |
| <a href="https://github.com/trinodb/trino/pull/31208">\#31208</a>  | Add start and end values to query periods                              | <a href="https://github.com/lovasoa">lovasoa</a>                      | no merged PRs yet |           41 | author replied  | M    | martint                                                            | docs                     |              |
| <a href="https://github.com/trinodb/trino/pull/31272">\#31272</a>  | Fix BigLake create or replace table with default Parquet compression   | <a href="https://github.com/zhangxinyao88">zhangxinyao88</a>          | no merged PRs yet |           37 | author replied  | M    | findinpath                                                         | iceberg                  |              |
| <a href="https://github.com/trinodb/trino/pull/30973">\#30973</a>  | Prevent query failure after transaction commit starts                  | <a href="https://github.com/BackendArchitectX">BackendArchitectX</a>  | no merged PRs yet |           35 | author replied  | XL   | dain, electrum                                                     | hive                     |              |
| <a href="https://github.com/trinodb/trino/pull/31691">\#31691</a>  | Fix legacy day-time interval decimal separator parsing                 | <a href="https://github.com/fallintoplace">fallintoplace</a>          | 1-9 merged PRs    |           22 | no response yet | S    |                                                                    |                          |              |
| <a href="https://github.com/trinodb/trino/pull/31692">\#31692</a>  | Cap HTTP event listener first retry delay                              | <a href="https://github.com/fallintoplace">fallintoplace</a>          | 1-9 merged PRs    |           22 | no response yet | S    |                                                                    |                          |              |
| <a href="https://github.com/trinodb/trino/pull/31727">\#31727</a>  | Migrate Hive view creation to SaveMode                                 | <a href="https://github.com/nanjeshramesh">nanjeshramesh</a>          | 1-9 merged PRs    |           21 | no response yet | S    |                                                                    | 4 areas                  |              |
| <a href="https://github.com/trinodb/trino/pull/31762">\#31762</a>  | Support writing unknown type in Iceberg                                | <a href="https://github.com/zhangxinyao88">zhangxinyao88</a>          | 1-9 merged PRs    |           19 | no response yet | L    | ebyhr                                                              | docs, iceberg            |              |
| <a href="https://github.com/trinodb/trino/pull/31830">\#31830</a>  | Allow multiple input files for CLI execution                           | <a href="https://github.com/dedyoc">dedyoc</a>                        | 1-9 merged PRs    |           15 | no response yet | M    | wendigo                                                            | docs                     |              |
| <a href="https://github.com/trinodb/trino/pull/31870">\#31870</a>  | Report oversized join hashes as insufficient resources                 | <a href="https://github.com/jalpan-randeri">jalpan-randeri</a>        | 1-9 merged PRs    |           14 | no response yet | S    | findepi                                                            |                          |              |
| <a href="https://github.com/trinodb/trino/pull/31896">\#31896</a>  | Fail on exceptions in Pinot gRPC metadata block                        | <a href="https://github.com/nanjeshramesh">nanjeshramesh</a>          | 1-9 merged PRs    |           13 | no response yet | M    |                                                                    | pinot                    |              |
| <a href="https://github.com/trinodb/trino/pull/31918">\#31918</a>  | Read Iceberg partition statistics for row counts                       | <a href="https://github.com/sdaberdaku">sdaberdaku</a>                | 1-9 merged PRs    |           12 | no response yet | XL   |                                                                    | docs, iceberg, lakehouse |              |
| <a href="https://github.com/trinodb/trino/pull/31684">\#31684</a>  | Redesign the web UI query list and cluster views                       | <a href="https://github.com/konovenski">konovenski</a>                | no merged PRs yet |            8 | author replied  | XL   | koszti                                                             | ui                       |              |

[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/maintaining/04-waiting-on-reviewers.sql)

## Waiting on the author for over 4 weeks

Pull requests where a reviewer spoke last, the CLA is not signed, or the draft has not changed, for over 4 weeks, oldest first. Ping the author, offer to take the pull request over, or close it.
The stale bot closes inactive pull requests by itself, but never those labeled stale-ignore, so most of the oldest ones here are kept open on purpose: decide if they still should be.

| Pull request                                           | Title                                                                  | Author                                                  | State            | Days waiting | Last reviewer                                     | Size | Stale bot    |
| ------------------------------------------------------ | ---------------------------------------------------------------------- | ------------------------------------------------------- | ---------------- | ------------:| ------------------------------------------------- | ---- | ------------ |
| <a href="https://github.com/trinodb/trino/pull/19161">\#19161</a>  | Reintroduce HiveTableRedirectionsProvider interface                    | <a href="https://github.com/architgyl">architgyl</a>                | reviewer replied |         1118 | <a href="https://github.com/mosabua">mosabua</a>              | M    | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/20203">\#20203</a>  | Add timestamp with tz to JSON cast                                     | <a href="https://github.com/CapCaWork">CapCaWork</a>                | reviewer replied |         1035 | <a href="https://github.com/findepi">findepi</a>              | M    | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/15288">\#15288</a>  | Add a new optimization rule: query fusion                              | <a href="https://github.com/weiatwork">weiatwork</a>                | reviewer replied |         1035 | <a href="https://github.com/SongChujun">SongChujun</a>        | XL   | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/16558">\#16558</a>  | add header authentication support for the web-ui                       | <a href="https://github.com/kenandominic">kenandominic</a>          | reviewer replied |          995 | <a href="https://github.com/Chaho12">Chaho12</a>              | S    | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/21243">\#21243</a>  | include null audience only if no additional audiences configured       | <a href="https://github.com/PratikDeshpande">PratikDeshpande</a>    | CLA not signed   |          961 |                                                   | XS   | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/17288">\#17288</a>  | Fill TupleDomain and expression in Constraint passed to ConnectorSplit | <a href="https://github.com/findepi">findepi</a>                    | reviewer replied |          950 | <a href="https://github.com/mosabua">mosabua</a>              | S    | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/21060">\#21060</a>  | Add writer and scale writer stats                                      | <a href="https://github.com/gaurav8297">gaurav8297</a>              | reviewer replied |          946 | <a href="https://github.com/sopel39">sopel39</a>              | M    | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/21196">\#21196</a>  | Use only single-parameter argument conventions                         | <a href="https://github.com/kasiafi">kasiafi</a>                    | reviewer replied |          919 | <a href="https://github.com/mosabua">mosabua</a>              | S    | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/21558">\#21558</a>  | Fix table function execution without partitioning \(v2\)               | <a href="https://github.com/findepi">findepi</a>                    | reviewer replied |          895 | <a href="https://github.com/tbaeg">tbaeg</a>                  | M    | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/21892">\#21892</a>  | Allow complex expression rewrites with approximate numeric constant    | <a href="https://github.com/Praveen2112">Praveen2112</a>            | reviewer replied |          860 | <a href="https://github.com/mosabua">mosabua</a>              | M    | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/23206">\#23206</a>  | Adaptive broadcast to partitioned                                      | <a href="https://github.com/gaurav8297">gaurav8297</a>              | reviewer replied |          773 | <a href="https://github.com/mosabua">mosabua</a>              | L    | marked stale |
| <a href="https://github.com/trinodb/trino/pull/12369">\#12369</a>  | Write statistics to ORC file for TINYINT                               | <a href="https://github.com/oneonestar">oneonestar</a>              | reviewer replied |          764 | <a href="https://github.com/mosabua">mosabua</a>              | S    | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/23619">\#23619</a>  | Support setting content md5 to validate upload content                 | <a href="https://github.com/zhaner08">zhaner08</a>                  | reviewer replied |          743 | <a href="https://github.com/mosabua">mosabua</a>              | S    | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/24616">\#24616</a>  | Add like\_regex predicate to JSON path                                 | <a href="https://github.com/piotrrzysko">piotrrzysko</a>            | reviewer replied |          652 | <a href="https://github.com/wendigo">wendigo</a>              | XL   | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/21550">\#21550</a>  | Add declared decomposition to aggregate functions                      | <a href="https://github.com/dain">dain</a>                          | reviewer replied |          631 | <a href="https://github.com/mosabua">mosabua</a>              | XL   | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/25276">\#25276</a>  | Add map literal syntax                                                 | <a href="https://github.com/dain">dain</a>                          | reviewer replied |          608 | <a href="https://github.com/findepi">findepi</a>              | M    | marked stale |
| <a href="https://github.com/trinodb/trino/pull/25009">\#25009</a>  | Use bloom filters to collect large DFs                                 | <a href="https://github.com/raunaqmorarka">raunaqmorarka</a>        | draft            |          596 |                                                   | XL   | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/25259">\#25259</a>  | Add support for PostgreSQL \`::\` style casts                          | <a href="https://github.com/dain">dain</a>                          | reviewer replied |          517 | <a href="https://github.com/findepi">findepi</a>              | S    | marked stale |
| <a href="https://github.com/trinodb/trino/pull/25961">\#25961</a>  | JDBC fetch size                                                        | <a href="https://github.com/wendigo">wendigo</a>                    | reviewer replied |          396 | <a href="https://github.com/chenjian2664">chenjian2664</a>    | S    | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/25735">\#25735</a>  | Switch documentation theme to immaterial \(w/ support for dark mode\)  | <a href="https://github.com/kumiDa">kumiDa</a>                      | reviewer replied |          320 | <a href="https://github.com/mosabua">mosabua</a>              | M    | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/27026">\#27026</a>  | Support Iceberg Identifier fields                                      | <a href="https://github.com/7hong">7hong</a>                        | reviewer replied |          318 | <a href="https://github.com/raunaqmorarka">raunaqmorarka</a>  | M    | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/28782">\#28782</a>  | Coerce NUMBER to DOUBLE                                                | <a href="https://github.com/findepi">findepi</a>                    | draft            |          236 |                                                   | S    | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/28811">\#28811</a>  | Parquet reader - avoid redundant dictionary reads                      | <a href="https://github.com/ShubhamChaurasia">ShubhamChaurasia</a>  | reviewer replied |          231 | <a href="https://github.com/raunaqmorarka">raunaqmorarka</a>  | L    | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/28917">\#28917</a>  | Retain precision when casting JSON number to VARCHAR                   | <a href="https://github.com/findepi">findepi</a>                    | draft            |          204 |                                                   | M    | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/28791">\#28791</a>  | Prefer the most specific function overload during coercion             | <a href="https://github.com/dain">dain</a>                          | reviewer replied |          204 | <a href="https://github.com/martint">martint</a>              | L    | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/29758">\#29758</a>  | Allow OAuth2 authenticated user tokens to be used with Iceberg REST ca | <a href="https://github.com/louis-pie">louis-pie</a>                | draft            |          141 |                                                   | XL   | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/30182">\#30182</a>  | Support NFS-backed table storage for local/file:// filesystem          | <a href="https://github.com/wendigo">wendigo</a>                    | reviewer replied |          132 | <a href="https://github.com/findepi">findepi</a>              | L    | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/30113">\#30113</a>  | Convert SQL examples to interactive trysql.io ones                     | <a href="https://github.com/wendigo">wendigo</a>                    | reviewer replied |          132 | <a href="https://github.com/mosabua">mosabua</a>              | XL   | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/30289">\#30289</a>  | Dissolve boolean CASE/COALESCE                                         | <a href="https://github.com/wendigo">wendigo</a>                    | reviewer replied |          121 | <a href="https://github.com/findepi">findepi</a>              | L    | stale-ignore |
| <a href="https://github.com/trinodb/trino/pull/30292">\#30292</a>  | Search flat hash control bytes with the Vector API                     | <a href="https://github.com/wendigo">wendigo</a>                    | draft            |          111 |                                                   | L    | stale-ignore |

[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/maintaining/05-waiting-on-author.sql)

## Review requests and review load per person

Open, non-draft pull requests that request a review from each person, and how many pull requests they reviewed in the last 90 days. Waiting on you counts the requests where the next step is a review; find yours, and if someone has many more requests than reviews, ask others to take some over.
GitHub drops a request once the person reviews, so old requests mean nobody answered them. Team requests are not counted. All maintainers are listed, and others with open requests.

| Reviewer                                                  | Role                | Waiting on you | All open requests | Longest wait in days | Reviewed PRs, last 90 days | Change   | Reviewed PRs         |
| --------------------------------------------------------- | ------------------- | --------------:| -----------------:| --------------------:| --------------------------:| -------- | -------------------- |
| <a href="https://github.com/dain">dain</a>                            | maintainer          |             27 |                32 |                  939 |                         19 | ▼ -44%   | █                    |
| <a href="https://github.com/ebyhr">ebyhr</a>                          | maintainer          |             23 |                32 |                  377 |                        314 | ▼ -3%    | ████████████████████ |
| <a href="https://github.com/martint">martint</a>                      | maintainer          |             22 |                42 |                  911 |                         31 | ▼ -14%   | ██                   |
| <a href="https://github.com/wendigo">wendigo</a>                      | maintainer          |             21 |                29 |                  939 |                        184 | ▼ -27%   | ████████████         |
| <a href="https://github.com/electrum">electrum</a>                    | maintainer          |             21 |                31 |                  939 |                         21 | ▼ -54%   | █                    |
| <a href="https://github.com/findepi">findepi</a>                      | maintainer          |             17 |                26 |                  911 |                        155 | ▲ \+35%  | ██████████           |
| <a href="https://github.com/raunaqmorarka">raunaqmorarka</a>          | maintainer          |             15 |                22 |                  965 |                        227 | ▲ \+123% | ██████████████       |
| <a href="https://github.com/chenjian2664">chenjian2664</a>            | maintainer          |             13 |                19 |                  377 |                         84 | ▲ \+236% | █████                |
| <a href="https://github.com/Praveen2112">Praveen2112</a>              | maintainer          |             13 |                17 |                  377 |                         35 | ▲ \+3%   | ██                   |
| <a href="https://github.com/losipiuk">losipiuk</a>                    | maintainer          |             10 |                15 |                  911 |                         48 | ▲ \+50%  | ███                  |
| <a href="https://github.com/findinpath">findinpath</a>                | regular contributor |              7 |                13 |                  206 |                         42 | ▼ -24%   | ███                  |
| <a href="https://github.com/kasiafi">kasiafi</a>                      | regular contributor |              6 |                13 |                   23 |                          6 | ▼ -25%   | ▏                    |
| <a href="https://github.com/sopel39">sopel39</a>                      | regular contributor |              5 |                 9 |                  965 |                          0 | ▼ -100%  |                      |
| <a href="https://github.com/pettyjamesm">pettyjamesm</a>              | maintainer          |              4 |                 6 |                  911 |                          3 | ▼ -57%   | ▏                    |
| <a href="https://github.com/hashhar">hashhar</a>                      | maintainer          |              3 |                 4 |                  911 |                         16 | ▲ \+433% | █                    |
| <a href="https://github.com/krvikash">krvikash</a>                    | regular contributor |              3 |                 4 |                  259 |                          8 | ▲ \+167% | █                    |
| <a href="https://github.com/koszti">koszti</a>                        | regular contributor |              2 |                 2 |                   76 |                          7 | ▼ -13%   | ▏                    |
| <a href="https://github.com/lukasz-stec">lukasz-stec</a>              | regular contributor |              2 |                 4 |                   37 |                          7 | = 0%     | ▏                    |
| <a href="https://github.com/mosabua">mosabua</a>                      | maintainer          |              2 |                 6 |                  939 |                          7 | ▼ -50%   | ▏                    |
| <a href="https://github.com/ssheikin">ssheikin</a>                    | regular contributor |              2 |                 2 |                   65 |                          3 | ▲ \+200% | ▏                    |
| <a href="https://github.com/lukasz-walkiewicz">lukasz-walkiewicz</a>  | regular contributor |              2 |                 4 |                   28 |                          2 | ▲ \+100% | ▏                    |
| <a href="https://github.com/alexjo2144">alexjo2144</a>                | regular contributor |              2 |                 3 |                  204 |                          0 |          |                      |
| <a href="https://github.com/kokosing">kokosing</a>                    | maintainer          |              1 |                 2 |                   12 |                         16 | ▲ \+45%  | █                    |
| <a href="https://github.com/nineinchnick">nineinchnick</a>            | regular contributor |              1 |                 2 |                  939 |                          8 | ▲ \+300% | █                    |
| <a href="https://github.com/tbaeg">tbaeg</a>                          | regular contributor |              1 |                 1 |                    1 |                          3 | ▲ \+200% | ▏                    |
| <a href="https://github.com/Chaho12">Chaho12</a>                      | regular contributor |              1 |                 1 |                   24 |                          2 |          | ▏                    |
| <a href="https://github.com/andythsu">andythsu</a>                    | contributor         |              1 |                 1 |                   24 |                          1 |          | ▏                    |
| <a href="https://github.com/0eu">0eu</a>                              | contributor         |              1 |                 1 |                   54 |                          0 |          |                      |
| <a href="https://github.com/Dith3r">Dith3r</a>                        | regular contributor |              1 |                 1 |                  911 |                          0 |          |                      |
| <a href="https://github.com/Parth-Brahmbhatt">Parth-Brahmbhatt</a>    | contributor         |              1 |                 1 |                   63 |                          0 |          |                      |

[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/maintaining/06-review-queue.sql)

## Is the backlog growing?

Pull requests opened, merged, and closed without merging per month, and how many were open at the end of the month. When the net change stays above zero, the project gets more pull requests than it can review: look at what waits on reviewers above.
Closed by the stale bot is part of closed. Bots' pull requests are not counted. The current month is not complete.

<pre><code>
  Month  | Opened | Merged | Closed | By stale bot | Net change | Open at end |       Open at the end of the month       
---------+--------+--------+--------+--------------+------------+-------------+------------------------------------------
 2026-11 |    121 |     85 |     47 |           13 | ▼ -11      |         297 | █████████████████████████████████████    
 2026-10 |    384 |    265 |    129 |           59 | ▼ -10      |         308 | ██████████████████████████████████████   
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
[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/maintaining/07-backlog-trend.sql)

## How fast do reviewers respond?

Time from an author's update (opening the pull request, a push, or a reply) to the next review, comment, or merge by someone who reviews in this project, for responses in the last 12 months. Cumulative shows the share of updates answered within that time.
Authors who wait days for each round lose context and interest; if the share answered within a day drops, review more often in smaller sessions. Updates still without a response are not counted; they are in the lists above. Draft periods count as waiting, because the data has no record of them.

<pre><code>
    Response time    | Responses | Share | Cumulative |                Histogram                 
---------------------+-----------+-------+------------+------------------------------------------
 under 1 hour        |      1582 | 27%   | 27%        | ████████████████████████████████████████ 
 1 to 4 hours        |      1272 | 22%   | 49%        | ████████████████████████████████         
 4 to 24 hours       |      1510 | 26%   | 74%        | ██████████████████████████████████████   
 1 to 2 days         |       376 | 6%    | 81%        | ██████████                               
 2 to 4 days         |       347 | 6%    | 87%        | █████████                                
 4 to 7 days         |       221 | 4%    | 90%        | ██████                                   
 1 to 2 weeks        |       197 | 3%    | 94%        | █████                                    
 2 to 4 weeks        |       182 | 3%    | 97%        | █████                                    
 4 weeks to 3 months |       142 | 2%    | 99%        | ████                                     
 over 3 months       |        50 | 1%    | 100%       | █                                        
(10 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/maintaining/08-reviewer-response-time.sql)

## Reviews per merged pull request

How many people reviewed each pull request merged in the month, how many were merged without a review by a person, and how fast reviewers responded to authors' updates in the month (median and P90, as in the section above).
A rising share merged without a review means changes go in unchecked; a single reviewer on most pull requests means one person carries each change. Bots' pull requests and bot reviews are not counted. The current month is not complete.

<pre><code>
  Month  | Merged | No review | 1 reviewer |  2  | 3 or more |     None ·, 1 ▒, 2 ▓, 3+ █     | Median response | P90 response 
---------+--------+-----------+------------+-----+-----------+--------------------------------+-----------------+--------------
 2026-11 |     85 | 0%        | 66%        | 31% | 4%        | ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓█ | 7h 25m          | 6d 7h        
 2026-10 |    265 | 0%        | 64%        | 28% | 8%        | ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓██ | 4h 48m          | 7d 14h       
 2026-09 |    218 | 0%        | 62%        | 31% | 6%        | ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓██ | 5h 39m          | 6d 13h       
 2026-08 |    144 | 0%        | 54%        | 37% | 9%        | ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓███ | 5h 45m          | 9d 22h       
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
[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/maintaining/09-review-coverage.sql)

## How concentrated is reviewing?

Share of reviews done by the 5 and the 10 busiest reviewers per quarter, and how many people did half of all reviews. One review is one person reviewing one pull request in the quarter, however many comments they left. Bots and authors replying in their own pull requests are not counted.
When a few people do most reviews, the project stalls when they are away, and they burn out: if the shares grow, ask regular contributors to review more in their areas. The current quarter is not complete.

<pre><code>
 Quarter | Reviewers | Reviews | Top 5 | Top 10 | Half done by |    Top 5 █, next 5 ▓, everyone else ░    
---------+-----------+---------+-------+--------+--------------+------------------------------------------
 2026 Q4 |        41 |     714 | 73%   | 87%    |            3 | █████████████████████████████▓▓▓▓▓▓░░░░░ 
 2026 Q3 |        49 |    1219 | 69%   | 86%    |            3 | ████████████████████████████▓▓▓▓▓▓░░░░░░ 
 2026 Q2 |        49 |    1110 | 69%   | 88%    |            3 | ███████████████████████████▓▓▓▓▓▓▓▓░░░░░ 
 2026 Q1 |        55 |    1230 | 74%   | 89%    |            3 | █████████████████████████████▓▓▓▓▓▓▓░░░░ 
 2025 Q4 |        58 |    1171 | 75%   | 88%    |            3 | ██████████████████████████████▓▓▓▓▓░░░░░ 
 2025 Q3 |        49 |     680 | 74%   | 85%    |            3 | █████████████████████████████▓▓▓▓▓░░░░░░ 
 2025 Q2 |        47 |     594 | 68%   | 84%    |            3 | ███████████████████████████▓▓▓▓▓▓░░░░░░░ 
 2025 Q1 |        53 |     864 | 63%   | 80%    |            4 | █████████████████████████▓▓▓▓▓▓▓░░░░░░░░ 
(8 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/maintaining/10-review-concentration.sql)

## Who reviews

Reviews per month by the role of the reviewer, as shares of all reviews, drawn as maintainers █, regular contributors ▓, contributors ▒, newcomers ░, and bots ·. One review is one reviewer reviewing one pull request in the month. Roles are as of today: maintainers merged pull requests of others in the last year, regular contributors have 10 or more merged pull requests, contributors 1 to 9, newcomers none.
A growing share of regular contributors and contributors takes load off maintainers. A growing share of bots adds comments for authors to read, but does not replace a review by a person.

<pre><code>
  Month  | Reviews | Maintainers | Regular | Contributors | Newcomers | Bots |             Share of reviews             
---------+---------+-------------+---------+--------------+-----------+------+------------------------------------------
 2026-11 |     252 | 67%         | 4%      | 0%           | 0%        | 28%  | ███████████████████████████▓▓··········· 
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
[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/maintaining/11-reviews-by-role.sql)

## What bots do

Pull requests opened by bots, and reviews and comments bots wrote in pull requests, in the last 12 months. Bots are counted nowhere else on this page. Use it to judge the load of dependency updates and how many bot comments authors and reviewers have to read.
Activity is the number of pull requests, reviews, and comments per month, one character per month, oldest first, scaled to each bot's busiest month. Time to merge is the median of merged pull requests.

<pre><code>
                Bot                 | PRs opened | Merged | Closed | Open | Time to merge | Reviews | Comments | Activity, 12 months 
------------------------------------+------------+--------+--------+------+---------------+---------+----------+---------------------
 coderabbitai[bot]                  |          0 |      0 |      0 |    0 |               |     918 |      980 | ...▁▂▁▁▂▁▁█▂        
 github-actions[bot]                |          0 |      0 |      0 |    0 |               |       0 |     1806 | ▄▃▃▄▅▃█▆▇▇█▃        
 dependabot[bot]                    |       1037 |    807 |    229 |    1 | 3h 12m        |       0 |      245 | ▆▄████▇▅▅▃▅▁        
 cla-bot[bot]                       |          0 |      0 |      0 |    0 |               |       0 |      638 | ▃▇▅██▁......        
 copilot-pull-request-reviewer[bot] |          0 |      0 |      0 |    0 |               |     208 |        0 | ▃▃▅█▄▇▄▁▁▁▃▁        
 starburstdata-automation           |          0 |      0 |      0 |    0 |               |       0 |      202 | ▃▂▇▇▃.▂█....        
 chatgpt-codex-connector[bot]       |          0 |      0 |      0 |    0 |               |      61 |      130 | ...▁▂▁▂▄▂██▅        
 sourcery-ai[bot]                   |          0 |      0 |      0 |    0 |               |       1 |        0 | █...........        
(8 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/maintaining/12-automation.sql)

Generated on Thu Nov 12 09:47:08 UTC 2026

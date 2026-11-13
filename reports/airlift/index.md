---
title: Airlift
---

## Activity per repository

Pull requests and issues of people in the libraries of airlift, which Trino is built on, in the last 12 months, what is open now, and the median time until another person commented or reviewed a pull request. Pull requests of bots, like dependency updates, are counted on their own.
A repository with many open pull requests or issues, or a slow first response, needs more maintainers; ask for help in #dev on the Trino Slack.

<pre><code>
  Repository   | People | PRs | Merged | First response | Open PRs | Issues | Open issues | Bot PRs / open | PRs per month, 24 months chart 
---------------+--------+-----+--------+----------------+----------+--------+-------------+----------------+--------------------------------
 airlift       |     49 | 334 |    253 | 6h 07m         |       67 |     12 |          66 | 241 / 0        | ▂▃▄▃▁▁▁▂▂▄▄▄▅▆▃█▁▄█▅▃▅▄▁       
 regulator     |      2 | 248 |    243 | 13d 7h         |        0 |      0 |           0 | 0 / 0          | ...................▁.▁▄█       
 aircompressor |     34 |  47 |     32 | 16h 28m        |       14 |      5 |          20 | 56 / 2         | ...▁▁.▂.....▅▂▅▁.▁▂▂.▅█▂       
 airbase       |     12 |  34 |     30 | 15m 10s        |        4 |     11 |          13 | 416 / 1        | .▁▂▂.▁▁█▅▂▆▁▁▅.▂▃▅▅▁▅▂▅.       
 airstyle      |      5 |  26 |     26 | 9h 40m         |        0 |      2 |           1 | 0 / 0          | .................█▁▁....       
 slice         |      9 |  22 |     17 | 5h 26m         |        6 |      0 |           1 | 0 / 0          | ..▂...▄.▂....▄▃█▃..▃▂▃▃▃       
 launcher      |     11 |  16 |     12 | 59m 30s        |        2 |      0 |           0 | 30 / 1         | .▂▄.▄.▄.▂▄▇▄▂.▄.▂.▂▄█▂▄.       
 zest          |      6 |  12 |      6 | 1d 10h         |        6 |      0 |           0 | 29 / 1         | ....................▃▁█.       
 vthreadtime   |      4 |   9 |      7 | 1d 13h         |        0 |      1 |           0 | 34 / 2         | ...................▂..██       
 provisio      |      6 |   7 |      7 | 1h 30m         |        0 |      0 |          10 | 41 / 8         | .................▃▆█..▃.       
 classfile     |      2 |   4 |      4 |                |        0 |      0 |           0 | 14 / 2         | .....................▃.█       
(11 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/0544c4064d92f4066f6e50002e6e68677654a8f7/sql/airlift/01-activity.sql)

## Open pull requests

Pull requests of people that aren't drafts, at most 8 per repository: approved ones first, because they only need a merge, then the ones without any response, oldest first, and then the ones that waited the longest since another person last commented or reviewed. Without commits, it doesn't show whether the author pushed changes since then.
Merge or close approved pull requests, answer the ones without a response, and ask the authors of the others whether they still work on them.

<table>
<thead>
<tr><th>Repository</th><th>PR</th><th>Title</th><th>Author</th><th>Open for</th><th>Review</th><th>Last response</th></tr>
</thead>
<tbody>
<tr><td>airbase</td><td><a href="https://github.com/airlift/airbase/pull/270">#270</a></td><td>Docker container builder/publish for Airlift</td><td><a href="https://github.com/Randgalt">Randgalt</a></td><td>1925d 16h</td><td>no response</td><td></td></tr>
<tr><td>airbase</td><td><a href="https://github.com/airlift/airbase/pull/394">#394</a></td><td>Load junit-extensions for surefire tests</td><td><a href="https://github.com/findepi">findepi</a></td><td>1012d 6h</td><td>commented</td><td>347d 9h</td></tr>
<tr><td>airbase</td><td><a href="https://github.com/airlift/airbase/pull/1350">#1350</a></td><td>Move checkstyle cache to project root directory</td><td><a href="https://github.com/wendigo">wendigo</a></td><td>79d 5h</td><td>commented</td><td>74d 6h</td></tr>
<tr><td>airbase</td><td><a href="https://github.com/airlift/airbase/pull/1409">#1409</a></td><td>Add dependabot cooldown</td><td><a href="https://github.com/findepi">findepi</a></td><td>29d 12h</td><td>changes requested</td><td>29d 5h</td></tr>
<tr><td>aircompressor</td><td><a href="https://github.com/airlift/aircompressor/pull/155">#155</a></td><td>Add zlib decompressor</td><td><a href="https://github.com/electrum">electrum</a></td><td>1473d 20h</td><td>approved</td><td>688d 17h</td></tr>
<tr><td>aircompressor</td><td><a href="https://github.com/airlift/aircompressor/pull/394">#394</a></td><td>Remove bundled PPC64LE native libraries</td><td><a href="https://github.com/wendigo">wendigo</a></td><td>18d 1h</td><td>approved</td><td>17d 21h</td></tr>
<tr><td>aircompressor</td><td><a href="https://github.com/airlift/aircompressor/pull/142">#142</a></td><td>Add support for LZ4 frame format</td><td><a href="https://github.com/findepi">findepi</a></td><td>1676d 3h</td><td>no response</td><td></td></tr>
<tr><td>aircompressor</td><td><a href="https://github.com/airlift/aircompressor/pull/302">#302</a></td><td>Fix out-of-bounds read in ZstdIncrementalFrameDecompressor</td><td><a href="https://github.com/Marcono1234">Marcono1234</a></td><td>516d 6h</td><td>no response</td><td></td></tr>
<tr><td>aircompressor</td><td><a href="https://github.com/airlift/aircompressor/pull/395">#395</a></td><td>Validate LZ4 input lengths</td><td><a href="https://github.com/wendigo">wendigo</a></td><td>17d 21h</td><td>no response</td><td></td></tr>
<tr><td>aircompressor</td><td><a href="https://github.com/airlift/aircompressor/pull/399">#399</a></td><td>[1/4] Fix compression buffer safety and resource lifetimes</td><td><a href="https://github.com/wendigo">wendigo</a></td><td>16d 0h</td><td>no response</td><td></td></tr>
<tr><td>aircompressor</td><td><a href="https://github.com/airlift/aircompressor/pull/400">#400</a></td><td>[2/4] Allow safepoints during long native codec and hash calls</td><td><a href="https://github.com/wendigo">wendigo</a></td><td>16d 0h</td><td>no response</td><td></td></tr>
<tr><td>aircompressor</td><td><a href="https://github.com/airlift/aircompressor/pull/401">#401</a></td><td>[3/4] Reuse staging buffers and avoid copies for simple heap blocks</td><td><a href="https://github.com/wendigo">wendigo</a></td><td>16d 0h</td><td>no response</td><td></td></tr>
<tr><td>airlift</td><td><a href="https://github.com/airlift/airlift/pull/566">#566</a></td><td>Update to Takari lifecycle</td><td><a href="https://github.com/electrum">electrum</a></td><td>3314d 23h</td><td>approved</td><td>3302d 20h</td></tr>
<tr><td>airlift</td><td><a href="https://github.com/airlift/airlift/pull/843">#843</a></td><td>Add additional JAX-RS tests</td><td><a href="https://github.com/electrum">electrum</a></td><td>2389d 0h</td><td>approved</td><td>1831d 21h</td></tr>
<tr><td>airlift</td><td><a href="https://github.com/airlift/airlift/pull/1207">#1207</a></td><td>Config option to enable setting IP_TOS on the http client socket</td><td><a href="https://github.com/wenjianhn">wenjianhn</a></td><td>873d 6h</td><td>approved</td><td>829d 5h</td></tr>
<tr><td>airlift</td><td><a href="https://github.com/airlift/airlift/pull/1165">#1165</a></td><td>Fix HTTP request builder setHeader case sensitivity</td><td><a href="https://github.com/findepi">findepi</a></td><td>910d 10h</td><td>approved</td><td>745d 9h</td></tr>
<tr><td>airlift</td><td><a href="https://github.com/airlift/airlift/pull/2031">#2031</a></td><td>Fix exception on empty TabularData, allow CompositeData in MetricsC...</td><td><a href="https://github.com/gertjanal">gertjanal</a></td><td>133d 0h</td><td>approved</td><td>108d 22h</td></tr>
<tr><td>airlift</td><td><a href="https://github.com/airlift/airlift/pull/2152">#2152</a></td><td>Add fast path for JSON content type detection</td><td><a href="https://github.com/wendigo">wendigo</a></td><td>52d 1h</td><td>approved</td><td>19d 2h</td></tr>
<tr><td>airlift</td><td><a href="https://github.com/airlift/airlift/pull/2227">#2227</a></td><td>Add AsyncBodyGenerator to HTTP client</td><td><a href="https://github.com/wendigo">wendigo</a></td><td>1d 2h</td><td>approved</td><td>10h 44m</td></tr>
<tr><td>airlift</td><td><a href="https://github.com/airlift/airlift/pull/254">#254</a></td><td>Reduce HttpClient MaxRequestsQueuedPerDestination default</td><td><a href="https://github.com/johngmyers">johngmyers</a></td><td>4354d 20h</td><td>no response</td><td></td></tr>
<tr><td>launcher</td><td><a href="https://github.com/airlift/launcher/pull/59">#59</a></td><td>Use latest JVM config when undefined</td><td><a href="https://github.com/wendigo">wendigo</a></td><td>81d 9h</td><td>no response</td><td></td></tr>
<tr><td>launcher</td><td><a href="https://github.com/airlift/launcher/pull/64">#64</a></td><td>Update golang to 1.27.1 and modernize</td><td><a href="https://github.com/wendigo">wendigo</a></td><td>59d 8h</td><td>no response</td><td></td></tr>
<tr><td>slice</td><td><a href="https://github.com/airlift/slice/pull/193">#193</a></td><td>Improve hashing performance</td><td><a href="https://github.com/wendigo">wendigo</a></td><td>225d 0h</td><td>approved</td><td>224d 22h</td></tr>
<tr><td>slice</td><td><a href="https://github.com/airlift/slice/pull/202">#202</a></td><td>Fix array size calculation with compact object headers</td><td><a href="https://github.com/a-narsudinov">a-narsudinov</a></td><td>9d 7h</td><td>approved</td><td>8d 23h</td></tr>
<tr><td>slice</td><td><a href="https://github.com/airlift/slice/pull/196">#196</a></td><td>Speed up Slice search, UTF-8 case conversion, and trims</td><td><a href="https://github.com/wendigo">wendigo</a></td><td>123d 21h</td><td>no response</td><td></td></tr>
<tr><td>slice</td><td><a href="https://github.com/airlift/slice/pull/203">#203</a></td><td>Fix array size calculation with compact object headers</td><td><a href="https://github.com/wendigo">wendigo</a></td><td>8d 23h</td><td>no response</td><td></td></tr>
<tr><td>slice</td><td><a href="https://github.com/airlift/slice/pull/173">#173</a></td><td>Move Slice to use MemorySegment</td><td><a href="https://github.com/wendigo">wendigo</a></td><td>865d 6h</td><td>commented</td><td>864d 14h</td></tr>
<tr><td>zest</td><td><a href="https://github.com/airlift/zest/pull/36">#36</a></td><td>Add binder attributes set with Guice.withAttribute</td><td><a href="https://github.com/Randgalt">Randgalt</a></td><td>18d 7h</td><td>no response</td><td></td></tr>
<tr><td>zest</td><td><a href="https://github.com/airlift/zest/pull/38">#38</a></td><td>Add @EmptyIfUnbound for optional injection of unbound types</td><td><a href="https://github.com/Randgalt">Randgalt</a></td><td>13d 9h</td><td>no response</td><td></td></tr>
<tr><td>zest</td><td><a href="https://github.com/airlift/zest/pull/34">#34</a></td><td>Add @BoundFor, a binding qualifier that takes a class</td><td><a href="https://github.com/Randgalt">Randgalt</a></td><td>18d 9h</td><td>commented</td><td>18d 8h</td></tr>
<tr><td>zest</td><td><a href="https://github.com/airlift/zest/pull/33">#33</a></td><td>Add Binder.rebind() for replacing an existing binding</td><td><a href="https://github.com/Randgalt">Randgalt</a></td><td>18d 10h</td><td>commented</td><td>18d 7h</td></tr>
<tr><td>zest</td><td><a href="https://github.com/airlift/zest/pull/32">#32</a></td><td>Add DynamicProvider, a provider with an injected @Provides method</td><td><a href="https://github.com/Randgalt">Randgalt</a></td><td>18d 10h</td><td>commented</td><td>17d 0h</td></tr>
<tr><td>zest</td><td><a href="https://github.com/airlift/zest/pull/35">#35</a></td><td>Add Binder.asSingleton() and SingletonModule</td><td><a href="https://github.com/Randgalt">Randgalt</a></td><td>18d 9h</td><td>commented</td><td>15d 0h</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/0544c4064d92f4066f6e50002e6e68677654a8f7/sql/airlift/02-open-pull-requests.sql)

## Issues without an answer

Issues of people opened in the last 12 months that are still open and that no other person commented on, at most 8 per repository, oldest first. Older ones are counted in "Activity per repository".
An answer, even a question or a label, tells the reporter that someone read it. Close the ones that are fixed or can't be reproduced.

<table>
<thead>
<tr><th>Repository</th><th>Issue</th><th>Title</th><th>Author</th><th>Open for</th></tr>
</thead>
<tbody>
<tr><td>airbase</td><td><a href="https://github.com/airlift/airbase/issues/1120">#1120</a></td><td>Add checkstyle rule CommentsIndentation</td><td><a href="https://github.com/electrum">electrum</a></td><td>254d 12h</td></tr>
<tr><td>airbase</td><td><a href="https://github.com/airlift/airbase/issues/1177">#1177</a></td><td>Add additional check style rules</td><td><a href="https://github.com/electrum">electrum</a></td><td>202d 0h</td></tr>
<tr><td>aircompressor</td><td><a href="https://github.com/airlift/aircompressor/issues/406">#406</a></td><td>any plan to support openzl？</td><td><a href="https://github.com/chaijunjie0101">chaijunjie0101</a></td><td>11d 16h</td></tr>
<tr><td>airlift</td><td><a href="https://github.com/airlift/airlift/issues/1887">#1887</a></td><td>Inconsistent http-client documentation</td><td><a href="https://github.com/shivamvishal">shivamvishal</a></td><td>219d 8h</td></tr>
<tr><td>airlift</td><td><a href="https://github.com/airlift/airlift/issues/2021">#2021</a></td><td>[MCP] 2026 protocol</td><td><a href="https://github.com/Randgalt">Randgalt</a></td><td>139d 13h</td></tr>
<tr><td>airstyle</td><td><a href="https://github.com/airlift/airstyle/issues/28">#28</a></td><td>Unused import is kept when its name appears elsewhere in the file</td><td><a href="https://github.com/findepi">findepi</a></td><td>23d 9h</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/0544c4064d92f4066f6e50002e6e68677654a8f7/sql/airlift/03-unanswered-issues.sql)

## First-time contributors

People whose first pull request to a repository was opened in the last 12 months, newest first, what happened to it, and how long it waited for a first response.
A quick first response keeps new people coming back. Thank them, and point them to issues they could help with next.

<table>
<thead>
<tr><th>Repository</th><th>Author</th><th>First PR</th><th>Opened</th><th>State</th><th>First response</th></tr>
</thead>
<tbody>
<tr><td>aircompressor</td><td><a href="https://github.com/2748109647">2748109647</a></td><td><a href="https://github.com/airlift/aircompressor/pull/412">#412</a></td><td>2026-11-13</td><td>open</td><td>none yet</td></tr>
<tr><td>slice</td><td><a href="https://github.com/a-narsudinov">a-narsudinov</a></td><td><a href="https://github.com/airlift/slice/pull/202">#202</a></td><td>2026-11-04</td><td>open</td><td>7h 28m</td></tr>
<tr><td>zest</td><td><a href="https://github.com/Randgalt">Randgalt</a></td><td><a href="https://github.com/airlift/zest/pull/32">#32</a></td><td>2026-10-26</td><td>open</td><td>1d 10h</td></tr>
<tr><td>airlift</td><td><a href="https://github.com/motsc">motsc</a></td><td><a href="https://github.com/airlift/airlift/pull/2199">#2199</a></td><td>2026-10-25</td><td>closed</td><td>none</td></tr>
<tr><td>aircompressor</td><td><a href="https://github.com/dajiaohuang">dajiaohuang</a></td><td><a href="https://github.com/airlift/aircompressor/pull/391">#391</a></td><td>2026-10-23</td><td>merged</td><td>3d 1h</td></tr>
<tr><td>aircompressor</td><td><a href="https://github.com/PHJ2000">PHJ2000</a></td><td><a href="https://github.com/airlift/aircompressor/pull/390">#390</a></td><td>2026-10-22</td><td>closed</td><td>none</td></tr>
<tr><td>slice</td><td><a href="https://github.com/PHJ2000">PHJ2000</a></td><td><a href="https://github.com/airlift/slice/pull/200">#200</a></td><td>2026-10-22</td><td>merged</td><td>1d 1h</td></tr>
<tr><td>vthreadtime</td><td><a href="https://github.com/wendigo">wendigo</a></td><td><a href="https://github.com/airlift/vthreadtime/pull/29">#29</a></td><td>2026-10-21</td><td>merged</td><td>1d 22h</td></tr>
<tr><td>launcher</td><td><a href="https://github.com/Dith3r">Dith3r</a></td><td><a href="https://github.com/airlift/launcher/pull/68">#68</a></td><td>2026-10-19</td><td>merged</td><td>25m 22s</td></tr>
<tr><td>airlift</td><td><a href="https://github.com/filowsky">filowsky</a></td><td><a href="https://github.com/airlift/airlift/pull/2192">#2192</a></td><td>2026-10-19</td><td>open</td><td>3h 48m</td></tr>
<tr><td>aircompressor</td><td><a href="https://github.com/nineinchnick">nineinchnick</a></td><td><a href="https://github.com/airlift/aircompressor/pull/385">#385</a></td><td>2026-10-16</td><td>merged</td><td>8m 10s</td></tr>
<tr><td>regulator</td><td><a href="https://github.com/electrum">electrum</a></td><td><a href="https://github.com/airlift/regulator/pull/11">#11</a></td><td>2026-10-08</td><td>closed</td><td>13d 7h</td></tr>
<tr><td>airlift</td><td><a href="https://github.com/vinzee">vinzee</a></td><td><a href="https://github.com/airlift/airlift/pull/2176">#2176</a></td><td>2026-10-05</td><td>open</td><td>none yet</td></tr>
<tr><td>launcher</td><td><a href="https://github.com/losipiuk">losipiuk</a></td><td><a href="https://github.com/airlift/launcher/pull/66">#66</a></td><td>2026-10-05</td><td>closed</td><td>52m 34s</td></tr>
<tr><td>classfile</td><td><a href="https://github.com/dain">dain</a></td><td><a href="https://github.com/airlift/classfile/pull/1">#1</a></td><td>2026-09-21</td><td>merged</td><td>none</td></tr>
<tr><td>airlift</td><td><a href="https://github.com/arimu1">arimu1</a></td><td><a href="https://github.com/airlift/airlift/pull/2132">#2132</a></td><td>2026-09-13</td><td>open</td><td>none yet</td></tr>
<tr><td>slice</td><td><a href="https://github.com/arimu1">arimu1</a></td><td><a href="https://github.com/airlift/slice/pull/197">#197</a></td><td>2026-08-29</td><td>merged</td><td>none</td></tr>
<tr><td>zest</td><td><a href="https://github.com/wendigo">wendigo</a></td><td><a href="https://github.com/airlift/zest/pull/1">#1</a></td><td>2026-08-20</td><td>merged</td><td>4d 2h</td></tr>
<tr><td>airlift</td><td><a href="https://github.com/niteshy">niteshy</a></td><td><a href="https://github.com/airlift/airlift/pull/2100">#2100</a></td><td>2026-08-17</td><td>open</td><td>10h 43m</td></tr>
<tr><td>airlift</td><td><a href="https://github.com/cragkhit">cragkhit</a></td><td><a href="https://github.com/airlift/airlift/pull/2086">#2086</a></td><td>2026-08-01</td><td>closed</td><td>none</td></tr>
<tr><td>airlift</td><td><a href="https://github.com/hank199599">hank199599</a></td><td><a href="https://github.com/airlift/airlift/pull/2085">#2085</a></td><td>2026-08-01</td><td>merged</td><td>2d 4h</td></tr>
<tr><td>provisio</td><td><a href="https://github.com/mkuthan">mkuthan</a></td><td><a href="https://github.com/airlift/provisio/pull/178">#178</a></td><td>2026-07-31</td><td>merged</td><td>1h 30m</td></tr>
<tr><td>vthreadtime</td><td><a href="https://github.com/dain">dain</a></td><td><a href="https://github.com/airlift/vthreadtime/pull/1">#1</a></td><td>2026-07-30</td><td>merged</td><td>1d 13h</td></tr>
<tr><td>airstyle</td><td><a href="https://github.com/dain">dain</a></td><td><a href="https://github.com/airlift/airstyle/pull/27">#27</a></td><td>2026-07-26</td><td>merged</td><td>10m 44s</td></tr>
<tr><td>regulator</td><td><a href="https://github.com/dain">dain</a></td><td><a href="https://github.com/airlift/regulator/pull/1">#1</a></td><td>2026-07-25</td><td>merged</td><td>none</td></tr>
<tr><td>airlift</td><td><a href="https://github.com/huw0">huw0</a></td><td><a href="https://github.com/airlift/airlift/pull/2067">#2067</a></td><td>2026-07-24</td><td>closed</td><td>1h 12m</td></tr>
<tr><td>launcher</td><td><a href="https://github.com/grantatspothero">grantatspothero</a></td><td><a href="https://github.com/airlift/launcher/pull/51">#51</a></td><td>2026-07-17</td><td>merged</td><td>19m 58s</td></tr>
<tr><td>airlift</td><td><a href="https://github.com/gertjanal">gertjanal</a></td><td><a href="https://github.com/airlift/airlift/pull/2031">#2031</a></td><td>2026-07-03</td><td>open</td><td>24d 1h</td></tr>
<tr><td>aircompressor</td><td><a href="https://github.com/dfa1">dfa1</a></td><td><a href="https://github.com/airlift/aircompressor/pull/356">#356</a></td><td>2026-06-21</td><td>closed</td><td>none</td></tr>
<tr><td>aircompressor</td><td><a href="https://github.com/tyronecai">tyronecai</a></td><td><a href="https://github.com/airlift/aircompressor/pull/355">#355</a></td><td>2026-06-20</td><td>merged</td><td>19d 15h</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/0544c4064d92f4066f6e50002e6e68677654a8f7/sql/airlift/04-first-time-contributors.sql)

## Who reviews

People who reviewed or commented on pull requests of other people in the last 12 months, per repository, and the share of reviewed pull requests the top reviewer saw.
When one person reviews almost everything, the repository stops when they're away. Reviews from people who use a library count too: ask them to review.

<table>
<thead>
<tr><th>Repository</th><th style="text-align: right">Reviewed PRs</th><th style="text-align: right">Reviewers</th><th>Seen by the top reviewer</th><th>Top reviewers (PRs)</th></tr>
</thead>
<tbody>
<tr><td>airlift</td><td style="text-align: right">303</td><td style="text-align: right">30</td><td>48%</td><td>wendigo (144), findepi (58), electrum (43), Randgalt (41)</td></tr>
<tr><td>aircompressor</td><td style="text-align: right">37</td><td style="text-align: right">18</td><td>59%</td><td>electrum (22), wendigo (8), dain (6), martint (2)</td></tr>
<tr><td>airbase</td><td style="text-align: right">34</td><td style="text-align: right">9</td><td>62%</td><td>wendigo (21), findepi (11), electrum (4), martint (3)</td></tr>
<tr><td>slice</td><td style="text-align: right">19</td><td style="text-align: right">6</td><td>47%</td><td>dain (9), electrum (7), wendigo (5), findepi (2)</td></tr>
<tr><td>launcher</td><td style="text-align: right">13</td><td style="text-align: right">7</td><td>69%</td><td>findepi (9), martint (3), wendigo (3), electrum (1)</td></tr>
<tr><td>zest</td><td style="text-align: right">10</td><td style="text-align: right">5</td><td>30%</td><td>dain (3), jvanzyl (3), wendigo (3), electrum (2)</td></tr>
<tr><td>vthreadtime</td><td style="text-align: right">7</td><td style="text-align: right">4</td><td>57%</td><td>dain (4), raunaqmorarka (2), wendigo (2), electrum (1)</td></tr>
<tr><td>airstyle</td><td style="text-align: right">4</td><td style="text-align: right">1</td><td>100%</td><td>electrum (4)</td></tr>
<tr><td>provisio</td><td style="text-align: right">4</td><td style="text-align: right">3</td><td>75%</td><td>wendigo (3), jvanzyl (1), mosabua (1)</td></tr>
<tr><td>regulator</td><td style="text-align: right">1</td><td style="text-align: right">1</td><td>100%</td><td>dain (1)</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/0544c4064d92f4066f6e50002e6e68677654a8f7/sql/airlift/05-reviewers.sql)

Generated on Fri Nov 13 19:42:04 UTC 2026

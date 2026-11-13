---
title: Trino Community Reports
---

## Is the community growing?

People, not bots, who were active in the repository, by what they did. The chart has one character per month for the last 24 full months, each row on its own scale, and the numbers compare the last 90 days and the last 12 months with the period before.
When authors grow faster than reviewers, pull requests wait longer, so reviewing is the most useful help.

<pre><code>
              People who               | Per month, 24 months chart | Last 90 days | vs previous 90 | Last 12 months | vs previous 12 
---------------------------------------+----------------------------+--------------+----------------+----------------+----------------
 Did any of these                      | █▇████▇▇▆▇▇█▆▆▇▆▇▆▆▇▇▇██   |          356 | ▲ +26%         |            835 | ▼ -14%         
 Opened a pull request                 | ▅▅▅▅▅▅▄▄▄▆▅▄▅▅▄▅▇▆▆▇▇███   |          192 | ▲ +22%         |            389 | ▲ +59%         
 Reviewed a pull request               | ███▇▆▆▇▆▅▅▆▇█▇▇▆▇▆▆▆▆▆▇█   |           56 | ▲ +12%         |            107 | ▼ -2%          
 Commented on an issue or pull request | █▇███▇▇▆▆▇▆█▆▆▆▆▇▆▅▆▇▇██   |          266 | ▲ +36%         |            608 | ▼ -16%         
 Opened an issue                       | ▇▇▇███▆▇▇▇▆▇▄▃▅▆▅▄▅▃▄▆▆▆   |          104 | ▲ +25%         |            308 | ▼ -34%         
 Was active for the first time         | ▆▅██▇▇▇▆▇▇▆█▅▄▅▅▇▆▅▆▅▆▇█   |          174 | ▲ +32%         |            556 | ▼ -13%         
(6 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/8c956a35fc3622b816d0c735103cbd8ed1dbeb91/sql/community/01-active-people.sql)

## Do people come back?

Authors of pull requests per full quarter: █ also opened one in the previous quarter, ▒ came back after a longer break, ░ opened their first one. The last two columns show how many of the quarter's newcomers opened another pull request, or got one merged, within 6 months of their first one, once 6 months have passed.
If newcomers rarely come back, review their first pull requests sooner.

<pre><code>
 Quarter | Authors | Returning, came back, new chart | Returning | Came back | New | New who opened a 2nd PR | New who got a PR merged 
---------+---------+---------------------------------+-----------+-----------+-----+-------------------------+-------------------------
 2026-Q3 |     179 | ██████████▒▒▒▒▒░░░░░░░░░░░░░░░  | 33%       | 18%       | 49% |                         |                         
 2026-Q2 |     139 | █████████▒▒▒▒░░░░░░░░░░░░░░░░░  | 30%       | 14%       | 56% |                         |                         
 2026-Q1 |     112 | ███████████▒▒▒▒▒░░░░░░░░░░░░░░  | 37%       | 18%       | 46% | 37%                     | 29%                     
 2025-Q4 |      94 | ████████████▒▒▒▒▒▒▒▒░░░░░░░░░░  | 39%       | 27%       | 34% | 34%                     | 31%                     
 2025-Q3 |     101 | ███████████▒▒▒▒▒▒░░░░░░░░░░░░░  | 37%       | 19%       | 45% | 38%                     | 51%                     
 2025-Q2 |      96 | █████████████▒▒▒▒▒░░░░░░░░░░░░  | 42%       | 19%       | 40% | 39%                     | 39%                     
 2025-Q1 |      88 | ██████████████▒▒▒▒▒▒░░░░░░░░░░  | 48%       | 19%       | 33% | 52%                     | 52%                     
 2024-Q4 |     109 | █████████████▒▒▒▒▒▒░░░░░░░░░░░  | 45%       | 17%       | 38% | 27%                     | 41%                     
(8 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/8c956a35fc3622b816d0c735103cbd8ed1dbeb91/sql/community/02-returning-authors.sql)

## Where do contributors live?

People whose commits were merged in each year since 2019, newest first, by the region of their computer's time zone: ░ the Americas, ▒ Europe, Africa, and the Middle East, ▓ South Asia, █ East Asia and Oceania. A person is counted in the time zone of most of their commits in the year.
More regions mean that someone is awake to review and answer at any time of the day. Maintainers from a region with many authors help their pull requests move faster.

<pre><code>
    Year     | People | Americas | Europe, Africa, Middle East | South Asia | East Asia, Oceania |              Regions chart               
-------------+--------+----------+-----------------------------+------------+--------------------+------------------------------------------
 2026 so far |    199 | 36%      | 38%                         | 8%         | 18%                | ░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓███████ 
 2025        |    154 | 38%      | 40%                         | 7%         | 14%                | ░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓██████ 
 2024        |    203 | 37%      | 38%                         | 6%         | 19%                | ░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓████████ 
 2023        |    172 | 44%      | 32%                         | 8%         | 16%                | ░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓███████ 
 2022        |    192 | 40%      | 32%                         | 6%         | 22%                | ░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓█████████ 
 2021        |    158 | 46%      | 28%                         | 6%         | 20%                | ░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▓▓████████ 
 2020        |    157 | 48%      | 21%                         | 11%        | 20%                | ░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▓▓▓▓████████ 
 2019        |    141 | 48%      | 25%                         | 11%        | 16%                | ░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▓▓▓▓███████ 
(8 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/8c956a35fc3622b816d0c735103cbd8ed1dbeb91/sql/community/03-regions.sql)

## Which companies contribute?

People who merged a pull request or reviewed one in the last 12 months, by the company in their GitHub profile, which they write themselves, so it can be missing or out of date, or else by their public GitHub organizations or commit emails. Reviews don't count reviews of a person's own pull requests.
A project where one company writes or reviews most of the changes depends on its plans. More companies sharing reviews means pull requests from everyone move faster.

<table>
<thead>
<tr><th>Company</th><th style="text-align: right">People</th><th style="text-align: right">Merged PRs</th><th>Share of merged PRs</th><th style="text-align: right">Reviews</th><th>Share of reviews</th></tr>
</thead>
<tbody>
<tr><td>Starburst</td><td style="text-align: right">37</td><td style="text-align: right">1042</td><td>53%</td><td style="text-align: right">5417</td><td>63%</td></tr>
<tr><td>IceGuard</td><td style="text-align: right">4</td><td style="text-align: right">146</td><td>7%</td><td style="text-align: right">288</td><td>3%</td></tr>
<tr><td>Amazon</td><td style="text-align: right">5</td><td style="text-align: right">27</td><td>1%</td><td style="text-align: right">70</td><td>1%</td></tr>
<tr><td>simpligility technologies</td><td style="text-align: right">1</td><td style="text-align: right">11</td><td>1%</td><td style="text-align: right">66</td><td>1%</td></tr>
<tr><td>Apple</td><td style="text-align: right">1</td><td style="text-align: right">6</td><td>0%</td><td style="text-align: right">16</td><td>0%</td></tr>
<tr><td>insideview</td><td style="text-align: right">1</td><td style="text-align: right">6</td><td>0%</td><td style="text-align: right">16</td><td>0%</td></tr>
<tr><td>cargurus</td><td style="text-align: right">1</td><td style="text-align: right">13</td><td>1%</td><td style="text-align: right">8</td><td>0%</td></tr>
<tr><td>DataDog</td><td style="text-align: right">3</td><td style="text-align: right">19</td><td>1%</td><td style="text-align: right">0</td><td>0%</td></tr>
<tr><td>LinkedIn</td><td style="text-align: right">3</td><td style="text-align: right">6</td><td>0%</td><td style="text-align: right">3</td><td>0%</td></tr>
<tr><td>Rashworld</td><td style="text-align: right">1</td><td style="text-align: right">0</td><td>0%</td><td style="text-align: right">9</td><td>0%</td></tr>
<tr><td>University of Maryland, College Park.</td><td style="text-align: right">1</td><td style="text-align: right">3</td><td>0%</td><td style="text-align: right">5</td><td>0%</td></tr>
<tr><td>Expedientetalle</td><td style="text-align: right">1</td><td style="text-align: right">0</td><td>0%</td><td style="text-align: right">7</td><td>0%</td></tr>
<tr><td>LY Corporation</td><td style="text-align: right">2</td><td style="text-align: right">4</td><td>0%</td><td style="text-align: right">2</td><td>0%</td></tr>
<tr><td>Naver</td><td style="text-align: right">1</td><td style="text-align: right">4</td><td>0%</td><td style="text-align: right">2</td><td>0%</td></tr>
<tr><td>OpenAI</td><td style="text-align: right">2</td><td style="text-align: right">6</td><td>0%</td><td style="text-align: right">0</td><td>0%</td></tr>
<tr><td>Other 52 companies</td><td style="text-align: right">55</td><td style="text-align: right">69</td><td>3%</td><td style="text-align: right">36</td><td>0%</td></tr>
<tr><td>No company in the profile, organizations, or commits</td><td style="text-align: right">122</td><td style="text-align: right">615</td><td>31%</td><td style="text-align: right">2696</td><td>31%</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/8c956a35fc3622b816d0c735103cbd8ed1dbeb91/sql/community/04-companies.sql)

## How often does Trino release?

The last 20 releases, the days since the release before, and the commits to master between the two, with their authors, not bots, and the authors whose first commit it was. Master has a linear history, so these are the commits made after the previous release commit.
Long gaps mean that fixes wait longer to reach users.

<pre><code>
 Release |    Date    | Days | Days since the previous release chart | Commits | Authors | First-time |     Notes     
---------+------------+------+---------------------------------------+---------+---------+------------+---------------
     484 | 2026-10-15 |   89 | ████████████████████████              |    1427 |     110 |         50 | <a href="https://trino.io/docs/current/release/release-484.html">release notes</a> 
     483 | 2026-07-18 |   22 | ██████                                |     318 |      44 |         14 | <a href="https://trino.io/docs/current/release/release-483.html">release notes</a> 
     482 | 2026-06-25 |   44 | ████████████                          |     745 |      48 |         13 | <a href="https://trino.io/docs/current/release/release-482.html">release notes</a> 
     481 | 2026-05-11 |   48 | █████████████                         |     546 |      44 |          8 | <a href="https://trino.io/docs/current/release/release-481.html">release notes</a> 
     480 | 2026-03-24 |   99 | ███████████████████████████           |     986 |      62 |         19 | <a href="https://trino.io/docs/current/release/release-480.html">release notes</a> 
     479 | 2025-12-15 |   46 | █████████████                         |     457 |      38 |         10 | <a href="https://trino.io/docs/current/release/release-479.html">release notes</a> 
     478 | 2025-10-29 |   34 | █████████                             |     399 |      36 |          8 | <a href="https://trino.io/docs/current/release/release-478.html">release notes</a> 
     477 | 2025-09-24 |  110 | ██████████████████████████████        |     804 |      72 |         21 | <a href="https://trino.io/docs/current/release/release-477.html">release notes</a> 
     476 | 2025-06-06 |   43 | ████████████                          |     297 |      44 |         10 | <a href="https://trino.io/docs/current/release/release-476.html">release notes</a> 
     475 | 2025-04-23 |   32 | █████████                             |     246 |      38 |          9 | <a href="https://trino.io/docs/current/release/release-475.html">release notes</a> 
     474 | 2025-03-22 |    2 | █                                     |      19 |      11 |          2 | <a href="https://trino.io/docs/current/release/release-474.html">release notes</a> 
     473 | 2025-03-19 |   13 | ████                                  |     143 |      21 |          1 | <a href="https://trino.io/docs/current/release/release-473.html">release notes</a> 
     472 | 2025-03-06 |   13 | ████                                  |     154 |      25 |          1 | <a href="https://trino.io/docs/current/release/release-472.html">release notes</a> 
     471 | 2025-02-20 |   13 | ████                                  |     187 |      23 |          1 | <a href="https://trino.io/docs/current/release/release-471.html">release notes</a> 
     470 | 2025-02-06 |    9 | ██                                    |     158 |      26 |          3 | <a href="https://trino.io/docs/current/release/release-470.html">release notes</a> 
     469 | 2025-01-27 |   41 | ███████████                           |     318 |      43 |         12 | <a href="https://trino.io/docs/current/release/release-469.html">release notes</a> 
     468 | 2024-12-17 |   10 | ███                                   |      97 |      20 |          1 | <a href="https://trino.io/docs/current/release/release-468.html">release notes</a> 
     467 | 2024-12-06 |    8 | ██                                    |     104 |      20 |          1 | <a href="https://trino.io/docs/current/release/release-467.html">release notes</a> 
     466 | 2024-11-28 |    7 | ██                                    |      84 |      19 |          2 | <a href="https://trino.io/docs/current/release/release-466.html">release notes</a> 
     465 | 2024-11-21 |   21 | ██████                                |     259 |      38 |          6 | <a href="https://trino.io/docs/current/release/release-465.html">release notes</a> 
(20 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/8c956a35fc3622b816d0c735103cbd8ed1dbeb91/sql/community/05-releases.sql)

## Are issues handled as fast as they come in?

Issues, not pull requests, opened and closed in each quarter since 2019, newest first, and the issues open at the end of the quarter. In the chart, opened issues grow to the left, and closed ones to the right, so the backlog grows when the left part is longer.
A backlog that keeps growing needs triage: close what is fixed or can't be reproduced, and label the rest.

<pre><code>
    Quarter     | Opened | Closed | Backlog change | Open at the end |                    Opened ◀ chart ▶ Closed                    
----------------+--------+--------+----------------+-----------------+---------------------------------------------------------------
 2026-Q4 so far |    104 |    112 | ▼ -8           |            2465 |                       ████████│█████████                      
 2026-Q3        |    196 |    151 | ▲ +45          |            2473 |                ███████████████│████████████                   
 2026-Q2        |    138 |    116 | ▲ +22          |            2428 |                    ███████████│█████████                      
 2026-Q1        |    211 |    170 | ▲ +41          |            2406 |               ████████████████│█████████████                  
 2025-Q4        |    162 |    125 | ▲ +37          |            2365 |                   ████████████│██████████                     
 2025-Q3        |    179 |    109 | ▲ +70          |            2328 |                 ██████████████│████████                       
 2025-Q2        |    184 |    115 | ▲ +69          |            2258 |                 ██████████████│█████████                      
 2025-Q1        |    226 |    221 | ▲ +5           |            2189 |              █████████████████│█████████████████              
 2024-Q4        |    244 |    231 | ▲ +13          |            2184 |            ███████████████████│██████████████████             
 2024-Q3        |    277 |    326 | ▼ -49          |            2171 |          █████████████████████│█████████████████████████      
 2024-Q2        |    278 |    198 | ▲ +80          |            2220 |          █████████████████████│███████████████                
 2024-Q1        |    259 |    258 | ▲ +1           |            2140 |           ████████████████████│████████████████████           
 2023-Q4        |    261 |    191 | ▲ +70          |            2139 |           ████████████████████│███████████████                
 2023-Q3        |    302 |    222 | ▲ +80          |            2069 |        ███████████████████████│█████████████████              
 2023-Q2        |    336 |    244 | ▲ +92          |            1989 |     ██████████████████████████│███████████████████            
 2023-Q1        |    342 |    234 | ▲ +108         |            1897 |     ██████████████████████████│██████████████████             
 2022-Q4        |    327 |    265 | ▲ +62          |            1789 |      █████████████████████████│████████████████████           
 2022-Q3        |    369 |    309 | ▲ +60          |            1727 |   ████████████████████████████│████████████████████████       
 2022-Q2        |    390 |    274 | ▲ +116         |            1667 | ██████████████████████████████│█████████████████████          
 2022-Q1        |    384 |    277 | ▲ +107         |            1551 | ██████████████████████████████│█████████████████████          
 2021-Q4        |    266 |    174 | ▲ +92          |            1444 |           ████████████████████│█████████████                  
 2021-Q3        |    332 |    180 | ▲ +152         |            1352 |     ██████████████████████████│██████████████                 
 2021-Q2        |    294 |    168 | ▲ +126         |            1200 |        ███████████████████████│█████████████                  
 2021-Q1        |    321 |    162 | ▲ +159         |            1074 |      █████████████████████████│████████████                   
 2020-Q4        |    375 |    183 | ▲ +192         |             915 |  █████████████████████████████│██████████████                 
 2020-Q3        |    336 |    198 | ▲ +138         |             723 |     ██████████████████████████│███████████████                
 2020-Q2        |    317 |    181 | ▲ +136         |             585 |       ████████████████████████│██████████████                 
 2020-Q1        |    264 |    165 | ▲ +99          |             449 |           ████████████████████│█████████████                  
 2019-Q4        |    202 |     92 | ▲ +110         |             350 |               ████████████████│███████                        
 2019-Q3        |    153 |     75 | ▲ +78          |             240 |                   ████████████│██████                         
 2019-Q2        |    136 |     65 | ▲ +71          |             162 |                     ██████████│█████                          
 2019-Q1        |    135 |     44 | ▲ +91          |              91 |                     ██████████│███                            
(32 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/8c956a35fc3622b816d0c735103cbd8ed1dbeb91/sql/community/06-issues-flow.sql)

## How long do users wait for an answer?

Issues opened by users, not maintainers or bots, in each quarter since 2019, newest first, and the time until the first comment from another person, on a log scale: ─ spans 80% of the answered issues, ▒ the middle half, and █ is the median. Issues without any comment aren't in the chart, but are counted in the last two columns.
Issues closed without a comment were often fixed or closed by their reporter. The open ones are listed in the next report, so anyone can answer them.

<pre><code>
    Quarter     | Issues | Median  | 90% within | 1m             1h          1d     1w    30d     1y | Closed, no comment | Open, no comment 
----------------+--------+---------+------------+----------------------------------------------------+--------------------+------------------
 2026-Q4 so far |     60 | 1d 14h  | 11d 13h    |                   ──▒▒▒▒▒▒▒▒▒█▒▒▒────              | 25%                | 43%              
 2026-Q3        |    138 | 7h 54m  | 12d 1h     |          ──────▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒─────              | 30%                | 34%              
 2026-Q2        |    108 | 1d 9h   | 87d 4h     |                  ────▒▒▒▒▒▒▒█▒▒▒▒▒▒──────────      | 24%                | 30%              
 2026-Q1        |    126 | 5h 23m  | 21d 19h    |            ──────▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒───────           | 25%                | 17%              
 2025-Q4        |    107 | 4h 58m  | 30d 2h     |             ────▒▒▒▒▒█▒▒▒▒▒▒▒▒▒──────────          | 10%                | 14%              
 2025-Q3        |    155 | 15h 31m | 77d 10h    |               ────▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒─────────       | 21%                | 14%              
 2025-Q2        |    172 | 10h 29m | 78d 23h    |         ─────────▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒───────────       | 21%                | 21%              
 2025-Q1        |    202 | 9h 02m  | 24d 15h    |           ───────▒▒▒▒▒▒█▒▒▒▒▒▒▒▒────────           | 21%                | 13%              
 2024-Q4        |    194 | 8h 29m  | 26d 0h     |          ────────▒▒▒▒▒▒█▒▒▒▒▒▒▒─────────           | 16%                | 12%              
 2024-Q3        |    226 | 17h 55m | 36d 5h     |              ──────▒▒▒▒▒▒▒█▒▒▒▒▒▒▒───────          | 22%                | 13%              
 2024-Q2        |    207 | 20h 21m | 62d 8h     |           ───────▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒────────        | 21%                | 12%              
 2024-Q1        |    193 | 14h 26m | 159d 22h   |            ───────▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒──────────    | 13%                | 11%              
 2023-Q4        |    194 | 1d 20h  | 93d 7h     |          ───────────▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒────────      | 20%                | 11%              
 2023-Q3        |    232 | 12h 20m | 103d 0h    |           ───────▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒─────────      | 23%                | 16%              
 2023-Q2        |    244 | 1d 13h  | 348d 23h   |           ───────▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒▒──────── | 19%                | 20%              
 2023-Q1        |    248 | 15h 59m | 302d 15h   |            ───────▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒───────────  | 17%                | 14%              
 2022-Q4        |    247 | 16h 11m | 21d 16h    |             ──────▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒─────            | 24%                | 13%              
 2022-Q3        |    262 | 8h 53m  | 55d 8h     |        ────────▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒──────────        | 20%                | 7%               
 2022-Q2        |    295 | 14h 33m | 237d 5h    |          ─────▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒▒▒─────────   | 21%                | 11%              
 2022-Q1        |    237 | 7h 41m  | 277d 17h   |           ─────▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒───────────────  | 19%                | 12%              
 2021-Q4        |    194 | 1d 5h   | 330d 3h    |            ────────▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒────────── | 17%                | 12%              
 2021-Q3        |    220 | 12h 41m | 547d 9h    |           ───────▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒▒▒▒────────── | 11%                | 9%               
 2021-Q2        |    181 | 1d 1h   | 293d 20h   |               ──────▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒──────────  | 15%                | 9%               
 2021-Q1        |    182 | 8h 43m  | 78d 11h    |           ──────▒▒▒▒▒▒▒█▒▒▒▒▒───────────────       | 11%                | 11%              
 2020-Q4        |    193 | 9h 01m  | 280d 20h   |            ──────▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒───────────────  | 11%                | 12%              
 2020-Q3        |    199 | 5h 16m  | 206d 5h    |            ──────▒▒▒▒█▒▒▒▒▒▒▒▒▒▒────────────────   | 9%                 | 7%               
 2020-Q2        |    161 | 5h 47m  | 488d 8h    |          ──────▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒───────── | 17%                | 5%               
 2020-Q1        |    168 | 7h 30m  | 533d 0h    |          ──────▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒▒────────────── | 14%                | 4%               
 2019-Q4        |     97 | 5h 01m  | 615d 2h    |           ──────▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒──────────── | 14%                | 4%               
 2019-Q3        |    115 | 5h 23m  | 72d 18h    |           ─────▒▒▒▒▒▒█▒▒▒▒▒▒────────────────       | 5%                 | 4%               
 2019-Q2        |     74 | 4h 11m  | 3d 16h     |           ────▒▒▒▒▒▒▒█▒▒▒▒▒──────                  | 8%                 | 1%               
 2019-Q1        |     53 | 22h 34m | 1807d 18h  |               ─────▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒▒────────── | 4%                 | 4%               
(32 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/8c956a35fc3622b816d0c735103cbd8ed1dbeb91/sql/community/07-issues-first-response.sql)

## Issues waiting for a first answer

Open issues opened by users, not maintainers or bots, in the last 90 days, without any comment from another person, newest first.
If you know the area, ask for details, point to the documentation, or confirm the bug: an answer in the first days keeps reporters engaged.

<table>
<thead>
<tr><th>Issue</th><th>Title</th><th>Reporter</th><th>Waiting for</th><th style="text-align: right">Reactions</th></tr>
</thead>
<tbody>
<tr><td><a href="https://github.com/trinodb/trino/issues/32138">#32138</a></td><td>A CASE inside an IN subquery can return NULL incorrectly</td><td><a href="https://github.com/cyclane">cyclane</a></td><td>2h 59m</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/32137">#32137</a></td><td>JOINs with multi-column IN (subquery) condition crashes</td><td><a href="https://github.com/cyclane">cyclane</a></td><td>3h 09m</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/32131">#32131</a></td><td>Support loading and refreshing session property rules over HTTP</td><td><a href="https://github.com/alina-atomskaya">alina-atomskaya</a></td><td>10h 52m</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/32089">#32089</a></td><td>Cost estimates are unknown for most plans with aggregations, sorting, or window functions</td><td><a href="https://github.com/RafPe">RafPe</a></td><td>2d 13h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/32045">#32045</a></td><td>DuckDB connector no longer creates JDBC statement spans</td><td><a href="https://github.com/jiwen624">jiwen624</a></td><td>3d 23h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31976">#31976</a></td><td>Azure exchange writes fail with 409 BlobAlreadyExists when the SDK retries</td><td><a href="https://github.com/kevinsheth">kevinsheth</a></td><td>10d 2h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31948">#31948</a></td><td>Filter on a decimal column over Parquet integer data drops rows</td><td><a href="https://github.com/wombatu-kun">wombatu-kun</a></td><td>12d 8h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31925">#31925</a></td><td>Iceberg: table-wide NDV makes the optimizer misestimate partition-filtered joins when keys are skewed per partition</td><td><a href="https://github.com/sdaberdaku">sdaberdaku</a></td><td>13d 13h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31917">#31917</a></td><td>Proposal: use Iceberg partition statistics files for row count estimates</td><td><a href="https://github.com/sdaberdaku">sdaberdaku</a></td><td>14d 2h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31905">#31905</a></td><td>Parquet and ORC bloom filters treat -0.0 and 0.0 as different values</td><td><a href="https://github.com/wombatu-kun">wombatu-kun</a></td><td>14d 12h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31871">#31871</a></td><td>Report oversized join hashes as insufficient resource instead of internal failures</td><td><a href="https://github.com/jalpan-randeri">jalpan-randeri</a></td><td>15d 23h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31859">#31859</a></td><td>Delta Lake checkpoint writer ignores parquet.writer.delta-length-byte-array-encoding-enabled</td><td><a href="https://github.com/nikifor2014">nikifor2014</a></td><td>16d 7h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31854">#31854</a></td><td>Ranger: allow tag-based column SELECT to authorize COUNT(*) without tagging the table</td><td><a href="https://github.com/sadrabarani">sadrabarani</a></td><td>16d 10h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31812">#31812</a></td><td>Docs: cume_dist is documented as returning bigint but returns double</td><td><a href="https://github.com/MicroMilo">MicroMilo</a></td><td>17d 15h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31810">#31810</a></td><td>Iceberg connector: Table queries and SHOW TABLES fail with 403 Forbidden under table-only permissions</td><td><a href="https://github.com/lsherwin10">lsherwin10</a></td><td>17d 19h</td><td style="text-align: right">1</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31780">#31780</a></td><td>Add support for creating symlink-backed tables in the Hive connector</td><td><a href="https://github.com/findinpath">findinpath</a></td><td>19d 23h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31734">#31734</a></td><td>TrinoArray.getResultSet() is not supported</td><td><a href="https://github.com/rileythomp">rileythomp</a></td><td>22d 6h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31701">#31701</a></td><td>Proposal: Redis SQL source connector via ADBC or Flight SQL</td><td><a href="https://github.com/alberttwong">alberttwong</a></td><td>23d 23h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31672">#31672</a></td><td>Support unordered inserts in MongoDB connector</td><td><a href="https://github.com/seokyoung-naver">seokyoung-naver</a></td><td>25d 7h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31663">#31663</a></td><td>Support bounded vectored reads in the Parquet filesystem path</td><td><a href="https://github.com/nirupamsingh29">nirupamsingh29</a></td><td>25d 10h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31654">#31654</a></td><td>Add query-scoped CPU profiling with Web UI flame graphs</td><td><a href="https://github.com/Max-Cheng">Max-Cheng</a></td><td>25d 17h</td><td style="text-align: right">1</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31590">#31590</a></td><td>date_trunc('day', …) returns 23:00 of the previous day for Canadian zones after 2026-11-01 on master (Joda-Time 2.15.0 tz 2026e vs Temurin 25.0.4 tz 2026b)</td><td><a href="https://github.com/CyberNativeAI">CyberNativeAI</a></td><td>30d 12h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31568">#31568</a></td><td>Workload isolation within a single cluster</td><td><a href="https://github.com/tbaeg">tbaeg</a></td><td>32d 4h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31545">#31545</a></td><td>Flaky test TestDeltaQueryFailureRecoveryTest: "Encountered too many errors talking to a worker node"</td><td><a href="https://github.com/jiwen624">jiwen624</a></td><td>33d 15h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31460">#31460</a></td><td>Allow excluding datasets from OpenLineage events</td><td><a href="https://github.com/bimbolimbo">bimbolimbo</a></td><td>38d 7h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31399">#31399</a></td><td>Iceberg equality delete file with extra non-key columns ignored in file scan planning</td><td><a href="https://github.com/findinpath">findinpath</a></td><td>43d 8h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31351">#31351</a></td><td>Time travel configured using session properties</td><td><a href="https://github.com/technical-debt-collector">technical-debt-collector</a></td><td>46d 10h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31308">#31308</a></td><td>Trino shows stale (pre-truncation) data when reading a truncated Hive ACID table before compaction runs</td><td><a href="https://github.com/thierrycz">thierrycz</a></td><td>51d 6h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31302">#31302</a></td><td>Trino displays deleted rows from Hive ACID tables before compaction runs</td><td><a href="https://github.com/thierrycz">thierrycz</a></td><td>51d 9h</td><td style="text-align: right">0</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/31273">#31273</a></td><td>Allow connectors to emit warnings through the SPI, like they can raise custom errors</td><td><a href="https://github.com/okayhooni">okayhooni</a></td><td>52d 13h</td><td style="text-align: right">0</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/8c956a35fc3622b816d0c735103cbd8ed1dbeb91/sql/community/08-unanswered-issues.sql)

## What do users ask for?

Open issues with the most reactions, which is how users vote for a feature or a fix, then the most comments. Comments in the last 90 days show what is discussed now.
Maintainers: this is the demand to plan for. Contributors: these are changes that many people will use; comment on the issue before you start, to agree on the approach.

<table>
<thead>
<tr><th>Issue</th><th>Title</th><th style="text-align: right">Reactions</th><th style="text-align: right">Comments</th><th style="text-align: right">Comments in the last 90 days</th><th>Opened</th></tr>
</thead>
<tbody>
<tr><td><a href="https://github.com/trinodb/trino/issues/391">#391</a></td><td>High Availability</td><td style="text-align: right">112</td><td style="text-align: right">28</td><td style="text-align: right">1</td><td>2019-03</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/14237">#14237</a></td><td>Project Hummingbird</td><td style="text-align: right">82</td><td style="text-align: right">8</td><td style="text-align: right">0</td><td>2022-09</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/396">#396</a></td><td>Build a Kubernetes Operator for Presto</td><td style="text-align: right">62</td><td style="text-align: right">20</td><td style="text-align: right">0</td><td>2019-03</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/18038">#18038</a></td><td>support API for Arrow Flight SQL </td><td style="text-align: right">62</td><td style="text-align: right">16</td><td style="text-align: right">1</td><td>2023-06</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/18">#18</a></td><td>Allow connectors to participate in query optimization</td><td style="text-align: right">53</td><td style="text-align: right">35</td><td style="text-align: right">0</td><td>2019-01</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/5686">#5686</a></td><td>add support for temp tables</td><td style="text-align: right">29</td><td style="text-align: right">15</td><td style="text-align: right">0</td><td>2020-10</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/22811">#22811</a></td><td>Add Support For Liquid Clustering Delta lake</td><td style="text-align: right">28</td><td style="text-align: right">5</td><td style="text-align: right">0</td><td>2024-07</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/12195">#12195</a></td><td>Add support to Kafka connector for connecting to secured Schema Registry</td><td style="text-align: right">26</td><td style="text-align: right">21</td><td style="text-align: right">0</td><td>2022-04</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/26523">#26523</a></td><td>DuckLake support</td><td style="text-align: right">26</td><td style="text-align: right">15</td><td style="text-align: right">1</td><td>2025-09</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/17329">#17329</a></td><td>Add StarRocks Connector</td><td style="text-align: right">24</td><td style="text-align: right">21</td><td style="text-align: right">0</td><td>2023-05</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/17272">#17272</a></td><td>Support copy-on-write mode for Iceberg write</td><td style="text-align: right">23</td><td style="text-align: right">10</td><td style="text-align: right">1</td><td>2023-04</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/20854">#20854</a></td><td>Support query result caching</td><td style="text-align: right">22</td><td style="text-align: right">9</td><td style="text-align: right">0</td><td>2024-02</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/8653">#8653</a></td><td>Add apache doris connector</td><td style="text-align: right">22</td><td style="text-align: right">4</td><td style="text-align: right">0</td><td>2021-07</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/29564">#29564</a></td><td>Iceberg connector cannot read shredded Variant Parquet</td><td style="text-align: right">19</td><td style="text-align: right">9</td><td style="text-align: right">3</td><td>2026-05</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/3300">#3300</a></td><td>Add spatial functions for H3 hexagons</td><td style="text-align: right">19</td><td style="text-align: right">5</td><td style="text-align: right">0</td><td>2020-04</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/15953">#15953</a></td><td>Persisting Trino Query Logs</td><td style="text-align: right">17</td><td style="text-align: right">7</td><td style="text-align: right">0</td><td>2023-02</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/23067">#23067</a></td><td>Add support for ODBC driver</td><td style="text-align: right">16</td><td style="text-align: right">3</td><td style="text-align: right">0</td><td>2024-08</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/389">#389</a></td><td>Parallel read in jdbc-based connectors</td><td style="text-align: right">14</td><td style="text-align: right">21</td><td style="text-align: right">0</td><td>2019-03</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/21791">#21791</a></td><td>Trino2Trino connector</td><td style="text-align: right">13</td><td style="text-align: right">9</td><td style="text-align: right">0</td><td>2024-05</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/18673">#18673</a></td><td>Incremental refresh for Iceberg Materialized Views</td><td style="text-align: right">13</td><td style="text-align: right">8</td><td style="text-align: right">1</td><td>2023-08</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/23795">#23795</a></td><td>Cast operator `::`</td><td style="text-align: right">12</td><td style="text-align: right">5</td><td style="text-align: right">1</td><td>2024-10</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/15847">#15847</a></td><td>FR: Support GeoParquet Format</td><td style="text-align: right">12</td><td style="text-align: right">3</td><td style="text-align: right">0</td><td>2023-01</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/10">#10</a></td><td>Named queries (WITH) should be evaluated only once</td><td style="text-align: right">12</td><td style="text-align: right">1</td><td style="text-align: right">0</td><td>2019-01</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/7103">#7103</a></td><td>ClickHouse connector</td><td style="text-align: right">11</td><td style="text-align: right">10</td><td style="text-align: right">0</td><td>2021-03</td></tr>
<tr><td><a href="https://github.com/trinodb/trino/issues/27371">#27371</a></td><td>🧊 Iceberg  Roadmap</td><td style="text-align: right">11</td><td style="text-align: right">5</td><td style="text-align: right">0</td><td>2025-11</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/8c956a35fc3622b816d0c735103cbd8ed1dbeb91/sql/community/09-most-wanted-issues.sql)

## Which areas get the most issues?

Issues by label: open now, and opened and closed in the last 12 months, with the change of the backlog. An issue with many labels counts for each of them, and the last row shows the issues without a label.
A label with a growing backlog needs an owner. Labels like good first issue are a place to start for new contributors.

<table>
<thead>
<tr><th>Label</th><th style="text-align: right">Open</th><th style="text-align: right">Opened in 12 months</th><th style="text-align: right">Closed in 12 months</th><th>Backlog change</th></tr>
</thead>
<tbody>
<tr><td>enhancement</td><td style="text-align: right">393</td><td style="text-align: right">22</td><td style="text-align: right">40</td><td>▼ -18</td></tr>
<tr><td>Flaky Tests</td><td style="text-align: right">90</td><td style="text-align: right">82</td><td style="text-align: right">74</td><td>▲ +8</td></tr>
<tr><td>test</td><td style="text-align: right">88</td><td style="text-align: right">6</td><td style="text-align: right">15</td><td>▼ -9</td></tr>
<tr><td>syntax-needs-review</td><td style="text-align: right">79</td><td style="text-align: right">6</td><td style="text-align: right">6</td><td>= 0</td></tr>
<tr><td>iceberg</td><td style="text-align: right">74</td><td style="text-align: right">33</td><td style="text-align: right">33</td><td>= 0</td></tr>
<tr><td>docs</td><td style="text-align: right">67</td><td style="text-align: right">4</td><td style="text-align: right">4</td><td>= 0</td></tr>
<tr><td>performance</td><td style="text-align: right">58</td><td style="text-align: right">15</td><td style="text-align: right">7</td><td>▲ +8</td></tr>
<tr><td>correctness</td><td style="text-align: right">56</td><td style="text-align: right">39</td><td style="text-align: right">42</td><td>▼ -3</td></tr>
<tr><td>delta-lake</td><td style="text-align: right">47</td><td style="text-align: right">14</td><td style="text-align: right">15</td><td>▼ -1</td></tr>
<tr><td>good first issue</td><td style="text-align: right">38</td><td style="text-align: right">29</td><td style="text-align: right">39</td><td>▼ -10</td></tr>
<tr><td>maintenance</td><td style="text-align: right">36</td><td style="text-align: right">4</td><td style="text-align: right">4</td><td>= 0</td></tr>
<tr><td>jdbc</td><td style="text-align: right">31</td><td style="text-align: right">3</td><td style="text-align: right">5</td><td>▼ -2</td></tr>
<tr><td>roadmap</td><td style="text-align: right">26</td><td style="text-align: right">4</td><td style="text-align: right">14</td><td>▼ -10</td></tr>
<tr><td>ui</td><td style="text-align: right">20</td><td style="text-align: right">3</td><td style="text-align: right">0</td><td>▲ +3</td></tr>
<tr><td>hudi</td><td style="text-align: right">14</td><td style="text-align: right">1</td><td style="text-align: right">4</td><td>▼ -3</td></tr>
<tr><td>hive</td><td style="text-align: right">13</td><td style="text-align: right">2</td><td style="text-align: right">3</td><td>▼ -1</td></tr>
<tr><td>dx</td><td style="text-align: right">10</td><td style="text-align: right">5</td><td style="text-align: right">1</td><td>▲ +4</td></tr>
<tr><td>bigquery</td><td style="text-align: right">10</td><td style="text-align: right">2</td><td style="text-align: right">2</td><td>= 0</td></tr>
<tr><td>needs-docs</td><td style="text-align: right">6</td><td style="text-align: right">2</td><td style="text-align: right">2</td><td>= 0</td></tr>
<tr><td>corruption</td><td style="text-align: right">3</td><td style="text-align: right">2</td><td style="text-align: right">1</td><td>▲ +1</td></tr>
<tr><td>mongodb</td><td style="text-align: right">3</td><td style="text-align: right">0</td><td style="text-align: right">1</td><td>▼ -1</td></tr>
<tr><td>snowflake</td><td style="text-align: right">3</td><td style="text-align: right">0</td><td style="text-align: right">0</td><td>= 0</td></tr>
<tr><td>sqlserver</td><td style="text-align: right">2</td><td style="text-align: right">1</td><td style="text-align: right">0</td><td>▲ +1</td></tr>
<tr><td>user experience</td><td style="text-align: right">2</td><td style="text-align: right">0</td><td style="text-align: right">0</td><td>= 0</td></tr>
<tr><td>RELEASE-BLOCKER</td><td style="text-align: right">1</td><td style="text-align: right">14</td><td style="text-align: right">14</td><td>= 0</td></tr>
<tr><td>No label</td><td style="text-align: right">1531</td><td style="text-align: right">483</td><td style="text-align: right">347</td><td>▲ +136</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/8c956a35fc3622b816d0c735103cbd8ed1dbeb91/sql/community/10-issues-by-label.sql)

## How active is Slack?

Messages and replies by people, not bots, in the archived Slack channels, and how many people posted them. The charts have one character per week for the last 26 full weeks, each row on its own scale, and the numbers compare the last 13 weeks with the 13 before.
Joining or leaving a channel isn't counted as a message. A channel that gets quieter may need someone to watch it.

<pre><code>
      Channel      |  Messages per week chart   | Messages | Change  |      People per week       | People | Change  
-------------------+----------------------------+----------+---------+----------------------------+--------+---------
 All channels      | █▇▄▄▇▆█▅▅█▇▄▆▄▇▇▆▄▅▆▄▃▅▄▄▂ |      612 | ▼ -27%  | ▆▅▆▆▆▆█▅▅▇▇▅▇▄▆▇▅▇▇▆▅▄▅▅▄▃ |    115 | ▼ -22%  
 core-dev          | ▆▇▁▄█▄▅▃▁▅▅▁▅▄▆▄▆▄▂▁▁▂▃▂▂▁ |      243 | ▼ -33%  | ▇▅▃▇█▅█▄▂▅▆▂▆▆▇▆▇▇▆▄▄▄▆▅▅▃ |     52 | ▲ +16%  
 dev               | ▃▄▂▃▁▃▃▅▂▄▄▃▃▁▆█▃▃▃▅▂▃▃▃▃▁ |      130 | ▲ +17%  | ▆▆▆▆▃▆▆▇▅▅▇█▇▃██▃▆▆█▃▃▆▇▆▂ |     46 | ▼ -12%  
 trino-gateway-dev | ▆▄▂..▁▄.▃▂▂▂▇▄▂▂▂▁▄▇█▃█▄▂. |       89 | ▲ +46%  | ▅█▅..▄▄.▇▄▄▅█▅▅▇▄▂█▇█▇▇▄▄. |     11 | = 0%    
 troubleshooting   | ▄▂▂▂▂▅▆▁██▂▁▁.▁▄▄▁▂▁▂▂▁.▂▂ |       56 | ▼ -58%  | ▅▃▃▃▃▄█▁█▇▅▂▁.▂▆▃▃▄▁▃▃▁.▂▂ |     24 | ▼ -49%  
 beginner          | ..█▃▁▂▂.▁.▁▅▄..▁▁▁▃▂▁..▂▄. |       26 | ▼ -49%  | ..█▇▃▃▃.▃.▃▆▆..▂▂▂▆▄▃..▃▄. |     13 | ▼ -46%  
 announcements     | █.▃...▅▂..▄...▂▃▃.▃▅▅▃.▄▃. |       22 | ▲ +29%  | █.▄...█▄..█...▄▄█.▄█▄▄.█▄. |      2 | ▼ -33%  
 iceberg           | .▃▁.▄▂▂▆▁▃▇█.▂...▂▂▁.▁.▃▁▄ |       20 | ▼ -66%  | .▅▂.█▄▄▄▂▅█▅.▄...▂▄▂.▂.▅▂▇ |     11 | ▼ -52%  
 delta-lake        | ....▂▂█.▁▂......▂▂▂▅▂..... |       17 | ▼ -23%  | ....▃▃█.▂▂......▃▃▂▄▄..... |      7 | = 0%    
 python            | .......▃......▃....█...... |        4 | ▲ +300% | .......▄......▄....█...... |      3 | ▲ +200% 
 kubernetes        | █▂.....▂..▂...........▃▂.. |        3 | ▼ -70%  | █▄.....▄..▄...........▄▄.. |      2 | ▼ -50%  
 trino-gateway     | ▂......█▂▃..▃.▂........▂.. |        2 | ▼ -85%  | ▄......█▄█..█.▄........▄.. |      1 | ▼ -83%  
(12 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/8c956a35fc3622b816d0c735103cbd8ed1dbeb91/sql/community/11-slack-activity.sql)

## Who joins the Slack channels?

People, not bots or deactivated accounts, in every archived channel now, and how many joined and left it in the last 12 full months. The charts have one character per month, oldest on the left, with joins and leaves of a channel on the same scale.
The weekly sync sees a member join or leave only on its next run, so the times are accurate to a week.

<pre><code>
      Channel      | Members now | Joined | Left | Change | Joined per month chart | Left per month 
-------------------+-------------+--------+------+--------+------------------------+----------------
 announcements     |       15819 |    824 |   26 | ▲ +798 | ██▅▅▆▄▃▆▅▅▅▄           | ▁▁▁▁▁▁▁▁.▁▁▁   
 troubleshooting   |       15014 |    823 |   34 | ▲ +789 | ██▅▅▆▄▃▆▅▅▅▄           | ▁▁▁▁▁▁▁▁.▁▁▁   
 dev               |       14652 |    823 |   31 | ▲ +792 | ██▅▅▆▄▃▆▅▅▅▄           | ▁▁▁▁▁▁▁▁.▁▁▁   
 beginner          |       10288 |    822 |   30 | ▲ +792 | ██▅▅▆▄▃▆▅▅▅▄           | ▁▁▁▁▁▁▁▁.▁▁▁   
 iceberg           |        1931 |    141 |    6 | ▲ +135 | ████▇▅▃█▆▄▄▃           | ....▁.▁▂.▁..   
 kubernetes        |        1657 |     62 |    3 | ▲ +59  | ▇▆█▅▃█▂█▅▄▃▃           | ......▁▁.▁..   
 python            |         978 |     46 |    2 | ▲ +44  | ▇▆█▇▇▃▃▄▆▃▄▇           | .....▂▂.....   
 trino-gateway     |         814 |     73 |    3 | ▲ +70  | ▅▆▆▆▄▂▂▆█▃▄▂           | ......▁▁▁...   
 core-dev          |         475 |    165 |    5 | ▲ +160 | ▆▅▆▆▇▆▄█▄▆▆▆           | .....▁▁▁.▁..   
 delta-lake        |         460 |     39 |    3 | ▲ +36  | ▄▄▂▁▂▃.█▆▃▃▃           | ......▂..▁..   
 trino-gateway-dev |         325 |     53 |    2 | ▲ +51  | ▃▅██▂▄▂▃▃▄▂▃           | ......▁.▁...   
(11 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/8c956a35fc3622b816d0c735103cbd8ed1dbeb91/sql/community/12-slack-members.sql)

## Are questions on Slack answered?

Questions are messages that start a conversation, posted by people, not bots, in the last 12 full months. Answered is the share with a reply in the thread from another person, and the median wait is until the first one; all channels means all archived channels except announcements.
An older sync saved the replies until August 2026, and missed some of them, so older months can show fewer answers than there were.

<table>
<thead>
<tr><th>Month</th><th style="text-align: right">Questions in troubleshooting</th><th>Answered</th><th>Median wait</th><th style="text-align: right">Questions in beginner</th><th>Answered</th><th>Median wait</th><th style="text-align: right">Questions in all channels</th><th>Answered</th><th>Median wait</th></tr>
</thead>
<tbody>
<tr><td>2026-10</td><td style="text-align: right">4</td><td>50%</td><td>1d 7h</td><td style="text-align: right">3</td><td>67%</td><td>2h 24m</td><td style="text-align: right">67</td><td>37%</td><td>41m 33s</td></tr>
<tr><td>2026-09</td><td style="text-align: right">6</td><td>67%</td><td>5h 52m</td><td style="text-align: right">4</td><td>50%</td><td>12h 21m</td><td style="text-align: right">66</td><td>53%</td><td>4h 01m</td></tr>
<tr><td>2026-08</td><td style="text-align: right">7</td><td>29%</td><td>29m 47s</td><td style="text-align: right">4</td><td>50%</td><td>5d 11h</td><td style="text-align: right">83</td><td>47%</td><td>2h 30m</td></tr>
<tr><td>2026-07</td><td style="text-align: right">12</td><td>83%</td><td>1h 43m</td><td style="text-align: right">5</td><td>60%</td><td>1d 5h</td><td style="text-align: right">74</td><td>50%</td><td>1h 28m</td></tr>
<tr><td>2026-06</td><td style="text-align: right">13</td><td>38%</td><td>11h 04m</td><td style="text-align: right">10</td><td>20%</td><td>3h 38m</td><td style="text-align: right">95</td><td>36%</td><td>2h 21m</td></tr>
<tr><td>2026-05</td><td style="text-align: right">13</td><td>38%</td><td>5h 08m</td><td style="text-align: right">6</td><td>50%</td><td>1h 17m</td><td style="text-align: right">74</td><td>46%</td><td>2h 19m</td></tr>
<tr><td>2026-04</td><td style="text-align: right">22</td><td>36%</td><td>7h 42m</td><td style="text-align: right">11</td><td>64%</td><td>3h 02m</td><td style="text-align: right">106</td><td>49%</td><td>3h 35m</td></tr>
<tr><td>2026-03</td><td style="text-align: right">22</td><td>45%</td><td>42m 23s</td><td style="text-align: right">16</td><td>56%</td><td>9h 34m</td><td style="text-align: right">102</td><td>48%</td><td>2h 04m</td></tr>
<tr><td>2026-02</td><td style="text-align: right">23</td><td>57%</td><td>8h 56m</td><td style="text-align: right">10</td><td>40%</td><td>51m 42s</td><td style="text-align: right">123</td><td>50%</td><td>1h 43m</td></tr>
<tr><td>2026-01</td><td style="text-align: right">23</td><td>57%</td><td>4h 32m</td><td style="text-align: right">8</td><td>38%</td><td>11h 28m</td><td style="text-align: right">118</td><td>64%</td><td>3h 32m</td></tr>
<tr><td>2025-12</td><td style="text-align: right">30</td><td>50%</td><td>39m 28s</td><td style="text-align: right">13</td><td>77%</td><td>5h 21m</td><td style="text-align: right">113</td><td>51%</td><td>1h 52m</td></tr>
<tr><td>2025-11</td><td style="text-align: right">40</td><td>35%</td><td>17h 16m</td><td style="text-align: right">36</td><td>53%</td><td>1h 24m</td><td style="text-align: right">157</td><td>39%</td><td>1h 50m</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/8c956a35fc3622b816d0c735103cbd8ed1dbeb91/sql/community/13-slack-questions-answered.sql)

## Slack questions without an answer

Messages that start a conversation in troubleshooting and beginner, by people, not bots, per week for the last 13 full weeks: █ got a reply from another person, ░ got none.
Look through these channels for questions without a reply in their thread: even a link to the documentation or a hint where to look helps.

<pre><code>
  Week of   | Questions | No reply | Share |      Replied or not chart      | No reply in troubleshooting | No reply in beginner 
------------+-----------+----------+-------+--------------------------------+-----------------------------+----------------------
 2026-11-02 |         1 |        0 | 0%    | ██████████████████████████████ |                           0 |                    0 
 2026-10-26 |         2 |        0 | 0%    | ██████████████████████████████ |                           0 |                    0 
 2026-10-19 |         2 |        1 | 50%   | ███████████████░░░░░░░░░░░░░░░ |                           0 |                    1 
 2026-10-12 |         0 |        0 |       |                                |                           0 |                    0 
 2026-10-05 |         2 |        2 | 100%  | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ |                           2 |                    0 
 2026-09-28 |         2 |        1 | 50%   | ███████████████░░░░░░░░░░░░░░░ |                           0 |                    1 
 2026-09-21 |         2 |        1 | 50%   | ███████████████░░░░░░░░░░░░░░░ |                           0 |                    1 
 2026-09-14 |         3 |        0 | 0%    | ██████████████████████████████ |                           0 |                    0 
 2026-09-07 |         2 |        1 | 50%   | ███████████████░░░░░░░░░░░░░░░ |                           1 |                    0 
 2026-08-31 |         2 |        1 | 50%   | ███████████████░░░░░░░░░░░░░░░ |                           1 |                    0 
 2026-08-24 |         4 |        1 | 25%   | ███████████████████████░░░░░░░ |                           1 |                    0 
 2026-08-17 |         2 |        2 | 100%  | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ |                           2 |                    0 
 2026-08-10 |         0 |        0 |       |                                |                           0 |                    0 
(13 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/8c956a35fc3622b816d0c735103cbd8ed1dbeb91/sql/community/14-slack-unanswered-questions.sql)

## When is the Slack community awake?

Messages and replies posted by people, not bots, in the archived channels in the last 12 full months, by the day of the week and the hour in UTC. Darker cells have more messages.
Ask when the cells are dark to get a quick answer; the next report shows where people live.

<pre><code>
    Day    | 00    03    06    09    12    15    18    21     | Messages | Busiest hour 
-----------+--------------------------------------------------+----------+--------------
 Monday    | ░░░░░░░░░░░░▒▒░░▒▒▒▒▒▒░░▒▒▒▒▓▓▓▓▒▒▒▒▓▓████▓▓░░░░ |      781 | 20:00        
 Tuesday   | ░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓░░▒▒▒▒▒▒▒▒▓▓▒▒▓▓▒▒▒▒░░ |      758 | 12:00        
 Wednesday | ▒▒░░░░░░░░░░▒▒░░▒▒▒▒▒▒▒▒▒▒██▓▓████▓▓▓▓▓▓▓▓▒▒▒▒▒▒ |      920 | 13:00        
 Thursday  | ░░░░░░░░░░▒▒░░░░▓▓▒▒▒▒▒▒▒▒▓▓▓▓▓▓██▓▓▓▓▒▒▒▒▒▒░░▒▒ |      787 | 16:00        
 Friday    | ▒▒░░▒▒░░░░░░░░░░░░▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒░░▒▒▒▒ |      696 | 18:00        
 Saturday  | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ |      183 | 18:00        
 Sunday    | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ |      194 | 16:00        
(7 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/8c956a35fc3622b816d0c735103cbd8ed1dbeb91/sql/community/15-slack-busy-hours.sql)

## Where do people on Slack live?

People, not bots, who posted in the archived channels in the last 12 full months, by the region of the time zone set in their Slack profile, with the most common time zones and their offsets from UTC.
Read it with the hours above: a question asked in the working hours of a large region gets an answer sooner.

<pre><code>
  Region  | People | Share |          People chart          |   Offsets   |                 Most common time zones                 
----------+--------+-------+--------------------------------+-------------+--------------------------------------------------------
 Asia     |    178 | 38%   | ██████████████████████████████ | UTC+2 to +9 | Asia/Kolkata, Asia/Jerusalem, Asia/Seoul               
 Americas |    149 | 32%   | █████████████████████████      | UTC-8 to -3 | America/New_York, America/Los_Angeles, America/Chicago 
 Europe   |    131 | 28%   | ██████████████████████         | UTC+0 to +3 | Europe/Amsterdam, Europe/London, Europe/Warsaw         
 Africa   |      6 | 1%    | █                              | UTC+0 to +3 | Africa/Casablanca, Africa/Nairobi, Africa/Cairo        
 Oceania  |      1 | 0%    | ▏                              | UTC+10      | Australia/Brisbane                                     
 Not set  |      5 | 1%    | █                              | UTC+0       |                                                        
(6 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/8c956a35fc3622b816d0c735103cbd8ed1dbeb91/sql/community/16-slack-time-zones.sql)

## Who helps others on Slack?

People who replied in the most threads that someone else started in the archived channels in the last 90 days, and in how many of them they replied first, by the name shown in Slack. Accounts with the same full name are counted as one person. Bots and deactivated accounts aren't listed.
Thank them, and if you know the answer to a question in troubleshooting or beginner, join them.

<table>
<thead>
<tr><th>Name</th><th style="text-align: right">Threads</th><th style="text-align: right">Replied first</th><th style="text-align: right">In troubleshooting or beginner</th><th>Channels</th></tr>
</thead>
<tbody>
<tr><td>Mateusz Gajewski</td><td style="text-align: right">21</td><td style="text-align: right">18</td><td style="text-align: right">4</td><td>core-dev, dev, troubleshooting</td></tr>
<tr><td>Manfred Moser</td><td style="text-align: right">15</td><td style="text-align: right">7</td><td style="text-align: right">2</td><td>core-dev, trino-gateway-dev, beginner</td></tr>
<tr><td>findepi</td><td style="text-align: right">12</td><td style="text-align: right">8</td><td style="text-align: right">0</td><td>core-dev, iceberg, dev</td></tr>
<tr><td>Jan Waś</td><td style="text-align: right">11</td><td style="text-align: right">10</td><td style="text-align: right">1</td><td>core-dev, announcements, dev</td></tr>
<tr><td>dain</td><td style="text-align: right">8</td><td style="text-align: right">7</td><td style="text-align: right">0</td><td>core-dev</td></tr>
<tr><td>Vishal Jadhav</td><td style="text-align: right">8</td><td style="text-align: right">6</td><td style="text-align: right">0</td><td>trino-gateway-dev</td></tr>
<tr><td>Roey Ogen</td><td style="text-align: right">7</td><td style="text-align: right">7</td><td style="text-align: right">1</td><td>core-dev, trino-gateway-dev, beginner</td></tr>
<tr><td>raunaqm</td><td style="text-align: right">6</td><td style="text-align: right">5</td><td style="text-align: right">4</td><td>troubleshooting, delta-lake, iceberg</td></tr>
<tr><td>Kent Murra</td><td style="text-align: right">4</td><td style="text-align: right">3</td><td style="text-align: right">2</td><td>dev, beginner, troubleshooting</td></tr>
<tr><td>david</td><td style="text-align: right">4</td><td style="text-align: right">2</td><td style="text-align: right">0</td><td>dev, core-dev</td></tr>
<tr><td>Praveen</td><td style="text-align: right">3</td><td style="text-align: right">2</td><td style="text-align: right">0</td><td>core-dev, dev</td></tr>
<tr><td>Tony Baeg</td><td style="text-align: right">3</td><td style="text-align: right">2</td><td style="text-align: right">1</td><td>core-dev, dev, troubleshooting</td></tr>
<tr><td>martin</td><td style="text-align: right">3</td><td style="text-align: right">2</td><td style="text-align: right">0</td><td>dev, core-dev</td></tr>
<tr><td>ebyhr</td><td style="text-align: right">3</td><td style="text-align: right">1</td><td style="text-align: right">0</td><td>core-dev, dev, iceberg</td></tr>
<tr><td>Jaeho</td><td style="text-align: right">2</td><td style="text-align: right">2</td><td style="text-align: right">0</td><td>trino-gateway-dev</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/8c956a35fc3622b816d0c735103cbd8ed1dbeb91/sql/community/17-slack-top-helpers.sql)

Generated on Fri Nov 13 19:35:06 UTC 2026

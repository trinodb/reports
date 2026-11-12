---
title: Trino Community Reports
---

## Is the community growing?

People, not bots, who were active in the repository, by what they did. The chart has one character per month for the last 24 full months, each row on its own scale, and the numbers compare the last 90 days and the last 12 months with the period before.
When authors grow faster than reviewers, pull requests wait longer, so reviewing is the most useful help.

<pre><code>
              People who               | Per month, 24 months chart | Last 90 days | vs previous 90 | Last 12 months | vs previous 12 
---------------------------------------+----------------------------+--------------+----------------+----------------+----------------
 Did any of these                      | █▇████▇▇▆▇▇█▆▆▇▆▇▆▆▇▇▇██   |          351 | ▲ +25%         |            830 | ▼ -15%         
 Opened a pull request                 | ▅▅▅▅▅▅▄▄▄▆▅▄▅▅▄▅▇▆▆▇▇███   |          190 | ▲ +22%         |            386 | ▲ +57%         
 Reviewed a pull request               | ███▇▆▆▇▆▅▅▆▇█▇▇▆▇▆▆▆▆▆▇█   |           55 | ▲ +10%         |            108 | ▼ -1%          
 Commented on an issue or pull request | █▇███▇▇▆▆▇▆█▆▆▆▆▇▆▅▆▇▇██   |          264 | ▲ +37%         |            604 | ▼ -17%         
 Opened an issue                       | ▇▇▇███▆▇▇▇▆▇▄▃▅▆▅▄▅▃▄▆▆▆   |          102 | ▲ +23%         |            307 | ▼ -35%         
 Was active for the first time         | ▆▅██▇▇▇▆▇▇▆█▅▄▅▅▇▆▅▆▅▆▇█   |          172 | ▲ +31%         |            554 | ▼ -14%         
(6 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/community/01-active-people.sql)

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
[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/community/02-returning-authors.sql)

## Where do contributors live?

People whose commits were merged in each year since 2019, newest first, by the region of their computer's time zone: ░ the Americas, ▒ Europe, Africa, and the Middle East, ▓ South Asia, █ East Asia and Oceania. A person is counted in the time zone of most of their commits in the year.
More regions mean that someone is awake to review and answer at any time of the day. Maintainers from a region with many authors help their pull requests move faster.

<pre><code>
    Year     | People | Americas | Europe, Africa, Middle East | South Asia | East Asia, Oceania |              Regions chart               
-------------+--------+----------+-----------------------------+------------+--------------------+------------------------------------------
 2026 so far |    198 | 36%      | 38%                         | 8%         | 18%                | ░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓███████ 
 2025        |    154 | 38%      | 40%                         | 7%         | 14%                | ░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓██████ 
 2024        |    203 | 37%      | 37%                         | 6%         | 19%                | ░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓████████ 
 2023        |    172 | 44%      | 31%                         | 8%         | 17%                | ░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓███████ 
 2022        |    192 | 40%      | 32%                         | 6%         | 22%                | ░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓█████████ 
 2021        |    158 | 46%      | 28%                         | 6%         | 20%                | ░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▓▓████████ 
 2020        |    157 | 48%      | 21%                         | 11%        | 20%                | ░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▓▓▓▓████████ 
 2019        |    141 | 48%      | 25%                         | 11%        | 16%                | ░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▓▓▓▓███████ 
(8 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/community/03-regions.sql)

## Which companies contribute?

People who merged a pull request or reviewed one in the last 12 months, by the company in their GitHub profile, which they write themselves, so it can be missing or out of date. Reviews don't count reviews of a person's own pull requests.
A project where one company writes or reviews most of the changes depends on its plans. More companies sharing reviews means pull requests from everyone move faster.

| Company                               | People | Merged PRs | Share of merged PRs | Reviews | Share of reviews |
| ------------------------------------- | ------:| ----------:| ------------------- | -------:| ---------------- |
| Starburst                             |     34 |        997 | 51%                 |    5091 | 59%              |
| IceGuard                              |      2 |         79 | 4%                  |     167 | 2%               |
| Amazon                                |      5 |         28 | 1%                  |      67 | 1%               |
| simpligility technologies             |      1 |         11 | 1%                  |      66 | 1%               |
| Apple                                 |      1 |          6 | 0%                  |      16 | 0%               |
| insideview                            |      1 |          6 | 0%                  |      16 | 0%               |
| cargurus                              |      1 |         13 | 1%                  |       8 | 0%               |
| DataDog                               |      3 |         19 | 1%                  |       0 | 0%               |
| LinkedIn                              |      3 |          6 | 0%                  |       3 | 0%               |
| Rashworld                             |      1 |          0 | 0%                  |       9 | 0%               |
| University of Maryland, College Park. |      1 |          3 | 0%                  |       5 | 0%               |
| Expedientetalle                       |      1 |          0 | 0%                  |       7 | 0%               |
| LY Corporation                        |      2 |          4 | 0%                  |       2 | 0%               |
| Naver                                 |      1 |          4 | 0%                  |       2 | 0%               |
| OpenAI                                |      2 |          6 | 0%                  |       0 | 0%               |
| Other 50 companies                    |     53 |         67 | 3%                  |      36 | 0%               |
| No company in the profile or commits  |    129 |        710 | 36%                 |    3109 | 36%              |

[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/community/04-companies.sql)

## How often does Trino release?

The last 20 releases, the days since the release before, and the commits to master between the two, with their authors, not bots, and the authors whose first commit it was. Master has a linear history, so these are the commits made after the previous release commit.
Long gaps mean that fixes wait longer to reach users.

<pre><code>
 Release |    Date    | Days | Days since the previous release chart | Commits | Authors | First-time |                                  Notes                                  
---------+------------+------+---------------------------------------+---------+---------+------------+-------------------------------------------------------------------------
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
[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/community/05-releases.sql)

## Are issues handled as fast as they come in?

Issues, not pull requests, opened and closed in each quarter since 2019, newest first, and the issues open at the end of the quarter. In the chart, opened issues grow to the left, and closed ones to the right, so the backlog grows when the left part is longer.
A backlog that keeps growing needs triage: close what is fixed or can't be reproduced, and label the rest.

<pre><code>
    Quarter     | Opened | Closed | Backlog change | Open at the end |                    Opened ◀ chart ▶ Closed                    
----------------+--------+--------+----------------+-----------------+---------------------------------------------------------------
 2026-Q4 so far |    101 |    110 | ▼ -9           |            2464 |                       ████████│████████                       
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
[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/community/06-issues-flow.sql)

## How long do users wait for an answer?

Issues opened by users, not maintainers or bots, in each quarter since 2019, newest first, and the time until the first comment from another person, on a log scale: ─ spans 80% of the answered issues, ▒ the middle half, and █ is the median. Issues without any comment aren't in the chart, but are counted in the last two columns.
Issues closed without a comment were often fixed or closed by their reporter. The open ones are listed in the next report, so anyone can answer them.

<pre><code>
    Quarter     | Issues | Median  | 90% within | 1m             1h          1d     1w    30d     1y | Closed, no comment | Open, no comment 
----------------+--------+---------+------------+----------------------------------------------------+--------------------+------------------
 2026-Q4 so far |     57 | 1d 17h  | 11d 13h    |                   ──▒▒▒▒▒▒▒▒▒█▒▒▒────              | 26%                | 42%              
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
[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/community/07-issues-first-response.sql)

## Issues waiting for a first answer

Open issues opened by users, not maintainers or bots, in the last 90 days, without any comment from another person, newest first.
If you know the area, ask for details, point to the documentation, or confirm the bug: an answer in the first days keeps reporters engaged.

| Issue                                                    | Title                                                                                                                                                            | Reporter                                                                | Waiting for | Reactions |
| -------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------- | ---------:|
| <a href="https://github.com/trinodb/trino/issues/32097">\#32097</a>  | Iceberg scan silently returns zero rows when manifest\_length is incorrect                                                                                       | <a href="https://github.com/moelhoussein">moelhoussein</a>                          | 4h 38m      |         0 |
| <a href="https://github.com/trinodb/trino/issues/32089">\#32089</a>  | Cost estimates are unknown for most plans with aggregations, sorting, or window functions                                                                        | <a href="https://github.com/RafPe">RafPe</a>                                        | 1d 3h       |         0 |
| <a href="https://github.com/trinodb/trino/issues/32045">\#32045</a>  | DuckDB connector no longer creates JDBC statement spans                                                                                                          | <a href="https://github.com/jiwen624">jiwen624</a>                                  | 2d 13h      |         0 |
| <a href="https://github.com/trinodb/trino/issues/31976">\#31976</a>  | Azure exchange writes fail with 409 BlobAlreadyExists when the SDK retries                                                                                       | <a href="https://github.com/kevinsheth">kevinsheth</a>                              | 8d 17h      |         0 |
| <a href="https://github.com/trinodb/trino/issues/31948">\#31948</a>  | Filter on a decimal column over Parquet integer data drops rows                                                                                                  | <a href="https://github.com/wombatu-kun">wombatu-kun</a>                            | 10d 22h     |         0 |
| <a href="https://github.com/trinodb/trino/issues/31925">\#31925</a>  | Iceberg: table-wide NDV makes the optimizer misestimate partition-filtered joins when keys are skewed per partition                                              | <a href="https://github.com/sdaberdaku">sdaberdaku</a>                              | 12d 3h      |         0 |
| <a href="https://github.com/trinodb/trino/issues/31917">\#31917</a>  | Proposal: use Iceberg partition statistics files for row count estimates                                                                                         | <a href="https://github.com/sdaberdaku">sdaberdaku</a>                              | 12d 17h     |         0 |
| <a href="https://github.com/trinodb/trino/issues/31905">\#31905</a>  | Parquet and ORC bloom filters treat -0.0 and 0.0 as different values                                                                                             | <a href="https://github.com/wombatu-kun">wombatu-kun</a>                            | 13d 2h      |         0 |
| <a href="https://github.com/trinodb/trino/issues/31871">\#31871</a>  | Report oversized join hashes as insufficient resource instead of internal failures                                                                               | <a href="https://github.com/jalpan-randeri">jalpan-randeri</a>                      | 14d 13h     |         0 |
| <a href="https://github.com/trinodb/trino/issues/31859">\#31859</a>  | Delta Lake checkpoint writer ignores parquet.writer.delta-length-byte-array-encoding-enabled                                                                     | <a href="https://github.com/nikifor2014">nikifor2014</a>                            | 14d 22h     |         0 |
| <a href="https://github.com/trinodb/trino/issues/31854">\#31854</a>  | Ranger: allow tag-based column SELECT to authorize COUNT\(\*\) without tagging the table                                                                         | <a href="https://github.com/sadrabarani">sadrabarani</a>                            | 15d 1h      |         0 |
| <a href="https://github.com/trinodb/trino/issues/31812">\#31812</a>  | Docs: cume\_dist is documented as returning bigint but returns double                                                                                            | <a href="https://github.com/MicroMilo">MicroMilo</a>                                | 16d 6h      |         0 |
| <a href="https://github.com/trinodb/trino/issues/31810">\#31810</a>  | Iceberg connector: Table queries and SHOW TABLES fail with 403 Forbidden under table-only permissions                                                            | <a href="https://github.com/lsherwin10">lsherwin10</a>                              | 16d 9h      |         1 |
| <a href="https://github.com/trinodb/trino/issues/31780">\#31780</a>  | Add support for creating symlink-backed tables in the Hive connector                                                                                             | <a href="https://github.com/findinpath">findinpath</a>                              | 18d 13h     |         0 |
| <a href="https://github.com/trinodb/trino/issues/31734">\#31734</a>  | TrinoArray.getResultSet\(\) is not supported                                                                                                                     | <a href="https://github.com/rileythomp">rileythomp</a>                              | 20d 20h     |         0 |
| <a href="https://github.com/trinodb/trino/issues/31701">\#31701</a>  | Proposal: Redis SQL source connector via ADBC or Flight SQL                                                                                                      | <a href="https://github.com/alberttwong">alberttwong</a>                            | 22d 13h     |         0 |
| <a href="https://github.com/trinodb/trino/issues/31672">\#31672</a>  | Support unordered inserts in MongoDB connector                                                                                                                   | <a href="https://github.com/seokyoung-naver">seokyoung-naver</a>                    | 23d 21h     |         0 |
| <a href="https://github.com/trinodb/trino/issues/31663">\#31663</a>  | Support bounded vectored reads in the Parquet filesystem path                                                                                                    | <a href="https://github.com/nirupamsingh29">nirupamsingh29</a>                      | 24d 0h      |         0 |
| <a href="https://github.com/trinodb/trino/issues/31654">\#31654</a>  | Add query-scoped CPU profiling with Web UI flame graphs                                                                                                          | <a href="https://github.com/Max-Cheng">Max-Cheng</a>                                | 24d 7h      |         1 |
| <a href="https://github.com/trinodb/trino/issues/31590">\#31590</a>  | date\_trunc\('day', …\) returns 23:00 of the previous day for Canadian zones after 2026-11-01 on master \(Joda-Time 2.15.0 tz 2026e vs Temurin 25.0.4 tz 2026b\) | <a href="https://github.com/CyberNativeAI">CyberNativeAI</a>                        | 29d 3h      |         0 |
| <a href="https://github.com/trinodb/trino/issues/31568">\#31568</a>  | Workload isolation within a single cluster                                                                                                                       | <a href="https://github.com/tbaeg">tbaeg</a>                                        | 30d 19h     |         0 |
| <a href="https://github.com/trinodb/trino/issues/31545">\#31545</a>  | Flaky test TestDeltaQueryFailureRecoveryTest: "Encountered too many errors talking to a worker node"                                                             | <a href="https://github.com/jiwen624">jiwen624</a>                                  | 32d 5h      |         0 |
| <a href="https://github.com/trinodb/trino/issues/31460">\#31460</a>  | Allow excluding datasets from OpenLineage events                                                                                                                 | <a href="https://github.com/bimbolimbo">bimbolimbo</a>                              | 36d 21h     |         0 |
| <a href="https://github.com/trinodb/trino/issues/31399">\#31399</a>  | Iceberg equality delete file with extra non-key columns ignored in file scan planning                                                                            | <a href="https://github.com/findinpath">findinpath</a>                              | 41d 23h     |         0 |
| <a href="https://github.com/trinodb/trino/issues/31351">\#31351</a>  | Time travel configured using session properties                                                                                                                  | <a href="https://github.com/technical-debt-collector">technical-debt-collector</a>  | 45d 1h      |         0 |
| <a href="https://github.com/trinodb/trino/issues/31308">\#31308</a>  | Trino shows stale \(pre-truncation\) data when reading a truncated Hive ACID table before compaction runs                                                        | <a href="https://github.com/thierrycz">thierrycz</a>                                | 49d 20h     |         0 |
| <a href="https://github.com/trinodb/trino/issues/31302">\#31302</a>  | Trino displays deleted rows from Hive ACID tables before compaction runs                                                                                         | <a href="https://github.com/thierrycz">thierrycz</a>                                | 49d 23h     |         0 |
| <a href="https://github.com/trinodb/trino/issues/31273">\#31273</a>  | Allow connectors to emit warnings through the SPI, like they can raise custom errors                                                                             | <a href="https://github.com/okayhooni">okayhooni</a>                                | 51d 3h      |         0 |
| <a href="https://github.com/trinodb/trino/issues/31250">\#31250</a>  | Password authenticator rewrites only one user header after user mapping                                                                                          | <a href="https://github.com/Amirmehdig">Amirmehdig</a>                              | 52d 19h     |         0 |
| <a href="https://github.com/trinodb/trino/issues/31248">\#31248</a>  | Branch name is not recorded for source tables dependencies on Trino Materialized Views                                                                           | <a href="https://github.com/findinpath">findinpath</a>                              | 53d 1h      |         0 |

[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/community/08-unanswered-issues.sql)

## What do users ask for?

Open issues with the most reactions, which is how users vote for a feature or a fix, then the most comments. Comments in the last 90 days show what is discussed now.
Maintainers: this is the demand to plan for. Contributors: these are changes that many people will use; comment on the issue before you start, to agree on the approach.

| Issue                                                    | Title                                                                    | Reactions | Comments | Comments in the last 90 days | Opened  |
| -------------------------------------------------------- | ------------------------------------------------------------------------ | ---------:| --------:| ----------------------------:| ------- |
| <a href="https://github.com/trinodb/trino/issues/391">\#391</a>      | High Availability                                                        |       112 |       28 |                            1 | 2019-03 |
| <a href="https://github.com/trinodb/trino/issues/14237">\#14237</a>  | Project Hummingbird                                                      |        82 |        8 |                            0 | 2022-09 |
| <a href="https://github.com/trinodb/trino/issues/396">\#396</a>      | Build a Kubernetes Operator for Presto                                   |        62 |       20 |                            0 | 2019-03 |
| <a href="https://github.com/trinodb/trino/issues/18038">\#18038</a>  | support API for Arrow Flight SQL                                         |        62 |       16 |                            1 | 2023-06 |
| <a href="https://github.com/trinodb/trino/issues/18">\#18</a>        | Allow connectors to participate in query optimization                    |        53 |       35 |                            0 | 2019-01 |
| <a href="https://github.com/trinodb/trino/issues/5686">\#5686</a>    | add support for temp tables                                              |        29 |       15 |                            0 | 2020-10 |
| <a href="https://github.com/trinodb/trino/issues/22811">\#22811</a>  | Add Support For Liquid Clustering Delta lake                             |        28 |        5 |                            0 | 2024-07 |
| <a href="https://github.com/trinodb/trino/issues/12195">\#12195</a>  | Add support to Kafka connector for connecting to secured Schema Registry |        26 |       21 |                            0 | 2022-04 |
| <a href="https://github.com/trinodb/trino/issues/26523">\#26523</a>  | DuckLake support                                                         |        26 |       15 |                            1 | 2025-09 |
| <a href="https://github.com/trinodb/trino/issues/17329">\#17329</a>  | Add StarRocks Connector                                                  |        24 |       21 |                            0 | 2023-05 |
| <a href="https://github.com/trinodb/trino/issues/17272">\#17272</a>  | Support copy-on-write mode for Iceberg write                             |        23 |       10 |                            1 | 2023-04 |
| <a href="https://github.com/trinodb/trino/issues/20854">\#20854</a>  | Support query result caching                                             |        22 |        9 |                            0 | 2024-02 |
| <a href="https://github.com/trinodb/trino/issues/8653">\#8653</a>    | Add apache doris connector                                               |        22 |        4 |                            0 | 2021-07 |
| <a href="https://github.com/trinodb/trino/issues/29564">\#29564</a>  | Iceberg connector cannot read shredded Variant Parquet                   |        19 |        9 |                            3 | 2026-05 |
| <a href="https://github.com/trinodb/trino/issues/3300">\#3300</a>    | Add spatial functions for H3 hexagons                                    |        19 |        5 |                            0 | 2020-04 |
| <a href="https://github.com/trinodb/trino/issues/15953">\#15953</a>  | Persisting Trino Query Logs                                              |        17 |        7 |                            0 | 2023-02 |
| <a href="https://github.com/trinodb/trino/issues/23067">\#23067</a>  | Add support for ODBC driver                                              |        16 |        3 |                            0 | 2024-08 |
| <a href="https://github.com/trinodb/trino/issues/389">\#389</a>      | Parallel read in jdbc-based connectors                                   |        14 |       21 |                            0 | 2019-03 |
| <a href="https://github.com/trinodb/trino/issues/21791">\#21791</a>  | Trino2Trino connector                                                    |        13 |        9 |                            0 | 2024-05 |
| <a href="https://github.com/trinodb/trino/issues/18673">\#18673</a>  | Incremental refresh for Iceberg Materialized Views                       |        13 |        8 |                            1 | 2023-08 |
| <a href="https://github.com/trinodb/trino/issues/23795">\#23795</a>  | Cast operator \`::\`                                                     |        12 |        5 |                            1 | 2024-10 |
| <a href="https://github.com/trinodb/trino/issues/15847">\#15847</a>  | FR: Support GeoParquet Format                                            |        12 |        3 |                            0 | 2023-01 |
| <a href="https://github.com/trinodb/trino/issues/10">\#10</a>        | Named queries \(WITH\) should be evaluated only once                     |        12 |        1 |                            0 | 2019-01 |
| <a href="https://github.com/trinodb/trino/issues/7103">\#7103</a>    | ClickHouse connector                                                     |        11 |       10 |                            0 | 2021-03 |
| <a href="https://github.com/trinodb/trino/issues/27371">\#27371</a>  | 🧊 Iceberg  Roadmap                                                      |        11 |        5 |                            0 | 2025-11 |

[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/community/09-most-wanted-issues.sql)

## Which areas get the most issues?

Issues by label: open now, and opened and closed in the last 12 months, with the change of the backlog. An issue with many labels counts for each of them, and the last row shows the issues without a label.
A label with a growing backlog needs an owner. Labels like good first issue are a place to start for new contributors.

| Label               | Open | Opened in 12 months | Closed in 12 months | Backlog change |
| ------------------- | ----:| -------------------:| -------------------:| -------------- |
| enhancement         |  392 |                  21 |                  40 | ▼ -19          |
| Flaky Tests         |   91 |                  82 |                  73 | ▲ \+9          |
| test                |   88 |                   6 |                  15 | ▼ -9           |
| syntax-needs-review |   79 |                   6 |                   6 | = 0            |
| iceberg             |   74 |                  33 |                  33 | = 0            |
| docs                |   67 |                   4 |                   4 | = 0            |
| performance         |   58 |                  15 |                   7 | ▲ \+8          |
| correctness         |   56 |                  39 |                  42 | ▼ -3           |
| delta-lake          |   47 |                  14 |                  15 | ▼ -1           |
| good first issue    |   38 |                  29 |                  39 | ▼ -10          |
| maintenance         |   36 |                   4 |                   4 | = 0            |
| jdbc                |   31 |                   3 |                   5 | ▼ -2           |
| roadmap             |   26 |                   4 |                  14 | ▼ -10          |
| ui                  |   20 |                   3 |                   0 | ▲ \+3          |
| hudi                |   14 |                   1 |                   4 | ▼ -3           |
| hive                |   13 |                   2 |                   3 | ▼ -1           |
| dx                  |   10 |                   5 |                   1 | ▲ \+4          |
| bigquery            |   10 |                   2 |                   2 | = 0            |
| needs-docs          |    6 |                   2 |                   2 | = 0            |
| corruption          |    3 |                   2 |                   1 | ▲ \+1          |
| mongodb             |    3 |                   0 |                   1 | ▼ -1           |
| snowflake           |    3 |                   0 |                   0 | = 0            |
| sqlserver           |    2 |                   1 |                   0 | ▲ \+1          |
| user experience     |    2 |                   0 |                   0 | = 0            |
| RELEASE-BLOCKER     |    1 |                  14 |                  14 | = 0            |
| No label            | 1530 |                 481 |                 346 | ▲ \+135        |

[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/community/10-issues-by-label.sql)

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
[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/community/11-slack-activity.sql)

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
[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/community/12-slack-members.sql)

## Are questions on Slack answered?

Questions are messages that start a conversation, posted by people, not bots, in the last 12 full months. Answered is the share with a reply in the thread from another person, and the median wait is until the first one; all channels means all archived channels except announcements.
An older sync saved the replies until August 2026, and missed some of them, so older months can show fewer answers than there were.

| Month   | Questions in troubleshooting | Answered | Median wait | Questions in beginner | Answered | Median wait | Questions in all channels | Answered | Median wait |
| ------- | ----------------------------:| -------- | ----------- | ---------------------:| -------- | ----------- | -------------------------:| -------- | ----------- |
| 2026-10 |                            4 | 50%      | 1d 7h       |                     3 | 67%      | 2h 24m      |                        67 | 37%      | 41m 33s     |
| 2026-09 |                            6 | 67%      | 5h 52m      |                     4 | 50%      | 12h 21m     |                        66 | 53%      | 4h 01m      |
| 2026-08 |                            7 | 29%      | 29m 47s     |                     4 | 50%      | 5d 11h      |                        83 | 47%      | 2h 30m      |
| 2026-07 |                           12 | 83%      | 1h 43m      |                     5 | 60%      | 1d 5h       |                        74 | 50%      | 1h 28m      |
| 2026-06 |                           13 | 38%      | 11h 04m     |                    10 | 20%      | 3h 38m      |                        95 | 36%      | 2h 21m      |
| 2026-05 |                           13 | 38%      | 5h 08m      |                     6 | 50%      | 1h 17m      |                        74 | 46%      | 2h 19m      |
| 2026-04 |                           22 | 36%      | 7h 42m      |                    11 | 64%      | 3h 02m      |                       106 | 49%      | 3h 35m      |
| 2026-03 |                           22 | 45%      | 42m 23s     |                    16 | 56%      | 9h 34m      |                       102 | 48%      | 2h 04m      |
| 2026-02 |                           23 | 57%      | 8h 56m      |                    10 | 40%      | 51m 42s     |                       123 | 50%      | 1h 43m      |
| 2026-01 |                           23 | 57%      | 4h 32m      |                     8 | 38%      | 11h 28m     |                       118 | 64%      | 3h 32m      |
| 2025-12 |                           30 | 50%      | 39m 28s     |                    13 | 77%      | 5h 21m      |                       113 | 51%      | 1h 52m      |
| 2025-11 |                           40 | 35%      | 17h 16m     |                    36 | 53%      | 1h 24m      |                       157 | 39%      | 1h 50m      |

[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/community/13-slack-questions-answered.sql)

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
[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/community/14-slack-unanswered-questions.sql)

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
[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/community/15-slack-busy-hours.sql)

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
[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/community/16-slack-time-zones.sql)

## Who helps others on Slack?

People who replied in the most threads that someone else started in the archived channels in the last 90 days, and in how many of them they replied first, by the name shown in Slack. Accounts with the same full name are counted as one person. Bots and deactivated accounts aren't listed.
Thank them, and if you know the answer to a question in troubleshooting or beginner, join them.

| Name             | Threads | Replied first | In troubleshooting or beginner | Channels                              |
| ---------------- | -------:| -------------:| ------------------------------:| ------------------------------------- |
| Mateusz Gajewski |      21 |            18 |                              4 | core-dev, dev, troubleshooting        |
| Manfred Moser    |      15 |             7 |                              2 | core-dev, trino-gateway-dev, beginner |
| findepi          |      12 |             8 |                              0 | core-dev, iceberg, dev                |
| Jan Waś          |      11 |            10 |                              1 | core-dev, announcements, dev          |
| dain             |       8 |             7 |                              0 | core-dev                              |
| Vishal Jadhav    |       8 |             6 |                              0 | trino-gateway-dev                     |
| Roey Ogen        |       7 |             7 |                              1 | core-dev, trino-gateway-dev, beginner |
| raunaqm          |       6 |             5 |                              4 | troubleshooting, delta-lake, iceberg  |
| Kent Murra       |       4 |             3 |                              2 | dev, beginner, troubleshooting        |
| david            |       4 |             2 |                              0 | dev, core-dev                         |
| Praveen          |       3 |             2 |                              0 | core-dev, dev                         |
| Tony Baeg        |       3 |             2 |                              1 | core-dev, dev, troubleshooting        |
| martin           |       3 |             2 |                              0 | dev, core-dev                         |
| ebyhr            |       3 |             1 |                              0 | core-dev, dev, iceberg                |
| Jaeho            |       2 |             2 |                              0 | trino-gateway-dev                     |

[query](https://github.com/trinodb/reports/blob/45f99dcecdd7dffd16f5bde5fe1c42c6293ae49a/sql/community/17-slack-top-helpers.sql)

Generated on Thu Nov 12 09:48:44 UTC 2026

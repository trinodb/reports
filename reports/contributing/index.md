---
title: Contributing to Trino
---

## What to expect when you open a pull request

Pull requests opened by people in the 6 full months before this one, by how many pull requests their author had merged before. If this is your first pull request, read the first row: it is what happened to others like you. Drafts are not counted.
A response is the first review or comment from another person, or the merge. No response means the pull request was closed, or is still open, without one. The time to merge counts only merged pull requests. Many first pull requests are never merged because the CLA is not signed: see the next report.

<table>
<thead>
<tr><th>Author experience</th><th style="text-align: right">Pull requests</th><th>Merged</th><th>Closed without merging</th><th>Still open</th><th>No response</th><th>Median time to first response</th><th>Median time to merge</th><th>90% merged within</th></tr>
</thead>
<tbody>
<tr><td>no merged PRs yet</td><td style="text-align: right">345</td><td>28%</td><td>53%</td><td>20%</td><td>36%</td><td>15h 40m</td><td>12d 13h</td><td>49d 9h</td></tr>
<tr><td>1-9 merged PRs</td><td style="text-align: right">164</td><td>55%</td><td>27%</td><td>18%</td><td>17%</td><td>10h 16m</td><td>2d 4h</td><td>28d 5h</td></tr>
<tr><td>10-99 merged PRs</td><td style="text-align: right">177</td><td>74%</td><td>13%</td><td>13%</td><td>7%</td><td>6h 08m</td><td>2d 9h</td><td>23d 21h</td></tr>
<tr><td>100+ merged PRs</td><td style="text-align: right">929</td><td>86%</td><td>10%</td><td>4%</td><td>6%</td><td>2h 22m</td><td>13h 51m</td><td>6d 20h</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/81f91fb3ec9096a375111c79420b9e3884eb5401/sql/contributing/01-what-to-expect.sql)

## Sign the CLA first

Pull requests opened in the last 12 months by people with no merged pull request yet, by whether the cla-signed label was added. It is added once every author of the commits signed the [Contributor License Agreement](https://github.com/trinodb/cla).
Pull requests without a signed CLA are never merged, and most get no response from a person. Sign it before you ask for a review. Drafts are not counted.

<table>
<thead>
<tr><th>CLA</th><th style="text-align: right">Pull requests</th><th>Merged</th><th>Closed without merging</th><th>Still open</th><th>No response</th></tr>
</thead>
<tbody>
<tr><td>signed</td><td style="text-align: right">288</td><td>46%</td><td>39%</td><td>15%</td><td>18%</td></tr>
<tr><td>not signed</td><td style="text-align: right">215</td><td>0%</td><td>78%</td><td>22%</td><td>53%</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/81f91fb3ec9096a375111c79420b9e3884eb5401/sql/contributing/02-sign-the-cla.sql)

## Is it getting better for newcomers?

Pull requests opened by people with no merged pull request yet, per quarter, newest first. The columns after "CLA signed" count only pull requests with a signed CLA, because the others are never merged. Closed as stale means closed by the stale bot. Drafts are not counted.
The last two quarters are not final: many of their pull requests are still open, so fewer are merged yet, and the medians count only the ones answered or merged so far. Compare a quarter with the same quarter a year before.

<table>
<thead>
<tr><th>Quarter</th><th style="text-align: right">Pull requests</th><th>CLA signed</th><th>Merged</th><th>Still open</th><th>Closed as stale</th><th>No response</th><th>Median time to first response</th><th>Median time to merge</th></tr>
</thead>
<tbody>
<tr><td>2026-Q4 (so far)</td><td style="text-align: right">79</td><td>33%</td><td>50%</td><td>46%</td><td>0%</td><td>23%</td><td>4h 31m</td><td>3d 17h</td></tr>
<tr><td>2026-Q3</td><td style="text-align: right">191</td><td>55%</td><td>52%</td><td>25%</td><td>20%</td><td>15%</td><td>20h 29m</td><td>10d 10h</td></tr>
<tr><td>2026-Q2</td><td style="text-align: right">129</td><td>67%</td><td>43%</td><td>3%</td><td>40%</td><td>24%</td><td>1d 5h</td><td>23d 17h</td></tr>
<tr><td>2026-Q1</td><td style="text-align: right">81</td><td>65%</td><td>36%</td><td>6%</td><td>42%</td><td>15%</td><td>1d 0h</td><td>18d 9h</td></tr>
<tr><td>2025-Q4</td><td style="text-align: right">43</td><td>72%</td><td>42%</td><td>0%</td><td>42%</td><td>6%</td><td>14h 10m</td><td>30d 23h</td></tr>
<tr><td>2025-Q3</td><td style="text-align: right">81</td><td>74%</td><td>50%</td><td>2%</td><td>33%</td><td>10%</td><td>16h 45m</td><td>23d 7h</td></tr>
<tr><td>2025-Q2</td><td style="text-align: right">66</td><td>62%</td><td>49%</td><td>0%</td><td>27%</td><td>12%</td><td>5h 56m</td><td>7d 4h</td></tr>
<tr><td>2025-Q1</td><td style="text-align: right">42</td><td>67%</td><td>57%</td><td>0%</td><td>36%</td><td>4%</td><td>15h 31m</td><td>28d 5h</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/81f91fb3ec9096a375111c79420b9e3884eb5401/sql/contributing/03-newcomers-trend.sql)

## How long until a response, and until the merge?

The share of pull requests that got their first response from another person, or were merged, within the time in the first column. For pull requests opened by people in the 12 months before the last 30 days, so each one had at least a month. Drafts and pull requests without a signed CLA are not counted.
Read a row like this: within 1 day, this share of first pull requests got a response. The last row is the share that ever got one. If yours waits longer than most, ask for a review in the #core-dev channel on the Trino Slack.

<table>
<thead>
<tr><th>Time since opened</th><th>Responded: first PRs</th><th>Responded: others</th><th>Merged: first PRs</th><th>Merged: others</th></tr>
</thead>
<tbody>
<tr><td>within 1 hour</td><td>12%</td><td>33%</td><td>0%</td><td>3%</td></tr>
<tr><td>within 4 hours</td><td>22%</td><td>53%</td><td>1%</td><td>20%</td></tr>
<tr><td>within 1 day</td><td>43%</td><td>77%</td><td>5%</td><td>48%</td></tr>
<tr><td>within 2 days</td><td>51%</td><td>81%</td><td>9%</td><td>56%</td></tr>
<tr><td>within 1 week</td><td>62%</td><td>89%</td><td>15%</td><td>69%</td></tr>
<tr><td>within 2 weeks</td><td>69%</td><td>91%</td><td>23%</td><td>74%</td></tr>
<tr><td>within 30 days</td><td>76%</td><td>93%</td><td>33%</td><td>77%</td></tr>
<tr><td>within 90 days</td><td>81%</td><td>94%</td><td>43%</td><td>81%</td></tr>
<tr><td>ever, so far</td><td>82%</td><td>94%</td><td>46%</td><td>82%</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/81f91fb3ec9096a375111c79420b9e3884eb5401/sql/contributing/04-how-long-it-takes.sql)

## Time to merge per quarter

Pull requests of people merged in each quarter since 2019, newest first, and how long they were open, on a log scale: ─ spans 80% of them, ▒ the middle half, and █ is the median. 90% were merged within the time in the third column, so only 1 in 10 waited longer.
First pull requests are those of authors with no merged pull request before. They usually wait much longer, so the last two columns show them on their own.

<pre><code>
    Quarter     | Merged | Median  | 90% within | 1m             1h          1d     1w    30d     1y | First PRs | Median for first PRs 
----------------+--------+---------+------------+----------------------------------------------------+-----------+----------------------
 2026-Q4 so far |    373 | 1d 0h   | 24d 14h    |                   ───▒▒▒▒▒▒█▒▒▒▒▒───────           |        33 | 16d 23h              
 2026-Q3        |    529 | 21h 53m | 23d 2h     |                    ──▒▒▒▒▒▒█▒▒▒▒▒▒──────           |        52 | 10d 10h              
 2026-Q2        |    454 | 21h 08m | 20d 4h     |                   ───▒▒▒▒▒▒█▒▒▒▒▒──────            |        26 | 13d 0h               
 2026-Q1        |    407 | 15h 30m | 23d 13h    |                ───▒▒▒▒▒▒▒█▒▒▒▒▒▒▒───────           |        21 | 18d 9h               
 2025-Q4        |    407 | 16h 57m | 17d 16h    |                 ───▒▒▒▒▒▒▒█▒▒▒▒▒▒──────            |        16 | 43d 10h              
 2025-Q3        |    324 | 8h 48m  | 26d 1h     |                ──▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒───────           |        23 | 12d 5h               
 2025-Q2        |    311 | 11h 25m | 22d 14h    |                ───▒▒▒▒▒▒█▒▒▒▒▒▒▒▒───────           |        22 | 7d 20h               
 2025-Q1        |    489 | 14h 07m | 31d 7h     |                ────▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒──────          |        26 | 28d 21h              
 2024-Q4        |    536 | 14h 47m | 22d 12h    |                ───▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒──────           |        25 | 15d 9h               
 2024-Q3        |    567 | 17h 07m | 22d 23h    |                ────▒▒▒▒▒▒▒█▒▒▒▒▒▒───────           |        23 | 17d 12h              
 2024-Q2        |    712 | 13h 27m | 15d 14h    |                 ────▒▒▒▒▒█▒▒▒▒▒▒──────             |        40 | 9d 8h                
 2024-Q1        |    674 | 14h 58m | 24d 12h    |                 ───▒▒▒▒▒▒█▒▒▒▒▒▒────────           |        31 | 25d 3h               
 2023-Q4        |    585 | 22h 04m | 15d 6h     |                   ───▒▒▒▒▒▒█▒▒▒▒▒▒────             |        16 | 17d 7h               
 2023-Q3        |    608 | 1d 14h  | 34d 20h    |                    ─────▒▒▒▒▒█▒▒▒▒▒▒─────          |        22 | 13d 12h              
 2023-Q2        |    661 | 1d 22h  | 26d 21h    |                     ─────▒▒▒▒█▒▒▒▒▒─────           |        17 | 19d 22h              
 2023-Q1        |    662 | 2d 8h   | 33d 0h     |                     ─────▒▒▒▒▒█▒▒▒▒▒▒────          |        27 | 19d 3h               
 2022-Q4        |    609 | 2d 11h  | 38d 21h    |                      ────▒▒▒▒▒█▒▒▒▒▒▒─────         |        32 | 17d 8h               
 2022-Q3        |    638 | 2d 15h  | 35d 0h     |                     ─────▒▒▒▒▒▒█▒▒▒▒▒────          |        34 | 10d 13h              
 2022-Q2        |    655 | 2d 13h  | 27d 21h    |                     ─────▒▒▒▒▒▒█▒▒▒▒────           |        36 | 14d 5h               
 2022-Q1        |    660 | 2d 3h   | 24d 3h     |                     ─────▒▒▒▒▒█▒▒▒▒▒────           |        33 | 5d 23h               
 2021-Q4        |    532 | 1d 18h  | 28d 0h     |                    ─────▒▒▒▒▒█▒▒▒▒▒▒────           |        26 | 15d 8h               
 2021-Q3        |    494 | 1d 19h  | 26d 12h    |                    ──────▒▒▒▒█▒▒▒▒▒─────           |        34 | 7d 5h                
 2021-Q2        |    514 | 1d 16h  | 25d 4h     |                   ─────▒▒▒▒▒▒█▒▒▒▒▒─────           |        40 | 11d 20h              
 2021-Q1        |    490 | 1d 15h  | 17d 6h     |                    ─────▒▒▒▒▒█▒▒▒▒▒────            |        18 | 7d 21h               
 2020-Q4        |    568 | 1d 3h   | 19d 1h     |                   ─────▒▒▒▒▒█▒▒▒▒▒─────            |        19 | 15d 10h              
 2020-Q3        |    569 | 1d 6h   | 26d 10h    |                   ─────▒▒▒▒▒█▒▒▒▒▒▒▒────           |        44 | 11d 2h               
 2020-Q2        |    547 | 1d 5h   | 19d 18h    |                   ─────▒▒▒▒▒█▒▒▒▒▒▒────            |        30 | 7d 2h                
 2020-Q1        |    487 | 1d 20h  | 23d 12h    |                   ──────▒▒▒▒▒█▒▒▒▒▒─────           |        25 | 4d 19h               
 2019-Q4        |    419 | 1d 13h  | 17d 14h    |                   ──────▒▒▒▒▒█▒▒▒▒─────            |        20 | 4d 2h                
 2019-Q3        |    301 | 1d 14h  | 20d 2h     |                     ────▒▒▒▒▒█▒▒▒▒▒────            |        20 | 5d 22h               
 2019-Q2        |    298 | 1d 14h  | 25d 22h    |                    ────▒▒▒▒▒▒█▒▒▒▒▒─────           |        25 | 17d 9h               
 2019-Q1        |    314 | 22h 38m | 7d 0h      |                  ────▒▒▒▒▒▒█▒▒▒▒───                |        32 | 2d 2h                
(32 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/81f91fb3ec9096a375111c79420b9e3884eb5401/sql/contributing/05-time-to-merge-per-quarter.sql)

## Pull requests per quarter

Pull requests opened by people in each quarter since 2019, newest first, how many of them were merged, and how many are still open. The chart shows their sizes in added plus deleted lines: ░ under 100, ▒ under 500, ▓ under 1000, █ 1000 or more.
When more people open pull requests but a smaller share is merged, reviewers can't keep up, or the pull requests aren't ready. The reasons are in "What happens to pull requests that are not merged?".

<pre><code>
    Quarter     | Opened | Authors | Merged | Still open |            Pull requests by size chart             
----------------+--------+---------+--------+------------+----------------------------------------------------
 2026-Q4 so far |    530 |     107 | 61%    |        148 | ░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▓▓██                      
 2026-Q3        |    856 |     179 | 62%    |         79 | ░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓█████    
 2026-Q2        |    690 |     139 | 68%    |         18 | ░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▓▓▓█████             
 2026-Q1        |    594 |     112 | 67%    |         10 | ░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▓▓███                   
 2025-Q4        |    579 |      94 | 71%    |          3 | ░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▓▓██                   
 2025-Q3        |    459 |     101 | 72%    |          2 | ░░░░░░░░░░░░░░░░░▒▒▒▒▒▓██                          
 2025-Q2        |    409 |      96 | 74%    |          4 | ░░░░░░░░░░░░░░░▒▒▒▒▒▓█                             
 2025-Q1        |    584 |      88 | 79%    |          4 | ░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▓▓██                   
 2024-Q4        |    690 |     109 | 78%    |          3 | ░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▓▓███             
 2024-Q3        |    731 |     117 | 77%    |          4 | ░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▓▓███           
 2024-Q2        |    887 |     122 | 81%    |          5 | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓███  
 2024-Q1        |    804 |     112 | 81%    |          4 | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▓▓████       
 2023-Q4        |    742 |     107 | 80%    |          3 | ░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▓▓▓███          
 2023-Q3        |    749 |     119 | 77%    |          4 | ░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▓▓███          
 2023-Q2        |    867 |     132 | 75%    |          1 | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▓▓▓███    
 2023-Q1        |    895 |     129 | 77%    |          3 | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓███  
 2022-Q4        |    781 |     118 | 73%    |          1 | ░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▓▓████        
 2022-Q3        |    914 |     128 | 73%    |          0 | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓███ 
 2022-Q2        |    892 |     132 | 73%    |          1 | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓███  
 2022-Q1        |    911 |     122 | 76%    |          0 | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓████ 
 2021-Q4        |    710 |     118 | 75%    |          0 | ░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▓▓███            
 2021-Q3        |    662 |     102 | 76%    |          0 | ░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▓▓█               
 2021-Q2        |    662 |     107 | 77%    |          0 | ░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▓██               
 2021-Q1        |    661 |      85 | 75%    |          0 | ░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▓▓▓██               
 2020-Q4        |    744 |      86 | 76%    |          0 | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▓▓▓██          
 2020-Q3        |    741 |     111 | 77%    |          0 | ░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▓▓▓██          
 2020-Q2        |    671 |      80 | 83%    |          0 | ░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▓▓█              
 2020-Q1        |    656 |      80 | 75%    |          0 | ░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▓▓██               
 2019-Q4        |    545 |      69 | 79%    |          0 | ░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▓▓██                     
 2019-Q3        |    410 |      58 | 77%    |          0 | ░░░░░░░░░░░░░░▒▒▒▒▒▒▓█                             
 2019-Q2        |    358 |      49 | 82%    |          0 | ░░░░░░░░░░░▒▒▒▒▒▒▓██                               
 2019-Q1        |    429 |      45 | 81%    |          0 | ░░░░░░░░░░░░░░▒▒▒▒▒▓▓██                            
(32 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/81f91fb3ec9096a375111c79420b9e3884eb5401/sql/contributing/06-pull-requests-per-quarter.sql)

## Do smaller pull requests merge faster?

Pull requests opened by people in the 12 months before the last 30 days, by size and by whether the author had a merged pull request before. Size is added plus deleted lines: XS under 10, S under 100, M under 500, L under 1000, XL 1000 or more. Drafts and pull requests without a signed CLA are not counted.
Larger changes wait longer for the merge and are merged less often, most clearly for first pull requests of 100 changed lines or more (M and larger). If you are new, start with a small change, and split a large one into pull requests that can be reviewed one by one.

<table>
<thead>
<tr><th>Author</th><th>Size</th><th style="text-align: right">Pull requests</th><th>Merged</th><th>Median time to first response</th><th>Median time to merge</th><th>90% merged within</th></tr>
</thead>
<tbody>
<tr><td>first PRs</td><td>XS</td><td style="text-align: right">19</td><td>58%</td><td>15h 49m</td><td>2d 5h</td><td>25d 20h</td></tr>
<tr><td>first PRs</td><td>S</td><td style="text-align: right">101</td><td>67%</td><td>9h 31m</td><td>12d 14h</td><td>43d 23h</td></tr>
<tr><td>first PRs</td><td>M</td><td style="text-align: right">91</td><td>38%</td><td>1d 11h</td><td>21d 4h</td><td>108d 15h</td></tr>
<tr><td>first PRs</td><td>L</td><td style="text-align: right">28</td><td>32%</td><td>21h 01m</td><td>28d 16h</td><td>169d 10h</td></tr>
<tr><td>first PRs</td><td>XL</td><td style="text-align: right">35</td><td>11%</td><td>5d 10h</td><td>103d 7h</td><td>124d 20h</td></tr>
<tr><td>authors with merged PRs</td><td>XS</td><td style="text-align: right">393</td><td>90%</td><td>1h 06m</td><td>5h 04m</td><td>2d 11h</td></tr>
<tr><td>authors with merged PRs</td><td>S</td><td style="text-align: right">696</td><td>88%</td><td>1h 41m</td><td>14h 32m</td><td>7d 6h</td></tr>
<tr><td>authors with merged PRs</td><td>M</td><td style="text-align: right">533</td><td>79%</td><td>4h 34m</td><td>1d 4h</td><td>18d 19h</td></tr>
<tr><td>authors with merged PRs</td><td>L</td><td style="text-align: right">144</td><td>67%</td><td>9h 37m</td><td>1d 22h</td><td>28d 5h</td></tr>
<tr><td>authors with merged PRs</td><td>XL</td><td style="text-align: right">174</td><td>60%</td><td>19h 21m</td><td>6d 3h</td><td>75d 14h</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/81f91fb3ec9096a375111c79420b9e3884eb5401/sql/contributing/07-size.sql)

## What happens to pull requests that are not merged?

Pull requests opened by people in the 12 months before the last 30 days that were not merged, by the experience of their author. █ Stale: closed by the stale bot, which marks a pull request after 21 days without activity, and closes it 21 days later. ▒ Closed by its author or a maintainer. ░ Still open. Drafts are not counted.
No CLA and No response count the not merged pull requests without a signed CLA, and without any review or comment from another person. To keep yours from going stale, reply to reviews, push fixes, and ask for help in the #core-dev channel on the Trino Slack.

<pre><code>
 Author experience | Not merged | Of all PRs | █ stale, ▒ closed, ░ open chart | Stale | Closed | Open | No CLA | No response 
-------------------+------------+------------+---------------------------------+-------+--------+------+--------+-------------
 no merged PRs yet |        315 | 71%        | █████████████▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░  | 44%   | 42%    | 14%  | 53%    | 42%         
 1-9 merged PRs    |         96 | 41%        | ██████████████▒▒▒▒▒▒▒▒▒░░░░░░░  | 47%   | 30%    | 23%  | 2%     | 27%         
 10-99 merged PRs  |         51 | 20%        | █████████████▒▒▒▒▒▒▒▒▒░░░░░░░░  | 43%   | 31%    | 25%  | 0%     | 24%         
 100+ merged PRs   |        211 | 15%        | ████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░  | 14%   | 69%    | 17%  | 1%     | 36%         
(4 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/81f91fb3ec9096a375111c79420b9e3884eb5401/sql/contributing/08-not-merged.sql)

## How fast do authors answer reviews?

After a review or comment from another person, how long until the author answered with a comment, a review, or a new commit, in the last 12 months. The cumulative columns are the share of answers given within that time, on first pull requests and on the pull requests of everyone else.
This is the pace reviewers are used to: most authors answer within a day. An answer within a day or two keeps the review fresh for your reviewer, and after 21 days without activity the stale bot marks the pull request. Reviews never answered, like an approval followed by the merge, are not counted.

<table>
<thead>
<tr><th>Author answered</th><th style="text-align: right">First PRs</th><th>First PRs, cumulative</th><th style="text-align: right">Others</th><th>Others, cumulative</th></tr>
</thead>
<tbody>
<tr><td>within 1 hour</td><td style="text-align: right">156</td><td>20%</td><td style="text-align: right">989</td><td>32%</td></tr>
<tr><td>1 to 4 hours</td><td style="text-align: right">132</td><td>36%</td><td style="text-align: right">564</td><td>50%</td></tr>
<tr><td>4 hours to 1 day</td><td style="text-align: right">235</td><td>66%</td><td style="text-align: right">867</td><td>78%</td></tr>
<tr><td>1 to 2 days</td><td style="text-align: right">73</td><td>75%</td><td style="text-align: right">191</td><td>85%</td></tr>
<tr><td>2 days to 1 week</td><td style="text-align: right">95</td><td>87%</td><td style="text-align: right">293</td><td>94%</td></tr>
<tr><td>1 to 2 weeks</td><td style="text-align: right">56</td><td>94%</td><td style="text-align: right">80</td><td>97%</td></tr>
<tr><td>2 weeks to 30 days</td><td style="text-align: right">28</td><td>97%</td><td style="text-align: right">56</td><td>99%</td></tr>
<tr><td>over 30 days</td><td style="text-align: right">22</td><td>100%</td><td style="text-align: right">46</td><td>100%</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/81f91fb3ec9096a375111c79420b9e3884eb5401/sql/contributing/09-author-response.sql)

## Where is review help needed?

Areas by the labels that a workflow adds from the changed paths, like a connector, docs, or ui. Changes only to the engine, the build, or CI get no label, and changes to more than 3 areas at once, like to all connectors, are counted as many areas. Open counts the open pull requests now, and those without any review or comment from another person yet. The other columns are for pull requests opened in the 12 months before the last 30 days. Drafts, bots and pull requests without a signed CLA are not counted.
Reviewers: the areas on top have the most pull requests that nobody answered yet. Contributors: compare the median times to see where to expect a longer wait, and ask for a review in the #core-dev channel on the Trino Slack if yours waits longer.

<table>
<thead>
<tr><th>Area</th><th style="text-align: right">Open</th><th style="text-align: right">Open without response</th><th style="text-align: right">Opened in 12 months</th><th>Merged</th><th>No response</th><th>Median time to first response</th><th>Median time to merge</th></tr>
</thead>
<tbody>
<tr><td>(no area label)</td><td style="text-align: right">70</td><td style="text-align: right">17</td><td style="text-align: right">990</td><td>82%</td><td>7%</td><td>2h 04m</td><td>12h 35m</td></tr>
<tr><td>docs</td><td style="text-align: right">77</td><td style="text-align: right">15</td><td style="text-align: right">351</td><td>60%</td><td>9%</td><td>15h 21m</td><td>4d 12h</td></tr>
<tr><td>iceberg</td><td style="text-align: right">43</td><td style="text-align: right">7</td><td style="text-align: right">387</td><td>80%</td><td>5%</td><td>4h 44m</td><td>1d 2h</td></tr>
<tr><td>lakehouse</td><td style="text-align: right">8</td><td style="text-align: right">3</td><td style="text-align: right">41</td><td>66%</td><td>5%</td><td>10h 44m</td><td>7d 0h</td></tr>
<tr><td>hive</td><td style="text-align: right">19</td><td style="text-align: right">3</td><td style="text-align: right">142</td><td>72%</td><td>9%</td><td>3h 12m</td><td>1d 4h</td></tr>
<tr><td>ui</td><td style="text-align: right">5</td><td style="text-align: right">2</td><td style="text-align: right">63</td><td>79%</td><td>8%</td><td>7h 31m</td><td>22h 55m</td></tr>
<tr><td>pinot</td><td style="text-align: right">3</td><td style="text-align: right">2</td><td style="text-align: right">10</td><td>60%</td><td>10%</td><td>4h 57m</td><td>2d 18h</td></tr>
<tr><td>(many areas)</td><td style="text-align: right">8</td><td style="text-align: right">1</td><td style="text-align: right">130</td><td>68%</td><td>8%</td><td>9h 09m</td><td>1d 20h</td></tr>
<tr><td>hudi</td><td style="text-align: right">4</td><td style="text-align: right">1</td><td style="text-align: right">12</td><td>50%</td><td>17%</td><td>6h 59m</td><td>3d 19h</td></tr>
<tr><td>delta-lake</td><td style="text-align: right">8</td><td style="text-align: right">1</td><td style="text-align: right">109</td><td>86%</td><td>4%</td><td>4h 54m</td><td>2d 1h</td></tr>
<tr><td>redshift</td><td style="text-align: right">3</td><td style="text-align: right">1</td><td style="text-align: right">33</td><td>73%</td><td>12%</td><td>1h 45m</td><td>18h 08m</td></tr>
<tr><td>elasticsearch</td><td style="text-align: right">0</td><td style="text-align: right">0</td><td style="text-align: right">10</td><td>70%</td><td>0%</td><td>15h 37m</td><td>1d 19h</td></tr>
<tr><td>clickhouse</td><td style="text-align: right">3</td><td style="text-align: right">0</td><td style="text-align: right">14</td><td>71%</td><td>0%</td><td>14h 14m</td><td>1d 10h</td></tr>
<tr><td>sqlserver</td><td style="text-align: right">1</td><td style="text-align: right">0</td><td style="text-align: right">12</td><td>100%</td><td>0%</td><td>13h 07m</td><td>23h 29m</td></tr>
<tr><td>cassandra</td><td style="text-align: right">0</td><td style="text-align: right">0</td><td style="text-align: right">12</td><td>83%</td><td>0%</td><td>12h 04m</td><td>1d 1h</td></tr>
<tr><td>postgresql</td><td style="text-align: right">1</td><td style="text-align: right">0</td><td style="text-align: right">30</td><td>83%</td><td>7%</td><td>7h 28m</td><td>1d 10h</td></tr>
<tr><td>bigquery</td><td style="text-align: right">0</td><td style="text-align: right">0</td><td style="text-align: right">35</td><td>91%</td><td>3%</td><td>3h 27m</td><td>13h 28m</td></tr>
<tr><td>ignite</td><td style="text-align: right">0</td><td style="text-align: right">0</td><td style="text-align: right">11</td><td>64%</td><td>36%</td><td>3h 10m</td><td>5d 0h</td></tr>
<tr><td>faker</td><td style="text-align: right">4</td><td style="text-align: right">0</td><td style="text-align: right">15</td><td>73%</td><td>0%</td><td>2h 05m</td><td>2d 13h</td></tr>
<tr><td>jdbc</td><td style="text-align: right">6</td><td style="text-align: right">0</td><td style="text-align: right">27</td><td>81%</td><td>4%</td><td>1h 48m</td><td>1d 7h</td></tr>
<tr><td>mongodb</td><td style="text-align: right">1</td><td style="text-align: right">0</td><td style="text-align: right">12</td><td>92%</td><td>0%</td><td>1h 15m</td><td>9h 38m</td></tr>
<tr><td>opensearch</td><td style="text-align: right">0</td><td style="text-align: right">0</td><td style="text-align: right">11</td><td>64%</td><td>18%</td><td>1h 10m</td><td>3h 47m</td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/81f91fb3ec9096a375111c79420b9e3884eb5401/sql/contributing/10-review-help-needed.sql)

## Where is the focus?

Pull requests opened by people in the last 12 full months, by area: the labels that a workflow adds from the changed paths, like a connector, docs, or ui. Changes only to the engine, the build, or CI get no label, and changes to more than 3 areas at once, like to all connectors, are counted as many areas. One pull request can be in up to 3 areas, so the shares add up to more than 100%.
The chart has one character per month, oldest on the left, and each row has its own scale. This is what the project works on now; the next report shows the modules where merged code changes, including the engine.

<pre><code>
      Area       | PRs  | Share | Authors | Per month chart 
-----------------+------+-------+---------+-----------------
 (no area label) | 1286 | 44%   |     178 | ▅▄▃▅▅▄▅▆▇▆▆█    
 iceberg         |  483 | 17%   |     110 | ▄▃▄▅▆▄▅▇▆▇██    
 docs            |  475 | 16%   |     180 | ▄▄▂▂▅▅▅▆▅▇▇█    
 hive            |  182 | 6%    |      60 | ▄▅▃▄█▆▄▆▇▆▇█    
 (many areas)    |  157 | 5%    |      41 | █▇▅▇▇█▆█▇▄▇▇    
 delta-lake      |  140 | 5%    |      44 | ▂▄▄▄▃▅▄▄▆▇▇█    
 ui              |   77 | 3%    |      19 | ▃▄▃▄▅▃▇▃█▂▄▃    
 lakehouse       |   62 | 2%    |      30 | ▂▄▄▁█▄▂▄▂▅▂█    
 jdbc            |   46 | 2%    |      20 | ▁.▁▄▂▂▂▃▄▂▂█    
 redshift        |   43 | 1%    |      11 | █▄.▁▂█▅.▂▁▅▁    
 bigquery        |   42 | 1%    |      12 | ▁▃▂▃▅▃▂.▄█▃▃    
 postgresql      |   38 | 1%    |      18 | ▄▃▃▃▄▆█▃▃▄▇▆    
 faker           |   31 | 1%    |      10 | .▁.▁.▃.▂..▂█    
 hudi            |   25 | 1%    |      13 | ▃▃▄.█▆.▂▃▆▂.    
 clickhouse      |   19 | 1%    |       9 | ...▂▄▅▂▂▄▂▅█    
 sqlserver       |   19 | 1%    |      10 | █..▃▆█▆▆▃█.▆    
 elasticsearch   |   19 | 1%    |      10 | ▂▂.▅█▂▂.▂▄▄▄    
 ignite          |   18 | 1%    |      16 | ▃▃▃.▆██▃█▆▃.    
 mongodb         |   15 | 1%    |       8 | ..▆..▂.▄.▄█▆    
 cassandra       |   15 | 1%    |      11 | ▂..▂█▄▆▆▂...    
 kafka           |   13 | 0%    |       9 | .▂.▇..▄.▂..█    
 opensearch      |   13 | 0%    |       7 | .▂▂▂▂█..▂▂▂▄    
 druid           |   12 | 0%    |      10 | ▃.▆.█..▆▃.▆▃    
 pinot           |   12 | 0%    |       8 | .▄█▄█▄▄.▄▄.█    
 oracle          |   12 | 0%    |      10 | .▂▂.▄...█▂▄▂    
(25 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/81f91fb3ec9096a375111c79420b9e3884eb5401/sql/contributing/11-focus-areas.sql)

## Where does the code change?

Commits of people merged to the master branch in the last 12 full months, by the module they change, like core/trino-main or plugin/trino-iceberg. A commit changing several modules counts in each.
The chart has one character per month, oldest on the left, and each row has its own scale. If you change a module on top, others change it too: rebase often to find conflicts early.

<pre><code>
                Module                | Commits | Share | Authors | Per month chart 
--------------------------------------+---------+-------+---------+-----------------
 core/trino-main                      |    1326 | 34%   |      86 | ▃▃▂▃▃▃▃█▄▂▆▅    
 plugin/trino-iceberg                 |     598 | 15%   |      73 | ▄▄▆▇▆▅▇█▆▆██    
 (build, CI, other)                   |     511 | 13%   |      30 | ▂▂▂▃▄▃▃▃█▇▄▆    
 testing/trino-product-tests          |     414 | 11%   |      34 | ▁▁▁▁▁▁▂▁█▄▁▂    
 core/trino-spi                       |     413 | 11%   |      35 | ▄▃▁▂▃▂▃█▃▁▃▅    
 docs                                 |     311 | 8%    |      89 | ▃▃▃▂▄▃▃▄▅▂▄█    
 plugin/trino-hive                    |     273 | 7%    |      38 | ▅▆▂▃▅▅██▄▂▆▇    
 plugin/trino-delta-lake              |     248 | 6%    |      39 | ▃▄▂▃▄▄▆▇▄▂▅█    
 testing/trino-testing                |     159 | 4%    |      29 | ▆█▄█▄▄▇▆▅▄▄▆    
 lib/trino-parquet                    |     150 | 4%    |      19 | ▂▂▁▁▂▂▄▂█▁▂▅    
 testing/trino-tests                  |     139 | 4%    |      36 | ▅▆▄▄▇▄▄█▃▃▅█    
 lib/trino-plugin-toolkit             |     120 | 3%    |      26 | █▂▂▁█▆▇█▅▃▄▇    
 plugin/trino-base-jdbc               |     112 | 3%    |      19 | ▅▇▅▂█▅▆▆▂▂▃█    
 testing/trino-product-tests-launcher |     111 | 3%    |      15 | ▁▃▁▂▂▂▄▂█▃..    
 plugin/trino-bigquery                |      93 | 2%    |      15 | ▃▆▂▄█▄█▆▅█▃█    
 lib/trino-orc                        |      86 | 2%    |      14 | ▁▃▁▂▂▃▅▂█▂▁▄    
 testing/trino-testing-containers     |      84 | 2%    |      11 | ▁▁▁▂▄▁▄▄█▅▅█    
 client/trino-jdbc                    |      81 | 2%    |      11 | .▂▁█▃▄▇▃▄▁▁█    
 client/trino-client                  |      80 | 2%    |      13 | ▂▄▆▅▅▇█▅▅.▁▅    
 plugin/trino-postgresql              |      79 | 2%    |      15 | ▄▄▂▄▅▄██▄▂▄▅    
 plugin/trino-lakehouse               |      77 | 2%    |      23 | ▄▄▃▆▆▂▅█▃▄▄▇    
 core/trino-parser                    |      75 | 2%    |      15 | ▄▂▄▂▄▆██▆▂▂▇    
 lib/trino-hive-formats               |      74 | 2%    |      11 | ▁▃▁▃▃▃█▄█▂▂▄    
 plugin/trino-redshift                |      71 | 2%    |      13 | ▆▄▁▁▃▃█▃▂▁▄▂    
 lib/trino-filesystem                 |      67 | 2%    |      14 | █▄▃▂▄▄█▆▇.▄█    
(25 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/81f91fb3ec9096a375111c79420b9e3884eb5401/sql/contributing/12-code-changes.sql)

## How many pull requests do people open?

People who opened pull requests in the last 12 months, by how many they opened. Most open only one or two, while a few regular contributors open most of the pull requests. Got one merged is the share of these authors with at least one of them merged.
If you plan a bigger change, start with a small one to learn how the review works, and open an issue or ask in the #core-dev channel on the Trino Slack before the large one.

<pre><code>
 Pull requests per author | Authors | Of authors |    Authors chart     | Pull requests | Of pull requests | Pull requests chart  | Got one merged 
--------------------------+---------+------------+----------------------+---------------+------------------+----------------------+----------------
 1                        |     204 | 53%        | ████████████████████ |           204 | 7%               | ██                   | 28%            
 2                        |      65 | 17%        | ██████               |           130 | 4%               | ██                   | 45%            
 3 to 4                   |      47 | 12%        | █████                |           152 | 5%               | ██                   | 66%            
 5 to 9                   |      32 | 8%         | ███                  |           206 | 7%               | ██                   | 81%            
 10 to 19                 |      18 | 5%         | ██                   |           241 | 8%               | ███                  | 94%            
 20 to 49                 |      12 | 3%         | █                    |           341 | 11%              | ████                 | 92%            
 50 or more               |      10 | 3%         | █                    |          1705 | 57%              | ████████████████████ | 100%           
(7 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/81f91fb3ec9096a375111c79420b9e3884eb5401/sql/contributing/13-prs-per-author.sql)

## When are reviewers active?

Each cell is one hour of the week in UTC, two characters wide: the darker, the more reviews and comments people wrote on other people's pull requests in the last 12 months. The other columns are for pull requests opened on that day in the 12 months before the last 30 days. Drafts and pull requests without a signed CLA are not counted.
Most reviews happen on weekdays, so a pull request opened on a Friday or a weekend waits longer for a first response. If you can, open yours early in the week.

<pre><code>
    Day    | 00    03    06    09    12    15    18    21 UTC | PRs opened | Median time to first response | Responded within a day 
-----------+--------------------------------------------------+------------+-------------------------------+------------------------
 Monday    | ░░░░░░░░░░▒▒▓▓▓▓██▓▓▓▓▓▓▓▓▒▒▓▓▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒░░ |        368 | 2h 17m                        | 78%                    
 Tuesday   | ▒▒░░░░░░▒▒▒▒▒▒████████▓▓██▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒ |        380 | 2h 57m                        | 77%                    
 Wednesday | ░░░░░░▒▒▒▒▓▓▓▓▓▓████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▓▓▓▓▒▒▒▒▒▒ |        425 | 2h 18m                        | 77%                    
 Thursday  | ▒▒░░░░▒▒▒▒▒▒██▓▓▓▓▓▓▓▓▓▓▓▓▒▒▓▓▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒ |        416 | 3h 21m                        | 79%                    
 Friday    | ▒▒▒▒░░▒▒▓▓▓▓▓▓▒▒▓▓▓▓▓▓▓▓▒▒▓▓▒▒▓▓▒▒▒▒▒▒▒▒▒▒░░░░░░ |        387 | 2h 11m                        | 67%                    
 Saturday  | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ |        123 | 1d 5h                         | 42%                    
 Sunday    | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ |        115 | 18h 58m                       | 54%                    
(7 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/81f91fb3ec9096a375111c79420b9e3884eb5401/sql/contributing/14-when-reviewers-are-active.sql)

Generated on Fri Nov 13 14:09:40 UTC 2026

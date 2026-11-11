---
title: Trino Overview
---

## The project in numbers

Each number is for the last 30 days, with the change against the 30 days before, and a trend of the last 12 periods of 30 days, oldest on the left. The arrows show only the direction; the "Good news?" column says if the change is better or worse for the project. A change under 5% (2 points for a share) is steady.
Response numbers are for pull requests opened 7 to 37 days ago, so that each one had a week to get an answer; a response is the first review or comment from another person, or the merge. Bots are not counted. Open now counts what is open at the end of each period. A blank mark means there is no data yet.

<pre><code>
     Area      |               Measure               | Last 30 days |  Change   | Good news? | Last 12 x 30 days 
---------------+-------------------------------------+--------------+-----------+------------+-------------------
 Pull requests | Opened by people                    | 383          | ▲ +20%    | better     | ▅▄▄▅▆▅▅▇▅▆▇█      
               | Merged                              | 237          | ▼ -10%    | worse      | ▅▄▄▄▆▅▄▇▅▆██      
               | Median time to merge                | 22h 01m      | ▼ -12%    | better     | ▄█▃▃▃▅▅▅▄▅▆▅      
               | Median time to first response       | 13h 11m      | ▲ +4%     | steady     | ▃▇▆▃▃▅▆█▆▇▇▇      
               | No response within 7 days           | 23%          | ▲ +7 pts  | worse      | ▃▄▅▄▄▆▆█▇▆▅▆      
               | Open now                            | 299          | ▼ -1%     | steady     | ▄▅▅▅▅▆▇▇████      
 People        | Opened a pull request               | 82           | ▼ -7%     | worse      | ▄▅▄▆▇▆▇▇▇███      
               | Reviewed a pull request             | 33           | ▲ +3%     | steady     | ██▆▇█▆▇▇▆▇██      
               | Had their first pull request merged | 12           | ▼ -56%    | worse      | ▂▂▃▁▂▃▃▆▃▅█▄      
 Issues        | Opened                              | 72           | ▼ -3%     | steady     | ▆▅██▇▆▅▅▆███      
               | Open now                            | 2465         | = 0%      | steady     | ████████████      
 CI            | Merge queue success rate            | 68%          | ▲ +15 pts | better     |      ▅▆▇▇▄▇█      
               | Median duration of a passing PR run | 36m 38s      | ▼ -2%     | steady     | █████████▇▆▆      
(13 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/a459fa8518163ea5d81aa005b6848e40ddc90b9c/sql/overview/01-headline-numbers.sql)

Generated on Wed Nov 11 22:55:56 UTC 2026

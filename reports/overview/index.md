---
title: Trino Overview
---

## The project in numbers

Each number is for the last 30 days, with the change against the 30 days before, and a trend of the last 12 periods of 30 days, oldest on the left. The arrows show only the direction; the "Good news?" column says if the change is better or worse for the project. A change under 5% (2 points for a share) is steady.
Response numbers are for pull requests opened 7 to 37 days ago, so that each one had a week to get an answer; a response is the first review or comment from another person, or the merge. Bots are not counted. Open now counts what is open at the end of each period. A blank mark means there is no data yet.

<pre><code>
     Area      |               Measure               | Last 30 days |  Change   | Good news? | Last 12 x 30 days 
---------------+-------------------------------------+--------------+-----------+------------+-------------------
 Pull requests | Opened by people                    | 384          | ▲ +22%    | better     | ▅▄▄▅▆▅▅▇▅▆▇█      
               | Merged                              | 238          | ▼ -10%    | worse      | ▅▄▄▄▆▅▄▇▅▅██      
               | Median time to merge                | 21h 30m      | ▼ -15%    | better     | ▄█▃▃▄▅▅▅▄▆▆▅      
               | Median time to first response       | 9h 12m       | ▲ +24%    | worse      | ▂▆▅▂▃▃▄█▅▆▆▇      
               | No response within 7 days           | 21%          | ▲ +6 pts  | worse      | ▂▄▅▃▄▅▅█▆▆▄▆      
               | Open now                            | 299          | ▼ -1%     | steady     | ▄▅▅▅▅▅▇▇███▇      
 People        | Opened a pull request               | 81           | ▼ -8%     | worse      | ▄▅▄▆▇▆▇▇▇███      
               | Reviewed a pull request             | 35           | ▼ -13%    | worse      | ▇▇▆▇█▆▇▇▆▇█▇      
               | Had their first pull request merged | 11           | ▼ -61%    | worse      | ▂▂▂▁▂▃▂▆▂▄█▄      
 Issues        | Opened                              | 76           | ▲ +1%     | steady     | ▆▅██▇▆▅▅▆███      
               | Open now                            | 2469         | ▲ +1%     | steady     | ████████████      
 CI            | Merge queue success rate            | 68%          | ▲ +14 pts | better     |      ▅▆▇▇▄▇█      
               | Median duration of a passing PR run | 36m 37s      | ▼ -2%     | steady     | █████████▇▆▆      
(13 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/77ceec2ce89e36caed3ae1be149d46b480a74dd6/sql/overview/01-headline-numbers.sql)

Generated on Thu Nov 12 06:15:24 UTC 2026

---
title: Trino Overview
---

## What needs attention now

Work that waits on maintainers, reviewers, or anyone who can answer, and how much of it there is now. Follow the link to the list, and start from the top. Pull requests, issues, and questions of bots are not counted.

<table>
<thead>
<tr><th>What</th><th style="text-align: right">Now</th><th>Notes</th><th>Where</th></tr>
</thead>
<tbody>
<tr><td>First pull requests without any response</td><td style="text-align: right">28</td><td>oldest waits 156 days, 3 marked stale</td><td><a href="https://trinodb.github.io/reports/reports/maintaining/#first-pull-requests-without-any-response">First pull requests without any response</a></td></tr>
<tr><td>Approved pull requests, not merged</td><td style="text-align: right">37</td><td>26 approved by a maintainer, oldest approval 882 days ago</td><td><a href="https://trinodb.github.io/reports/reports/maintaining/#approved-not-merged">Approved, not merged</a></td></tr>
<tr><td>Pull requests waiting on reviewers</td><td style="text-align: right">111</td><td>77 wait over a week, 16 marked stale</td><td><a href="https://trinodb.github.io/reports/reports/maintaining/#waiting-on-reviewers-pick-from-the-top">Waiting on reviewers: pick from the top</a></td></tr>
<tr><td>Pull requests waiting on the author for over 4 weeks</td><td style="text-align: right">64</td><td>oldest waits 1133 days, 40 labeled stale-ignore</td><td><a href="https://trinodb.github.io/reports/reports/maintaining/#waiting-on-the-author-for-over-4-weeks">Waiting on the author for over 4 weeks</a></td></tr>
<tr><td>Issues of the last 90 days without an answer</td><td style="text-align: right">58</td><td>oldest waits 86 days</td><td><a href="https://trinodb.github.io/reports/reports/community/#issues-waiting-for-a-first-answer">Issues waiting for a first answer</a></td></tr>
<tr><td>Slack questions of the last 4 weeks without a reply</td><td style="text-align: right">1</td><td>of 5 questions, 0 in troubleshooting</td><td><a href="https://trinodb.github.io/reports/reports/community/#slack-questions-without-an-answer">Slack questions without an answer</a></td></tr>
<tr><td>Jobs failing in the merge queue and nightly runs in the last 14 days</td><td style="text-align: right">23</td><td>most often test (plugin/trino-bigquery), 24 times</td><td><a href="https://trinodb.github.io/reports/reports/ci-cd/#which-jobs-fail-in-the-merge-queue-and-nightly-runs">Which jobs fail in the merge queue and nightly runs</a></td></tr>
<tr><td>Pull requests in clients and tools, approved or without a response</td><td style="text-align: right">84</td><td>most in airlift, 37, oldest open 4174 days</td><td><a href="https://trinodb.github.io/reports/reports/repositories/#open-pull-requests">Open pull requests</a></td></tr>
<tr><td>Issues in clients and tools of the last 12 months without an answer</td><td style="text-align: right">39</td><td>most in trino-gateway, 19</td><td><a href="https://trinodb.github.io/reports/reports/repositories/#issues-without-an-answer">Issues without an answer</a></td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/ea619d9d611012db24767f7c234d42d594576c0f/sql/overview/01-needs-attention.sql)

## The project in numbers

Each number is for the last 30 days and for the last 12 months, with the change against the same time before, and a trend of the last 12 periods of 30 days, oldest on the left. The arrows show only the direction, and the word after them says if the change is better or worse for the project. A change under 5% (2 points for a share) is steady. Small numbers swing a lot in 30 days, so a change that the last 12 months don't show is likely noise; follow the link to see what is behind a number.
Response numbers are for pull requests opened at least 7 days before the end of the period, so that each one had a week to get an answer; a response is the first review or comment from another person, or the merge. Bots are not counted. Open now counts what is open at the end of each period. CI runs are kept for a year, and the merge queue started in May 2026, so CI numbers have no change over 12 months. A blank mark means there is no data yet.

<pre><code>
     Area      |               Measure               | Last 30 days |     Change      | Last 12 x 30 days | Last 12 months |     Change     |                       Details                       
---------------+-------------------------------------+--------------+-----------------+-------------------+----------------+----------------+-----------------------------------------------------
 Pull requests | Opened by people                    | 435          | ▲ +26% better   | ▄▃▄▅▄▅▅▆▆▆▇█      | 3097           | ▲ +51% better  | <a href="https://trinodb.github.io/reports/reports/contributing/#pull-requests-per-quarter">Pull requests per quarter</a>                           
               | Merged                              | 268          | ▲ +3% steady    | ▄▄▄▆▄▅▆▆▅▆██      | 2038           | ▲ +31% better  | <a href="https://trinodb.github.io/reports/reports/contributing/#pull-requests-per-quarter">Pull requests per quarter</a>                           
               | Median time to merge                | 1d 4h        | ▲ +30% worse    | ▄█▃▃▄▄▆▄▆▅▅▆      | 20h 34m        | ▲ +58% worse   | <a href="https://trinodb.github.io/reports/reports/contributing/#time-to-merge-per-quarter">Time to merge per quarter</a>                           
               | Median time to first response       | 14h 30m      | ▲ +240% worse   | ▂▅▂▂▃▂▅▄▄▇▃█      | 5h 55m         | ▲ +95% worse   | <a href="https://trinodb.github.io/reports/reports/maintaining/#how-fast-do-reviewers-respond">How fast do reviewers respond?</a>                      
               | No response within 7 days           | 24%          | ▲ +10 pts worse | ▂▅▄▄▅▅▆█▇▅▄▇      | 19%            | ▲ +6 pts worse | <a href="https://trinodb.github.io/reports/reports/maintaining/#waiting-on-reviewers-pick-from-the-top">Waiting on reviewers: pick from the top</a>             
               | Open now                            | 331          | ▼ -1% steady    | ▅▅▅▅▅▆▆▇████      | 331            | ▲ +92% worse   | <a href="https://trinodb.github.io/reports/reports/maintaining/#is-the-backlog-growing">Is the backlog growing?</a>                             
 People        | Opened a pull request               | 97           | ▲ +8% better    | ▅▄▅▆▆▆▆▆▇███      | 409            | ▲ +70% better  | <a href="https://trinodb.github.io/reports/reports/community/#is-the-community-growing">Is the community growing?</a>                           
               | Reviewed a pull request             | 36           | ▼ -12% worse    | ▇█▇▇▆▇▆▇▆▇██      | 107            | ▼ -4% steady   | <a href="https://trinodb.github.io/reports/reports/maintaining/#how-concentrated-is-reviewing">How concentrated is reviewing?</a>                      
               | Had their first pull request merged | 8            | ▼ -65% worse    | ▂▃▂▃▂▂▅▆▄▇█▃      | 122            | ▲ +69% better  | <a href="https://trinodb.github.io/reports/reports/contributing/#is-it-getting-better-for-newcomers">Is it getting better for newcomers?</a>                 
 Issues        | Opened                              | 86           | ▲ +15%          | ▄▅█▇▄▅▅▄▇█▇█      | 749            | ▼ -6%          | <a href="https://trinodb.github.io/reports/reports/community/#are-issues-handled-as-fast-as-they-come-in">Are issues handled as fast as they come in?</a>         
               | Open now                            | 2480         | ▲ +1% steady    | ████████████      | 2480           | ▲ +5% worse    | <a href="https://trinodb.github.io/reports/reports/community/#which-areas-get-the-most-issues">Which areas get the most issues?</a>                    
 CI            | Merge queue success rate            | 67%          | ▼ -2 pts worse  |      ▆▆█▄▅██      | 48%            |                | <a href="https://trinodb.github.io/reports/reports/ci-cd/#which-jobs-fail-in-the-merge-queue-and-nightly-runs">Which jobs fail in the merge queue and nightly runs</a> 
               | Median duration of a passing PR run | 35m 17s      | ▼ -6% better    | █████████▆▆▆      | 41m 05s        |                | <a href="https://trinodb.github.io/reports/reports/ci-cd/#how-long-a-ci-run-takes">How long a CI run takes</a>                             
(13 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/ea619d9d611012db24767f7c234d42d594576c0f/sql/overview/02-headline-numbers.sql)

## The last 30 days

What happened, and who made it happen. Say thanks, and welcome the people who just started. Bots are not counted. Companies come from GitHub profiles, public organization memberships, and commit emails, so people without one are not counted there.

<table>
<thead>
<tr><th>What</th><th>Details</th><th>More</th></tr>
</thead>
<tbody>
<tr><td>Releases</td><td>none</td><td><a href="https://trinodb.github.io/reports/reports/community/#how-often-does-trino-release">How often does Trino release?</a></td></tr>
<tr><td>First pull request merged: 8 people</td><td><a href="https://github.com/arturmkr">arturmkr</a> · <a href="https://github.com/wombatu-kun">wombatu-kun</a> · <a href="https://github.com/baptistegh">baptistegh</a> · <a href="https://github.com/sachinsharma3191">sachinsharma3191</a> · <a href="https://github.com/seokyoung-naver">seokyoung-naver</a> · <a href="https://github.com/arvindKandpal-ksolves">arvindKandpal-ksolves</a> · <a href="https://github.com/akmhmgc">akmhmgc</a> · <a href="https://github.com/leekyungryul">leekyungryul</a></td><td><a href="https://trinodb.github.io/reports/reports/hall-of-fame/#welcome">Welcome</a></td></tr>
<tr><td>Milestones of merged pull requests</td><td><a href="https://github.com/gertjanal">gertjanal</a> (50th), <a href="https://github.com/tbaeg">tbaeg</a> (25th), <a href="https://github.com/JohnFitzpatrick44">JohnFitzpatrick44</a> (25th), <a href="https://github.com/p3tr0sz">p3tr0sz</a> (25th), <a href="https://github.com/andrewdibiasio6">andrewdibiasio6</a> (10th)</td><td><a href="https://trinodb.github.io/reports/reports/hall-of-fame/#milestones">Milestones</a></td></tr>
<tr><td>Most pull requests merged, of 268</td><td><a href="https://github.com/wendigo">wendigo</a> (48), <a href="https://github.com/findepi">findepi</a> (43), <a href="https://github.com/chenjian2664">chenjian2664</a> (30), <a href="https://github.com/raunaqmorarka">raunaqmorarka</a> (21), <a href="https://github.com/electrum">electrum</a> (16)</td><td><a href="https://trinodb.github.io/reports/reports/hall-of-fame/#top-authors-of-the-last-12-months">Top authors of the last 12 months</a></td></tr>
<tr><td>Most pull requests reviewed, by 36 people</td><td><a href="https://github.com/raunaqmorarka">raunaqmorarka</a> (109), <a href="https://github.com/ebyhr">ebyhr</a> (95), <a href="https://github.com/findepi">findepi</a> (84), <a href="https://github.com/wendigo">wendigo</a> (79), <a href="https://github.com/chenjian2664">chenjian2664</a> (45)</td><td><a href="https://trinodb.github.io/reports/reports/hall-of-fame/#top-reviewers-of-the-last-12-months">Top reviewers of the last 12 months</a></td></tr>
<tr><td>Areas with the most merged pull requests</td><td>iceberg (38), docs (33), hive (27), delta-lake (24), bigquery (10)</td><td><a href="https://trinodb.github.io/reports/reports/contributing/#where-is-the-focus">Where is the focus?</a></td></tr>
<tr><td>Companies with the most merged pull requests, of 14</td><td>Starburst (142), IceGuard (20), Amazon (5), DataDog (5), Netflix (2)</td><td><a href="https://trinodb.github.io/reports/reports/community/#which-companies-contribute">Which companies contribute?</a></td></tr>
<tr><td>Pull requests merged in clients and tools: 353</td><td>regulator (225), trino-gateway (39), trino-go-client (33), airlift (27), grafana-trino (9), aircompressor (7), slice (4), classfile (3), provisio (2), vthreadtime (2), airbase (1), launcher (1)</td><td><a href="https://trinodb.github.io/reports/reports/repositories/#activity-per-repository">Activity per repository</a></td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/ea619d9d611012db24767f7c234d42d594576c0f/sql/overview/03-highlights.sql)

Generated on Fri Nov 27 06:15:12 UTC 2026

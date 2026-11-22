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
<tr><td>First pull requests without any response</td><td style="text-align: right">33</td><td>oldest waits 151 days, 3 marked stale</td><td><a href="https://trinodb.github.io/reports/reports/maintaining/#first-pull-requests-without-any-response">First pull requests without any response</a></td></tr>
<tr><td>Approved pull requests, not merged</td><td style="text-align: right">47</td><td>30 approved by a maintainer, oldest approval 949 days ago</td><td><a href="https://trinodb.github.io/reports/reports/maintaining/#approved-not-merged">Approved, not merged</a></td></tr>
<tr><td>Pull requests waiting on reviewers</td><td style="text-align: right">123</td><td>81 wait over a week, 22 marked stale</td><td><a href="https://trinodb.github.io/reports/reports/maintaining/#waiting-on-reviewers-pick-from-the-top">Waiting on reviewers: pick from the top</a></td></tr>
<tr><td>Pull requests waiting on the author for over 4 weeks</td><td style="text-align: right">62</td><td>oldest waits 1128 days, 43 labeled stale-ignore</td><td><a href="https://trinodb.github.io/reports/reports/maintaining/#waiting-on-the-author-for-over-4-weeks">Waiting on the author for over 4 weeks</a></td></tr>
<tr><td>Issues of the last 90 days without an answer</td><td style="text-align: right">50</td><td>oldest waits 89 days</td><td><a href="https://trinodb.github.io/reports/reports/community/#issues-waiting-for-a-first-answer">Issues waiting for a first answer</a></td></tr>
<tr><td>Slack questions of the last 4 weeks without a reply</td><td style="text-align: right">1</td><td>of 5 questions, 0 in troubleshooting</td><td><a href="https://trinodb.github.io/reports/reports/community/#slack-questions-without-an-answer">Slack questions without an answer</a></td></tr>
<tr><td>Jobs failing in the merge queue and nightly runs in the last 14 days</td><td style="text-align: right">27</td><td>most often test (plugin/trino-bigquery), 13 times</td><td><a href="https://trinodb.github.io/reports/reports/ci-cd/#which-jobs-fail-in-the-merge-queue-and-nightly-runs">Which jobs fail in the merge queue and nightly runs</a></td></tr>
<tr><td>Pull requests in clients and tools, approved or without a response</td><td style="text-align: right">99</td><td>most in airlift, 43, oldest open 4363 days</td><td><a href="https://trinodb.github.io/reports/reports/repositories/#open-pull-requests">Open pull requests</a></td></tr>
<tr><td>Issues in clients and tools of the last 12 months without an answer</td><td style="text-align: right">34</td><td>most in trino-gateway, 16</td><td><a href="https://trinodb.github.io/reports/reports/repositories/#issues-without-an-answer">Issues without an answer</a></td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/6b0f3f1f89db4398ed564c0e89e48381c42e7512/sql/overview/01-needs-attention.sql)

## The project in numbers

Each number is for the last 30 days and for the last 12 months, with the change against the same time before, and a trend of the last 12 periods of 30 days, oldest on the left. The arrows show only the direction, and the word after them says if the change is better or worse for the project. A change under 5% (2 points for a share) is steady. Small numbers swing a lot in 30 days, so a change that the last 12 months don't show is likely noise; follow the link to see what is behind a number.
Response numbers are for pull requests opened at least 7 days before the end of the period, so that each one had a week to get an answer; a response is the first review or comment from another person, or the merge. Bots are not counted. Open now counts what is open at the end of each period. CI runs are kept for a year, and the merge queue started in May 2026, so CI numbers have no change over 12 months. A blank mark means there is no data yet.

<pre><code>
     Area      |               Measure               | Last 30 days |     Change     | Last 12 x 30 days | Last 12 months |     Change     |                       Details                       
---------------+-------------------------------------+--------------+----------------+-------------------+----------------+----------------+-----------------------------------------------------
 Pull requests | Opened by people                    | 430          | ▲ +39% better  | ▄▃▄▅▄▅▅▆▅▆▆█      | 3046           | ▲ +49% better  | <a href="https://trinodb.github.io/reports/reports/contributing/#pull-requests-per-quarter">Pull requests per quarter</a>                           
               | Merged                              | 261          | ▲ +6% better   | ▅▃▅▅▄▅▆▆▄▆██      | 2010           | ▲ +30% better  | <a href="https://trinodb.github.io/reports/reports/contributing/#pull-requests-per-quarter">Pull requests per quarter</a>                           
               | Median time to merge                | 1d 1h        | ▲ +26% worse   | ▃█▂▂▃▄▅▃▄▄▃▄      | 20h 27m        | ▲ +60% worse   | <a href="https://trinodb.github.io/reports/reports/contributing/#time-to-merge-per-quarter">Time to merge per quarter</a>                           
               | Median time to first response       | 12h 15m      | ▲ +170% worse  | ▂▇▃▃▃▂▆▅▇▇▃█      | 5h 53m         | ▲ +97% worse   | <a href="https://trinodb.github.io/reports/reports/maintaining/#how-fast-do-reviewers-respond">How fast do reviewers respond?</a>                      
               | No response within 7 days           | 23%          | ▲ +8 pts worse | ▂▅▄▄▄▅▇█▇▆▄▇      | 18%            | ▲ +6 pts worse | <a href="https://trinodb.github.io/reports/reports/maintaining/#waiting-on-reviewers-pick-from-the-top">Waiting on reviewers: pick from the top</a>             
               | Open now                            | 336          | ▲ +7% worse    | ▅▅▅▆▆▆▆▇████      | 336            | ▲ +96% worse   | <a href="https://trinodb.github.io/reports/reports/maintaining/#is-the-backlog-growing">Is the backlog growing?</a>                             
 People        | Opened a pull request               | 84           | ▼ -5% worse    | ▄▄▅▆▆▆▆▆▇███      | 396            | ▲ +63% better  | <a href="https://trinodb.github.io/reports/reports/community/#is-the-community-growing">Is the community growing?</a>                           
               | Reviewed a pull request             | 34           | ▼ -13% worse   | ▇█▇▇▇▇▇▇▆██▇      | 105            | ▼ -6% worse    | <a href="https://trinodb.github.io/reports/reports/maintaining/#how-concentrated-is-reviewing">How concentrated is reviewing?</a>                      
               | Had their first pull request merged | 6            | ▼ -78% worse   | ▂▂▂▃▁▃▄▅▃▆█▂      | 119            | ▲ +63% better  | <a href="https://trinodb.github.io/reports/reports/contributing/#is-it-getting-better-for-newcomers">Is it getting better for newcomers?</a>                 
 Issues        | Opened                              | 77           | ▲ +26%         | ▄▄█▆▄▅▄▃▆▇▅▇      | 729            | ▼ -8%          | <a href="https://trinodb.github.io/reports/reports/community/#are-issues-handled-as-fast-as-they-come-in">Are issues handled as fast as they come in?</a>         
               | Open now                            | 2470         | = 0% steady    | ████████████      | 2470           | ▲ +5% worse    | <a href="https://trinodb.github.io/reports/reports/community/#which-areas-get-the-most-issues">Which areas get the most issues?</a>                    
 CI            | Merge queue success rate            | 68%          | ▼ -2 pts worse |      ▆▅▇▄▅██      | 48%            |                | <a href="https://trinodb.github.io/reports/reports/ci-cd/#which-jobs-fail-in-the-merge-queue-and-nightly-runs">Which jobs fail in the merge queue and nightly runs</a> 
               | Median duration of a passing PR run | 36m 00s      | ▼ -4% steady   | █████████▆▆▆      | 41m 32s        |                | <a href="https://trinodb.github.io/reports/reports/ci-cd/#how-long-a-ci-run-takes">How long a CI run takes</a>                             
(13 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/6b0f3f1f89db4398ed564c0e89e48381c42e7512/sql/overview/02-headline-numbers.sql)

## The last 30 days

What happened, and who made it happen. Say thanks, and welcome the people who just started. Bots are not counted. Companies come from GitHub profiles, public organization memberships, and commit emails, so people without one are not counted there.

<table>
<thead>
<tr><th>What</th><th>Details</th><th>More</th></tr>
</thead>
<tbody>
<tr><td>Releases</td><td>none</td><td><a href="https://trinodb.github.io/reports/reports/community/#how-often-does-trino-release">How often does Trino release?</a></td></tr>
<tr><td>First pull request merged: 6 people</td><td><a href="https://github.com/i-yuki23">i-yuki23</a> · <a href="https://github.com/arturmkr">arturmkr</a> · <a href="https://github.com/wombatu-kun">wombatu-kun</a> · <a href="https://github.com/baptistegh">baptistegh</a> · <a href="https://github.com/sachinsharma3191">sachinsharma3191</a> · <a href="https://github.com/seokyoung-naver">seokyoung-naver</a></td><td><a href="https://trinodb.github.io/reports/reports/hall-of-fame/#welcome">Welcome</a></td></tr>
<tr><td>Milestones of merged pull requests</td><td><a href="https://github.com/jiwen624">jiwen624</a> (25th), <a href="https://github.com/tbaeg">tbaeg</a> (25th), <a href="https://github.com/JohnFitzpatrick44">JohnFitzpatrick44</a> (25th), <a href="https://github.com/andrewdibiasio6">andrewdibiasio6</a> (10th)</td><td><a href="https://trinodb.github.io/reports/reports/hall-of-fame/#milestones">Milestones</a></td></tr>
<tr><td>Most pull requests merged, of 261</td><td><a href="https://github.com/findepi">findepi</a> (50), <a href="https://github.com/wendigo">wendigo</a> (45), <a href="https://github.com/chenjian2664">chenjian2664</a> (30), <a href="https://github.com/raunaqmorarka">raunaqmorarka</a> (22), <a href="https://github.com/ebyhr">ebyhr</a> (11)</td><td><a href="https://trinodb.github.io/reports/reports/hall-of-fame/#top-authors-of-the-last-12-months">Top authors of the last 12 months</a></td></tr>
<tr><td>Most pull requests reviewed, by 34 people</td><td><a href="https://github.com/raunaqmorarka">raunaqmorarka</a> (103), <a href="https://github.com/ebyhr">ebyhr</a> (97), <a href="https://github.com/wendigo">wendigo</a> (80), <a href="https://github.com/findepi">findepi</a> (66), <a href="https://github.com/chenjian2664">chenjian2664</a> (38)</td><td><a href="https://trinodb.github.io/reports/reports/hall-of-fame/#top-reviewers-of-the-last-12-months">Top reviewers of the last 12 months</a></td></tr>
<tr><td>Areas with the most merged pull requests</td><td>iceberg (38), docs (34), hive (32), delta-lake (22), jdbc (10)</td><td><a href="https://trinodb.github.io/reports/reports/contributing/#where-is-the-focus">Where is the focus?</a></td></tr>
<tr><td>Companies with the most merged pull requests, of 12</td><td>Starburst (148), IceGuard (14), DataDog (6), Amazon (4), Naver (2)</td><td><a href="https://trinodb.github.io/reports/reports/community/#which-companies-contribute">Which companies contribute?</a></td></tr>
<tr><td>Pull requests merged in clients and tools: 375</td><td>regulator (262), trino-go-client (33), trino-gateway (28), airlift (24), aircompressor (9), vthreadtime (6), grafana-trino (4), slice (4), classfile (3), zest (2)</td><td><a href="https://trinodb.github.io/reports/reports/repositories/#activity-per-repository">Activity per repository</a></td></tr>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/6b0f3f1f89db4398ed564c0e89e48381c42e7512/sql/overview/03-highlights.sql)

Generated on Sun Nov 22 06:13:55 UTC 2026

---
title: Contributing to Trino
---

## What to expect when you open a pull request

Pull requests opened by people in the 6 full months before this one, by how many pull requests their author had merged before. If this is your first pull request, read the first row: it is what happened to others like you. Drafts are not counted.
A response is the first review or comment from another person, or the merge. No response means the pull request was closed, or is still open, without one. The time to merge counts only merged pull requests. Many first pull requests are never merged because the CLA is not signed: see the next report.

| Author experience | Pull requests | Merged | Closed without merging | Still open | No response | Median time to first response | Median time to merge | 90% merged within |
| ----------------- | -------------:| ------ | ---------------------- | ---------- | ----------- | ----------------------------- | -------------------- | ----------------- |
| no merged PRs yet |           345 | 28%    | 53%                    | 20%        | 37%         | 18h 01m                       | 12d 13h              | 49d 9h            |
| 1-9 merged PRs    |           163 | 55%    | 27%                    | 18%        | 17%         | 12h 07m                       | 2d 3h                | 27d 23h           |
| 10-99 merged PRs  |           178 | 74%    | 12%                    | 14%        | 7%          | 9h 33m                        | 2d 10h               | 23d 21h           |
| 100\+ merged PRs  |           928 | 86%    | 10%                    | 4%         | 7%          | 5h 37m                        | 13h 24m              | 7d 1h             |

[query](https://github.com/trinodb/reports/blob/b6e552c63e62df4353d3d2cfcc2e5a3f98c6fc4f/sql/contributing/01-what-to-expect.sql)

## Sign the CLA first

Pull requests opened in the last 12 months by people with no merged pull request yet, by whether the cla-signed label was added. It is added once every author of the commits signed the [Contributor License Agreement](https://github.com/trinodb/cla).
Pull requests without a signed CLA are never merged, and most get no response from a person. Sign it before you ask for a review. Drafts are not counted.

| CLA        | Pull requests | Merged | Closed without merging | Still open | No response |
| ---------- | -------------:| ------ | ---------------------- | ---------- | ----------- |
| signed     |           287 | 46%    | 39%                    | 15%        | 19%         |
| not signed |           215 | 0%     | 78%                    | 22%        | 56%         |

[query](https://github.com/trinodb/reports/blob/b6e552c63e62df4353d3d2cfcc2e5a3f98c6fc4f/sql/contributing/02-sign-the-cla.sql)

## Is it getting better for newcomers?

Pull requests opened by people with no merged pull request yet, per quarter, newest first. The columns after "CLA signed" count only pull requests with a signed CLA, because the others are never merged. Closed as stale means closed by the stale bot. Drafts are not counted.
The last two quarters are not final: many of their pull requests are still open, so fewer are merged yet, and the medians count only the ones answered or merged so far. Compare a quarter with the same quarter a year before.

| Quarter            | Pull requests | CLA signed | Merged | Still open | Closed as stale | No response | Median time to first response | Median time to merge |
| ------------------ | -------------:| ---------- | ------ | ---------- | --------------- | ----------- | ----------------------------- | -------------------- |
| 2026-Q4 \(so far\) |            77 | 31%        | 50%    | 46%        | 0%              | 25%         | 4h 31m                        | 4d 19h               |
| 2026-Q3            |           191 | 55%        | 52%    | 25%        | 20%             | 15%         | 22h 05m                       | 10d 10h              |
| 2026-Q2            |           129 | 67%        | 43%    | 3%         | 40%             | 25%         | 1d 23h                        | 23d 17h              |
| 2026-Q1            |            81 | 65%        | 36%    | 6%         | 42%             | 15%         | 1d 0h                         | 18d 9h               |
| 2025-Q4            |            43 | 72%        | 42%    | 0%         | 42%             | 6%          | 14h 10m                       | 30d 23h              |
| 2025-Q3            |            81 | 74%        | 50%    | 2%         | 33%             | 12%         | 16h 45m                       | 23d 7h               |
| 2025-Q2            |            66 | 62%        | 49%    | 0%         | 27%             | 12%         | 8h 35m                        | 7d 4h                |
| 2025-Q1            |            42 | 67%        | 57%    | 0%         | 36%             | 4%          | 15h 31m                       | 28d 5h               |

[query](https://github.com/trinodb/reports/blob/b6e552c63e62df4353d3d2cfcc2e5a3f98c6fc4f/sql/contributing/03-newcomers-trend.sql)

## How long until a response, and until the merge?

The share of pull requests that got their first response from another person, or were merged, within the time in the first column. For pull requests opened by people in the 12 months before the last 30 days, so each one had at least a month. Drafts and pull requests without a signed CLA are not counted.
Read a row like this: within 1 day, this share of first pull requests got a response. The last row is the share that ever got one. If yours waits longer than most, ask for a review in the #core-dev channel on the Trino Slack.

| Time since opened | Responded: first PRs | Responded: others | Merged: first PRs | Merged: others |
| ----------------- | -------------------- | ----------------- | ----------------- | -------------- |
| within 1 hour     | 9%                   | 18%               | 0%                | 3%             |
| within 4 hours    | 19%                  | 42%               | 1%                | 21%            |
| within 1 day      | 41%                  | 72%               | 6%                | 48%            |
| within 2 days     | 48%                  | 78%               | 9%                | 56%            |
| within 1 week     | 59%                  | 88%               | 15%               | 69%            |
| within 2 weeks    | 67%                  | 90%               | 23%               | 74%            |
| within 30 days    | 74%                  | 92%               | 33%               | 77%            |
| within 90 days    | 79%                  | 93%               | 43%               | 81%            |
| ever, so far      | 82%                  | 94%               | 46%               | 82%            |

[query](https://github.com/trinodb/reports/blob/b6e552c63e62df4353d3d2cfcc2e5a3f98c6fc4f/sql/contributing/04-how-long-it-takes.sql)

## Time to merge per month

Pull requests of people merged in each of the last 24 months, newest first, and how long they were open. The median is the typical wait; 90% of pull requests were merged within the time in the next column, so only 1 in 10 waited longer.
First pull requests are those of authors with no merged pull request before. They usually wait much longer, so the last two columns show them on their own.

| Month              | Merged | Median time to merge | 90% merged within | Merged first PRs | Median for first PRs |
| ------------------ | ------:| -------------------- | ----------------- | ----------------:| -------------------- |
| 2026-11 \(so far\) |     81 | 2d 3h                | 11d 10h           |                2 | 217d 3h              |
| 2026-10            |    265 | 19h 45m              | 29d 18h           |               30 | 20d 19h              |
| 2026-09            |    218 | 23h 22m              | 22d 19h           |               21 | 10d 0h               |
| 2026-08            |    144 | 1d 1h                | 17d 17h           |               14 | 12d 14h              |
| 2026-07            |    167 | 18h 46m              | 34d 5h            |               17 | 17d 13h              |
| 2026-06            |    193 | 1d 0h                | 23d 6h            |               16 | 12d 16h              |
| 2026-05            |    145 | 19h 48m              | 14d 7h            |                3 | 42d 23h              |
| 2026-04            |    116 | 17h 27m              | 18d 16h           |                7 | 25d 20h              |
| 2026-03            |    170 | 10h 29m              | 27d 5h            |                8 | 21d 17h              |
| 2026-02            |    133 | 11h 51m              | 11d 21h           |                4 | 33d 3h               |
| 2026-01            |    104 | 1d 16h               | 38d 6h            |                9 | 18d 9h               |
| 2025-12            |    120 | 19h 11m              | 12d 12h           |                3 | 2d 18h               |
| 2025-11            |    137 | 22h 27m              | 22d 0h            |                8 | 53d 14h              |
| 2025-10            |    150 | 10h 46m              | 21d 15h           |                5 | 43d 10h              |
| 2025-09            |    131 | 6h 39m               | 30d 20h           |               10 | 18d 9h               |
| 2025-08            |     89 | 15h 04m              | 25d 1h            |                9 | 8d 9h                |
| 2025-07            |    104 | 6h 19m               | 26d 16h           |                4 | 13d 4h               |
| 2025-06            |    112 | 11h 54m              | 13d 19h           |                4 | 28d 5h               |
| 2025-05            |     84 | 18h 25m              | 72d 10h           |                7 | 12d 22h              |
| 2025-04            |    115 | 7h 26m               | 20d 20h           |               11 | 5d 19h               |
| 2025-03            |    148 | 15h 15m              | 30d 5h            |                5 | 28d 9h               |
| 2025-02            |    175 | 9h 20m               | 9d 0h             |                4 | 8d 22h               |
| 2025-01            |    166 | 23h 00m              | 53d 0h            |               17 | 28d 21h              |
| 2024-12            |    141 | 17h 38m              | 26d 5h            |                5 | 15d 9h               |

[query](https://github.com/trinodb/reports/blob/b6e552c63e62df4353d3d2cfcc2e5a3f98c6fc4f/sql/contributing/05-time-to-merge-per-month.sql)

## Do smaller pull requests merge faster?

Pull requests opened by people in the 12 months before the last 30 days, by size and by whether the author had a merged pull request before. Size is added plus deleted lines: XS under 10, S under 100, M under 500, L under 1000, XL 1000 or more. Drafts and pull requests without a signed CLA are not counted.
Larger changes wait longer for the merge and are merged less often, most clearly for first pull requests of 100 changed lines or more (M and larger). If you are new, start with a small change, and split a large one into pull requests that can be reviewed one by one.

| Author                  | Size | Pull requests | Merged | Median time to first response | Median time to merge | 90% merged within |
| ----------------------- | ---- | -------------:| ------ | ----------------------------- | -------------------- | ----------------- |
| first PRs               | XS   |            19 | 58%    | 16h 46m                       | 2d 5h                | 25d 20h           |
| first PRs               | S    |           100 | 68%    | 13h 21m                       | 12d 14h              | 43d 23h           |
| first PRs               | M    |            90 | 38%    | 1d 16h                        | 27d 12h              | 108d 15h          |
| first PRs               | L    |            28 | 32%    | 17h 53m                       | 28d 16h              | 169d 10h          |
| first PRs               | XL   |            35 | 11%    | 5d 10h                        | 103d 7h              | 124d 20h          |
| authors with merged PRs | XS   |           394 | 90%    | 3h 09m                        | 5h 10m               | 2d 11h            |
| authors with merged PRs | S    |           697 | 88%    | 4h 28m                        | 14h 22m              | 7d 15h            |
| authors with merged PRs | M    |           529 | 78%    | 7h 42m                        | 1d 3h                | 18d 12h           |
| authors with merged PRs | L    |           143 | 66%    | 11h 56m                       | 1d 22h               | 28d 5h            |
| authors with merged PRs | XL   |           173 | 61%    | 18h 26m                       | 6d 1h                | 75d 14h           |

[query](https://github.com/trinodb/reports/blob/b6e552c63e62df4353d3d2cfcc2e5a3f98c6fc4f/sql/contributing/06-size.sql)

## What happens to pull requests that are not merged?

Pull requests opened by people in the 12 months before the last 30 days that were not merged, by the experience of their author. █ Stale: closed by the stale bot, which marks a pull request after 21 days without activity, and closes it 21 days later. ▒ Closed by its author or a maintainer. ░ Still open. Drafts are not counted.
No CLA and No response count the not merged pull requests without a signed CLA, and without any review or comment from another person. To keep yours from going stale, reply to reviews, push fixes, and ask for help in the #core-dev channel on the Trino Slack.

<pre><code>
 Author experience | Not merged | Of all PRs | █ stale, ▒ closed, ░ open chart | Stale | Closed | Open | No CLA | No response 
-------------------+------------+------------+---------------------------------+-------+--------+------+--------+-------------
 no merged PRs yet |        312 | 71%        | ██████████████▒▒▒▒▒▒▒▒▒▒▒▒░░░░  | 45%   | 42%    | 13%  | 53%    | 44%         
 1-9 merged PRs    |         97 | 41%        | ██████████████▒▒▒▒▒▒▒▒▒░░░░░░░  | 46%   | 30%    | 24%  | 2%     | 28%         
 10-99 merged PRs  |         51 | 20%        | ████████████▒▒▒▒▒▒▒▒▒▒░░░░░░░░  | 41%   | 31%    | 27%  | 0%     | 25%         
 100+ merged PRs   |        212 | 15%        | ████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░  | 14%   | 69%    | 17%  | 1%     | 41%         
(4 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/b6e552c63e62df4353d3d2cfcc2e5a3f98c6fc4f/sql/contributing/07-not-merged.sql)

## How fast do authors answer reviews?

After a review or comment from another person, how long until the author answered with a comment, a review, or a new commit, in the last 12 months. The cumulative columns are the share of answers given within that time, on first pull requests and on the pull requests of everyone else.
This is the pace reviewers are used to: most authors answer within a day. An answer within a day or two keeps the review fresh for your reviewer, and after 21 days without activity the stale bot marks the pull request. Reviews never answered, like an approval followed by the merge, are not counted.

| Author answered    | First PRs | First PRs, cumulative | Others | Others, cumulative |
| ------------------ | ---------:| --------------------- | ------:| ------------------ |
| within 1 hour      |       147 | 19%                   |    896 | 32%                |
| 1 to 4 hours       |       124 | 36%                   |    514 | 50%                |
| 4 hours to 1 day   |       230 | 66%                   |    792 | 78%                |
| 1 to 2 days        |        70 | 75%                   |    174 | 84%                |
| 2 days to 1 week   |        89 | 87%                   |    273 | 94%                |
| 1 to 2 weeks       |        51 | 94%                   |     72 | 97%                |
| 2 weeks to 30 days |        28 | 97%                   |     53 | 98%                |
| over 30 days       |        21 | 100%                  |     44 | 100%               |

[query](https://github.com/trinodb/reports/blob/b6e552c63e62df4353d3d2cfcc2e5a3f98c6fc4f/sql/contributing/08-author-response.sql)

## Where is review help needed?

Areas by the labels that a workflow adds from the changed paths, like a connector, docs, or ui. Changes only to the engine, the build, or CI get no label, and changes to more than 3 areas at once, like to all connectors, are counted as many areas. Open counts the open pull requests now, and those without any review or comment from another person yet. The other columns are for pull requests opened in the 12 months before the last 30 days. Drafts, bots and pull requests without a signed CLA are not counted.
Reviewers: the areas on top have the most pull requests that nobody answered yet. Contributors: compare the median times to see where to expect a longer wait, and ask for a review in the #core-dev channel on the Trino Slack if yours waits longer.

| Area              | Open | Open without response | Opened in 12 months | Merged | No response | Median time to first response | Median time to merge |
| ----------------- | ----:| ---------------------:| -------------------:| ------ | ----------- | ----------------------------- | -------------------- |
| \(no area label\) |   76 |                    20 |                 991 | 82%    | 7%          | 4h 47m                        | 11h 55m              |
| docs              |   77 |                    14 |                 349 | 60%    | 11%         | 17h 36m                       | 4d 7h                |
| iceberg           |   47 |                     8 |                 384 | 79%    | 6%          | 7h 47m                        | 1d 1h                |
| lakehouse         |    8 |                     3 |                  41 | 66%    | 5%          | 19h 28m                       | 7d 0h                |
| hive              |   21 |                     3 |                 143 | 71%    | 10%         | 7h 24m                        | 1d 4h                |
| \(many areas\)    |    8 |                     2 |                 130 | 67%    | 9%          | 14h 15m                       | 1d 21h               |
| hudi              |    4 |                     1 |                  12 | 50%    | 17%         | 11h 13m                       | 3d 19h               |
| delta-lake        |    8 |                     1 |                 109 | 86%    | 4%          | 8h 35m                        | 2d 1h                |
| ui                |    4 |                     1 |                  63 | 79%    | 8%          | 8h 22m                        | 22h 55m              |
| pinot             |    2 |                     1 |                  10 | 60%    | 10%         | 5h 35m                        | 2d 18h               |
| elasticsearch     |    0 |                     0 |                  10 | 70%    | 0%          | 1d 1h                         | 1d 19h               |
| clickhouse        |    3 |                     0 |                  13 | 69%    | 0%          | 16h 46m                       | 20h 45m              |
| sqlserver         |    1 |                     0 |                  12 | 100%   | 0%          | 13h 07m                       | 23h 29m              |
| postgresql        |    1 |                     0 |                  30 | 83%    | 7%          | 12h 38m                       | 1d 10h               |
| cassandra         |    0 |                     0 |                  12 | 83%    | 0%          | 12h 04m                       | 1d 1h                |
| bigquery          |    0 |                     0 |                  35 | 91%    | 3%          | 6h 33m                        | 13h 28m              |
| ignite            |    0 |                     0 |                  11 | 64%    | 36%         | 5h 44m                        | 5d 0h                |
| jdbc              |    6 |                     0 |                  26 | 85%    | 8%          | 4h 22m                        | 1d 7h                |
| mongodb           |    1 |                     0 |                  11 | 91%    | 0%          | 3h 27m                        | 9h 38m               |
| redshift          |    2 |                     0 |                  33 | 73%    | 12%         | 3h 12m                        | 18h 08m              |
| faker             |    4 |                     0 |                  15 | 73%    | 0%          | 3h 08m                        | 2d 13h               |
| opensearch        |    0 |                     0 |                  11 | 64%    | 18%         | 2h 13m                        | 3h 47m               |

[query](https://github.com/trinodb/reports/blob/b6e552c63e62df4353d3d2cfcc2e5a3f98c6fc4f/sql/contributing/09-review-help-needed.sql)

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
 elasticsearch   |   19 | 1%    |      10 | ▂▂.▅█▂▂.▂▄▄▄    
 sqlserver       |   19 | 1%    |      10 | █..▃▆█▆▆▃█.▆    
 clickhouse      |   19 | 1%    |       9 | ...▂▄▅▂▂▄▂▅█    
 ignite          |   18 | 1%    |      16 | ▃▃▃.▆██▃█▆▃.    
 mongodb         |   15 | 1%    |       8 | ..▆..▂.▄.▄█▆    
 cassandra       |   15 | 1%    |      11 | ▂..▂█▄▆▆▂...    
 kafka           |   13 | 0%    |       9 | .▂.▇..▄.▂..█    
 opensearch      |   13 | 0%    |       7 | .▂▂▂▂█..▂▂▂▄    
 pinot           |   12 | 0%    |       8 | .▄█▄█▄▄.▄▄.█    
 oracle          |   12 | 0%    |      10 | .▂▂.▄...█▂▄▂    
 druid           |   12 | 0%    |      10 | ▃.▆.█..▆▃.▆▃    
(25 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/b6e552c63e62df4353d3d2cfcc2e5a3f98c6fc4f/sql/contributing/10-focus-areas.sql)

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
[query](https://github.com/trinodb/reports/blob/b6e552c63e62df4353d3d2cfcc2e5a3f98c6fc4f/sql/contributing/11-code-changes.sql)

## How many pull requests do people open?

People who opened pull requests in the last 12 months, by how many they opened. Most open only one or two, while a few regular contributors open most of the pull requests. Got one merged is the share of these authors with at least one of them merged.
If you plan a bigger change, start with a small one to learn how the review works, and open an issue or ask in the #core-dev channel on the Trino Slack before the large one.

<pre><code>
 Pull requests per author | Authors | Of authors |    Authors chart     | Pull requests | Of pull requests | Pull requests chart  | Got one merged 
--------------------------+---------+------------+----------------------+---------------+------------------+----------------------+----------------
 1                        |     205 | 53%        | ████████████████████ |           205 | 7%               | ██                   | 28%            
 2                        |      65 | 17%        | ██████               |           130 | 4%               | ██                   | 45%            
 3 to 4                   |      45 | 12%        | ████                 |           146 | 5%               | ██                   | 67%            
 5 to 9                   |      32 | 8%         | ███                  |           206 | 7%               | ██                   | 81%            
 10 to 19                 |      17 | 4%         | ██                   |           223 | 8%               | ███                  | 94%            
 20 to 49                 |      13 | 3%         | █                    |           358 | 12%              | ████                 | 92%            
 50 or more               |      10 | 3%         | █                    |          1699 | 57%              | ████████████████████ | 100%           
(7 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/b6e552c63e62df4353d3d2cfcc2e5a3f98c6fc4f/sql/contributing/12-prs-per-author.sql)

## When are reviewers active?

Each cell is one hour of the week in UTC, two characters wide: the darker, the more reviews and comments people wrote on other people's pull requests in the last 12 months. The other columns are for pull requests opened on that day in the 12 months before the last 30 days. Drafts and pull requests without a signed CLA are not counted.
Most reviews happen on weekdays, so a pull request opened on a Friday or a weekend waits longer for a first response. If you can, open yours early in the week.

<pre><code>
    Day    | 00    03    06    09    12    15    18    21 UTC | PRs opened | Median time to first response | Responded within a day 
-----------+--------------------------------------------------+------------+-------------------------------+------------------------
 Monday    | ░░░░░░░░░░▒▒▓▓▓▓▓▓▓▓▓▓▒▒▓▓▒▒▓▓▒▒▓▓▒▒▒▒▒▒▓▓▒▒▒▒░░ |        356 | 4h 16m                        | 74%                    
 Tuesday   | ░░░░░░░░▒▒▒▒▒▒▓▓██████▓▓██▓▓▓▓▓▓▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒ |        380 | 5h 14m                        | 73%                    
 Wednesday | ░░░░░░░░░░▒▒▒▒▓▓████▓▓▓▓██▓▓▓▓▓▓▓▓▒▒▒▒▓▓▓▓▒▒▒▒▒▒ |        432 | 4h 50m                        | 73%                    
 Thursday  | ▒▒░░░░▒▒▒▒▒▒▒▒▓▓▓▓██▓▓▓▓▓▓▒▒▓▓▒▒▓▓▒▒▒▒▒▒▒▒▒▒░░░░ |        416 | 5h 26m                        | 76%                    
 Friday    | ▒▒░░░░░░▓▓▒▒▒▒▒▒▓▓██▓▓▒▒▓▓▓▓▒▒▓▓▒▒▒▒▒▒▒▒▒▒░░░░░░ |        386 | 5h 28m                        | 58%                    
 Saturday  | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ |        123 | 1d 8h                         | 38%                    
 Sunday    | ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ |        115 | 23h 06m                       | 48%                    
(7 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/b6e552c63e62df4353d3d2cfcc2e5a3f98c6fc4f/sql/contributing/13-when-reviewers-are-active.sql)

Generated on Wed Nov 11 23:25:52 UTC 2026

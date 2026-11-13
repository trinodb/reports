---
title: Airlift
---

## Activity per repository

Pull requests and issues of people in the libraries of airlift, which Trino is built on, in the last 12 months, what is open now, and the median time until another person commented or reviewed a pull request. Pull requests of bots, like dependency updates, are counted on their own.
A repository with many open pull requests or issues, or a slow first response, needs more maintainers; ask for help in #dev on the Trino Slack.

<pre><code>
 Repository | People | PRs | Merged | First response | Open PRs | Issues | Open issues | Bot PRs / open | PRs per month, 24 months chart 
------------+--------+-----+--------+----------------+----------+--------+-------------+----------------+--------------------------------
(0 rows)
</code></pre>
[query](https://github.com/trinodb/reports/blob/81f91fb3ec9096a375111c79420b9e3884eb5401/sql/airlift/01-activity.sql)

## Open pull requests

Pull requests of people that aren't drafts, at most 8 per repository: approved ones first, because they only need a merge, then the ones without any response, oldest first, and then the ones that waited the longest since another person last commented or reviewed. Without commits, it doesn't show whether the author pushed changes since then.
Merge or close approved pull requests, answer the ones without a response, and ask the authors of the others whether they still work on them.

<table>
<thead>
<tr><th>Repository</th><th>PR</th><th>Title</th><th>Author</th><th>Open for</th><th>Review</th><th>Last response</th></tr>
</thead>
<tbody>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/81f91fb3ec9096a375111c79420b9e3884eb5401/sql/airlift/02-open-pull-requests.sql)

## Issues without an answer

Issues of people opened in the last 12 months that are still open and that no other person commented on, at most 8 per repository, oldest first. Older ones are counted in "Activity per repository".
An answer, even a question or a label, tells the reporter that someone read it. Close the ones that are fixed or can't be reproduced.

<table>
<thead>
<tr><th>Repository</th><th>Issue</th><th>Title</th><th>Author</th><th>Open for</th></tr>
</thead>
<tbody>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/81f91fb3ec9096a375111c79420b9e3884eb5401/sql/airlift/03-unanswered-issues.sql)

## First-time contributors

People whose first pull request to a repository was opened in the last 12 months, newest first, what happened to it, and how long it waited for a first response.
A quick first response keeps new people coming back. Thank them, and point them to issues they could help with next.

<table>
<thead>
<tr><th>Repository</th><th>Author</th><th>First PR</th><th>Opened</th><th>State</th><th>First response</th></tr>
</thead>
<tbody>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/81f91fb3ec9096a375111c79420b9e3884eb5401/sql/airlift/04-first-time-contributors.sql)

## Who reviews

People who reviewed or commented on pull requests of other people in the last 12 months, per repository, and the share of reviewed pull requests the top reviewer saw.
When one person reviews almost everything, the repository stops when they're away. Reviews from people who use a library count too: ask them to review.

<table>
<thead>
<tr><th>Repository</th><th style="text-align: right">Reviewed PRs</th><th style="text-align: right">Reviewers</th><th>Seen by the top reviewer</th><th>Top reviewers (PRs)</th></tr>
</thead>
<tbody>
</tbody>
</table>

[query](https://github.com/trinodb/reports/blob/81f91fb3ec9096a375111c79420b9e3884eb5401/sql/airlift/05-reviewers.sql)

Generated on Fri Nov 13 14:11:13 UTC 2026

-- The last 30 days
-- What happened, and who made it happen. Say thanks, and welcome the people who just started. Bots are not counted. Companies come from GitHub profiles and commit emails, so people without one are not counted there.
WITH
since AS (
    SELECT CAST(now() AT TIME ZONE 'UTC' AS timestamp(6)) - INTERVAL '30' DAY AS ts
)
, releases AS (
    SELECT
        CAST(regexp_extract(t.name, '^refs/tags/([0-9]+)$', 1) AS integer) AS release
      , c.committer_date AS released_at
    FROM git.default.tags t
    JOIN commits c ON c.owner = 'trinodb' AND c.repo = 'trino' AND c.sha = t.commit_id
    WHERE regexp_like(t.name, '^refs/tags/[0-9]+$')
      AND c.committer_date >= (SELECT ts FROM since)
)
, merged AS (
    SELECT
        author
      , number
      , merged_at
      , area_labels
      , row_number() OVER (PARTITION BY author ORDER BY merged_at, number) AS merged_count
    FROM memory.default.pull_requests
    WHERE state = 'merged' AND NOT author_is_bot
)
, recently_merged AS (
    SELECT *
    FROM merged
    WHERE merged_at >= (SELECT ts FROM since)
)
, authors AS (
    SELECT author, count(*) AS prs
    FROM recently_merged
    GROUP BY author
)
, reviewers AS (
    SELECT actor, count(DISTINCT number) AS prs
    FROM memory.default.pull_request_events
    WHERE kind = 'review' AND NOT by_author AND NOT by_bot
      AND event_at >= (SELECT ts FROM since)
    GROUP BY actor
)
, areas AS (
    SELECT area, count(*) AS prs
    FROM recently_merged
    CROSS JOIN unnest(area_labels) AS t(area)
    GROUP BY area
)
, companies AS (
    SELECT c.company, count(*) AS prs
    FROM recently_merged m
    JOIN memory.default.companies c ON c.login = m.author
    GROUP BY c.company
)
, repositories AS (
    SELECT repo, count(*) AS prs
    FROM memory.default.repository_pull_requests
    WHERE NOT author_is_bot AND merged_at >= (SELECT ts FROM since)
    GROUP BY repo
)
, highlights AS (
    SELECT
        1 AS item_rank
      , 'Releases' AS item
      , memory.default.join_links(array_agg(memory.default.link(CAST(release AS varchar), format('https://trino.io/docs/current/release/release-%d.html', release)) ORDER BY release), ' · ') AS details
      , memory.default.section_link('community', 'How often does Trino release?') AS link
    FROM releases
    UNION ALL
    SELECT
        2
      , format('First pull request merged: %d people', count(*))
      , memory.default.join_links(array_agg(memory.default.user_link(author) ORDER BY merged_at), ' · ')
      , memory.default.section_link('hall-of-fame', 'Welcome')
    FROM recently_merged
    WHERE merged_count = 1
    UNION ALL
    SELECT
        3
      , 'Milestones of merged pull requests'
      , memory.default.join_links(array_agg(memory.default.user_link(author) || memory.default.plain(format(' (%dth)', merged_count)) ORDER BY merged_count DESC, merged_at), ', ')
      , memory.default.section_link('hall-of-fame', 'Milestones')
    FROM recently_merged
    WHERE merged_count IN (10, 25, 50, 100, 250, 500, 1000)
    UNION ALL
    SELECT
        4
      , format('Most pull requests merged, of %d', sum(prs))
      , memory.default.join_links(slice(array_agg(memory.default.user_link(author) || memory.default.plain(format(' (%d)', prs)) ORDER BY prs DESC, author), 1, 5), ', ')
      , memory.default.section_link('hall-of-fame', 'Top authors of the last 12 months')
    FROM authors
    UNION ALL
    SELECT
        5
      , format('Most pull requests reviewed, by %d people', count(*))
      , memory.default.join_links(slice(array_agg(memory.default.user_link(actor) || memory.default.plain(format(' (%d)', prs)) ORDER BY prs DESC, actor), 1, 5), ', ')
      , memory.default.section_link('hall-of-fame', 'Top reviewers of the last 12 months')
    FROM reviewers
    UNION ALL
    SELECT
        6
      , 'Areas with the most merged pull requests'
      , memory.default.plain(array_join(slice(array_agg(format('%s (%d)', area, prs) ORDER BY prs DESC, area), 1, 5), ', '))
      , memory.default.section_link('contributing', 'Where is the focus?')
    FROM areas
    UNION ALL
    SELECT
        7
      , format('Companies with the most merged pull requests, of %d', count(*))
      , memory.default.plain(array_join(slice(array_agg(format('%s (%d)', company, prs) ORDER BY prs DESC, company), 1, 5), ', '))
      , memory.default.section_link('community', 'Which companies contribute?')
    FROM companies
    UNION ALL
    SELECT
        8
      , format('Pull requests merged in clients and tools: %d', sum(prs))
      , memory.default.plain(array_join(array_agg(format('%s (%d)', repo, prs) ORDER BY prs DESC, repo), ', '))
      , memory.default.section_link('repositories', 'Activity per repository')
    FROM repositories
)
SELECT
    item AS "What"
  , coalesce(details, memory.default.plain('none')) AS "Details"
  , link AS "More"
FROM highlights
ORDER BY item_rank
;

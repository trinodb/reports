
-- this is not a report, just a setup
-- what happened in pull requests and one row for every pull request, so that all reports agree
-- on who is a bot, what a response is, how large a change is, and how experienced its author was

DROP TABLE IF EXISTS memory.default.pull_request_events;

CREATE TABLE memory.default.pull_request_events AS
WITH
pulls AS (
    SELECT *
    FROM pulls
    WHERE owner = 'trinodb' AND repo = 'trino'
)
, latest_pull_commits AS (
    -- keep the newest commit for every set of parent commits, because the table has all versions of amended commits
    SELECT *, row_number() OVER (PARTITION BY owner, repo, pull_number, parent_shas ORDER BY committer_date DESC) AS rownum
    FROM pull_commits
)
, events AS (
    SELECT number, created_at AS event_at, 'opened' AS kind, CAST(NULL AS varchar) AS detail, user_login AS actor, user_login AS author
    FROM pulls
    UNION ALL
    SELECT p.number, r.submitted_at, 'review', r.state, r.user_login, p.user_login
    FROM pulls p
    JOIN reviews r ON (r.owner, r.repo, r.pull_number) = (p.owner, p.repo, p.number)
    UNION ALL
    SELECT p.number, c.created_at, 'comment', NULL, c.user_login, p.user_login
    FROM pulls p
    JOIN issue_comments c ON (c.owner, c.repo, c.issue_number) = (p.owner, p.repo, p.number)
    UNION ALL
    -- commits are pushed by the author of the pull request, even when they include commits of other people
    SELECT p.number, c.committer_date, 'commit', NULL, p.user_login, p.user_login
    FROM pulls p
    JOIN latest_pull_commits c ON (c.owner, c.repo, c.pull_number) = (p.owner, p.repo, p.number) AND c.rownum = 1
)
SELECT
    number
  , event_at
  , kind
  -- the state of a review: APPROVED, CHANGES_REQUESTED, COMMENTED, or DISMISSED
  , detail
  , actor
  , coalesce(actor = author, false) AS by_author
  , memory.default.is_bot(actor) AS by_bot
FROM events
WHERE event_at IS NOT NULL;

DROP TABLE IF EXISTS memory.default.pull_requests;

CREATE TABLE memory.default.pull_requests AS
WITH
pulls AS (
    SELECT *
    FROM pulls
    WHERE owner = 'trinodb' AND repo = 'trino'
)
, latest_pull_stats AS (
    -- the table has a row for every version of the statistics of a pull request
    SELECT *, row_number() OVER (PARTITION BY owner, repo, pull_number ORDER BY updated_at DESC) AS rownum
    FROM pull_stats
)
, closed_by_stale_bot AS (
    -- the message of the stale workflow in .github/workflows/stale.yml of trinodb/trino
    SELECT DISTINCT issue_number AS number
    FROM issue_comments
    WHERE owner = 'trinodb' AND repo = 'trino'
      AND user_login = 'github-actions[bot]'
      AND body LIKE 'Closing this pull request, as it has been stale%'
)
, merged_before AS (
    SELECT p.number, count(earlier.number) AS author_merged_before
    FROM pulls p
    LEFT JOIN pulls earlier ON earlier.user_login = p.user_login AND earlier.merged_at < p.created_at
    GROUP BY p.number
)
, activity AS (
    SELECT
        number
      , min(event_at) FILTER (WHERE kind IN ('review', 'comment') AND NOT by_author AND NOT by_bot) AS first_response_at
      , min(event_at) FILTER (WHERE kind = 'review' AND NOT by_author AND NOT by_bot) AS first_review_at
      , max(event_at) FILTER (WHERE by_author) AS last_author_event_at
      , max(event_at) FILTER (WHERE NOT by_author AND NOT by_bot) AS last_reviewer_event_at
      , max(event_at) FILTER (WHERE NOT by_bot) AS last_event_at
      , coalesce(array_distinct(array_agg(actor) FILTER (WHERE kind = 'review' AND NOT by_author AND NOT by_bot)), ARRAY[]) AS reviewers
      , coalesce(array_distinct(array_agg(actor) FILTER (WHERE kind = 'review' AND detail = 'APPROVED' AND NOT by_author AND NOT by_bot)), ARRAY[]) AS approvers
    FROM memory.default.pull_request_events
    GROUP BY number
)
SELECT
    p.number
  , p.title
  , p.user_login AS author
  , memory.default.is_bot(p.user_login) AS author_is_bot
  -- open, merged, or closed (without merging)
  , CASE WHEN p.merged_at IS NOT NULL THEN 'merged' WHEN p.state = 'closed' THEN 'closed' ELSE 'open' END AS state
  , coalesce(p.draft, false) AS draft
  , p.created_at
  , p.merged_at
  , p.closed_at
  , coalesce(p.label_names, ARRAY[]) AS labels
  -- labels of the part of the code, which a workflow adds from the changed paths, without labels about the process;
  -- empty for changes only to the engine, the build, or CI
  , filter(coalesce(p.label_names, ARRAY[]), label -> label NOT IN (
        'cla-signed', 'stale', 'stale-ignore', 'release-notes', 'no-release-notes', 'ready-to-merge', 'needs-docs',
        'syntax-needs-review', 'RELEASE-BLOCKER', 'Flaky Tests', 'test', 'maintenance', 'enhancement', 'dx',
        'correctness', 'corruption', 'performance', 'dependencies', 'java', 'javascript', 'github_actions')) AS area_labels
  , coalesce(p.requested_reviewer_logins, ARRAY[]) AS requested_reviewers
  , s.additions
  , s.deletions
  , s.changed_files
  , s.additions + s.deletions AS changed_lines
  , CASE
        WHEN s.additions + s.deletions < 10 THEN 'XS'
        WHEN s.additions + s.deletions < 100 THEN 'S'
        WHEN s.additions + s.deletions < 500 THEN 'M'
        WHEN s.additions + s.deletions < 1000 THEN 'L'
        WHEN s.additions + s.deletions >= 1000 THEN 'XL'
    END AS size
  -- XS: under 10 changed lines, S: under 100, M: under 500, L: under 1000, XL: 1000 or more
  , CASE
        WHEN s.additions + s.deletions < 10 THEN 1
        WHEN s.additions + s.deletions < 100 THEN 2
        WHEN s.additions + s.deletions < 500 THEN 3
        WHEN s.additions + s.deletions < 1000 THEN 4
        WHEN s.additions + s.deletions >= 1000 THEN 5
    END AS size_rank
  -- how many pull requests of the author were merged before this one was opened
  , m.author_merged_before
  , CASE
        WHEN m.author_merged_before = 0 THEN 'no merged PRs yet'
        WHEN m.author_merged_before < 10 THEN '1-9 merged PRs'
        WHEN m.author_merged_before < 100 THEN '10-99 merged PRs'
        ELSE '100+ merged PRs'
    END AS author_cohort
  , CASE
        WHEN m.author_merged_before = 0 THEN 1
        WHEN m.author_merged_before < 10 THEN 2
        WHEN m.author_merged_before < 100 THEN 3
        ELSE 4
    END AS author_cohort_rank
  -- the first review or comment from a person other than the author
  , a.first_response_at
  -- the first response or the merge, because merging needs a maintainer, so it is a response even without a review
  , least(coalesce(a.first_response_at, p.merged_at), coalesce(p.merged_at, a.first_response_at)) AS responded_at
  , a.first_review_at
  , a.last_author_event_at
  , a.last_reviewer_event_at
  , a.last_event_at
  -- people other than the author who submitted a review, and those who approved
  , a.reviewers
  , a.approvers
  , s.merged_by_login AS merged_by
  -- closed without merging by the stale bot
  , p.merged_at IS NULL AND p.state = 'closed' AND b.number IS NOT NULL AS closed_by_stale_bot
FROM pulls p
JOIN merged_before m ON m.number = p.number
LEFT JOIN closed_by_stale_bot b ON b.number = p.number
LEFT JOIN activity a ON a.number = p.number
LEFT JOIN latest_pull_stats s ON (s.owner, s.repo, s.pull_number) = (p.owner, p.repo, p.number) AND s.rownum = 1;

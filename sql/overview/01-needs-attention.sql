-- What needs attention now
-- Work that waits on maintainers, reviewers, or anyone who can answer, and how much of it there is now. Follow the link to the list, and start from the top. Pull requests, issues, and questions of bots are not counted.
WITH
open_prs AS (
    SELECT
        *
      , date_diff('day', waiting_since, current_timestamp) AS days_waiting
      , CASE
            WHEN triage_state = 'no response' AND author_cohort_rank = 1 THEN 'newcomer'
            WHEN triage_state = 'approved' THEN 'approved'
            WHEN triage_state IN ('reviewers', 'no response') THEN 'reviewers'
            WHEN next_actor = 'author' AND waiting_since < current_timestamp - INTERVAL '28' DAY THEN 'author'
        END AS attention
    FROM memory.default.open_pull_request_states
)
, pr_rows AS (
    SELECT
        attention
      , count(*) AS items
      , max(days_waiting) AS oldest_days
      , count(*) FILTER (WHERE marked_stale) AS stale
      , count(*) FILTER (WHERE stale_ignored) AS stale_ignored
      , count(*) FILTER (WHERE cardinality(maintainer_approvers) > 0) AS maintainer_approved
      , count(*) FILTER (WHERE days_waiting > 7) AS over_week
    FROM open_prs
    WHERE attention IS NOT NULL
    GROUP BY attention
)
, unanswered_issues AS (
    -- like in the community report: issues of users from the last 90 days without a comment from another person
    SELECT i.number, i.created_at
    FROM issues i
    LEFT JOIN memory.default.contributors ct ON ct.login = i.user_login
    WHERE i.owner = 'trinodb' AND i.repo = 'trino'
      AND i.state = 'open'
      AND i.pull_request_url IS NULL
      AND NOT EXISTS (SELECT 1 FROM pulls p WHERE (p.owner, p.repo, p.number) = (i.owner, i.repo, i.number))
      AND NOT memory.default.is_bot(i.user_login)
      AND coalesce(ct.role, 'newcomer') != 'maintainer'
      AND i.created_at >= current_date - INTERVAL '90' DAY
      AND NOT EXISTS (
          SELECT 1
          FROM issue_comments c
          WHERE c.owner = 'trinodb' AND c.repo = 'trino' AND c.issue_number = i.number
            AND c.user_login != i.user_login AND NOT memory.default.is_bot(c.user_login)
      )
)
, slack_channels AS (
    SELECT id, min(name) AS name
    FROM trinocicd.slack.channels
    WHERE name IN ('troubleshooting', 'beginner')
    GROUP BY id
)
, slack_bots AS (
    SELECT id
    FROM trinocicd.slack.users
    GROUP BY id
    HAVING bool_or(is_bot) OR id = 'USLACKBOT'
)
, slack_last_week AS (
    -- the sync runs on Mondays, so the current week is never complete
    SELECT date_trunc('week', CAST(max(ts) AT TIME ZONE 'UTC' AS date)) - INTERVAL '7' DAY AS week
    FROM trinocicd.slack.messages
)
, slack_questions AS (
    -- like in the community report, for its last 4 weeks
    SELECT
        c.name
      , count(r.ts) FILTER (WHERE r.user != m.user AND r.user NOT IN (SELECT id FROM slack_bots)) > 0 AS answered
    FROM trinocicd.slack.messages m
    JOIN slack_channels c ON c.id = m.channel
    CROSS JOIN slack_last_week l
    LEFT JOIN trinocicd.slack.replies r ON r.channel = m.channel AND r.thread_ts = m.ts AND r.ts > r.thread_ts
        AND (r.subtype IS NULL OR r.subtype IN ('file_share', 'me_message', 'thread_broadcast'))
    WHERE (m.subtype IS NULL OR m.subtype IN ('file_share', 'me_message'))
      AND (m.thread_ts IS NULL OR m.thread_ts = m.ts)
      AND m.user IS NOT NULL
      AND m.user NOT IN (SELECT id FROM slack_bots)
      AND m.ts >= with_timezone(CAST(l.week - INTERVAL '21' DAY AS timestamp), 'UTC')
      AND m.ts < with_timezone(CAST(l.week + INTERVAL '7' DAY AS timestamp), 'UTC')
    GROUP BY c.name, m.channel, m.ts
)
, failed_jobs AS (
    -- like in the CI/CD report: jobs of the merge queue and nightly runs that failed in the last 14 days
    SELECT j.name, count(DISTINCT j.run_id) AS failures
    FROM jobs j
    JOIN memory.default.ci_runs r ON r.id = j.run_id
    WHERE j.owner = 'trinodb' AND j.repo = 'trino'
      AND j.started_at >= current_date - INTERVAL '13' DAY
      AND j.started_at < current_timestamp
      AND j.conclusion = 'failure'
      AND j.name != 'build-success'
      AND r.workflow = 'ci'
      AND r.trigger IN ('merge queue', 'scheduled')
    GROUP BY j.name
)
, repository_prs AS (
    SELECT repo, count(*) AS items, max(date_diff('day', created_at, current_timestamp)) AS oldest_days
    FROM memory.default.repository_pull_requests
    WHERE state = 'open' AND NOT draft AND NOT author_is_bot AND review_state IN ('approved', 'no response')
    GROUP BY repo
)
, repository_issues AS (
    SELECT repo, count(*) AS items
    FROM memory.default.repository_issues
    WHERE state = 'open' AND NOT author_is_bot AND first_response_at IS NULL
      AND created_at >= current_date - INTERVAL '12' MONTH
    GROUP BY repo
)
, attention AS (
    SELECT
        CASE attention WHEN 'newcomer' THEN 1 WHEN 'approved' THEN 2 WHEN 'reviewers' THEN 3 ELSE 4 END AS item_rank
      , CASE attention
            WHEN 'newcomer' THEN 'First pull requests without any response'
            WHEN 'approved' THEN 'Approved pull requests, not merged'
            WHEN 'reviewers' THEN 'Pull requests waiting on reviewers'
            ELSE 'Pull requests waiting on the author for over 4 weeks'
        END AS item
      , items
      , CASE attention
            WHEN 'newcomer' THEN format('oldest waits %d days, %d marked stale', oldest_days, stale)
            WHEN 'approved' THEN format('%d approved by a maintainer, oldest approval %d days ago', maintainer_approved, oldest_days)
            WHEN 'reviewers' THEN format('%d wait over a week, %d marked stale', over_week, stale)
            ELSE format('oldest waits %d days, %d labeled stale-ignore', oldest_days, stale_ignored)
        END AS notes
      , CASE attention
            WHEN 'newcomer' THEN memory.default.section_link('maintaining', 'First pull requests without any response')
            WHEN 'approved' THEN memory.default.section_link('maintaining', 'Approved, not merged')
            WHEN 'reviewers' THEN memory.default.section_link('maintaining', 'Waiting on reviewers: pick from the top')
            ELSE memory.default.section_link('maintaining', 'Waiting on the author for over 4 weeks')
        END AS link
    FROM pr_rows
    UNION ALL
    SELECT
        5
      , 'Issues of the last 90 days without an answer'
      , count(*)
      , coalesce(format('oldest waits %d days', max(date_diff('day', created_at, current_timestamp))), '')
      , memory.default.section_link('community', 'Issues waiting for a first answer')
    FROM unanswered_issues
    UNION ALL
    SELECT
        6
      , 'Slack questions of the last 4 weeks without a reply'
      , count(*) FILTER (WHERE NOT answered)
      , format('of %d questions, %d in troubleshooting', count(*), count(*) FILTER (WHERE NOT answered AND name = 'troubleshooting'))
      , memory.default.section_link('community', 'Slack questions without an answer')
    FROM slack_questions
    UNION ALL
    SELECT
        7
      , 'Jobs failing in the merge queue and nightly runs in the last 14 days'
      , count(*)
      , coalesce(format('most often %s, %d times', max_by(name, failures), max(failures)), '')
      , memory.default.section_link('ci-cd', 'Which jobs fail in the merge queue and nightly runs')
    FROM failed_jobs
    UNION ALL
    SELECT
        8
      , 'Pull requests in clients and tools, approved or without a response'
      , sum(items)
      , coalesce(format('most in %s, %d, oldest open %d days', max_by(repo, items), max(items), max(oldest_days)), '')
      , memory.default.section_link('repositories', 'Open pull requests')
    FROM repository_prs
    UNION ALL
    SELECT
        9
      , 'Issues in clients and tools of the last 12 months without an answer'
      , sum(items)
      , coalesce(format('most in %s, %d', max_by(repo, items), max(items)), '')
      , memory.default.section_link('repositories', 'Issues without an answer')
    FROM repository_issues
)
SELECT
    item AS "What"
  , coalesce(items, 0) AS "Now"
  , notes AS "Notes"
  , link AS "Where"
FROM attention
ORDER BY item_rank
;

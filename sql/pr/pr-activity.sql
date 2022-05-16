-- PR activity report
WITH
pulls AS (
  SELECT
      p.owner
    , p.repo
    , p.number
    , p.issue_url
    , p.user_login
    , p.created_at
    , p.updated_at
    , p.merged_at
  FROM unique_pulls p
  WHERE p.owner = 'trinodb' AND p.repo = 'trino'
)
, pull_update_count AS (
    SELECT
        date_trunc('month', updated_at) AS time_label
      , count(*) AS num_updated
    FROM pulls
    GROUP BY 1
)
, pull_merge_count AS (
    SELECT
        date_trunc('month', merged_at) AS time_label
      , count(*) AS num_merged
    FROM pulls
    GROUP BY 1
)
, members AS (
    SELECT
        org
      , login
      , team_slug
      -- joined_at is the time when membership was checked, so to avoid gaps stretch it to the previous row
      , lag(removed_at, 1, timestamp '0001-01-01') OVER (PARTITION BY org, login, team_slug ORDER BY joined_at) + interval '1' second AS joined_at
      , removed_at
    FROM timestamped_members
    WHERE team_slug != ''
)
, reviews AS (
  SELECT
      r.owner
    , r.repo
    , r.pull_number AS number
    , r.id
    , r.state
    , r.submitted_at AS event_at
    , r.user_login = p.user_login AS is_author
    , filter(array_agg(m.team_slug), x -> x is not null) AS teams
  FROM pulls p
  JOIN reviews r ON (p.owner, p.repo, p.number) = (r.owner, r.repo, r.pull_number)
  LEFT JOIN members m ON (m.org, m.login) = (r.owner, r.user_login)
    AND r.submitted_at BETWEEN m.joined_at AND coalesce(m.removed_at, now())
    AND m.team_slug != ''
  GROUP BY 1, 2, 3, 4, 5, 6, 7
)
, review_comments AS (
    SELECT
      r.event_at
    , r.is_author
    , contains(r.teams, 'maintainers') AS is_maintainer
    , r.state = 'APPROVED' AS is_approved
    , bool_and(c.in_reply_to_id != 0) AS is_response
    , count(c.id) AS num_comments
    FROM reviews r
    JOIN review_comments c ON c.pull_request_review_id = r.id
    GROUP BY 1, 2, 3, 4
)
, review_count AS (
    SELECT
         date_trunc('month', event_at) AS time_label
       , count(event_at) AS num_reviews
       , count(event_at) FILTER (WHERE is_author) AS num_author_reviews
       , count(event_at) FILTER (WHERE is_maintainer) AS num_maint_reviews
       , count(event_at) FILTER (WHERE is_response) AS num_responses
       , count(event_at) FILTER (WHERE is_author AND is_response) AS num_author_responses
       , count(event_at) FILTER (WHERE is_approved) AS num_approvals
       , sum(num_comments) AS num_comments
    FROM review_comments
    GROUP BY 1
)
, comments AS (
  SELECT
      p.owner
    , p.repo
    , p.number
    , pc.created_at AS event_at
    , pc.user_login = p.user_login AS is_author
    , filter(array_agg(m.team_slug), x -> x is not null) AS teams
  FROM pulls p
  JOIN unique_issue_comments pc ON pc.issue_url = p.issue_url
  LEFT JOIN members m ON (m.org, m.login) = (pc.owner, pc.user_login)
    AND pc.created_at BETWEEN m.joined_at AND coalesce(m.removed_at, now())
    AND m.team_slug != ''
  WHERE pc.user_login != 'cla-bot[bot]'
  GROUP BY 1, 2, 3, 4, 5
)
, comment_count AS (
    SELECT
        date_trunc('month', event_at) AS time_label
      , count(event_at) AS num_total
      , count(event_at) FILTER (WHERE is_author) AS num_author
      , count(event_at) FILTER (WHERE contains(teams, 'maintainers')) AS num_maint
    FROM comments
    GROUP BY 1
)
, commits AS (
  SELECT
      c.owner
    , c.repo
    , c.pull_number AS number
    , c.committer_date AS event_at
    , c.author_login = p.user_login AS is_author
  FROM pulls p
  JOIN unique_pull_commits c ON (p.owner, p.repo, p.number) = (c.owner, c.repo, c.pull_number)
)
, commit_count AS (
    SELECT
        date_trunc('month', event_at) AS time_label
      , count(*) AS num_total
    FROM commits
    GROUP BY 1
)
, events AS (
  SELECT owner, repo, number, created_at AS event_at, true AS is_author, 'created' AS event
  FROM pulls
  UNION ALL
  SELECT owner, repo, number, event_at, is_author, 'review' AS event FROM reviews
  UNION ALL
  SELECT owner, repo, number, event_at, is_author, 'comment' AS event FROM comments
  UNION ALL
  SELECT *, 'commit' AS event FROM commits
)
, review_rounds AS (
  SELECT
      date_trunc('month', event_at) AS time_label
    , count(*) AS num_total
  FROM (
    SELECT event_at, CASE WHEN is_author != lag(is_author) OVER (PARTITION BY number ORDER BY event_at) THEN 1 END AS flipped
    FROM events
  ) a
  WHERE a.flipped = 1
  GROUP BY 1
)
, time AS (
  SELECT
      d.time AS time_label
    , d.time - interval '3' month AS time_begin
    , lead(d.time) OVER (ORDER BY d.time) AS time_end
  FROM unnest(sequence(
        date_trunc('month', current_date) + interval '1' month,
        date_trunc('month', current_date) - interval '3' year,
        interval '-1' month)) AS d(time)
)
SELECT
  t.time_label AS "Time"
, pu.num_updated AS "Updated PRS"
, pm.num_merged AS "Merged PRS"
, r.num_reviews AS "All reviews"
, r.num_author_reviews AS "Author reviews"
, r.num_maint_reviews AS "Maintainer reviews"
, r.num_responses AS "Review responses"
, r.num_author_responses AS "Author responses"
, r.num_approvals AS "Approvals"
, r.num_comments AS "Review comments"
, cments.num_total AS "Regular comments"
, cments.num_author AS "Author comments"
, cments.num_maint AS "Maintainer comments"
, cmits.num_total AS "Commits"
, rr.num_total AS "Review rounds"
FROM
  time t
LEFT JOIN pull_update_count pu ON t.time_label = pu.time_label
LEFT JOIN pull_merge_count pm ON t.time_label = pm.time_label
LEFT JOIN review_count r ON t.time_label = r.time_label
LEFT JOIN comment_count cments ON t.time_label = cments.time_label
LEFT JOIN commit_count cmits ON t.time_label = cmits.time_label
LEFT JOIN review_rounds rr ON t.time_label = rr.time_label
WHERE t.time_label <= date_trunc('month', current_date)
ORDER BY 1 DESC
;

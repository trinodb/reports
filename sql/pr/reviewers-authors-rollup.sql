-- Reviewer-author engagement
WITH
all_members AS (
    SELECT
        org
      , team_slug
      , login
      -- joined_at is an approximate, recorded when membership was checked; assume membership is as old as possible, so stretch it to the end of the previous row
      , coalesce(lag(removed_at) OVER (PARTITION BY org, login, team_slug ORDER BY joined_at) + interval '1' second, timestamp '0001-01-01') AS joined_at
      , removed_at
    FROM timestamped_members
)
, org_members AS (
    SELECT
        login
      , joined_at
      , removed_at
      , array_agg(org) AS orgs
    FROM all_members
    WHERE team_slug = '' AND org != 'trinodb'
    GROUP BY 1, 2, 3
)
, team_members AS (
    SELECT
        login
      , joined_at
      , removed_at
      , array_agg(team_slug) AS teams
    FROM timestamped_members
    -- TODO how to filter out contributors for maintainers since it's a subset?
    WHERE team_slug NOT IN ('', 'infrastructure') AND org = 'trinodb'
    GROUP BY 1, 2, 3
)
, reviews AS (
    SELECT
        r.submitted_at AS review_time
      , r.pull_number
      , r.state
      , p.user_login AS author
      , r.user_login AS reviewer
      , count(*) AS comments
      , count(*) FILTER (WHERE rc.in_reply_to_id != 0) AS replies
    FROM reviews r
    JOIN unique_pulls p ON (p.owner, p.repo, p.number) = (r.owner, r.repo, r.pull_number)
    LEFT JOIN review_comments rc ON (r.owner, r.repo, r.id) = (rc.owner, rc.repo, rc.pull_request_review_id)
    WHERE r.owner = 'trinodb' AND r.repo = 'trino'
    AND r.user_login != p.user_login AND r.submitted_at > CURRENT_DATE - interval '1' year
    GROUP BY 1, 2, 3, 4, 5
)
, review_counts AS (
    SELECT
        reviewer
      , author
      , sum(comments) AS num_review_comments
      , sum(replies) AS num_comment_replies
      , count(distinct pull_number) AS num_prs
      , count(*) AS num_reviews
      , count(*) FILTER (WHERE comments = replies) AS num_review_replies
      , count(*) FILTER (WHERE state = 'APPROVED') AS num_approvals
      , count(distinct pull_number) FILTER (WHERE state = 'APPROVED') AS num_approved_prs
      , row_number() OVER (PARTITION BY reviewer ORDER BY sum(comments) DESC) AS author_rank
    FROM reviews
    GROUP BY 1, 2
)
, comments AS (
    SELECT
        p.user_login AS author
      , pc.user_login AS reviewer
      , count(*) FILTER (WHERE p.user_login = pc.user_login) AS num_pr_author_comments
      , count(*) FILTER (WHERE p.user_login != pc.user_login) AS num_pr_reviewer_comments
    FROM unique_pulls P
    JOIN unique_issue_comments pc ON pc.issue_url = p.issue_url
    WHERE p.owner = 'trinodb' AND p.repo = 'trino'
    AND pc.created_at > CURRENT_DATE - interval '1' year
    -- exclude reviewers commenting on own PRs, assuming these are mostly responses
    AND p.user_login != pc.user_login
    GROUP BY 1, 2
)
, commits AS (
    SELECT
        c.committer_login AS merger
      , p.user_login AS author
      , count(*) AS num_merged_commits
    FROM unique_pulls p
    JOIN unique_pull_commits c ON (p.owner, p.repo, p.number) = (c.owner, c.repo, c.pull_number)
    WHERE p.owner = 'trinodb' AND p.repo = 'trino'
    AND c.committer_date > CURRENT_DATE - interval '1' year
    -- exclude reviewers merging on own PRs
    AND c.committer_login != p.user_login
    GROUP BY 1, 2
)
, per_team AS (
    SELECT
        ri.name || coalesce(nullif(' (' || array_join(coalesce(omr.orgs, ARRAY[]) || coalesce(tmr.teams, ARRAY[]), ', ') || ')', ' ()'), '') AS "Reviewer name"
      , coalesce(oma.orgs, ARRAY[]) AS "Author orgs"
      , coalesce(tma.teams, ARRAY[]) AS "Author teams"
      , sum(num_review_comments) AS "Review comments"
      , sum(num_comment_replies) AS "Comment replies"
      , sum(num_prs) AS "Number of PRs"
      , sum(num_approved_prs) AS "Number of approved PRs"
      , sum(num_reviews) AS "Number of reviews"
      , sum(num_review_replies) AS "Number of replies"
      , sum(num_approvals) AS "Number of approvals"
      , sum(num_pr_author_comments) AS "PR author comments"
      , sum(num_pr_reviewer_comments) AS "PR reviewer comments"
      , sum(num_merged_commits) AS "Merged commits"
    FROM review_counts rc
    FULL OUTER JOIN comments cnt ON (rc.reviewer, rc.author) = (cnt.reviewer, cnt.author)
    FULL OUTER JOIN commits cit ON (rc.reviewer, rc.author) = (cit.merger, cit.author)
    JOIN memory.default.gh_idents ri ON CONTAINS(ri.logins, coalesce(rc.reviewer, cnt.reviewer, cit.merger))
    JOIN memory.default.gh_idents ai ON CONTAINS(ai.logins, coalesce(rc.author, cnt.author, cit.author))
    LEFT JOIN org_members oma ON CONTAINS(ai.logins, oma.login)
    LEFT JOIN team_members tma ON CONTAINS(ai.logins, tma.login)
    LEFT JOIN org_members omr ON CONTAINS(ri.logins, omr.login)
    LEFT JOIN team_members tmr ON CONTAINS(ri.logins, tmr.login)
    GROUP BY 1, 2, 3
)
SELECT
    "Reviewer name"
  , "Author orgs"
  , "Author teams"
  , sum("Review comments") AS "Review comments"
  , sum("Comment replies") AS "Comment replies"
  , sum("Number of PRs") AS "Number of PRs"
  , sum("Number of approved PRs") AS "Number of approved PRs"
  , format('%.2f', 100 * sum("Number of PRs") / (select cast(count(distinct pull_number) AS double) FROM reviews)) AS "Reviewed PRs %"
  , format('%.2f', 100 * sum("Number of approved PRs") / (select cast(count(distinct pull_number) AS double) FROM reviews WHERE state = 'APPROVED')) "Approved PRs %"
  , sum("Number of reviews") AS "Number of reviews"
  , sum("Number of replies") AS "Number of replies"
  , sum("Number of approvals") AS "Number of approvals"
  , sum("PR author comments") AS "PR author comments"
  , sum("PR reviewer comments") AS "PR reviewer comments"
  , sum("Merged commits") AS "Merged commits"
FROM per_team
GROUP BY GROUPING SETS (
    ()
  , ("Reviewer name")
  , ("Reviewer name", "Author teams")
  , ("Reviewer name", "Author orgs")
  , ("Reviewer name", "Author orgs", "Author teams")
)
ORDER BY "Reviewer name", "Author orgs", "Author teams"
;

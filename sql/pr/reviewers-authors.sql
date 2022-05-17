-- Reviewer-author engagement
WITH
all_members AS (
    SELECT
        org
      , team_slug
      , login
      -- joined_at is an approximate, recorded when membership was checked; assume membership is as old as possible, so stretch it to the end of the previous row
      , coalesce(lag(removed_at) OVER (PARTITION BY org, login, team_slug ORDER BY joined_at) + interval '1' second, timestamp '0001-01-01') AS joined_at
      , coalesce(removed_at, timestamp '9999-12-31') AS removed_at
    FROM timestamped_members
)
, members AS (
    SELECT
        login
      , joined_at
      , removed_at
      , array_agg(org) FILTER (WHERE team_slug = '' AND org != 'trinodb')
        -- TODO how to filter out contributors for maintainers since it's a subset?
        || array_agg(team_slug) FILTER (WHERE team_slug NOT IN ('', 'infrastructure') AND org = 'trinodb') AS teams
    FROM all_members
    WHERE (team_slug = '' AND org != 'trinodb') OR (team_slug NOT IN ('', 'infrastructure') AND org = 'trinodb')
    GROUP BY 1, 2, 3
)
, reviews AS (
    SELECT
        r.submitted_at AS review_time
      , r.pull_number
      , r.state
      , p.user_login AS author
      , r.user_login AS reviewer
      , coalesce(am.teams, ARRAY[]) AS author_teams
      , coalesce(rm.teams, ARRAY[]) AS reviewer_teams
      , count(*) AS comments
      , count(*) FILTER (WHERE rc.in_reply_to_id != 0) AS replies
    FROM reviews r
    LEFT JOIN members rm ON rm.login = r.user_login AND r.submitted_at BETWEEN rm.joined_at AND rm.removed_at
    JOIN unique_pulls p ON (p.owner, p.repo, p.number) = (r.owner, r.repo, r.pull_number)
    LEFT JOIN members am ON am.login = p.user_login AND p.created_at BETWEEN am.joined_at AND am.removed_at
    LEFT JOIN review_comments rc ON (r.owner, r.repo, r.id) = (rc.owner, rc.repo, rc.pull_request_review_id)
    WHERE r.owner = 'trinodb' AND r.repo = 'trino'
    AND r.user_login != p.user_login AND r.submitted_at > CURRENT_DATE - interval '1' year
    GROUP BY 1, 2, 3, 4, 5, 6, 7
)
, review_counts AS (
    SELECT
        reviewer
      , reviewer_teams
      , author
      , author_teams
      , sum(comments) AS num_review_comments
      , sum(replies) AS num_comment_replies
      , count(distinct pull_number) AS num_prs
      , count(distinct pull_number)
        / (select cast(count(distinct pull_number) AS double) FROM reviews) AS frac_prs
      , count(*) AS num_reviews
      , count(*) FILTER (WHERE comments = replies) AS num_review_replies
      , count(*) FILTER (WHERE state = 'APPROVED') AS num_approvals
      , count(distinct pull_number) FILTER (WHERE state = 'APPROVED')
        / (select cast(count(distinct pull_number) AS double) FROM reviews WHERE state = 'APPROVED') AS frac_approvals
      , row_number() OVER (PARTITION BY reviewer ORDER BY sum(comments) DESC) AS author_rank
    FROM reviews
    GROUP BY 1, 2, 3, 4
)
, comments AS (
    SELECT
        p.user_login AS author
      , pc.user_login AS reviewer
      , coalesce(am.teams, ARRAY[]) AS author_teams
      , coalesce(rm.teams, ARRAY[]) AS reviewer_teams
      , count(*) FILTER (WHERE p.user_login = pc.user_login) AS num_pr_author_comments
      , count(*) FILTER (WHERE p.user_login != pc.user_login) AS num_pr_reviewer_comments
    FROM unique_pulls P
    LEFT JOIN members am ON am.login = p.user_login AND p.created_at BETWEEN am.joined_at AND am.removed_at
    JOIN unique_issue_comments pc ON pc.issue_url = p.issue_url
    LEFT JOIN members rm ON rm.login = pc.user_login AND pc.created_at BETWEEN rm.joined_at AND rm.removed_at
    WHERE p.owner = 'trinodb' AND p.repo = 'trino'
    AND pc.created_at > CURRENT_DATE - interval '1' year
    -- exclude reviewers commenting on own PRs, assuming these are mostly responses
    AND p.user_login != pc.user_login
    GROUP BY 1, 2, 3, 4
)
, commits AS (
    SELECT
        c.committer_login AS merger
      , p.user_login AS author
      , coalesce(am.teams, ARRAY[]) AS author_teams
      , coalesce(rm.teams, ARRAY[]) AS merger_teams
      , count(*) AS num_merged_commits
    FROM unique_pulls p
    LEFT JOIN members am ON am.login = p.user_login AND p.created_at BETWEEN am.joined_at AND am.removed_at
    JOIN unique_pull_commits c ON (p.owner, p.repo, p.number) = (c.owner, c.repo, c.pull_number)
    LEFT JOIN members rm ON rm.login = c.committer_login AND c.committer_date BETWEEN rm.joined_at AND rm.removed_at
    WHERE p.owner = 'trinodb' AND p.repo = 'trino'
    AND c.committer_date > CURRENT_DATE - interval '1' year
    -- exclude reviewers merging on own PRs
    AND c.committer_login != p.user_login
    GROUP BY 1, 2, 3, 4
)
SELECT
    coalesce(rc.reviewer, cnt.reviewer, cit.merger) || coalesce(nullif(' (' || array_join(coalesce(rc.reviewer_teams, cnt.reviewer_teams, cit.merger_teams), ', ') || ')', ' ()'), '') AS "Reviewer"
  , coalesce(rc.author, cnt.author, cit.author) || coalesce(nullif(' (' || array_join(coalesce(rc.author_teams, cnt.author_teams, cit.author_teams), ', ') || ')', ' ()'), '') AS "Author"
  , author_rank AS "Author rank"
  , bar(num_review_comments / CAST(max(num_review_comments) OVER (PARTITION BY coalesce(rc.reviewer, cnt.reviewer, cit.merger)) AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Comments chart"
  , num_review_comments AS "Review comments"
  , num_comment_replies AS "Comment replies"
  , num_prs AS "Number of PRs"
  , format('%.2f', 100 * frac_prs) AS "Reviewed PRs %"
  , format('%.2f', 100 * frac_approvals) "Approved PRs %"
  , num_reviews "Number of reviews"
  , num_review_replies "Number of replies"
  , num_approvals "Number of approvals"
  , num_pr_author_comments AS "PR author comments"
  , num_pr_reviewer_comments AS "PR reviewer comments"
  , num_merged_commits AS "Merged commits"
FROM review_counts rc
FULL OUTER JOIN comments cnt ON (rc.reviewer, rc.reviewer_teams, rc.author, rc.author_teams) = (cnt.reviewer, cnt.reviewer_teams, cnt.author, cnt.author_teams)
FULL OUTER JOIN commits cit ON (rc.reviewer, rc.reviewer_teams, rc.author, rc.author_teams) = (cit.merger, cit.merger_teams, cit.author, cit.author_teams)
ORDER BY "Reviewer", "Review comments" DESC, "Author"
;

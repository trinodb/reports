-- Reviewer-author engagement
WITH
members AS (
    SELECT
        login
      , joined_at
      , removed_at
      , org AS team
    FROM all_members
    WHERE team_slug = '' AND org != 'trinodb'
    UNION ALL
    SELECT
        login
      , joined_at
      , removed_at
      , team_slug AS team
    FROM all_members
    WHERE team_slug NOT IN ('', 'infrastructure', 'contributors') AND org = 'trinodb'
)
, pulls AS (
    SELECT
        p.owner
      , p.repo
      , p.number
      , p.user_login
      , p.created_at
      , p.issue_url
      , array_agg(DISTINCT coalesce(m.team, 'external') ORDER BY coalesce(m.team, 'external')) AS author_teams
    FROM unique_pulls p
    LEFT JOIN members m ON m.login = p.user_login AND p.created_at BETWEEN m.joined_at AND m.removed_at
    WHERE p.owner = 'trinodb' AND p.repo = 'trino' AND p.created_at > CURRENT_DATE - interval '1' year
    GROUP BY 1, 2, 3, 4, 5, 6
)
, reviews AS (
    SELECT
        r.owner
      , r.repo
      , r.id
      , r.pull_number
      , r.user_login
      , r.submitted_at
      , r.state
      , array_agg(DISTINCT coalesce(m.team, 'external') ORDER BY coalesce(m.team, 'external')) AS reviewer_teams
    FROM reviews r
    LEFT JOIN members m ON m.login = r.user_login AND r.submitted_at BETWEEN m.joined_at AND m.removed_at
    WHERE r.owner = 'trinodb' AND r.repo = 'trino' AND r.submitted_at > CURRENT_DATE - interval '1' year
    GROUP BY 1, 2, 3, 4, 5, 6, 7
)
, reviews_with_comments AS (
    SELECT
        r.submitted_at AS review_time
      , r.pull_number
      , r.state
      , p.created_at AS pr_created_at
      , p.user_login AS author
      , p.author_teams
      , r.user_login AS reviewer
      , r.reviewer_teams
      , count(*) AS comments
      , count(*) FILTER (WHERE rc.in_reply_to_id != 0) AS replies
    FROM reviews r
    JOIN pulls p ON (p.owner, p.repo, p.number) = (r.owner, r.repo, r.pull_number)
    LEFT JOIN review_comments rc ON (r.owner, r.repo, r.id) = (rc.owner, rc.repo, rc.pull_request_review_id)
    AND r.user_login != p.user_login
    GROUP BY 1, 2, 3, 4, 5, 6, 7, 8
)
, author_prs AS (
    SELECT
        r.author
      , r.author_teams
      , count(distinct r.pull_number) AS num_prs
    FROM reviews_with_comments r
    GROUP BY 1, 2
)
, review_counts AS (
    SELECT
        reviewer
      , reviewer_teams
      , r.author
      , r.author_teams
      , sum(comments) AS num_review_comments
      , sum(replies) AS num_comment_replies
      , count(distinct pull_number) AS num_prs
      , count(distinct pull_number) / cast(a.num_prs AS double) AS frac_author_prs
      , count(distinct pull_number)
        / cast(sum(count(distinct pull_number)) OVER () AS double) AS frac_prs
      , count(distinct pull_number) FILTER (WHERE state = 'APPROVED')
        / cast(sum(count(distinct pull_number) FILTER (WHERE state = 'APPROVED')) OVER () AS double) AS frac_approvals
      , count(*) AS num_reviews
      , count(*) FILTER (WHERE comments = replies) AS num_review_replies
      , count(*) FILTER (WHERE state = 'APPROVED') AS num_approvals
    FROM reviews_with_comments r
    JOIN author_prs a ON (a.author, a.author_teams) = (r.author, r.author_teams)
    GROUP BY 1, 2, 3, 4, a.num_prs
)
, comments AS (
    SELECT
        p.user_login AS author
      , p.author_teams
      , pc.user_login AS reviewer
      , array_agg(DISTINCT coalesce(m.team, 'external') ORDER BY coalesce(m.team, 'external')) AS reviewer_teams
      , count(DISTINCT pc.id) FILTER (WHERE p.user_login = pc.user_login) AS num_pr_author_comments
      , count(DISTINCT pc.id) FILTER (WHERE p.user_login != pc.user_login) AS num_pr_reviewer_comments
    FROM pulls p
    JOIN unique_issue_comments pc ON pc.issue_url = p.issue_url
    LEFT JOIN members m ON m.login = pc.user_login AND pc.created_at BETWEEN m.joined_at AND m.removed_at
    AND pc.created_at > CURRENT_DATE - interval '1' year
    -- exclude reviewers commenting on own PRs, assuming these are mostly responses
    AND p.user_login != pc.user_login
    GROUP BY 1, 2, 3
)
, commits AS (
    SELECT
        c.committer_login AS merger
      , p.user_login AS author
      , p.author_teams
      , array_agg(DISTINCT coalesce(m.team, 'external') ORDER BY coalesce(m.team, 'external')) AS merger_teams
      , count(DISTINCT c.sha) AS num_merged_commits
    FROM pulls p
    JOIN unique_pull_commits c ON (p.owner, p.repo, p.number) = (c.owner, c.repo, c.pull_number)
    LEFT JOIN members m ON m.login = c.committer_login AND c.committer_date BETWEEN m.joined_at AND m.removed_at
    WHERE c.committer_login != '' AND c.committer_date > CURRENT_DATE - interval '1' year
    -- exclude reviewers merging on own PRs
    AND c.committer_login != p.user_login
    GROUP BY 1, 2, 3
)
SELECT
    coalesce(rc.reviewer, cnt.reviewer, cit.merger) || coalesce(nullif(' (' || array_join(coalesce(rc.reviewer_teams, cnt.reviewer_teams, cit.merger_teams), ', ') || ')', ' ()'), '') AS "Reviewer"
  , coalesce(rc.author, cnt.author, cit.author) || coalesce(nullif(' (' || array_join(coalesce(rc.author_teams, cnt.author_teams, cit.author_teams), ', ') || ')', ' ()'), '') AS "Author"
  , bar(num_review_comments / CAST(max(num_review_comments) OVER (PARTITION BY coalesce(rc.reviewer, cnt.reviewer, cit.merger)) AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Comments chart"
  , num_review_comments AS "Review comments"
  , num_comment_replies AS "Comment replies"
  , num_prs AS "Number of PRs"
  , format('%.2f', 100 * frac_author_prs) AS "Author PRs %"
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
FULL OUTER JOIN commits cit ON (coalesce(rc.reviewer, cnt.reviewer), coalesce(rc.reviewer_teams, cnt.reviewer_teams), coalesce(rc.author, cnt.author), coalesce(rc.author_teams, cnt.author_teams)) = (cit.merger, cit.merger_teams, cit.author, cit.author_teams)
ORDER BY "Reviewer", "Review comments" DESC, "Author"
;

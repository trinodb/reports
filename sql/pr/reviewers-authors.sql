-- Reviewer-author engagement
WITH
pulls AS (
    SELECT DISTINCT
        p.owner
      , p.repo
      , p.number
      , p.user_login
      , p.created_at
    FROM pulls p
    WHERE p.owner = 'trinodb' AND p.repo = 'trino' AND p.created_at > CURRENT_DATE - interval '1' year
)
, reviews AS (
    SELECT DISTINCT
        r.owner
      , r.repo
      , r.id
      , r.pull_number
      , r.user_login
      , r.submitted_at
      , r.state
    FROM reviews r
    WHERE r.owner = 'trinodb' AND r.repo = 'trino' AND r.submitted_at > CURRENT_DATE - interval '1' year
)
, reviews_with_comments AS (
    SELECT
        r.submitted_at AS review_time
      , r.pull_number
      , r.state
      , p.created_at AS pr_created_at
      , p.user_login AS author
      , r.user_login AS reviewer
      , count(*) AS comments
      , count(*) FILTER (WHERE rc.in_reply_to_id IS NOT NULL) AS replies
    FROM reviews r
    JOIN pulls p ON (p.owner, p.repo, p.number) = (r.owner, r.repo, r.pull_number)
    LEFT JOIN review_comments rc ON (r.owner, r.repo, r.id) = (rc.owner, rc.repo, rc.pull_request_review_id)
    AND r.user_login != p.user_login
    GROUP BY 1, 2, 3, 4, 5, 6
)
, author_prs AS (
    SELECT
        r.author
      , count(distinct r.pull_number) AS num_prs
    FROM reviews_with_comments r
    GROUP BY 1
)
, review_counts AS (
    SELECT
        reviewer
      , r.author
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
    JOIN author_prs a ON a.author = r.author
    GROUP BY 1, 2, a.num_prs
)
, comments AS (
    SELECT
        p.user_login AS author
      , pc.user_login AS reviewer
      , count(DISTINCT pc.id) FILTER (WHERE p.user_login = pc.user_login) AS num_pr_author_comments
      , count(DISTINCT pc.id) FILTER (WHERE p.user_login != pc.user_login) AS num_pr_reviewer_comments
    FROM pulls p
    JOIN issue_comments pc ON (pc.owner, pc.repo, pc.issue_number) = (p.owner, p.repo, p.number)
    GROUP BY 1, 2
)
, latest_pull_commits AS (
    -- like the unique_pull_commits view of trino-rest, keep the newest commit for every set of parent commits
    SELECT *, row_number() OVER (PARTITION BY owner, repo, pull_number, parent_shas ORDER BY committer_date DESC) AS rownum
    FROM pull_commits
)
, commits AS (
    SELECT
        c.committer_login AS merger
      , p.user_login AS author
      , count(DISTINCT c.sha) AS num_merged_commits
    FROM pulls p
    JOIN latest_pull_commits c ON (p.owner, p.repo, p.number) = (c.owner, c.repo, c.pull_number) AND c.rownum = 1
    WHERE c.committer_login IS NOT NULL AND c.committer_date > CURRENT_DATE - interval '1' year
    -- exclude reviewers merging on own PRs
    AND c.committer_login != p.user_login
    GROUP BY 1, 2
)
SELECT
    coalesce(rc.reviewer, cnt.reviewer, cit.merger) AS "Reviewer"
  , coalesce(rc.author, cnt.author, cit.author) AS "Author"
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
FULL OUTER JOIN comments cnt ON (rc.reviewer, rc.author) = (cnt.reviewer, cnt.author)
FULL OUTER JOIN commits cit ON (coalesce(rc.reviewer, cnt.reviewer), coalesce(rc.author, cnt.author)) = (cit.merger, cit.author)
ORDER BY "Reviewer", "Review comments" DESC, "Author"
;

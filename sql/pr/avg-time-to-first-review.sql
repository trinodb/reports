-- Average time to first review
WITH
first_reviews AS (
    SELECT
        p.number as pull_number
      , p.created_at as created_at
      , p.updated_at as updated_at
      , min(r.submitted_at) as first_review_at
      , min(r.submitted_at) - p.created_at AS ttfr
      , count(distinct r.id) as num_reviews
      , count(distinct r.user_id) as num_reviewers
      , count(distinct rc.id) as num_comments
    FROM unique_pulls p
    LEFT JOIN reviews r ON (p.owner, p.repo, p.number) = (r.owner, r.repo, r.pull_number)
    LEFT JOIN review_comments rc ON (r.owner, r.repo, r.id) = (rc.owner, rc.repo, rc.pull_request_review_id)
    WHERE p.owner = 'trinodb' AND p.repo = 'trino'
    GROUP BY 1, 2, 3
)
, first_comment AS (
    SELECT
        p.number as pull_number
      , p.created_at as created_at
      , p.updated_at as updated_at
      , min(c.created_at) as first_comment_at
      , min(c.created_at) - p.created_at as ttfc
      , count(distinct c.id) as num_comments
      , count(distinct c.user_id) as num_commenters
    FROM unique_pulls p
    LEFT JOIN unique_issue_comments c ON (p.owner, p.repo, p.issue_url) = (c.owner, c.repo, c.issue_url) AND c.user_login != 'cla-bot[bot]'
    WHERE p.owner = 'trinodb' AND p.repo = 'trino'
    GROUP BY 1, 2, 3
)
, monthly_rollup AS (
    SELECT
        date_trunc('month', date(coalesce(fr.updated_at, fc.updated_at))) as month_updated
      , count(coalesce(fr.pull_number, fc.pull_number)) as num_pulls
      , count(fr.first_review_at) + count(fc.first_comment_at) as num_first_reviews
      , avg(least(coalesce(fr.ttfr, interval '0' second), coalesce(fc.ttfc, interval '0' second))) as avg_ttfr
      , approx_percentile(to_milliseconds(least(coalesce(fr.ttfr, interval '0' second), coalesce(fc.ttfc, interval '0' second))) / (1000.0 * 3600.0 * 24.0), ARRAY[0.5, 0.75, 0.9, 0.99]) AS perc
      , round(avg(coalesce(fr.num_reviews, 0) + coalesce(fc.num_comments, 0)), 2) as avg_num_reviews
      , round(avg(coalesce(fr.num_reviewers, 0) + coalesce(fc.num_commenters, 0)), 2) as avg_num_reviewers
      , round(avg(coalesce(fr.num_comments, 0) + coalesce(fc.num_comments, 0)), 2) as avg_num_comments
    FROM first_reviews fr
    FULL OUTER JOIN first_comment fc ON fr.pull_number = fc.pull_number
    GROUP BY 1
    ORDER BY 1 DESC
)
SELECT
    month_updated AS "Updated in month"
  , num_pulls AS "Updated PRs"
  , num_first_reviews AS "Reviewed PRs"
  , bar(to_milliseconds(avg_ttfr) / CAST(max(to_milliseconds(avg_ttfr)) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Avg TTFR chart"
  , avg_ttfr AS "Avg TTFR"
  , transform(perc, d -> format('%.2f', d)) AS "Days to review percentiles 50, 75, 90, 99"
  , avg_num_reviews AS "Avg reviews"
  , avg_num_reviewers AS "Avg reviewers"
  , avg_num_comments AS "Avg comments"
FROM monthly_rollup
;

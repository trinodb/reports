-- Average time to first review
WITH first_reviews AS (
    SELECT
        p.number as pull_number
      , p.created_at as created_at
      , p.updated_at as updated_at
      , min(r.submitted_at) as first_review
      , count(distinct r.id) as num_reviews
      , count(distinct r.user_id) as num_reviewers
      , count(distinct rc.id) as num_comments
    FROM unique_pulls p
    LEFT JOIN reviews r ON (p.owner, p.repo, p.number) = (r.owner, r.repo, r.pull_number)
    LEFT JOIN review_comments rc ON (r.owner, r.repo, r.id) = (rc.owner, rc.repo, rc.pull_request_review_id)
    WHERE p.owner = 'trinodb' AND p.repo = 'trino'
    GROUP BY 1, 2, 3
),
monthly_rollup AS (
    SELECT
        date_trunc('month', date(updated_at)) as month_updated
      , count(pull_number) as num_pulls
      , count(first_review) as num_first_reviews
      , avg(first_review - created_at) as avg_time_to_first_review
      , approx_percentile(round(to_milliseconds(first_review - created_at) / (1000.0 * 3600.0 * 24.0), 2), ARRAY[0.5, 0.75, 0.9, 0.99]) AS perc
      , round(avg(num_reviews), 2) as avg_num_reviews
      , round(avg(num_reviewers), 2) as avg_num_reviewers
      , round(avg(num_comments), 2) as avg_num_comments
    FROM first_reviews
    GROUP BY 1
    ORDER BY 1 DESC
)
SELECT
    month_updated AS "Updated in month"
  , num_pulls AS "Updated PRs"
  , num_first_reviews AS "Reviewed PRs"
  , bar(to_milliseconds(avg_time_to_first_review) / CAST(max(to_milliseconds(avg_time_to_first_review)) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Avg TTFR chart"
  , avg_time_to_first_review AS "Avg TTFR"
  , perc AS "Day percentiles 50, 75, 90, 99"
  , avg_num_reviews AS "Avg reviews"
  , avg_num_reviewers AS "Avg reviewers"
  , avg_num_comments AS "Avg comments"
FROM monthly_rollup
;

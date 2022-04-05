-- Average time to first review
WITH first_reviews AS (
    SELECT
        p.number as pull_number,
        p.created_at as created_at,
        p.updated_at as updated_at,
        min(r.submitted_at) as first_review,
        count(r.id) as num_reviews,
        count(distinct r.user_id) as num_reviewers
    FROM unique_pulls p
    LEFT JOIN reviews r ON (p.owner, p.repo, p.number) = (r.owner, r.repo, r.pull_number)
    WHERE p.owner = 'trinodb' AND p.repo = 'trino'
    GROUP BY 1, 2, 3),
monthly_rollup AS (
    SELECT
        date_trunc('month', date(updated_at)) as month_updated,
        count(pull_number) as num_pulls,
        count(first_review) as num_first_reviews,
        avg(first_review - created_at) as avg_time_to_first_review,
        approx_percentile(to_milliseconds(first_review - created_at) / (1000.0 * 3600.0 * 24.0), ARRAY[0.5, 0.75, 0.9, 0.99]) AS perc,
        avg(num_reviews) as avg_num_reviews,
        avg(num_reviewers) as avg_num_reviewers
    FROM first_reviews
    GROUP BY 1
    ORDER BY 1 DESC)
SELECT
    month_updated,
    num_pulls,
    num_first_reviews,
    bar(to_milliseconds(avg_time_to_first_review) / CAST(max(to_milliseconds(avg_time_to_first_review)) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Duration ratio chart",
    avg_time_to_first_review,
    perc AS "Day percentiles 50, 75, 90, 99",
    avg_num_reviews,
    avg_num_reviewers
FROM monthly_rollup
;

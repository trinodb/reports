-- Do people come back?
-- Authors of pull requests per full quarter: █ also opened one in the previous quarter, ▒ came back after a longer break, ░ opened their first one. The last two columns show how many of the quarter's newcomers opened another pull request, or got one merged, within 6 months of their first one, once 6 months have passed.
-- If newcomers rarely come back, review their first pull requests sooner.
WITH
authored AS (
    SELECT DISTINCT author AS login, date_trunc('quarter', created_at) AS quarter
    FROM memory.default.pull_requests
    WHERE NOT author_is_bot AND author IS NOT NULL
)
, authors AS (
    SELECT
        login
      , quarter
      , lag(quarter) OVER (PARTITION BY login ORDER BY quarter) AS previous_quarter
    FROM authored
)
, newcomers AS (
    SELECT
        p.author AS login
      , date_trunc('quarter', min(p.created_at)) AS quarter
      , min(p.created_at) AS first_pr_at
    FROM memory.default.pull_requests p
    WHERE NOT p.author_is_bot AND p.author IS NOT NULL
    GROUP BY p.author
)
, newcomer_followup AS (
    SELECT
        n.quarter
      , count(DISTINCT n.login) AS newcomers
      , count(DISTINCT n.login) FILTER (WHERE p.created_at > n.first_pr_at) AS opened_second
      , count(DISTINCT n.login) FILTER (WHERE p.merged_at < n.first_pr_at + INTERVAL '6' MONTH) AS got_merged
    FROM newcomers n
    LEFT JOIN memory.default.pull_requests p ON p.author = n.login AND p.created_at < n.first_pr_at + INTERVAL '6' MONTH
    GROUP BY n.quarter
)
, quarters AS (
    SELECT
        quarter
      , count(*) AS authors
      , count(*) FILTER (WHERE previous_quarter = quarter - INTERVAL '3' MONTH) AS returning
      , count(*) FILTER (WHERE previous_quarter < quarter - INTERVAL '3' MONTH) AS came_back
      , count(*) FILTER (WHERE previous_quarter IS NULL) AS new
    FROM authors
    WHERE quarter >= date_trunc('quarter', current_date) - INTERVAL '24' MONTH
      AND quarter < date_trunc('quarter', current_date)
    GROUP BY quarter
)
SELECT
    format('%d-Q%d', year(q.quarter), quarter(q.quarter)) AS "Quarter"
  , q.authors AS "Authors"
  , memory.default.stacked(CAST(ARRAY[q.returning, q.came_back, q.new] AS array(double)), '█▒░', 30) AS "Returning, came back, new chart"
  , format('%.0f%%', q.returning * 100e0 / q.authors) AS "Returning"
  , format('%.0f%%', q.came_back * 100e0 / q.authors) AS "Came back"
  , format('%.0f%%', q.new * 100e0 / q.authors) AS "New"
  , if(q.quarter + INTERVAL '9' MONTH <= current_date, format('%.0f%%', f.opened_second * 100e0 / f.newcomers), '') AS "New who opened a 2nd PR"
  , if(q.quarter + INTERVAL '9' MONTH <= current_date, format('%.0f%%', f.got_merged * 100e0 / f.newcomers), '') AS "New who got a PR merged"
FROM quarters q
JOIN newcomer_followup f ON f.quarter = q.quarter
ORDER BY q.quarter DESC
;

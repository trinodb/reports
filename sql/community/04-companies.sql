-- Which companies contribute?
-- People who merged a pull request or reviewed one in the last 12 months, by the company in their GitHub profile, which they write themselves, so it can be missing or out of date, or else by their public GitHub organizations or commit emails. Reviews don't count reviews of a person's own pull requests.
-- A project where one company writes or reviews most of the changes depends on its plans. More companies sharing reviews means pull requests from everyone move faster.
WITH
merged AS (
    SELECT author AS login, count(*) AS merged_prs
    FROM memory.default.pull_requests
    WHERE NOT author_is_bot AND state = 'merged' AND merged_at >= current_date - INTERVAL '12' MONTH
    GROUP BY author
)
, reviewed AS (
    SELECT actor AS login, count(*) AS reviews
    FROM memory.default.pull_request_events
    WHERE kind = 'review' AND NOT by_bot AND NOT by_author AND event_at >= current_date - INTERVAL '12' MONTH
    GROUP BY actor
)
, people AS (
    SELECT
        coalesce(m.login, r.login) AS login
      , coalesce(m.merged_prs, 0) AS merged_prs
      , coalesce(r.reviews, 0) AS reviews
    FROM merged m
    FULL JOIN reviewed r ON r.login = m.login
)
, per_company AS (
    SELECT
        c.company
      , count(*) AS people
      , sum(p.merged_prs) AS merged_prs
      , sum(p.reviews) AS reviews
    FROM people p
    LEFT JOIN memory.default.companies c ON c.login = p.login
    GROUP BY c.company
)
, ranked AS (
    SELECT
        *
      , row_number() OVER (ORDER BY company IS NULL, merged_prs + reviews DESC, company) AS company_rank
    FROM per_company
)
, grouped AS (
    SELECT
        CASE
            WHEN company IS NULL THEN 'No company in the profile, organizations, or commits'
            WHEN company_rank <= 15 THEN company
            ELSE 'Other companies'
        END AS company
      , min(if(company IS NULL, 1000000, if(company_rank <= 15, company_rank, 999999))) AS sort_key
      , count(*) AS companies
      , sum(people) AS people
      , sum(merged_prs) AS merged_prs
      , sum(reviews) AS reviews
    FROM ranked
    GROUP BY 1
)
SELECT
    if(company = 'Other companies', format('Other %d companies', companies), company) AS "Company"
  , people AS "People"
  , merged_prs AS "Merged PRs"
  , format('%.0f%%', merged_prs * 100e0 / sum(merged_prs) OVER ()) AS "Share of merged PRs"
  , reviews AS "Reviews"
  , format('%.0f%%', reviews * 100e0 / sum(reviews) OVER ()) AS "Share of reviews"
FROM grouped
ORDER BY sort_key
;

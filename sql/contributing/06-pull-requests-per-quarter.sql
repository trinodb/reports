-- Pull requests per quarter
-- Pull requests opened by people in each quarter since 2019, newest first, how many of them were merged, and how many are still open. The chart shows their sizes in added plus deleted lines: ░ under 100, ▒ under 500, ▓ under 1000, █ 1000 or more.
-- When more people open pull requests but a smaller share is merged, reviewers can't keep up, or the pull requests aren't ready. The reasons are in "What happens to pull requests that are not merged?".
WITH
quarters AS (
    SELECT quarter
    FROM unnest(sequence(DATE '2019-01-01', date_trunc('quarter', current_date), INTERVAL '3' MONTH)) AS t(quarter)
)
, per_quarter AS (
    SELECT
        q.quarter
      , count(p.number) AS opened
      , count(DISTINCT p.author) AS authors
      , count(p.number) FILTER (WHERE p.state = 'merged') AS merged
      , count(p.number) FILTER (WHERE p.state = 'open') AS still_open
      , count(p.number) FILTER (WHERE p.size IN ('XS', 'S')) AS small
      , count(p.number) FILTER (WHERE p.size = 'M') AS medium
      , count(p.number) FILTER (WHERE p.size = 'L') AS large
      , count(p.number) FILTER (WHERE p.size = 'XL') AS extra_large
    FROM quarters q
    LEFT JOIN memory.default.pull_requests p ON date_trunc('quarter', p.created_at) = q.quarter AND NOT p.author_is_bot
    GROUP BY q.quarter
)
SELECT
    format('%d-Q%d', year(quarter), quarter(quarter)) || if(quarter = date_trunc('quarter', current_date), ' so far', '') AS "Quarter"
  , opened AS "Opened"
  , authors AS "Authors"
  , format('%.0f%%', merged * 100e0 / nullif(opened, 0)) AS "Merged"
  , still_open AS "Still open"
  -- the bar's length is the number of pull requests, so its parts show both the sizes and how they changed
  , memory.default.stacked(ARRAY[small * 1e0, medium * 1e0, large * 1e0, extra_large * 1e0], '░▒▓█', CAST(round(opened * 50e0 / max(opened) OVER ()) AS integer)) AS "Pull requests by size chart"
FROM per_quarter
ORDER BY quarter DESC
;

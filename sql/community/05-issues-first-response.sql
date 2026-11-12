-- How long do users wait for an answer?
-- Issues opened by users, not maintainers or bots, in each quarter since 2019, newest first, and the time until the first comment from another person, on a log scale: ─ spans 80% of the answered issues, ▒ the middle half, and █ is the median. Issues without any comment aren't in the chart, but are counted in the last two columns.
-- Issues closed without a comment were often fixed or closed by their reporter. The open ones are listed in the next report, so anyone can answer them.
WITH
issues_only AS (
    -- the table has pull requests too, and only some of them have pull_request_url set
    SELECT i.number, i.user_login, i.state, i.created_at
    FROM issues i
    LEFT JOIN memory.default.contributors ct ON ct.login = i.user_login
    WHERE i.owner = 'trinodb' AND i.repo = 'trino'
      AND i.pull_request_url IS NULL
      AND NOT EXISTS (SELECT 1 FROM pulls p WHERE (p.owner, p.repo, p.number) = (i.owner, i.repo, i.number))
      AND NOT memory.default.is_bot(i.user_login)
      AND coalesce(ct.role, 'newcomer') != 'maintainer'
)
, first_responses AS (
    SELECT i.number, min(c.created_at) AS first_response_at
    FROM issues_only i
    JOIN issue_comments c ON c.owner = 'trinodb' AND c.repo = 'trino' AND c.issue_number = i.number
    WHERE c.user_login != i.user_login AND NOT memory.default.is_bot(c.user_login)
    GROUP BY i.number
)
, quarters AS (
    SELECT quarter
    FROM unnest(sequence(DATE '2019-01-01', date_trunc('quarter', current_date), INTERVAL '3' MONTH)) AS t(quarter)
)
, per_quarter AS (
    SELECT
        q.quarter
      , count(i.number) AS issues
      , approx_percentile(to_unixtime(r.first_response_at) - to_unixtime(i.created_at), ARRAY[0.1, 0.25, 0.5, 0.75, 0.9]) AS percentiles
      , count(i.number) FILTER (WHERE r.first_response_at IS NULL AND i.state = 'closed') AS closed_without_comment
      , count(i.number) FILTER (WHERE r.first_response_at IS NULL AND i.state = 'open') AS open_without_comment
    FROM quarters q
    LEFT JOIN issues_only i ON date_trunc('quarter', i.created_at) = q.quarter
    LEFT JOIN first_responses r ON r.number = i.number
    GROUP BY q.quarter
)
SELECT
    format('%d-Q%d', year(quarter), quarter(quarter)) || if(quarter = date_trunc('quarter', current_date), ' so far', '') AS "Quarter"
  , issues AS "Issues"
  , coalesce(memory.default.human_duration(percentiles[3]), '') AS "Median"
  , coalesce(memory.default.human_duration(percentiles[5]), '') AS "90% within"
  -- the chart's column title is its axis, as drawn by log_position for a width of 50
  , memory.default.boxplot(percentiles[1], percentiles[2], percentiles[3], percentiles[4], percentiles[5], 50) AS "1m             1h          1d     1w    30d     1y"
  , format('%.0f%%', closed_without_comment * 100e0 / nullif(issues, 0)) AS "Closed, no comment"
  , format('%.0f%%', open_without_comment * 100e0 / nullif(issues, 0)) AS "Open, no comment"
FROM per_quarter
ORDER BY quarter DESC
;

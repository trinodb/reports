-- When are reviewers active?
-- Each cell is one hour of the week in UTC, two characters wide: the darker, the more reviews and comments people wrote on other people's pull requests in the last 12 months. The other columns are for pull requests opened on that day in the 12 months before the last 30 days. Drafts and pull requests without a signed CLA are not counted.
-- Most reviews happen on weekdays, so a pull request opened on a Friday or a weekend waits longer for a first response. If you can, open yours early in the week.
WITH
activity AS (
    SELECT
        day_of_week(event_at) AS day
      , hour(event_at) AS hour
      , count(*) AS events
    FROM memory.default.pull_request_events
    WHERE kind IN ('review', 'comment') AND NOT by_author AND NOT by_bot
      AND event_at >= current_date - INTERVAL '12' MONTH
    GROUP BY 1, 2
)
, cells AS (
    SELECT d.day, h.hour, coalesce(a.events, 0) AS events
    FROM unnest(sequence(1, 7)) AS d(day)
    CROSS JOIN unnest(sequence(0, 23)) AS h(hour)
    LEFT JOIN activity a ON a.day = d.day AND a.hour = h.hour
)
, heatmap AS (
    SELECT
        day
      -- each hour is drawn twice, so that the chart is wide enough to read
      , array_join(array_agg(rpad('', 2, memory.default.shade(events, (SELECT max(events) FROM cells))) ORDER BY hour), '') AS cells
    FROM cells
    GROUP BY day
)
, opened AS (
    SELECT
        day_of_week(created_at) AS day
      , count(*) AS prs
      , approx_percentile(to_unixtime(responded_at) - to_unixtime(created_at), 0.5) AS median_response
      , count(*) FILTER (WHERE responded_at < created_at + INTERVAL '1' DAY) AS within_day
    FROM memory.default.pull_requests
    WHERE NOT author_is_bot AND NOT draft
      AND contains(labels, 'cla-signed')
      AND created_at >= current_date - INTERVAL '12' MONTH
      AND created_at < current_date - INTERVAL '30' DAY
    GROUP BY 1
)
SELECT
    element_at(ARRAY['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'], h.day) AS "Day"
  , h.cells AS "00    03    06    09    12    15    18    21 UTC"
  , o.prs AS "PRs opened"
  , memory.default.human_duration(o.median_response) AS "Median time to first response"
  , format('%.0f%%', o.within_day * 100e0 / o.prs) AS "Responded within a day"
FROM heatmap h
JOIN opened o ON o.day = h.day
ORDER BY h.day
;

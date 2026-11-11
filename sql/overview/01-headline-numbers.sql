-- The project in numbers
-- Each number is for the last 30 days, with the change against the 30 days before, and a trend of the last 12 periods of 30 days, oldest on the left. The arrows show only the direction; the "Good news?" column says if the change is better or worse for the project. A change under 5% (2 points for a share) is steady.
-- Response numbers are for pull requests opened 7 to 37 days ago, so that each one had a week to get an answer; a response is the first review or comment from another person, or the merge. Bots are not counted. Open now counts what is open at the end of each period. A blank mark means there is no data yet.
WITH
now_utc AS (
    SELECT CAST(now() AT TIME ZONE 'UTC' AS timestamp(6)) AS ts
)
, periods AS (
    -- period 0 is the last 30 days, period 1 the 30 days before, and so on
    SELECT
        k AS period
      , ts - k * interval '30' day AS period_end
      , ts - (k + 1) * interval '30' day AS period_start
    FROM now_utc
    CROSS JOIN unnest(sequence(0, 11)) AS t(k)
)
, people_prs AS (
    SELECT *
    FROM memory.default.pull_requests
    WHERE NOT author_is_bot
)
, real_issues AS (
    -- the issues table also has a row for every pull request, and pull_request_url is not set on all of them
    SELECT *
    FROM issues
    WHERE owner = 'trinodb' AND repo = 'trino'
      AND number NOT IN (SELECT number FROM memory.default.pull_requests)
)
, ci AS (
    SELECT *
    FROM memory.default.ci_runs
    WHERE workflow = 'ci'
)
, pr_numbers AS (
    SELECT
        p.period
      , count(*) FILTER (WHERE pr.created_at >= p.period_start AND pr.created_at < p.period_end) AS opened
      , count(*) FILTER (WHERE pr.merged_at >= p.period_start AND pr.merged_at < p.period_end) AS merged
      , count(*) FILTER (WHERE pr.created_at < p.period_end AND (pr.closed_at IS NULL OR pr.closed_at >= p.period_end)) AS open_at_end
      , count(DISTINCT pr.author) FILTER (WHERE pr.created_at >= p.period_start AND pr.created_at < p.period_end) AS authors
      , approx_percentile(to_unixtime(pr.merged_at) - to_unixtime(pr.created_at), 0.5) FILTER (WHERE pr.merged_at >= p.period_start AND pr.merged_at < p.period_end) AS median_time_to_merge
      -- a response after more than 7 days counts as 7 days, so that older pull requests are not measured over a longer time
      , approx_percentile(least(coalesce(to_unixtime(pr.responded_at) - to_unixtime(pr.created_at), 7 * 86400e0), 7 * 86400e0), 0.5)
            FILTER (WHERE NOT pr.draft AND pr.created_at >= p.period_start - interval '7' day AND pr.created_at < p.period_end - interval '7' day) AS median_time_to_response
      , avg(if(pr.responded_at IS NULL OR pr.responded_at > pr.created_at + interval '7' day, 1e0, 0e0))
            FILTER (WHERE NOT pr.draft AND pr.created_at >= p.period_start - interval '7' day AND pr.created_at < p.period_end - interval '7' day) AS no_response_share
    FROM periods p
    CROSS JOIN people_prs pr
    GROUP BY p.period
)
, reviewer_numbers AS (
    SELECT p.period, count(DISTINCT e.actor) AS reviewers
    FROM periods p
    JOIN memory.default.pull_request_events e ON e.event_at >= p.period_start AND e.event_at < p.period_end
    WHERE e.kind = 'review' AND NOT e.by_author AND NOT e.by_bot
    GROUP BY p.period
)
, newcomer_numbers AS (
    SELECT p.period, count(c.login) AS newcomers
    FROM periods p
    LEFT JOIN memory.default.contributors c ON c.first_merged_at >= p.period_start AND c.first_merged_at < p.period_end AND NOT c.is_bot
    GROUP BY p.period
)
, issue_numbers AS (
    SELECT
        p.period
      , count(*) FILTER (WHERE i.created_at >= p.period_start AND i.created_at < p.period_end) AS opened
      , count(*) FILTER (WHERE i.created_at < p.period_end AND (i.state = 'open' OR i.closed_at >= p.period_end)) AS open_at_end
    FROM periods p
    CROSS JOIN real_issues i
    GROUP BY p.period
)
, ci_numbers AS (
    SELECT
        p.period
      -- cancelled runs are neither passed nor failed
      , CAST(count(*) FILTER (WHERE r.trigger = 'merge queue' AND r.outcome = 'passed') AS double)
            / nullif(count(*) FILTER (WHERE r.trigger = 'merge queue' AND r.outcome IN ('passed', 'failed')), 0) AS merge_queue_success_rate
      , approx_percentile(to_unixtime(r.updated_at) - to_unixtime(r.run_started_at), 0.5) FILTER (WHERE r.trigger = 'pull request' AND r.outcome = 'passed') AS median_pr_run_duration
    FROM periods p
    JOIN ci r ON r.created_at >= p.period_start AND r.created_at < p.period_end
    GROUP BY p.period
)
, measures AS (
    SELECT period, area_rank, area, measure_rank, measure, value, unit, better
    FROM pr_numbers
    CROSS JOIN unnest(
        ARRAY[1, 2, 3, 4, 5, 6],
        ARRAY['Opened by people', 'Merged', 'Median time to merge', 'Median time to first response', 'No response within 7 days', 'Open now'],
        ARRAY[CAST(opened AS double), merged, median_time_to_merge, median_time_to_response, no_response_share, open_at_end],
        ARRAY['count', 'count', 'duration', 'duration', 'share', 'count'],
        ARRAY['higher', 'higher', 'lower', 'lower', 'lower', 'lower']
    ) AS t(measure_rank, measure, value, unit, better)
    CROSS JOIN (VALUES (1, 'Pull requests')) AS a(area_rank, area)
    UNION ALL
    SELECT period, 2, 'People', 1, 'Opened a pull request', authors, 'count', 'higher'
    FROM pr_numbers
    UNION ALL
    SELECT period, 2, 'People', 2, 'Reviewed a pull request', reviewers, 'count', 'higher'
    FROM reviewer_numbers
    UNION ALL
    SELECT period, 2, 'People', 3, 'Had their first pull request merged', newcomers, 'count', 'higher'
    FROM newcomer_numbers
    UNION ALL
    SELECT period, 3, 'Issues', 1, 'Opened', opened, 'count', NULL
    FROM issue_numbers
    UNION ALL
    SELECT period, 3, 'Issues', 2, 'Open now', open_at_end, 'count', 'lower'
    FROM issue_numbers
    UNION ALL
    SELECT period, 4, 'CI', 1, 'Merge queue success rate', merge_queue_success_rate, 'share', 'higher'
    FROM ci_numbers
    UNION ALL
    SELECT period, 4, 'CI', 2, 'Median duration of a passing PR run', median_pr_run_duration, 'duration', 'lower'
    FROM ci_numbers
)
, summary AS (
    SELECT
        area_rank
      , area
      , measure_rank
      , measure
      , unit
      , better
      , max(value) FILTER (WHERE period = 0) AS current_value
      , max(value) FILTER (WHERE period = 1) AS previous_value
      , array_agg(value ORDER BY period DESC) AS trend
    FROM measures
    GROUP BY area_rank, area, measure_rank, measure, unit, better
)
, changes AS (
    SELECT
        *
      , CASE
            WHEN current_value IS NULL OR previous_value IS NULL OR previous_value = 0 THEN 'unknown'
            -- compare the rounded changes that are shown, so that a change shown as 5% is never called steady
            WHEN unit = 'share' AND abs(round((current_value - previous_value) * 100)) < 2 THEN 'steady'
            WHEN unit != 'share' AND abs(round((current_value - previous_value) * 100 / abs(previous_value))) < 5 THEN 'steady'
            WHEN current_value > previous_value THEN 'up'
            ELSE 'down'
        END AS direction
    FROM summary
)
SELECT
    if(measure_rank = 1, area, '') AS "Area"
  , measure AS "Measure"
  , CASE unit
        WHEN 'count' THEN format('%d', CAST(round(current_value) AS bigint))
        WHEN 'share' THEN format('%d%%', CAST(round(current_value * 100) AS bigint))
        ELSE memory.default.human_duration(current_value)
    END AS "Last 30 days"
  , CASE
        WHEN unit != 'share' THEN memory.default.delta(current_value, previous_value)
        WHEN round((current_value - previous_value) * 100) > 0 THEN format('▲ +%d pts', CAST(round((current_value - previous_value) * 100) AS bigint))
        WHEN round((current_value - previous_value) * 100) < 0 THEN format('▼ %d pts', CAST(round((current_value - previous_value) * 100) AS bigint))
        ELSE '= 0 pts'
    END AS "Change"
  , CASE
        WHEN direction = 'unknown' THEN ''
        WHEN direction = 'steady' THEN 'steady'
        WHEN better IS NULL THEN ''
        WHEN (direction = 'up') = (better = 'higher') THEN 'better'
        ELSE 'worse'
    END AS "Good news?"
  -- drawn as a chart: one mark per 30 days, so the rows line up
  , memory.default.sparkline(trend) AS "Last 12 x 30 days"
FROM changes
ORDER BY area_rank, measure_rank;

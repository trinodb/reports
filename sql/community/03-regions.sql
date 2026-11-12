-- Where do contributors live?
-- People whose commits were merged in each year since 2019, newest first, by the region of their computer's time zone: ░ the Americas, ▒ Europe, Africa, and the Middle East, ▓ South Asia, █ East Asia and Oceania. A person is counted in the time zone of most of their commits in the year.
-- More regions mean that someone is awake to review and answer at any time of the day. Maintainers from a region with many authors help their pull requests move faster.
WITH
commits_by_people AS (
    SELECT
        coalesce(gh.author_login, lower(g.author_email)) AS person
      , year(g.commit_time) AS year
      , timezone_hour(g.author_time) AS utc_offset
    FROM git.default.commits g
    LEFT JOIN commits gh ON gh.sha = g.object_id
    WHERE g.commit_time >= TIMESTAMP '2019-01-01 00:00:00 UTC'
      AND NOT memory.default.is_bot(coalesce(gh.author_login, g.author_name))
)
, offsets AS (
    SELECT
        person
      , year
      -- some people's tools save commits in UTC, so UTC counts only for people without any other time zone
      , coalesce(max_by(utc_offset, commits) FILTER (WHERE utc_offset != 0), 0) AS utc_offset
    FROM (
        SELECT person, year, utc_offset, count(*) AS commits
        FROM commits_by_people
        GROUP BY person, year, utc_offset
    )
    GROUP BY person, year
)
, per_year AS (
    SELECT
        year
      , count(*) AS people
      , count_if(utc_offset <= -3) AS americas
      , count_if(utc_offset BETWEEN -2 AND 4) AS europe
      , count_if(utc_offset BETWEEN 5 AND 6) AS south_asia
      , count_if(utc_offset >= 7) AS east_asia
    FROM offsets
    GROUP BY year
)
SELECT
    format('%d', year) || if(year = year(current_date), ' so far', '') AS "Year"
  , people AS "People"
  , format('%.0f%%', americas * 100e0 / people) AS "Americas"
  , format('%.0f%%', europe * 100e0 / people) AS "Europe, Africa, Middle East"
  , format('%.0f%%', south_asia * 100e0 / people) AS "South Asia"
  , format('%.0f%%', east_asia * 100e0 / people) AS "East Asia, Oceania"
  , memory.default.stacked(ARRAY[americas * 1e0, europe * 1e0, south_asia * 1e0, east_asia * 1e0], '░▒▓█', 40) AS "Regions chart"
FROM per_year
ORDER BY year DESC
;

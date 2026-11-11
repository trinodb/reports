-- Who reviews
-- Reviews per month by the role of the reviewer, as shares of all reviews, drawn as maintainers █, regular contributors ▓, contributors ▒, newcomers ░, and bots ·. One review is one reviewer reviewing one pull request in the month. Roles are as of today: maintainers merged pull requests of others in the last year, regular contributors have 10 or more merged pull requests, contributors 1 to 9, newcomers none.
-- A growing share of regular contributors and contributors takes load off maintainers. A growing share of bots adds comments for authors to read, but does not replace a review by a person.
WITH
pairs AS (
    SELECT DISTINCT date_trunc('month', e.event_at) AS month, e.actor, e.number, c.role
    FROM memory.default.pull_request_events e
    JOIN memory.default.contributors c ON c.login = e.actor
    WHERE e.kind = 'review' AND NOT e.by_author
      AND e.event_at >= date_trunc('month', current_date) - INTERVAL '23' MONTH
)
, months AS (
    SELECT
        month
      , count(*) AS reviews
      , count(*) FILTER (WHERE role = 'maintainer') AS maintainers
      , count(*) FILTER (WHERE role = 'regular contributor') AS regulars
      , count(*) FILTER (WHERE role = 'contributor') AS contributors
      , count(*) FILTER (WHERE role = 'newcomer') AS newcomers
      , count(*) FILTER (WHERE role = 'bot') AS bots
    FROM pairs
    GROUP BY month
)
-- printed as a chart, so that the bars line up
SELECT
    format_datetime(month, 'yyyy-MM') AS "Month"
  , reviews AS "Reviews"
  , format('%.0f%%', maintainers * 100e0 / reviews) AS "Maintainers"
  , format('%.0f%%', regulars * 100e0 / reviews) AS "Regular"
  , format('%.0f%%', contributors * 100e0 / reviews) AS "Contributors"
  , format('%.0f%%', newcomers * 100e0 / reviews) AS "Newcomers"
  , format('%.0f%%', bots * 100e0 / reviews) AS "Bots"
  , memory.default.stacked(ARRAY[maintainers * 1e0, regulars * 1e0, contributors * 1e0, newcomers * 1e0, bots * 1e0], '█▓▒░·', 40) AS "Share of reviews"
FROM months
ORDER BY month DESC
;

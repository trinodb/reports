-- How often does Trino release?
-- The last 20 releases, the days since the release before, and the commits to master between the two, with their authors, not bots, and the authors whose first commit it was. Master has a linear history, so these are the commits made after the previous release commit.
-- Long gaps mean that fixes wait longer to reach users.
WITH
releases AS (
    SELECT
        CAST(regexp_extract(t.name, '^refs/tags/([0-9]+)$', 1) AS integer) AS release
      , c.committer_date AS released_at
    FROM git.default.tags t
    JOIN commits c ON c.owner = 'trinodb' AND c.repo = 'trino' AND c.sha = t.commit_id
    -- releases before the rename to Trino were called 0.xxx
    WHERE regexp_like(t.name, '^refs/tags/[0-9]+$')
)
, ranges AS (
    SELECT
        release
      , released_at
      , lag(released_at) OVER (ORDER BY release) AS previous_released_at
    FROM releases
)
, recent AS (
    SELECT *
    FROM ranges
    ORDER BY release DESC
    LIMIT 20
)
, master_commits AS (
    SELECT
        committer_date
      , coalesce(author_login, lower(author_email)) AS author
      , memory.default.is_bot(author_login) AS by_bot
      , min(committer_date) OVER (PARTITION BY coalesce(author_login, lower(author_email))) AS first_commit_at
    FROM commits
    WHERE owner = 'trinodb' AND repo = 'trino'
      AND NOT starts_with(commit_message, '[maven-release-plugin]')
)
, per_release AS (
    SELECT
        r.release
      , r.released_at
      , r.previous_released_at
      , count(c.committer_date) AS commits
      , count(DISTINCT c.author) FILTER (WHERE NOT c.by_bot) AS authors
      , count(DISTINCT c.author) FILTER (WHERE NOT c.by_bot AND c.first_commit_at > r.previous_released_at) AS first_time_authors
    FROM recent r
    LEFT JOIN master_commits c ON c.committer_date > r.previous_released_at AND c.committer_date <= r.released_at
    GROUP BY r.release, r.released_at, r.previous_released_at
)
SELECT
    release AS "Release"
  , date_format(released_at, '%Y-%m-%d') AS "Date"
  , date_diff('day', previous_released_at, released_at) AS "Days"
  , memory.default.hbar(date_diff('day', previous_released_at, released_at), max(date_diff('day', previous_released_at, released_at)) OVER (), 30) AS "Days since the previous release chart"
  , commits AS "Commits"
  , authors AS "Authors"
  , first_time_authors AS "First-time"
  , memory.default.link('release notes', format('https://trino.io/docs/current/release/release-%d.html', release)) AS "Notes"
FROM per_release
ORDER BY release DESC
;

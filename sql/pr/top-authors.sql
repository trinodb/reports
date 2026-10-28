-- Top 10 authors per year
WITH
commits AS (
    SELECT
        c.commit_time AT TIME ZONE 'UTC' AS commit_time
      , ai.name AS author_name
      , count(*) AS commits_count
    FROM git.default.commits c
    JOIN memory.default.gh_idents ai ON ai.email = c.author_email OR CONTAINS(ai.extra_emails, c.author_email)
    GROUP BY 1, 2
)
, mergers_per_year AS (
    SELECT
        year(commit_time) AS year,
        author_name,
        sum(commits_count) AS commits_count
    FROM commits
    GROUP BY 1, 2
)
, ranked_per_year AS (
    SELECT
        year,
        author_name,
        commits_count,
        row_number() OVER (PARTITION BY year ORDER BY commits_count DESC) AS in_year_rank
    FROM mergers_per_year
)
SELECT
    year,
    author_name,
    commits_count
FROM ranked_per_year
WHERE in_year_rank < 11
ORDER BY year DESC, commits_count DESC, author_name
;

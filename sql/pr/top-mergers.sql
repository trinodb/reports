-- Top 10 mergers per year
WITH
commits AS (
    SELECT
        c.commit_time AT TIME ZONE 'UTC' AS commit_time
      , ci.name AS committer_name
      , count(*) AS commits_count
    FROM git.default.commits c
    JOIN memory.default.gh_idents ai ON ai.email = c.author_email OR CONTAINS(ai.extra_emails, c.author_email)
    JOIN memory.default.gh_idents ci ON ci.email = c.committer_email OR CONTAINS(ci.extra_emails, c.committer_email)
    WHERE ai.email != ci.email
    GROUP BY 1, 2
)
, mergers_per_year AS (
    SELECT
        year(commit_time) AS year,
        committer_name,
        sum(commits_count) AS commits_count
    FROM commits
    GROUP BY 1, 2
)
, ranked_per_year AS (
    SELECT
        year,
        committer_name,
        commits_count,
        row_number() OVER (PARTITION BY year ORDER BY commits_count DESC) AS in_year_rank
    FROM mergers_per_year
)
SELECT
    year,
    committer_name,
    commits_count
FROM ranked_per_year
WHERE in_year_rank < 11
ORDER BY year DESC, commits_count DESC, committer_name
;

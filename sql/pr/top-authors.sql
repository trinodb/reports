-- Top 10 authors per year
WITH mergers_per_year AS (
    SELECT
        year(c.commit_time AT TIME ZONE 'UTC') AS year,
        ai.name || ' <' || ai.email || '>' AS identifier,
        count(*) AS commits_count
    FROM git.default.commits c
    JOIN memory.default.idents ai ON ai.email = c.author_email OR CONTAINS(ai.extra_emails, c.author_email)
    GROUP BY 1, 2
),
ranked_per_year AS (
    SELECT
        year,
        identifier,
        commits_count,
        row_number() OVER (PARTITION BY year ORDER BY commits_count DESC) AS in_year_rank
    FROM mergers_per_year
)
SELECT
    year,
    identifier,
    commits_count
FROM ranked_per_year
WHERE in_year_rank < 11
ORDER BY 1, 3 DESC
;

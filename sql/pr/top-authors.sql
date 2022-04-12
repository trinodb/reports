-- Top 10 authors per year
-- note that org membership is current, so if someone joins an org, all their historical commits shift toward this org
WITH mergers_per_year AS (
    SELECT
        year(c.commit_time AT TIME ZONE 'UTC') AS year,
        ai.name,
        regexp_replace(ai.email, '(?<=.)[^@](?=[^@]*?@)|(?:(?<=@.)|(?!^)\G(?=[^@]*$)).(?=.*\.)', '*') AS email,
        m.org,
        count(*) AS commits_count
    FROM git.default.commits c
    JOIN memory.default.gh_idents ai ON ai.email = c.author_email OR CONTAINS(ai.extra_emails, c.author_email)
    LEFT JOIN members m ON CONTAINS(ai.logins, m.login)
    GROUP BY 1, 2, 3, 4
),
ranked_per_year AS (
    SELECT
        year,
        name,
        email,
        org,
        commits_count,
        row_number() OVER (PARTITION BY year ORDER BY commits_count DESC) AS in_year_rank
    FROM mergers_per_year
)
SELECT
    year,
    name,
    email,
    org,
    commits_count
FROM ranked_per_year
WHERE in_year_rank < 11
ORDER BY 1 DESC, 5 DESC
;

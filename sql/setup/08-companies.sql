
-- this is not a report, just a setup
-- the company of every person, from the company in their GitHub profile, which they write themselves and keep up to date or not,
-- or else from the email domain of their recent commits
CREATE TABLE IF NOT EXISTS memory.default.companies AS
WITH
cleaned AS (
    SELECT
        login
      -- former employers, like "@databricks ex-@aws"
      , trim(regexp_replace(trim(company), '(?i)(^|[\s,(])(ex|former|formerly|previously)\b.*$', '')) AS company
    FROM trinocicd.github.users
)
, named AS (
    SELECT
        login
      , CASE
            WHEN company IS NULL OR company = '' THEN NULL
            -- organizations, like "@starburstdata @trinodb", where the first one that isn't a project is the employer
            WHEN strpos(company, '@') > 0 THEN element_at(filter(
                regexp_extract_all(company, '@([\p{L}\p{N}][\p{L}\p{N}_.-]*)', 1),
                o -> lower(o) NOT IN ('trinodb', 'trino', 'prestodb', 'prestosql', 'apache')), 1)
            ELSE regexp_replace(company, '(?i)[\s,]+(inc\.?|ltd\.?|llc|corp\.?|corporation|gmbh|co\., ltd\.?)$|\.(com|io|ai)$', '')
        END AS company
    FROM cleaned
)
, domains AS (
    SELECT DISTINCT gh.author_login AS login, lower(split_part(g.author_email, '@', 2)) AS domain
    FROM git.default.commits g
    JOIN trinocicd.github.commits gh ON gh.sha = g.object_id
    WHERE g.commit_time >= current_timestamp - INTERVAL '2' YEAR AND gh.author_login IS NOT NULL
)
, from_emails AS (
    -- a domain of one person is usually their own, and some are of mail providers or foundations
    SELECT d.login, min(split_part(d.domain, '.', 1)) AS company
    FROM domains d
    WHERE d.domain IN (
        SELECT domain
        FROM domains
        WHERE domain NOT IN ('gmail.com', 'googlemail.com', 'users.noreply.github.com', 'outlook.com', 'hotmail.com', 'live.com', 'yahoo.com', 'icloud.com', 'me.com', 'qq.com', '163.com', 'foxmail.com', 'naver.com', 'protonmail.com', 'proton.me', 'pm.me', 'tutanota.com', 'mail.ru', 'yandex.ru', 'apache.org')
        GROUP BY domain
        HAVING count(DISTINCT login) >= 2
    )
    GROUP BY d.login
)
, all_companies AS (
    SELECT login, company FROM named WHERE company IS NOT NULL
    UNION ALL
    SELECT login, company FROM from_emails WHERE login NOT IN (SELECT login FROM named WHERE company IS NOT NULL)
)
, keyed AS (
    SELECT
        login
      , company
      -- spellings of the same company, like "starburstdata" and "Starburst Data", have the same key
      , CASE regexp_replace(lower(company), '[^\p{L}\p{N}]', '')
            WHEN 'starburst' THEN 'starburstdata'
            WHEN 'aws' THEN 'amazon'
            WHEN 'amazonwebservices' THEN 'amazon'
            WHEN 'ly' THEN 'lycorporation'
            WHEN 'lycorp' THEN 'lycorporation'
            WHEN 'datadoghq' THEN 'datadog'
            WHEN 'navercorp' THEN 'naver'
            WHEN 'avitotech' THEN 'avito'
            WHEN 'duneanalytics' THEN 'dune'
            ELSE regexp_replace(lower(company), '[^\p{L}\p{N}]', '')
        END AS company_key
    FROM all_companies
)
, names AS (
    SELECT
        company_key
      , CASE company_key
            WHEN 'starburstdata' THEN 'Starburst'
            WHEN 'amazon' THEN 'Amazon'
            WHEN 'lycorporation' THEN 'LY Corporation'
            -- a spelling with capital letters, like a name, over an organization's handle, and then the one most people use
            ELSE max_by(company, ROW(regexp_like(company, '\p{Lu}'), people))
        END AS company
    FROM (
        SELECT company_key, company, count(*) AS people
        FROM keyed
        GROUP BY company_key, company
    )
    GROUP BY company_key
)
SELECT k.login, n.company
FROM keyed k
JOIN names n ON n.company_key = k.company_key
;

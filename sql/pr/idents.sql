
-- this is not a report, just a setup
-- make sure the connector fetches the repo in a single thread
SELECT count(*)
FROM git.default.commits;

CREATE TABLE IF NOT EXISTS memory.default.nodes AS
    SELECT email, name, login, count(*) AS count
    FROM (
        SELECT g.author_email AS email, g.author_name AS name, gh.author_login AS login
        FROM git.default.commits g
        LEFT JOIN commits gh ON gh.sha = g.object_id
        UNION ALL
        SELECT g.committer_email AS email, g.committer_name AS name, gh.committer_login AS login
        FROM git.default.commits g
        LEFT JOIN commits gh ON gh.sha = g.object_id
    ) names
    GROUP BY email, name, login;

CREATE TABLE IF NOT EXISTS memory.default.edges AS
    SELECT n1.name AS name1, n2.name AS name2
    FROM memory.default.nodes n1
    INNER JOIN memory.default.nodes n2 USING (email);

CREATE TABLE IF NOT EXISTS memory.default.idents AS
WITH RECURSIVE
    walk (name1, name2, visited) AS (
        SELECT name1, name2, ARRAY[name1]
        FROM memory.default.edges
        WHERE name1 = name2
        UNION ALL
        SELECT w.name1, e.name2, w.visited || e.name2
        FROM walk w
        INNER JOIN memory.default.edges e ON e.name1 = w.name2
        WHERE NOT contains(w.visited, e.name2)
    ),
    result (name1, name2s) AS (
        SELECT name1, array_agg(DISTINCT name2 ORDER BY name2)
        FROM walk
        GROUP BY name1
    ),
    grouped (names, emails, logins) AS (
        SELECT
            array_distinct(array_agg(n.name ORDER BY n.count DESC)) AS names,
            array_distinct(array_agg(n.email ORDER BY n.count DESC)) AS emails,
            array_distinct(filter(array_agg(n.login ORDER BY n.count DESC), x -> coalesce(x, '') != '')) AS logins
        FROM result r
        INNER JOIN memory.default.nodes n ON n.name = r.name1
        GROUP BY r.name2s
    )
SELECT
    emails[1] AS email,
    names[1] AS name,
    slice(emails, 2, cardinality(emails)) AS extra_emails,
    slice(names, 2, cardinality(emails)) AS extra_names,
    logins
FROM grouped
ORDER BY name, names;

-- since idents don't resolve duplicates via GitHub logins, create another table
-- to group names and emails by GH login and use idents to resolve names/emails without GH logins
CREATE TABLE IF NOT EXISTS memory.default.gh_idents AS
WITH github_names AS (
    SELECT email, name, login, count(*) AS count
    FROM (
        SELECT author_email AS email, author_name AS name, coalesce(author_login, '') AS login
        FROM commits gh
        UNION ALL
        SELECT committer_email AS email, committer_name AS name, coalesce(committer_login, '') AS login
        FROM commits gh
    ) n
    GROUP BY 1, 2, 3
)
, github_grouped AS (
    SELECT
        login
      , array_agg(email ORDER BY count DESC) AS emails
      , array_agg(name ORDER BY count DESC) AS names
    FROM github_names
    WHERE login != ''
    GROUP BY 1
)
SELECT
    emails[1] AS email
  , names[1] AS name
  , slice(emails, 2, cardinality(emails)) AS extra_emails
  , slice(names, 2, cardinality(emails)) AS extra_names
  , ARRAY[login] AS logins
FROM github_grouped
UNION ALL
SELECT *
FROM memory.default.idents
WHERE cardinality(logins) = 0
ORDER BY name, extra_names;

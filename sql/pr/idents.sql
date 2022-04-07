
-- this is not a report, just a setup
-- make sure the connector fetches the repo in a single thread
SELECT count(*)
FROM git.default.commits;

DROP TABLE IF EXISTS memory.default.nodes;
CREATE TABLE memory.default.nodes AS
    SELECT email, name, count(*) AS count
    FROM (
        SELECT author_email AS email, author_name AS name
        FROM git.default.commits
        UNION ALL
        SELECT committer_email AS email, committer_name AS name
        FROM git.default.commits
    ) names
    GROUP BY email, name;

DROP TABLE IF EXISTS memory.default.edges;
CREATE TABLE memory.default.edges AS
    SELECT n1.name AS name1, n2.name AS name2
    FROM memory.default.nodes n1
    INNER JOIN memory.default.nodes n2 USING (email);

DROP TABLE IF EXISTS memory.default.idents;
CREATE TABLE memory.default.idents AS
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
    grouped (names, emails) AS (
        SELECT
            array_distinct(array_agg(n.name ORDER BY n.count DESC)) AS names,
            array_distinct(array_agg(n.email ORDER BY n.count DESC)) AS emails
        FROM result r
        INNER JOIN memory.default.nodes n ON n.name = r.name1
        GROUP BY r.name2s
    )
SELECT
    emails[1] AS email,
    names[1] AS name,
    slice(emails, 2, cardinality(emails)) AS extra_emails,
    slice(names, 2, cardinality(emails)) AS extra_names
FROM grouped
ORDER BY name, names;

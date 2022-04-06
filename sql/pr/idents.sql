DROP TABLE IF EXISTS memory.default.nodes;
CREATE TABLE memory.default.nodes AS
    SELECT DISTINCT author_email AS email, author_name AS name
    FROM git.default.commits
    UNION
    SELECT DISTINCT committer_email AS email, committer_name AS name
    FROM git.default.commits;

DROP TABLE IF EXISTS memory.default.edges;
CREATE TABLE memory.default.edges AS
    SELECT n1.name AS name1, n2.name AS name2
    FROM memory.default.nodes n1
    INNER JOIN memory.default.nodes n2 USING (email);

DROP TABLE IF EXISTS memory.default.idents;
CREATE TABLE memory.default.idents AS
with recursive
    cte(name1, name2, visited) as (
        select name1, name2, array[name1]
        from memory.default.edges
        where name1 = name2
        union all
        select c.name1, e.name2, c.visited || e.name2
        from cte c
        inner join memory.default.edges e on e.name1 = c.name2
        where not contains(c.visited, e.name2)
    ),
    res(name1, name2s) as (
        select name1, array_agg(distinct name2 order by name2)
        from cte
        group by name1
    ),
    grouped (names, emails) AS (
        select
            array_agg(distinct n.name order by n.name) as names,
            array_agg(distinct n.email order by n.email) as emails
        from res r
        inner join memory.default.nodes n on n.name = r.name1
        group by r.name2s
    )
SELECT
    emails[1] AS email,
    names[1] AS name,
    slice(emails, 2, cardinality(emails)) AS extra_emails,
    slice(names, 2, cardinality(emails)) AS extra_names
FROM grouped
ORDER BY name, names;

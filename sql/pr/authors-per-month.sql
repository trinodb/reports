-- Authors per month
WITH
members AS (
    SELECT
        login
      , joined_at
      , removed_at
      , array_agg(org ORDER BY org) AS orgs
    FROM all_members
    WHERE (team_slug = '' AND org != 'trinodb')
    GROUP BY 1, 2, 3
)
, authors AS (
    SELECT
      date_trunc('month', date(c.commit_time AT TIME ZONE 'UTC')) AS month
    , array_join(coalesce(m.orgs, ARRAY[]), ', ') AS orgs
    , count(*) AS num_commits
    , array_agg(distinct ai.name order by ai.name) AS names
    FROM git.default.commits c
    JOIN memory.default.gh_idents ai ON ai.name = c.author_name OR CONTAINS(ai.extra_names, c.author_name)
    LEFT JOIN members m ON CONTAINS(ai.logins, m.login) AND c.commit_time AT TIME ZONE 'UTC' BETWEEN m.joined_at AND m.removed_at
    GROUP BY 1, 2
)
, accumulated AS (
    SELECT
      a.*
    , array_sort(array_distinct(flatten(array_agg(a.names) OVER (PARTITION BY a.orgs ORDER BY a.month)))) AS all_names
    FROM authors a
    GROUP BY 1, 2, 3, 4
)
, new AS (
    SELECT
      a.month
    , a.orgs
    , a.num_commits
    , a.names
    , cardinality(a.names) AS num_names
    , a.all_names
    , cardinality(a.all_names) AS num_all_names
    , array_except(a.names, lag(a.all_names, 1, array[]) OVER (PARTITION BY a.orgs ORDER BY a.month)) AS new_names
    FROM accumulated a
)
, grouped AS (
    SELECT
      a.month
    , reverse(array_sort(array_agg(a.num_commits))) AS num_org_commits
    , sum(a.num_commits) AS num_commits
    , cast(max(sum(a.num_commits)) OVER () AS double) AS max_num_commits
    -- group into tuples with size as first item to be able to sort descending by size
    , reverse(array_sort(array_agg((a.num_names, a.names)))) AS names
    , reverse(array_sort(array_agg((a.num_all_names, a.all_names)))) AS all_names
    , sum(a.num_names) AS num_names
    , sum(a.num_all_names) AS num_all_names
    , cast(max(sum(a.num_names)) OVER () AS double) AS max_num_names
    , cast(max(sum(a.num_all_names)) OVER () AS double) AS max_num_all_names
    , flatten(array_agg(new_names)) AS new_names
    FROM new a
    GROUP BY 1
)
SELECT
  a.month AS "Month"
-- create a bar chart for every org and join all charts
, array_join(transform(
    -- add group index as a double in [0, 1) range
    zip(
        transform(sequence(1, cardinality(a.num_org_commits)), x -> (x - 1) / cast(cardinality(a.num_org_commits) as double)),
        a.num_org_commits
    ),
    x -> rtrim(bar(x[2] / a.max_num_commits, 20, color(x[1], rgb(255, 0, 0), rgb(0, 0, 255)), color(x[1], rgb(255, 0, 0), rgb(0, 0, 255))))
  ), '') AS "Commits per org chart"
, array_join(transform(
    -- replace size with group index and names with cardinality
    zip(
        transform(sequence(1, cardinality(a.names)), x -> (x - 1) / cast(cardinality(a.names) as double)),
        transform(a.names, x -> cardinality(x[2]))
    ),
    x -> rtrim(bar(x[2] / a.max_num_names, 20, color(x[1], rgb(255, 0, 0), rgb(0, 0, 255)), color(x[1], rgb(255, 0, 0), rgb(0, 0, 255))))
  ), '') AS "Authors per org chart"
, bar(cardinality(a.new_names) / CAST(max(cardinality(a.new_names)) OVER () AS double), 20, rgb(0, 155, 0), rgb(0, 155, 0)) AS "New authors count chart"
, array_join(transform(
    zip(
        transform(sequence(1, cardinality(a.all_names)), x -> (x - 1) / cast(cardinality(a.all_names) as double)),
        transform(a.all_names, x -> cardinality(x[2]))
    ),
    x -> rtrim(bar(x[2] / a.max_num_all_names, 20, color(x[1], rgb(255, 0, 0), rgb(0, 0, 255)), color(x[1], rgb(255, 0, 0), rgb(0, 0, 255))))
  ), '') AS "All authors per org chart"
, a.num_commits AS "Commits count"
, a.num_names AS "Authors count"
, cardinality(a.new_names) AS "New authors count"
, a.num_all_names AS "All authors count"
, new_names AS "New authors"
FROM grouped a
ORDER BY 1 DESC
LIMIT 24;

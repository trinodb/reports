-- Authors per month
WITH
authors AS (
    SELECT
      date_trunc('month', date(c.commit_time AT TIME ZONE 'UTC')) AS month
    , count(*) AS num_commits
    , array_agg(distinct ai.name order by ai.name) AS names
    FROM git.default.commits c
    JOIN memory.default.gh_idents ai ON ai.name = c.author_name OR CONTAINS(ai.extra_names, c.author_name)
    GROUP BY 1
)
, accumulated AS (
    SELECT
      a.*
    , array_sort(array_distinct(flatten(array_agg(a.names) OVER (ORDER BY a.month)))) AS all_names
    FROM authors a
)
, new AS (
    SELECT
      a.month
    , a.num_commits
    , cardinality(a.names) AS num_names
    , cardinality(a.all_names) AS num_all_names
    , array_except(a.names, lag(a.all_names, 1, array[]) OVER (ORDER BY a.month)) AS new_names
    FROM accumulated a
)
SELECT
  a.month AS "Month"
, bar(a.num_commits / CAST(max(a.num_commits) OVER () AS double), 10, rgb(255, 0, 0), rgb(255, 0, 0)) AS "Commits chart"
, bar(a.num_names / CAST(max(a.num_names) OVER () AS double), 10, rgb(255, 0, 0), rgb(255, 0, 0)) AS "Authors chart"
, bar(cardinality(a.new_names) / CAST(max(cardinality(a.new_names)) OVER () AS double), 10, rgb(0, 155, 0), rgb(0, 155, 0)) AS "New authors count chart"
, bar(a.num_all_names / CAST(max(a.num_all_names) OVER () AS double), 10, rgb(255, 0, 0), rgb(255, 0, 0)) AS "All authors chart"
, a.num_commits AS "Commits count"
, a.num_names AS "Authors count"
, cardinality(a.new_names) AS "New authors count"
, a.num_all_names AS "All authors count"
, a.new_names AS "New authors"
FROM new a
ORDER BY 1 DESC
LIMIT 24;

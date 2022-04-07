-- Authors per month
WITH authors AS (
    SELECT
      date_trunc('month', date(c.commit_time AT TIME ZONE 'UTC')) AS month
    , count(distinct ai.name) AS count
    , array_agg(distinct ai.name order by ai.name) AS names
    FROM git.default.commits c
    JOIN memory.default.idents ai ON ai.name = c.author_name OR CONTAINS(ai.extra_names, c.author_name)
    GROUP BY 1
),
accumulated AS (
    SELECT
      a.*
    , array_sort(array_distinct(flatten(array_agg(a.names) OVER (ORDER BY a.month)))) AS all_names
    FROM authors a
    GROUP BY 1, 2, 3
),
new AS (
    SELECT
      a.month
    , a.count
    , a.all_names
    , cardinality(a.all_names) AS total_count
    , array_except(a.names, lag(a.all_names, 1, array[]) OVER (ORDER BY a.month)) AS new_names
    FROM accumulated a
)
SELECT
  a.month AS "Month"
, bar(a.count / CAST(max(a.count) OVER () AS double), 20, rgb(0, 155, 0), rgb(0, 155, 0)) AS "Authors count chart"
, bar(cardinality(a.new_names) / CAST(max(cardinality(a.new_names)) OVER () AS double), 20, rgb(0, 155, 0), rgb(0, 155, 0)) AS "New authors count chart"
, bar(cardinality(a.all_names) / CAST(max(cardinality(a.all_names)) OVER () AS double), 20, rgb(0, 155, 0), rgb(0, 155, 0)) AS "All authors count chart"
, a.count AS "Authors count"
, cardinality(a.new_names) AS "New authors count"
, cardinality(a.all_names) AS "All authors count"
--, cardinality(lag(a.all_names) OVER (ORDER BY a.month)) as all_prev_count
, new_names AS "New authors"
FROM new a
ORDER BY 1 DESC
LIMIT 24;

/* same but with emails
WITH authors AS (
    SELECT
      date_trunc('month', date(c.commit_time AT TIME ZONE 'UTC')) AS month
    , count(distinct ai.email) AS count
    , array_agg(distinct ai.email) AS emails
    FROM git.default.commits c
    JOIN memory.default.idents ai ON ai.email = c.author_email OR CONTAINS(ai.extra_emails, c.author_email)
    GROUP BY 1
),
accumulated AS (
    SELECT
      a.*
    , array_distinct(flatten(array_agg(a.emails) OVER (ORDER BY a.month))) AS all_emails
    FROM authors a
    GROUP BY 1, 2, 3
),
new AS (
    SELECT
      a.month
    , a.count
    , cardinality(a.all_emails) AS total_count
    , array_except(a.emails, lag(a.all_emails) OVER (ORDER BY a.month)) AS new_emails
    FROM accumulated a
)
SELECT
  a.month AS "Month"
, bar(a.count / CAST(max(a.count) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Authors count chart"
, bar(cardinality(a.new_emails) / CAST(max(cardinality(a.new_emails)) OVER () AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "New authors count chart"
, a.count AS "Authors count"
, cardinality(a.new_emails) AS "New authors count"
, new_emails AS "New authors"
FROM new a
ORDER BY 1 DESC
LIMIT 24;
*/

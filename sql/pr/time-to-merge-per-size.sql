-- Time to merge per PR size
WITH
stats AS (
    SELECT
        commit_id
      , sum(added_lines) + sum(deleted_lines) AS size
    FROM git.default.diff_stats
    GROUP BY 1
)
, ttm_per_size AS (
    SELECT
        p.merged_at - p.created_at AS time_to_merge
      , sum(s.size) AS size
    FROM unique_pulls p
    LEFT JOIN pull_commits c ON c.pull_number = p.number
    /*
    TODO most PRs are created in feature branches, and their commits do not exist in the trinodb/trino repo;
         the following details are available when fetching PRs one by one:
          "comments": 10,
          "review_comments": 0,
          "maintainer_can_modify": true,
          "commits": 3,
          "additions": 100,
          "deletions": 3,
          "changed_files": 5
    */
    LEFT JOIN stats s ON s.commit_id = c.sha
    WHERE p.owner = 'trinodb' AND p.repo = 'trino'
    GROUP BY 1
)
, histogram AS (
    SELECT
        size AS key
      , width_bucket(size, ARRAY[1, 10, 100, 1000, 10000]) AS bucket
      , time_to_merge AS value
    FROM ttm_per_size
)
, grouped AS (
    SELECT
        bucket
      , element_at(ARRAY['1 to 10', '10 to 100', '100 to 1,000', '1,000 to 10,000', 'over 10,000'], bucket) AS range
      , avg(value) AS value
      , count(*) AS num_prs
    FROM histogram
    GROUP BY 1, 2
)
SELECT
    range AS "PR size (added + deleted lines)"
  , num_prs AS "Number of PRs"
  , value AS "Avg time to merge"
  , bar(to_milliseconds(value) / CAST(to_milliseconds(max(value) OVER ()) AS double), 20, rgb(0, 155, 0), rgb(255, 0, 0)) AS "Chart"
FROM grouped
ORDER BY bucket
;

-- Combinations of module changes in commits
WITH
modules AS (
  SELECT
      d.commit_id
    , regexp_extract(d.path_name, '^([^/]+)/?', 1) AS module
    , count(*) AS num_changes
  FROM git.default.commits c
  JOIN git.default.diff_stats d ON d.commit_id = c.object_id
  WHERE c.commit_time > NOW() - INTERVAL '3' MONTH
  GROUP BY 1, 2
)
, combinations AS (
    SELECT
      commit_id
      , array_agg(module ORDER BY module) AS modules
    FROM modules
    GROUP BY 1
)
SELECT
  modules
  , count(*) AS num_commits
FROM combinations
GROUP BY 1
HAVING count(*) > 1
ORDER BY 2 DESC
LIMIT 10
;

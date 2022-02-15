-- CI workflow health
SELECT
  CASE head_branch
    WHEN 'master' THEN head_branch
    ELSE '<other>'
  END AS branch
  , count(1) FILTER (WHERE created_at > CURRENT_DATE - INTERVAL '1' DAY) AS today_count
  , round(count(1) FILTER (WHERE created_at > CURRENT_DATE - INTERVAL '1' DAY AND conclusion = 'success') / CAST(count(1) FILTER (WHERE created_at > CURRENT_DATE - INTERVAL '1' DAY) AS double), 2) AS today_success
  , count(1) FILTER (WHERE created_at > CURRENT_DATE - INTERVAL '3' DAY) AS "3day_count"
  , round(count(1) FILTER (WHERE created_at > CURRENT_DATE - INTERVAL '3' DAY AND conclusion = 'success') / CAST(count(1) FILTER (WHERE created_at > CURRENT_DATE - INTERVAL '3' DAY) AS double), 2) AS "3day_success"
  , count(1) FILTER (WHERE created_at > CURRENT_DATE - INTERVAL '7' DAY) AS week_count
  , round(count(1) FILTER (WHERE created_at > CURRENT_DATE - INTERVAL '7' DAY AND conclusion = 'success') / CAST(count(1) FILTER (WHERE created_at > CURRENT_DATE - INTERVAL '7' DAY) AS double), 2) AS week_success
  , count(1) AS month_count
  , round(count(1) FILTER (WHERE conclusion = 'success') / CAST(count(1) AS double), 2) AS month_success
FROM runs
WHERE name = 'ci' AND created_at >= CURRENT_DATE - INTERVAL '30' DAY
GROUP BY 1
ORDER BY 1
;

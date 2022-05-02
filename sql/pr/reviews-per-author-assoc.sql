-- Reviews per author association, per month
WITH reviews AS (
  SELECT
      date_trunc('month', date(r.submitted_at)) AS month
    , count(*) FILTER (WHERE r.author_association = 'MEMBER') AS member_num
    , count(*) FILTER (WHERE r.author_association = 'CONTRIBUTOR') AS contrib_num
    , count(*) FILTER (WHERE r.author_association NOT IN ('MEMBER', 'CONTRIBUTOR')) AS other_num
    , count(*) AS total_num
  FROM reviews r
  GROUP BY 1
)
SELECT
    month
  , rtrim(bar(cast(member_num AS double) / max(member_num) OVER (), 20, rgb(0, 155, 0), rgb(0, 155, 0)))
  || rtrim(bar(cast(contrib_num AS double) / max(contrib_num) OVER (), 20, rgb(255, 0, 0), rgb(255, 0, 0)))
  || rtrim(bar(cast(other_num AS double) / max(other_num) OVER (), 20, rgb(0, 0, 155), rgb(0, 0, 155))) AS chart
  , member_num
  , contrib_num
  , other_num
  , total_num
FROM reviews r
ORDER BY 1 DESC

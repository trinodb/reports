-- Reviews per author association, per month
WITH reviews AS (
  SELECT
      date_trunc('month', date(r.submitted_at)) AS month
    -- obtained from select array_agg(login) from github.default.members where org = 'trinodb' and team_slug = 'maintainers';
    -- which needs to be materialized
    , count(*) FILTER (WHERE r.user_login IN ('electrum', 'martint', 'dain', 'findepi', 'raghavsethi', 'losipiuk', 'arhimondr', 'sopel39', 'ebyhr', 'phd3', 'kokosing', 'Praveen2112', 'hashhar', 'kasiafi')) AS maint_num
    , count(*) FILTER (WHERE r.user_login NOT IN ('electrum', 'martint', 'dain', 'findepi', 'raghavsethi', 'losipiuk', 'arhimondr', 'sopel39', 'ebyhr', 'phd3', 'kokosing', 'Praveen2112', 'hashhar', 'kasiafi') AND r.author_association = 'MEMBER') AS member_num
    , count(*) FILTER (WHERE r.author_association = 'CONTRIBUTOR') AS contrib_num
    , count(*) FILTER (WHERE r.author_association NOT IN ('MEMBER', 'CONTRIBUTOR')) AS other_num
    , count(*) AS total_num
  FROM reviews r
  GROUP BY 1
)
SELECT
    month
  , rtrim(bar(cast(maint_num AS double) / max(maint_num) OVER (), 20, rgb(128, 128, 128), rgb(128, 128, 128)))
  || rtrim(bar(cast(member_num AS double) / max(member_num) OVER (), 20, rgb(0, 155, 0), rgb(0, 155, 0)))
  || rtrim(bar(cast(contrib_num AS double) / max(contrib_num) OVER (), 20, rgb(255, 0, 0), rgb(255, 0, 0)))
  || rtrim(bar(cast(other_num AS double) / max(other_num) OVER (), 20, rgb(0, 0, 155), rgb(0, 0, 155))) AS chart
  , maint_num
  , member_num
  , contrib_num
  , other_num
  , total_num
FROM reviews r
ORDER BY 1 DESC
;

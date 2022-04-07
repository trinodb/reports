-- Available achievements
WITH acha AS (
  SELECT id, name, description FROM memory.default.achievements_calendar
  UNION ALL
  SELECT id, name, description FROM memory.default.achievements_changed_files
  UNION ALL
  SELECT id, name, description FROM memory.default.achievements_changed_lines
  UNION ALL
  SELECT id, name, description FROM memory.default.achievements_languages
  UNION ALL
  SELECT id, name, description FROM memory.default.achievements_words
), acq AS (
  SELECT * FROM memory.default.acquired_calendar
  UNION ALL
  SELECT * FROM memory.default.acquired_changed_files
  UNION ALL
  SELECT * FROM memory.default.acquired_changed_lines
  UNION ALL
  SELECT * FROM memory.default.acquired_languages
  UNION ALL
  SELECT * FROM memory.default.acquired_words
), masked AS (
    SELECT
        acq.*,
        acq.author_name || ' <' || regexp_replace(acq.email, '(?<=.)[^@](?=[^@]*?@)|(?:(?<=@.)|(?!^)\G(?=[^@]*$)).(?=.*\.)', '*') || '>' AS fullname
    FROM acq
)
SELECT
  acha.name,
  acha.description,
  count(a.id) AS num_winners,
  FORMAT('%.2f', 100 * cast(count(a.id) AS DOUBLE) / i.idents_count) AS percent_winners,
  min(a.achieved_at) AS first_achieved_at,
  min_by(a.achieved_in, a.achieved_at) AS first_achieved_in,
  slice(array_agg(a.fullname ORDER BY a.num_achieved DESC, a.achieved_at) FILTER (WHERE year(a.achieved_at) = year(current_date)), 1, 3) AS recent_top3,
  slice(array_agg(a.fullname ORDER BY a.num_achieved DESC, a.achieved_at), 1, 3) AS alltime_top3
FROM acha
LEFT JOIN masked a ON a.id = acha.id
CROSS JOIN (SELECT COUNT(*) AS idents_count FROM memory.default.idents) i
GROUP BY acha.id, acha.name, acha.description, i.idents_count
ORDER BY NULLIF(num_winners, 0) NULLS LAST, acha.name
;

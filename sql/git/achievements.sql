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
)
SELECT
  acha.name,
  acha.description,
  count(acq.id) AS num_winners,
  FORMAT('%.2f', 100 * cast(count(acq.id) AS DOUBLE) / i.idents_count) AS percent_winners,
  min(acq.achieved_at) AS first_achieved_at,
  min_by(acq.achieved_in, acq.achieved_at) AS first_achieved_in,
  slice(array_agg(acq.author_name || ' <' || regexp_replace(acq.email, '(?<=.)[^@](?=[^@]*?@)|(?:(?<=@.)|(?!^)\G(?=[^@]*$)).(?=.*\.)', '*') || '>' ORDER BY acq.num_achieved DESC, acq.achieved_at), 1, 3) AS top3
FROM acha
LEFT JOIN acq ON acq.id = acha.id
CROSS JOIN (SELECT COUNT(*) AS idents_count FROM memory.default.idents) i
GROUP BY acha.id, acha.name, acha.description, i.idents_count
ORDER BY NULLIF(num_winners, 0) NULLS LAST, acha.name
;

-- Winners
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
  acq.author_name,
  regexp_replace(acq.email, '(?<=.)[^@](?=[^@]*?@)|(?:(?<=@.)|(?!^)\G(?=[^@]*$)).(?=.*\.)', '*') AS email,
  count(acq.id) OVER w AS num_achievements,
  format('%.2f', 100 * cast(count(acq.id) OVER w AS double) / a.achievements_count) AS percent_achievments,
  acq.name,
  acq.description,
  acq.achieved_in,
  acq.achieved_at,
  acq.num_achieved
FROM acq
CROSS JOIN (SELECT COUNT(*) AS achievements_count FROM acha) a
WINDOW w AS (PARTITION BY acq.email)
ORDER BY acq.author_name, acq.name
;

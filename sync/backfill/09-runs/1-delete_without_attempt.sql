-- Runs synced by trino-rest before it read their attempt, from 2021, have no attempt.
-- Every backfill copied them again, because they didn't match the existing rows,
-- so they're replaced with the ones the next statement saves as first attempts.
DELETE FROM trinocicd.github.runs
WHERE run_attempt IS NULL

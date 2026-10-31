-- Creates the schema and tables of all steps, so the tables exist before any step reads them,
-- and the backfill can create them before copying the old data.
CREATE SCHEMA IF NOT EXISTS trinocicd.github;

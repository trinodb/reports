-- trino-rest saved missing values as empty strings and as timestamps at the Unix epoch, so they're replaced with NULL, like the sync saves them.
-- Every version of every user, without duplicates. Safe to repeat, versions that are already saved are skipped.
INSERT INTO trinocicd.slack.users
WITH versions AS (
    SELECT DISTINCT
        id,
        nullif(team_id, '') AS team_id,
        name,
        deleted,
        nullif(color, '') AS color,
        nullif(real_name, '') AS real_name,
        nullif(tz, '') AS tz,
        nullif(tz_label, '') AS tz_label,
        tz_offset,
        nullif(avatar_hash, '') AS avatar_hash,
        nullif(status_text, '') AS status_text,
        nullif(status_emoji, '') AS status_emoji,
        nullif(profile_real_name, '') AS profile_real_name,
        nullif(display_name, '') AS display_name,
        nullif(real_name_normalized, '') AS real_name_normalized,
        nullif(display_name_normalized, '') AS display_name_normalized,
        nullif(email, '') AS email,
        nullif(image_24, '') AS image_24,
        nullif(image_32, '') AS image_32,
        nullif(image_48, '') AS image_48,
        nullif(image_72, '') AS image_72,
        nullif(image_192, '') AS image_192,
        nullif(image_512, '') AS image_512,
        nullif(team, '') AS team,
        is_admin,
        is_owner,
        is_primary_owner,
        is_restricted,
        is_ultra_restricted,
        is_bot,
        nullif(updated, from_unixtime(0, 'UTC')) AS updated,
        is_app_user,
        has_2fa
    FROM legacyslack.slack.users
)
SELECT v.*
FROM versions v
WHERE NOT EXISTS (SELECT 1 FROM trinocicd.slack.users u WHERE u.id = v.id AND u.updated IS NOT DISTINCT FROM v.updated)

-- Users changed since the newest version saved, read from the list of all users,
-- because users.list can't read only the changed ones.
INSERT INTO trinocicd.slack.users
WITH fetched AS (
    SELECT
        id,
        team_id,
        name,
        coalesce(deleted, false) AS deleted,
        color,
        real_name,
        tz,
        tz_label,
        tz_offset,
        profile.avatar_hash,
        profile.status_text,
        profile.status_emoji,
        profile.real_name AS profile_real_name,
        profile.display_name,
        profile.real_name_normalized,
        profile.display_name_normalized,
        profile.email,
        profile.image_24,
        profile.image_32,
        profile.image_48,
        profile.image_72,
        profile.image_192,
        profile.image_512,
        profile.team,
        coalesce(is_admin, false) AS is_admin,
        coalesce(is_owner, false) AS is_owner,
        coalesce(is_primary_owner, false) AS is_primary_owner,
        coalesce(is_restricted, false) AS is_restricted,
        coalesce(is_ultra_restricted, false) AS is_ultra_restricted,
        coalesce(is_bot, false) AS is_bot,
        CAST(from_unixtime(updated, 'UTC') AS timestamp(6) with time zone) AS updated,
        coalesce(is_app_user, false) AS is_app_user,
        coalesce(has_2fa, false) AS has_2fa
    FROM slack.default.users
),
saved AS (
    SELECT id, max(updated) AS updated
    FROM trinocicd.slack.users
    GROUP BY id
)
SELECT f.*
FROM fetched f
LEFT JOIN saved s ON s.id = f.id
WHERE s.id IS NULL OR f.updated > s.updated

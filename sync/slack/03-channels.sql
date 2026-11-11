-- Public channels whose name, topic, purpose, or archived state changed since the versions saved.
-- Changes of the number of members alone are not saved, so they don't add a version every week.
INSERT INTO trinocicd.slack.channels
WITH fetched AS (
    SELECT
        types AS type,
        id,
        name,
        coalesce(is_channel, false) AS is_channel,
        coalesce(is_group, false) AS is_group,
        coalesce(is_im, false) AS is_im,
        CAST(from_unixtime(created, 'UTC') AS timestamp(6) with time zone) AS created,
        creator,
        coalesce(is_archived, false) AS is_archived,
        coalesce(is_general, false) AS is_general,
        unlinked,
        name_normalized,
        coalesce(is_shared, false) AS is_shared,
        coalesce(is_ext_shared, false) AS is_ext_shared,
        coalesce(is_org_shared, false) AS is_org_shared,
        pending_shared,
        coalesce(is_pending_ext_shared, false) AS is_pending_ext_shared,
        coalesce(is_member, false) AS is_member,
        coalesce(is_private, false) AS is_private,
        coalesce(is_mpim, false) AS is_mpim,
        nullif(topic.value, '') AS topic_value,
        nullif(topic.creator, '') AS topic_creatro,
        CAST(from_unixtime(nullif(topic.last_set, 0), 'UTC') AS timestamp(6) with time zone) AS topic_last_set,
        nullif(purpose.value, '') AS purpose_value,
        nullif(purpose.creator, '') AS purpose_creatro,
        CAST(from_unixtime(nullif(purpose.last_set, 0), 'UTC') AS timestamp(6) with time zone) AS purpose_last_set,
        previous_names,
        num_members
    FROM slack.default.channels
    WHERE types = 'public_channel'
)
SELECT f.*
FROM fetched f
WHERE NOT EXISTS (
    SELECT 1
    FROM trinocicd.slack.channels c
    WHERE c.id = f.id
        AND c.name IS NOT DISTINCT FROM f.name
        AND c.is_archived IS NOT DISTINCT FROM f.is_archived
        AND c.topic_value IS NOT DISTINCT FROM f.topic_value
        AND c.purpose_value IS NOT DISTINCT FROM f.purpose_value
)

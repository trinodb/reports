-- trino-rest saved missing values as empty strings and as timestamps at the Unix epoch, so they're replaced with NULL, like the sync saves them.
-- Every version of every channel, without duplicates. Safe to repeat, versions that are already saved are skipped.
INSERT INTO trinocicd.slack.channels
WITH versions AS (
    SELECT DISTINCT
        type,
        id,
        name,
        is_channel,
        is_group,
        is_im,
        nullif(created, from_unixtime(0, 'UTC')) AS created,
        nullif(creator, '') AS creator,
        is_archived,
        is_general,
        unlinked,
        nullif(name_normalized, '') AS name_normalized,
        is_shared,
        is_ext_shared,
        is_org_shared,
        pending_shared,
        is_pending_ext_shared,
        is_member,
        is_private,
        is_mpim,
        nullif(topic_value, '') AS topic_value,
        nullif(topic_creatro, '') AS topic_creatro,
        nullif(topic_last_set, from_unixtime(0, 'UTC')) AS topic_last_set,
        nullif(purpose_value, '') AS purpose_value,
        nullif(purpose_creatro, '') AS purpose_creatro,
        nullif(purpose_last_set, from_unixtime(0, 'UTC')) AS purpose_last_set,
        previous_names,
        num_members
    FROM legacyslack.slack.channels
)
SELECT v.*
FROM versions v
WHERE NOT EXISTS (
    SELECT 1
    FROM trinocicd.slack.channels c
    WHERE c.id = v.id
        AND c.name IS NOT DISTINCT FROM v.name
        AND c.is_archived IS NOT DISTINCT FROM v.is_archived
        AND c.topic_value IS NOT DISTINCT FROM v.topic_value
        AND c.purpose_value IS NOT DISTINCT FROM v.purpose_value
        AND c.num_members IS NOT DISTINCT FROM v.num_members
)

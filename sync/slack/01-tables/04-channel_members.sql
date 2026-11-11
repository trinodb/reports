-- A row when the sync first sees a member in a channel, and another one with removed_at set
-- when it no longer does, so it keeps the history of members.
CREATE TABLE IF NOT EXISTS trinocicd.slack.channel_members (
    channel varchar,
    member varchar,
    joined_at timestamp(6),
    removed_at timestamp(6),
    source varchar
);

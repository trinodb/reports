-- The Slack sync appends rows and changes messages with MERGE every week, which creates small files and snapshots,
-- and the tables copied from the old ones start with many small files.
ALTER TABLE users EXECUTE optimize(file_size_threshold => '30MB');
ALTER TABLE users EXECUTE expire_snapshots(retention_threshold => '7d');
ALTER TABLE users EXECUTE remove_orphan_files(retention_threshold => '7d');
ALTER TABLE channels EXECUTE optimize(file_size_threshold => '30MB');
ALTER TABLE channels EXECUTE expire_snapshots(retention_threshold => '7d');
ALTER TABLE channels EXECUTE remove_orphan_files(retention_threshold => '7d');
ALTER TABLE channel_members EXECUTE optimize(file_size_threshold => '30MB');
ALTER TABLE channel_members EXECUTE expire_snapshots(retention_threshold => '7d');
ALTER TABLE channel_members EXECUTE remove_orphan_files(retention_threshold => '7d');
ALTER TABLE messages EXECUTE optimize(file_size_threshold => '30MB');
ALTER TABLE messages EXECUTE expire_snapshots(retention_threshold => '7d');
ALTER TABLE messages EXECUTE remove_orphan_files(retention_threshold => '7d');
ALTER TABLE replies EXECUTE optimize(file_size_threshold => '30MB');
ALTER TABLE replies EXECUTE expire_snapshots(retention_threshold => '7d');
ALTER TABLE replies EXECUTE remove_orphan_files(retention_threshold => '7d');
ALTER TABLE sync_state EXECUTE optimize(file_size_threshold => '30MB');
ALTER TABLE sync_state EXECUTE expire_snapshots(retention_threshold => '7d');
ALTER TABLE sync_state EXECUTE remove_orphan_files(retention_threshold => '7d');

-- The sync saves what it read, and which parents it checked, in batches of 30, so every sync adds hundreds of small files
-- to these tables, and every following batch reads all of them. optimize.yml compacts all tables only once a day, and syncs
-- run every 2 hours, or more often when catching up, so the sync compacts the small files of these tables when it's done.
ALTER TABLE sync_state EXECUTE optimize(file_size_threshold => '1MB');
ALTER TABLE reviews EXECUTE optimize(file_size_threshold => '1MB');
ALTER TABLE pull_stats EXECUTE optimize(file_size_threshold => '1MB');

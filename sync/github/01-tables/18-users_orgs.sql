-- the table existed before it had public organization memberships of people
ALTER TABLE trinocicd.github.users ADD COLUMN IF NOT EXISTS orgs array(varchar);

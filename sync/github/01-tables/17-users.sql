CREATE TABLE IF NOT EXISTS trinocicd.github.users (
    id bigint,
    login varchar,
    name varchar,
    company varchar,
    location varchar,
    created_at timestamp(6),
    updated_at timestamp(6)
);

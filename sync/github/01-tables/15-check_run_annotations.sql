CREATE TABLE IF NOT EXISTS trinocicd.github.check_run_annotations (
    owner varchar,
    repo varchar,
    check_run_id bigint,
    path varchar,
    start_line bigint,
    end_line bigint,
    start_column bigint,
    end_column bigint,
    annotation_level varchar,
    title varchar,
    message varchar,
    raw_details varchar,
    blob_href varchar
);

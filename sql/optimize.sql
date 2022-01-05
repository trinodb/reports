SET SESSION hive.non_transactional_optimize_enabled=true;
ALTER TABLE runs EXECUTE optimize(file_size_threshold => '30MB');
ALTER TABLE jobs EXECUTE optimize(file_size_threshold => '30MB');
ALTER TABLE steps EXECUTE optimize(file_size_threshold => '30MB');
ALTER TABLE check_suites EXECUTE optimize(file_size_threshold => '30MB');
ALTER TABLE check_runs EXECUTE optimize(file_size_threshold => '30MB');
ALTER TABLE check_run_annotations EXECUTE optimize(file_size_threshold => '30MB');
ALTER TABLE artifacts EXECUTE optimize(file_size_threshold => '30MB');

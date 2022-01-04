SET SESSION hive.non_transactional_optimize_enabled=true;
ALTER TABLE hive.default.runs EXECUTE optimize(file_size_threshold => '30MB');
ALTER TABLE hive.default.jobs EXECUTE optimize(file_size_threshold => '30MB');
ALTER TABLE hive.default.steps EXECUTE optimize(file_size_threshold => '30MB');
ALTER TABLE hive.default.check_suites EXECUTE optimize(file_size_threshold => '30MB');
ALTER TABLE hive.default.check_runs EXECUTE optimize(file_size_threshold => '30MB');
ALTER TABLE hive.default.check_run_annotations EXECUTE optimize(file_size_threshold => '30MB');
ALTER TABLE hive.default.artifacts EXECUTE optimize(file_size_threshold => '30MB');

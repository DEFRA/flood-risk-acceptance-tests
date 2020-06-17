# frozen_string_literal: true

task default: :run

desc "Run all scenarios (eq to bundle exec quke)"
task :run do
  sh %( bundle exec quke )
end

desc "Run all tests on local"
task :loc do
  sh %( QUKE_CONFIG=config/loc.config.yml bundle exec quke)
end

desc "Run all tests on dev"
task :dev do
  sh %( QUKE_CONFIG=config/dev.config.yml bundle exec quke)
end

desc "Run all tests on test"
task :tst do
  sh %( QUKE_CONFIG=config/tst.config.yml bundle exec quke)
end

desc "Run all tests on pre-production"
task :pre do
  sh %( QUKE_CONFIG=config/pre.config.yml bundle exec quke")
end

desc "Runs the tests used by continuous integration to check the project"
task :ci do
  sh %( QUKE_CONFIG=config/ci.config.yml bundle exec quke --tags @ci )
end

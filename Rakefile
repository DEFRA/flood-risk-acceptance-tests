# frozen_string_literal: true

task default: :run

desc "Run all scenarios (eq to bundle exec quke)"
task :run do
  sh %( bundle exec quke )
end

desc "Runs the tests used by continuous integration to check the project"
task :ci do
  sh %( bundle exec quke --tags @ci )
end

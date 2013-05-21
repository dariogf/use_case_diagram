require "bundler/gem_tasks"

require 'rake/testtask'
 
Rake::TestTask.new do |t|
  t.libs << 'lib/use_case_diagram'
  t.test_files = FileList['test/lib/use_case_diagram/test_*.rb']
  t.verbose = true
end
 
task :default => :test
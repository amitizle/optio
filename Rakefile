require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rdoc/task'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList["test/**/*_test.rb"]
end

RDoc::Task.new(:docs) do |rdoc|
  rdoc.main = 'README.md'
  rdoc.rdoc_files.include('README.md', 'lib/**/*.rb')
  rdoc.options << '--all'
  rdoc.rdoc_dir = 'docs'
end

task :default => :test

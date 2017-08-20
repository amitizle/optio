require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rdoc/task'

def gem_version
  major, minor, patch = Optio::VERSION.split('.').map {|i| i.to_i}
  [major, minor, patch]
end

def bump_version(type = :minor)
  curr_major, curr_minor, curr_patch  = gem_version
  new_version = case type
                when :patch
                  [curr_major, curr_minor, curr_patch + 1]
                when :minor
                  [curr_major, curr_minor + 1, 0]
                when :major
                  [curr_major + 1, 0, 0]
                end
  puts "Old version: #{[curr_major, curr_minor, curr_patch].inspect}"
  puts "New version: #{new_version.inspect}"
  File.write('VERSION', new_version.join('.'))
end

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

task :bump => 'bump:minor'
namespace :bump do
  task :patch do
    bump_version(:patch)
  end
  task :minor do
    bump_version(:minor)
  end
  task :major do
    bump_version(:major)
  end
end

task :default => :test

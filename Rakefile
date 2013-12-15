require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rdoc/task"

BASE_RDOC_OPTIONS = [
  '--line-numbers', '--show-hash',
  '--main', 'README.md',
  '--title', 'Shlerb and ShlispTools'
]

RDoc::Task.new do |rdoc|
  rdoc.rdoc_dir = 'html'
  rdoc.title = "Shlerb and ShlispTools"
  rdoc.options = BASE_RDOC_OPTIONS.dup
  rdoc.rdoc_files.include("README.md", "LICENSE.txt")
  rdoc.rdoc_files.include("lib/**/*.rb")
  rdoc.rdoc_files.include("examples/**/*.txt.erb")
end

RSpec::Core::RakeTask.new

task :default => :spec
task :test => :spec

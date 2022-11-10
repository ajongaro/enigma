require 'rubocop/rake_task'

task default: %w[test]
task default: %w[lint test]

Rubocop::RakeTask.new(:lint) do |task|
  task.patterns = ['lib/**/*.rb', 'test/**/*.rb']
  task.fail_on_error = false
end

# modify below file names to appropriate ones

task :run do
  ruby 'lib/changeme.rb'
end

task :test do
  ruby 'test/changeme_spec.rb
end

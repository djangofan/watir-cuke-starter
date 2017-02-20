require 'rspec/core/rake_task'
require 'parallel_cucumber'

@success = true

# Cucumber and RSpec can not be run at the same time
# The default task uses the runner based on the setting of ENV['TEST_RUNNER']
task :default do
  ENV['BUILD_TAG'] += "-#{ENV['TEST_RUNNER']}" if ENV['BUILD_TAG']
  Rake::MultiTask[:test_cucumber].invoke
end

task :test_rspec do
  ENV['TEST_RUNNER'] = 'rspec'
  Rake::MultiTask[:win_10_chrome].invoke
end

task :test_cucumber do
  ENV['TEST_RUNNER'] = 'cucumber'
  Rake::MultiTask[:win_10_chrome].invoke
end

task :run_rspec do
  FileUtils.mkpath(ENV['OUT_DIR'][/^[^\/]+/])
  begin
    @result = system "parallel_split_test spec --format d --out #{ENV['OUT_DIR']}.xml"
  ensure
    @success &= @result
  end
end

task :run_cucumber do
  FileUtils.mkpath(ENV['OUT_DIR'])
  begin
    @result = system "parallel_cucumber features -o \"--format junit --out #{ENV['OUT_DIR']} --format pretty\" -n 20"
    #@result = system "parallel_cucumber features -o \"--format html --expand --out #{ENV['OUT_DIR']}\" -n 20"
    #@result = system "parallel_cucumber features"
  ensure
    @success &= @result
  end
end

task :win_10_chrome do
  ENV['platform'] = 'WIN10'
  ENV['browserName'] = 'chrome'
  ENV['version'] = 'latest'
  ENV['OUT_DIR'] = 'junit_reports/win_10_chrome'
  Rake::Task["run_#{ENV['TEST_RUNNER']}"].execute
end


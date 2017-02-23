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

task :test_cucumber_parallel do
  ENV['TEST_RUNNER'] = 'cucumber_parallel'
  Rake::MultiTask[:win_10_chrome].invoke
end

task :test_cucumber_inline do
  ENV['TEST_RUNNER'] = 'cucumber_inline'
  Rake::MultiTask[:win_10_chrome].invoke
end

# trouble getting this one to work
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
    # cannot format HTML because of parallel forking
    @result = system "parallel_cucumber features -o \"--format junit --out #{ENV['OUT_DIR']} --format pretty --tag @sauce\" -n 20"
  ensure
    @success &= @result
  end
end

task :run_cucumber_inline do
  FileUtils.mkpath(ENV['OUT_DIR'])
  begin
    # cannot format HTML because of parallel forking
    @result = system "cucumber -r features --format html --out \"#{ENV['OUT_DIR']}/index.html\" --tag @sauce"
  ensure
    @success &= @result
  end
end

task :win_10_chrome do
  #ENV['SAUCE_USERNAME'] = 'blah'
  #ENV['SAUCE_ACCESS_KEY'] = 'key'
  ENV['platform'] = 'WIN10'
  ENV['browserName'] = 'chrome'
  ENV['version'] = 'latest'
  ENV['OUT_DIR'] = 'reports/win10_chrome'
  ENV['BUILD_TAG'] = "watir_win10_chrome_#{Time.now.strftime("d%m%d_t%H%M%S")}"
  Rake::Task["run_#{ENV['TEST_RUNNER']}"].execute
end


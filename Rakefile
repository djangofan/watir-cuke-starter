require 'rspec/core/rake_task'
require 'parallel_cucumber'

@success = true
@forks = 10

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

task :run_rspec do
  begin
    @result = system "parallel_split_test spec --format d --out #{ENV['OUT_DIR']}.xml"
  ensure
    @success &= @result
  end
end

task :run_cucumber_parallel do
  begin
    # built-in cucumber report formatters are not thread safe
    # use https://github.com/rajatthareja/ReportBuilder
    @result = system "parallel_cucumber features -o \"--format junit --out #{ENV['OUT_DIR']} --format pretty\" -n #{@forks}"
  ensure
    @success &= @result
  end
end

task :run_cucumber_inline do
  begin
    @result = system "cucumber -r features --format html --out \"#{ENV['OUT_DIR']}/index.html\" --tag @sauce"
  ensure
    @success &= @result
  end
end

task :win_10_chrome do
  ENV['platform'] = 'WIN10'
  ENV['browserName'] = 'chrome'
  ENV['version'] = 'latest'
  ENV['OUT_DIR'] = 'reports/win10_chrome'
  ENV['BUILD_TAG'] = "watir_win10_chrome_#{Time.now.strftime("d%m%d_t%H%M%S")}"
  FileUtils.mkpath(ENV['OUT_DIR'][/^[^\/]+/])

  #ENV['SAUCE_USERNAME'] = 'blah'
  #ENV['SAUCE_ACCESS_KEY'] = 'key'

  Rake::Task["run_#{ENV['TEST_RUNNER']}"].execute
end


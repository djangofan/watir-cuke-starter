require 'rspec/core/rake_task'
require 'parallel_cucumber'
require 'rake/clean'

@success = true
CLEAN.include("reports/**/junit*")
CLEAN.include("reports/**/TEST*.xml")
CLEAN.include("reports/**/*.html")
CLEAN.include("*.log")

task :test_parallel do
  ENV['TEST_RUNNER'] = 'cucumber_parallel'
  #Rake::MultiTask[:win_10_chrome].invoke
  Rake::Task[:win_10_chrome].invoke
end

task :test_inline do
  ENV['TEST_RUNNER'] = 'cucumber_inline'
  Rake::Task[:win_10_chrome].invoke
end

task :run_cucumber_parallel do
  begin
    # built-in cucumber report formatters are not thread safe
    # use https://github.com/rajatthareja/ReportBuilder
    @result = system "parallel_cucumber features -o \"--format pretty --profile parallel_reports\" -n #{ENV['SAUCE_THREAD_COUNT']}"
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
  ENV['OUT_DIR'] = 'reports/win10_chrome'
  FileUtils.mkpath(ENV['OUT_DIR'])

  ENV['platform'] = 'WIN10'
  ENV['browserName'] = 'chrome'
  ENV['version'] = 'latest'
  ENV['BUILD_TAG'] = "watir_win10_chrome_#{Time.now.strftime("d%m%d_t%H%M%S")}"

  Rake::Task["sauce_global_vars"].execute
  Rake::Task["run_#{ENV['TEST_RUNNER']}"].execute
end

task :sauce_global_vars do
  ENV['SAUCE_THREAD_COUNT'] = '10'
  ENV['SAUCE_PARENT_ACCOUNT'] = 'hs_qa'
  ENV['SAUCE_TUNNEL_ID'] = 'lower'
  #ENV['SAUCE_USERNAME'] = 'blah'
  #ENV['SAUCE_ACCESS_KEY'] = 'key'
  Rake::Task["check_missing_vars"].execute
end

task :check_missing_vars do
  variables = %w{SAUCE_USERNAME SAUCE_ACCESS_KEY SAUCE_THREAD_COUNT SAUCE_PARENT_ACCOUNT SAUCE_TUNNEL_ID}
  missing = variables.find_all { |v| ENV[v] == nil }
  unless missing.empty?
    raise "\n  The following variables are missing and are needed to run this script: #{missing.join(', ')}.\n\n"
  end
end

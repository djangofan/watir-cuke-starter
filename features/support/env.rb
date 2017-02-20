require 'rspec'
require 'watir'
require 'sauce_whisk'

$DEBUG = true

@sauce_user = ENV['SAUCE_USERNAME']
@sauce_key = ENV['SAUCE_ACCESS_KEY']
@grid_url = "http://#{@sauce_user}:#{@sauce_key}@ondemand.saucelabs.com:80/wd/hub"
puts "GRID URL: #{@grid_url}"
@tunnel_id = 'lower'

Before do |scenario|
  @name = "#{scenario.feature.name} - #{scenario.name}"

  # i coded caps var like this because RubyMine intelli-sense liked it this way
  @caps = Selenium::WebDriver::Remote::Capabilities.chrome
  @caps[:browserName] = ENV['browserName']
  @caps[:version] =  ENV['version']
  @caps[:platform] =  ENV['platform']
  @caps[:name] = "Starting: #{@name}"
  @caps[:tunnelIdentifier] = @tunnel_id
  @caps[:screenResolution] = '1440x900'
  @caps[:maxDuration] = '300'
  @caps[:tags] = ['1440x900','watir']

  @browser = Watir::Browser.new(:remote, url: @grid_url, desired_capabilities: @caps)
end

After do |scenario|
  session_id = @browser.wd.session_id
  SauceWhisk::Jobs.change_status(session_id, scenario.passed?)
  #@browser.close
end


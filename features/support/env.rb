require 'rspec'
require 'watir'
require 'sauce_whisk'

require 'page-object'

require 'data_magic'
DataMagic.load 'data_magic.yml'

require 'page-object/page_factory'
World(PageObject::PageFactory)

require_relative '../support/pages/google_home_page'
require_relative '../support/pages/google_result_page'
require_relative '../support/pages/guinea_pig_page'

#$DEBUG = true

Before do |scenario|
  grid_url = String.new("https://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:443/wd/hub")
  tunnel_id = 'lower'
  @name = "#{scenario.feature.name} - #{scenario.name}"

  # i coded caps var like this because RubyMine intelli-sense liked it this way
  @caps = Selenium::WebDriver::Remote::Capabilities.chrome
  @caps[:browserName] = ENV['browserName']
  @caps[:version] =  ENV['version']
  @caps[:platform] =  ENV['platform']
  @caps[:name] = "Starting: #{@name}"
  @caps[:tunnelIdentifier] = tunnel_id
  @caps[:screenResolution] = '1440x900'
  @caps[:maxDuration] = '300'
  @caps[:tags] = ['1440x900','watir']

  @browser = Watir::Browser.new(:remote, url: grid_url.strip, desired_capabilities: @caps)
end

After do |scenario|
  session_id = @browser.wd.session_id
  #SauceWhisk::Jobs.change_status(session_id, scenario.name = @name)
  SauceWhisk::Jobs.change_status(session_id, scenario.passed?)
  #@browser.close
end


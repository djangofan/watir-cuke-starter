require 'rspec'
require 'watir'
require 'sauce_whisk'
require 'page-object'
require 'data_magic'
#DataMagic.load 'data_magic.yml'

World(PageObject::PageFactory)
require_relative '../support/pages/the_internet_page'

#$DEBUG = true

status = SauceWhisk::Sauce.service_status   # Check the status of Sauce Labs' service
status.inspect

Before('@sauce') do |scenario|
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
  @caps[:build] = ENV['BUILD_TAG'] ||= "#{Time.now.strftime("Unlabeled build: d%m%d_t%H%M%S")}"

  @browser = Watir::Browser.new(:remote, url: grid_url.strip, desired_capabilities: @caps)
end

After('@sauce') do |scenario|
  session_id = @browser.wd.session_id
  job = SauceWhisk::Job.new({:id => session_id})
  job.name = "Finished: #{@name}"
  SauceWhisk::Jobs.save(job)
  SauceWhisk::Jobs.change_status(session_id, scenario.passed?)
end

at_exit { 
  print "\nReport output at: #{ENV['OUT_DIR']}\n" 
}


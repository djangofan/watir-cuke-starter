# Step definitions

Given /^I go to url '(.*)'$/ do |url|
  @browser.goto(url)
end

When /^I enter '(.*)' in the search box$/ do |item|
  @browser.find_element(:name, 'q').send_keys(item)
end

And /^I click the Search Button$/ do
  @browser.find_element(:name, 'btnG').click
end

Then /^item '(.*)' should be mentioned in the results$/ do |item|
  @browser.title.should include(item)
end


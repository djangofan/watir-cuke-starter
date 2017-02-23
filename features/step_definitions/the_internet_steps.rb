# Step definitions

Given 'I am on the internet' do
  @page = visit TheInternetPage, using_params: {id: 1000}
end

When 'I see a heading on the page' do
	heading = @page.get_heading_text
    expect(heading.empty?).to be(false), "Page title was empty! Actually found '" << heading << "'."
end

Then /^I see the text '(.*)' contained in the heading$/ do |substring|
	heading = @page.get_heading_text
    expect(heading).to include(substring), "Heading text did not contain expected text '#{substring}' within '" << heading << "'."
end



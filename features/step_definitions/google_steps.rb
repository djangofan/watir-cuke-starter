# Step definitions
# keyword visit is a page factory

Given 'I am on the Google home page' do
  @page = visit GooglePage, using_params: {id: 1000}
end

When /^I search for (.*)$/ do |term|
    @page.search_for term
    @page.click_search
end

Then /^I should see at least ([\d,]+) results$/ do |exp_num_results|
    @page.number_search_results.should >= exp_num_results.gsub(",","").to_i
end


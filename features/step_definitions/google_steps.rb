# Step definitions

When /^I search for (.*)$/ do |term|
  on @site, :google_home_page do |page|
    page.search_for term
  end
end

Then /^I should see at least ([\d,]+) results$/ do |exp_num_results|
  on @site, :google_results_page do |page|
    page.number_search_results.should >= exp_num_results.gsub(",","").to_i
  end
end

Then /^I should see at most ([\d,]+) results$/ do |exp_num_results|
  on @site, :google_results_page do |page|
    page.number_search_results.should <= exp_num_results.gsub(",","").to_i
  end
end

When /^I convert (.*)$/ do |conversion_statement|
  on @site, :google_home_page do |page|
    page.search_for "convert #{conversion_statement}"
  end
end

Then /^I should see the conversion result (.*)$/ do |exp_conversion_result|
  on @site, :google_results_page do |page|
    page.conversion_result.gsub('metres', 'meters').should == exp_conversion_result
  end
end

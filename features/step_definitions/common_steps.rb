And 'show me the test setup' do
    puts "Finished at "<< Time.now.strftime("%m/%d/%Y %H:%M") << ", " << @caps.platform << ", " << @caps.browser_name << ", " << @caps.version
end

And 'show me all the links on this page' do
    @browser.links.each { |x| puts x.href }
end

- watir-cuke-starter

-- To execute:

bundle exec rake test_cucumber

bundle exec rake test_rspec

Var to run sauce in parallel:
TEST_RUNNER=rspec bundle exec rake


-- NOTES

To get these to work, there was a JSON gem conflict.  I think using the Gemfile resolved it maybe?

#gem install sauce
#gem install sauce-connect
#gem install sauce_whisk

-- Related Cucumber tools:

https://github.com/cucumber/cucumber/wiki/Related-tools


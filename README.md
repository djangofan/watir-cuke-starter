# watir-cuke-starter

Inspired by https://github.com/titusfortner/Ruby-Watir-Tests/

Another good example:  https://github.com/alisterscott/WatirMelonCucumber/

### To execute:

bundle exec rake test_cucumber

bundle exec rake test_rspec

Var to run sauce in parallel:
TEST_RUNNER=rspec bundle exec rake


### Notes:

To get these to work, there was a JSON gem conflict.  I think using the Gemfile resolved it maybe?

- gem install sauce
- gem install sauce-connect
- gem install sauce_whisk

### Related Cucumber tools:

https://github.com/cucumber/cucumber/wiki/Related-tools


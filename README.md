# watir-cuke-starter

Inspired by https://github.com/titusfortner/Ruby-Watir-Tests/

Another good example:  https://github.com/alisterscott/WatirMelonCucumber/

### To execute:

bundle exec rake test_cucumber

bundle exec rake test_rspec

Idea: set var to run sauce in parallel:
TEST_RUNNER=rspec bundle exec rake


### Notes:

Basically, Rake sets up environment variables and then runs the Cucumber execution command.

We output as junit instead of html I think because the html formatter cant deal with parallel threading?

Uses newer Watir page-object lib.

Also, uses data_magic and watir_model libs.

### Related Cucumber tools:

https://github.com/cucumber/cucumber/wiki/Related-tools


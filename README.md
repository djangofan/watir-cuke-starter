# watir-cuke-starter

Inspired by https://github.com/titusfortner/Ruby-Watir-Tests/

Another good example:  https://github.com/alisterscott/WatirMelonCucumber/

### To execute:

First, type :  bundle install

Then execute:

bundle exec rake test_cucumber

bundle exec rake test_rspec

Idea: set var to run sauce in parallel:
TEST_RUNNER=rspec bundle exec rake


### Notes:

Basically, Rake sets up environment variables and then runs the Cucumber execution command.

We output as junit instead of html I think because the html formatter cant deal with parallel threading?

Uses newer Watir page-object lib.

Also, uses data_magic and watir_model libs.

Wont run unless you set system environment variables for SAUCE_USERNAME and SAUCE_ACCESS_KEY

### Examples:

Instead of xpath contains or starts-with, use regex:

browser.div(text: /^foo/)
browser.div(id: /bar$/)
browser.a(href: /google.com$/)

### Related Cucumber tools:

https://github.com/cucumber/cucumber/wiki/Related-tools


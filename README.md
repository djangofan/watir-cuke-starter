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

Also, uses data_magic and watir_model libs ( https://leanpub.com/cucumber_and_cheese )

Wont run unless you set system environment variables for SAUCE_USERNAME and SAUCE_ACCESS_KEY

### Related Cucumber tools:

https://github.com/cucumber/cucumber/wiki/Related-tools


### I use Sublime as my IDE

Key shortcuts:


Command Palette CTRL + SHIFT + p
File Switching CTRL + p
Goto Symbols CTRL + r
Multi Edit CTRL + click



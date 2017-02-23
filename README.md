# watir-cuke-starter

Inspired by https://github.com/titusfortner/Ruby-Watir-Tests/

Runs tests against: http://the-internet.herokuapp.com/

### To execute:

First, type :  

- bundle install

Then execute:

- bundle exec rake test_cucumber_parallel

- bundle exec rake test_cucumber_inline

- bundle exec rake test_rspec


### Notes:

Basically, Rake sets up environment variables and then runs the Cucumber execution command.

Uses newer Watir page-object lib.

Also, uses data_magic and watir_model libs ( https://leanpub.com/cucumber_and_cheese )

Test may not run unless you set system environment variables for SAUCE_USERNAME and SAUCE_ACCESS_KEY


### Related Cucumber tools:

https://github.com/cucumber/cucumber/wiki/Related-tools

Another way to go with functionally oriented page objects maybe?
https://github.com/automation-wizards/ferris/wiki/1-Quick-Start


### I use Sublime as my IDE

Key shortcuts:

Command Palette CTRL + SHIFT + p
File Switching CTRL + p
Goto Symbols CTRL + r
Multi Edit CTRL + click



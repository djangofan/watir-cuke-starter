# watir-cuke-starter

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


###  RESEARCH AREA

This section is for TODO stuff I am still researching.

https://github.com/cheezy/page-object/wiki/Page-Sections

https://github.com/automation-wizards/ferris/wiki/4-Defining-Regions

```
class MyPage < Ferris::Core
  region(:faqs, MyFaqs) { browser.divs(id: 'faq') }
end

class MyFaqs < Ferris::Core
  element(:question) { root.div(id: 'q') }
  element(:answer) { root.button(id: 'a') }

  def has_a_question?
    question.present?
  end

  def has_an_answer?
    question.present?
  end

end

Usage
page = MyPage.new
page.faqs.size                            # returns number of faqs which exist in the DOM
page.faqs.each {|faq| puts faq.question } # outputs question for each faq
page.faqs.map(&:present?).all?            # returns true if all faqs are visible

Cool RSpec usage
expect(page.faqs).to all(have_a_question)
expect(page.faqs).to all(have_an_answer)
```


capybara == Framework & DSL
page-object == Library & DSL
watir, selenium & watir_drops == Library & API 
Framework has inversion of control, library is essentially helper/wrapper methods. DSL takes more magic actions, API is more explicit object oriented design



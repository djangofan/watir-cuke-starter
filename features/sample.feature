# features/sample.feature
Feature: Try it out
  
Scenario: Search for something
  Given I go to url 'http://google.com'
  And I enter 'Cucumber' in the search box
  And I click the Search Button
  Then item 'Cucumber' should be mentioned in the results


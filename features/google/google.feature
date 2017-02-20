# features/google.feature
Feature: Internet Search
  As a casual internet user
  I want to find some information about watir, and do a quick conversion
  So that I can be knowledgeable being

  Scenario: Search for Watir
    Given I am on the Google homepage
    When I search for Watir
    Then I should see at least 100,000 results

  Scenario: Do a unit conversion
    Given I am on the Google homepage
    When I convert 10 cm to inches
    Then I should see the conversion result 10 Centimeter = 3.93701 Inch

  Scenario: Do a search using data specified externally
    Given I am on the Google homepage
    When I search for macrocryoglobulinemia marvel
    Then I should see at most 200 results

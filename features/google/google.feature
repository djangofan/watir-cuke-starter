# features/google.feature
Feature: Internet Search

  Scenario: Search for Watir
    Given I am on the Google home page
    When I search for Watir
    Then I should see at least 100,000 results

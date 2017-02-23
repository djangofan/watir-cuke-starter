# features/the_internet/the_internet.feature
@sauce
Feature: Test The Internet

  Scenario: Verify I see the heading of the internet
    Given I am on the internet
    When I see a heading on the page
    Then I see the text 'Welcome' contained in the heading
    And show me the test setup

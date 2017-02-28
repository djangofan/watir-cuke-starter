# features/the_internet/the_internet.feature

Feature: Test The Internet

  @sauce
  Scenario: Verify I see the heading of the internet again
    Given I am on the internet
    When I see a heading on the page
    Then I see the text 'Welcome' contained in the heading
    And show me the test setup
    
  @sauce
  Scenario: Verify I see the heading of the internet again and again
    Given I am on the internet
    When I see a heading on the page
    Then I see the text 'Welcome' contained in the heading
    And show me the test setup
    
Feature: Homepage

  Scenario: A not logged in user can not see the homepage
    Given I am on "/"
    Then I should be on "/login"

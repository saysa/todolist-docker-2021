Feature: Edit user

  Scenario: The page loads normally
    Given I am on "/users/1/edit"
    Then I should see "Modifier admin"
    And the response status code should be 200
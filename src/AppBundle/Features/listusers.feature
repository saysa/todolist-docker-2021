Feature: List users

  Scenario: The page loads normally
    Given I am on "/users"
    Then I should see "Liste des utilisateurs"
    And I should see "Se connecter"
    And the response status code should be 200

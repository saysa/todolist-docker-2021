Feature: Loginpage

  Scenario: The page loads correctly
    Given I am on "/login"
    Then I should see "Nom d'utilisateur"
    And I should see "Mot de passe"
    And the response status code should be 200
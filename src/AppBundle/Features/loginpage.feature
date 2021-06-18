Feature: Loginpage

  Scenario: The page loads correctly
    Given I am on "/login"
    Then I should see "Nom d'utilisateur"
    And I should see "Mot de passe"
    And the response status code should be 200

  Scenario: Username and Password are empty
    Given I am on "/login"
    When I fill in "" for "_username"
    And I fill in "" for "_password"
    And I press "Se connecter"
    Then I should be on "/login"
    And I should see "Invalid credentials."

  Scenario: Password is empty, Username not
    Given I am on "/login"
    When I fill in "john doe" for "_username"
    And I fill in "" for "_password"
    And I press "Se connecter"
    Then I should be on "/login"
    And I should see "Invalid credentials."

  Scenario: Username is empty, Password not
    Given I am on "/login"
    When I fill in "" for "_username"
    And I fill in "whatever" for "_password"
    And I press "Se connecter"
    Then I should be on "/login"
    And I should see "Invalid credentials."

  Scenario: Invalid credentials
    Given I am on "/login"
    When I fill in "whatever" for "_username"
    And I fill in "whatever" for "_password"
    And I press "Se connecter"
    Then I should be on "/login"
    And I should see "Invalid credentials."
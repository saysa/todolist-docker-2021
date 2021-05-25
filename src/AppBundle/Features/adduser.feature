Feature: Add user

  Scenario: The page loads normally
    Given I am on "/users/create"
    Then I should see "Créer un utilisateur"
    And the response status code should be 200

  Scenario: Add a user correctly
    Given I am on "/users/create"
    And I fill in "Toto" for "user_username"
    And I fill in "admin123" for "user_password_first"
    And I fill in "admin123" for "user_password_second"
    And I fill in "toto@todolist.de" for "user_email"
    And I press "Ajouter"
    Then I should be on "/users"
    And I should see "L'utilisateur a bien été ajouté"
    Given I am on "/users/create"
    And I fill in "Toto" for "user_username"
    And I fill in "admin123" for "user_password_first"
    And I fill in "admin123" for "user_password_second"
    And I fill in "toto@todolist.de" for "user_email"
    And I press "Ajouter"
    Then I should be on "/users/create"
    And I should see "This value is already used"

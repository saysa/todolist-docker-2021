Feature: Edit user

  Scenario: The page loads normally
    Given I am on "/users/1/edit"
    Then I should see "Modifier admin"
    And the response status code should be 200

  Scenario: The passwords do not match
    Given I am on "/users/1/edit"
    And I fill in "something" for "user[password][first]"
    And I fill in "something else" for "user[password][second]"
    And I press "Modifier"
    Then I should be on "/users/1/edit"
    And I should see "Les deux mots de passe doivent correspondre."

  Scenario: Edit the username
    Given I am on "/users/1/edit"
    And I fill in "new username" for "user[username]"
    And I fill in "something" for "user[password][first]"
    And I fill in "something" for "user[password][second]"
    And I press "Modifier"
    Then I should be on "/users"
    And I should see "Superbe ! L'utilisateur a bien été modifié"

  Scenario: Edit the email address
    Given I am on "/users/1/edit"
    And I fill in "something" for "user[password][first]"
    And I fill in "something" for "user[password][second]"
    And I fill in "new@email.com" for "user[email]"
    And I press "Modifier"
    Then I should be on "/users"
    And I should see "Superbe ! L'utilisateur a bien été modifié"
Feature: Delete a task

  Scenario: A not logged in user can not delete a task
    Given I am on "/login"
    When I fill in "admin" for "_username"
    And I fill in "pass_1234" for "_password"
    And I press "Se connecter"
    Then I should be on "/"
    Given I follow "Créer une nouvelle tâche"
    Then I should be on "/tasks/create"
    Given I fill in "my new task" for "task[title]"
    And I fill in "content" for "task[content]"
    And I press "Ajouter"
    Then I should be on "/tasks"
    And I should see "Superbe ! La tâche a été bien été ajoutée."
    Given I follow "Se déconnecter"
    Then I should be on "/login"
    Given I am on "/tasks/1/delete"
    Then I should be on "/login"

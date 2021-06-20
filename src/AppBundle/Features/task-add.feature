Feature: Add a task

  Scenario: A not logged in user can not add a task
    Given I am on "/tasks/create"
    Then I should be on "/login"

  Scenario: A logged in user can add a task
    Given I am on "/login"
    When I fill in "admin" for "_username"
    And I fill in "pass_1234" for "_password"
    And I press "Se connecter"
    Then I should be on "/"
    Given I follow "Créer une nouvelle tâche"
    Then I should be on "/tasks/create"
    Given I fill in "a new task" for "task[title]"
    And I fill in "description" for "task[content]"
    And I press "Ajouter"
    Then I should be on "/tasks"
    And I should see "Superbe ! La tâche a été bien été ajoutée."

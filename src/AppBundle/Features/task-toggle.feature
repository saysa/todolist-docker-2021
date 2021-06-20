Feature: Toggle a task

  Scenario: A not logged in user can not toggle a task
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
    Given I follow "Se déconnecter"
    Then I should be on "/login"
    Given I am on "/tasks/1/toggle"
    Then I should be on "/login"


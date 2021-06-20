Feature: List tasks

  Scenario: A not logged in user can not see the tasks
    Given I am on "/tasks"
    Then I should be on "/login"

  Scenario: A logged in user can see the tasks
    Given I am on "/login"
    When I fill in "admin" for "_username"
    And I fill in "pass_1234" for "_password"
    And I press "Se connecter"
    Then I should be on "/"
    Given I follow "Consulter la liste des tâches à faire"
    Then I should be on "/tasks"
    And I should see "Il n'y a pas encore de tâche enregistrée."

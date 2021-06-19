Feature: List tasks

  Scenario: A not logged in user can not see the tasks
    Given I am on "/tasks"
    Then I should be on "/login"

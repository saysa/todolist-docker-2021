Feature: Add a task

  Scenario: A not logged in user can not add a task
    Given I am on "/tasks/create"
    Then I should be on "/login"

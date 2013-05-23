Feature: Free Text Questions
  As an admin
  I want to view feedback of free text questions
  In order to evaluate these results

  Background:
    Given I am logged in as an admin
    And there exists a free text question named "first free text question"
      
  Scenario: View free text question
    When I go to the home page
    Then I should see "first free text question"
        
  Scenario: View feedback for free text questions
    Given the free text question "first free text question" has an answer "test answer"
    When I go to the home page
    And I follow "first free text question"
    Then I should see "test answer"
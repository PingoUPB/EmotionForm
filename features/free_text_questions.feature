Feature: Free Text Questions
  As a participant
  I want to answer free text questions
  In order to give feedback

  Background:
    Given I am logged in
    And there exists a free text question named "first free text question"
      
  Scenario: View free text question
    When I go to the home page
    Then I should see "first free text question"
    
  Scenario: Submit feedback for free text questions
    When I go to the home page
    And I fill in "answer" with "my answer"
    And I click the button "OK"
    Then I should see "Thank you"
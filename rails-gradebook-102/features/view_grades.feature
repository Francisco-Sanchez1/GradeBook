Feature: View Grades
    Scenario: view grades from homepage
      Given there are grades in the gradebook
      And I sign in
      When I visit the homepage
      Then I should see everyone's grades

    Scenario: view specific grade from homepage
      Given there are grades in the gradebook
      And I sign in
      When I visit the homepage
      Then I should see everyone's grades
      And I click "Show" on a post
      Then I should see that user's detailed grade information

    Scenario: Click ascending and descending buttons
      Given there are grades in the gradebook
      And I sign in
      When I click "Ascending"
      Then the student grades should be sorted in ascending order
      When I click "Descending"
      Then the student grades should be sorted in descending order
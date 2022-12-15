Feature: Deleting Grades
    Scenario: Viewing detailed grade information as a teacher, should be able to delete the grade
        Given there are grades in the gradebook
        And I sign in as a teacher
        When I visit the homepage
        And I click "Destroy" on a post
        Then that post should be deleted

    Scenario: Viewing detailed grade information as a teacher, should be able to delete the grade
        Given there are grades in the gradebook
        And I sign in as a teacher
        When I visit the homepage
        And I click "Destroy" on a post
        Then that post should be deleted

    Scenario: Viewing detailed grade information as a TA, should NOT be able to delete the grade
        Given there are grades in the gradebook
        And I sign in as a TA
        When I visit the homepage
        Then I should not see "Destroy" on the page
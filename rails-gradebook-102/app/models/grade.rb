class Grade < ApplicationRecord
    validates_presence_of :student_id
    validates_presence_of :student_name
    validates_presence_of :student_grade
    validate :grade_must_be_greater_than_or_equal_to_zero
    validate :student_id_must_be_five_characters

    #custom validator
    #makes sure grade is larger than zero
    def grade_must_be_greater_than_or_equal_to_zero
        #if it is not null, if it was null then we can't compare it to zero
        if student_grade != nil
            if student_grade < 0
                errors.add(:student_grade, "can't be less than 0")
            end
            if student_grade > 100
                errors.add(:student_grade, "can't be greater than 100")
            end
        end
    end

    def student_id_must_be_five_characters
        if student_id != nil
            if student_id.length != 5
                errors.add(:student_id, "student ids are 5 characters long")
            end


        end



    end

end

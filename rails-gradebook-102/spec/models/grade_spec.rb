require 'rails_helper'

RSpec.describe Grade, type: :model do
  it "requires a student id to be valid" do
    grade = Grade.new(student_name: "Fred Flinstone", student_grade: 20)
    expect(grade).to be_invalid
  end

  it "requires a student name to be valid" do
    grade = Grade.new(student_id: "11122", student_grade: 100)
    expect(grade).to be_invalid
  end

  it "requires a grade to be valid" do
    grade = Grade.new(student_id: "14645", student_name: "Johah Hill")
    expect(grade).to be_invalid
  end

  it "is valid when given a valid student id, valid student name, and valid grade" do
    grade = Grade.new(student_id: "12345", student_name: "Bobby Flay", student_grade: 100)
    expect(grade).to be_valid
  end

  it "requires the grade to be greater than or equal to 0" do
    grade = Grade.new(student_id: "18484", student_name: "Joe Exotic", student_grade: -30)
    expect(grade).to be_invalid
  end

  it "requires the grade to be less than 100" do
    grade = Grade.new(student_id: "18485", student_name: "Bob Exotic", student_grade: 105)
    expect(grade).to be_invalid
  end

  it "is not valid when given a non valid student id" do
    grade = Grade.new(student_id: "123456", student_name: "John Doe", student_grade: 99)
    expect(grade).to_not be_valid
  end

end

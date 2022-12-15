FactoryBot.define do
  factory :grade do
    sequence(:student_id){ |n| "AAAAA"}
    sequence(:student_name) { |n| "Student #{n}" }

    trait :valid do
      student_grade { 70 }
    end

    trait :invalid do
      student_grade { -70 }
    end

    trait :valid do
      student_id { 12345 }
    end

    trait :invalid do
      student_id { 12345 }
    end 

    trait :valid do
      student_id { 'ABCDE' }
    end

    trait :invalid do
      student_id { 'ABCDE' }
    end 

  end
end

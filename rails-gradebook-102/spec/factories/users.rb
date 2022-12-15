FactoryBot.define do
  factory :teacher, class: "User" do
      sequence(:email) { |n| "person-#{n}@example.com" }
      account_id {1}
      password { '123greetings' }
  end
end

FactoryBot.define do
  factory :ta, class: "User" do
    sequence(:email) { |n| "person-#{n}@example.com" }
      account_id {0}
      password { '123greetingsTA' }
  end
end
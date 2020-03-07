FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "test_email#{n}@test.com" 
    end
    first_name { "test_first_name" }
    last_name { "test_last_name" }
    password { "test_Password" }
    password_confirmation { "test_Password" }
  end

  factory :memory do
    mem { "test_mem_title" }
    mood  { "test_mood" }
    thoughts { "test_thought" }
    date     { "Mon, 01 Jan" }
    location { "test_location" }

    association :user
  end
end
FactoryBot.define do
  factory :mem_photo do
    
  end

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
    mem_title { "test_mem_title" }
    mood  { "test_mood" }
    thoughts { "test_thought" }
    date     { "test_date" }
    location { "test_location" }

    association :user
  end
end
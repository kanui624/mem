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
    title { "test_title" }
    association :user
  end
end
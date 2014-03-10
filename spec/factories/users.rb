FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    name { 'User Name' }
    email { generate :email }
    password "12345678"
    password_confirmation "12345678"
    role nil
  end
end

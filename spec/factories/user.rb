FactoryGirl.define do
  factory :user do
    name "Abdullah Alger"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
  end
end

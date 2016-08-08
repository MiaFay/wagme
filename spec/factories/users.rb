FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "user#{n}" }
    sequence(:last_name) { |n| "user#{n}" }
    sequence(:city) { |n| "user#{n}" }
    state 'MA'
    zip '00000'
    sequence(:email) { |m| "user#{m}@example.com" }
    password 'password'
    password_confirmation 'password'
    end
  end

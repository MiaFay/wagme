FactoryGirl.define do
  factory :user do
    first_name 'Mia'
    last_name 'Buckland'
    sequence(:email) { |n| 'dogdays#{n}@gmail.com' }
    city 'Boston'
    state 'MA'
    zip '01234'
    password 'password'
    password_confirmation 'password'

  end
end

FactoryGirl.define do
  factory :dog do
    name 'Marley'
    breed 'Golden Retriver'
    sex 'Female'
    temperment 'Shes the sweetest thing.'
    user_id 1
    description 'Bennett is the best dog a kid could ask for!'
  end
end

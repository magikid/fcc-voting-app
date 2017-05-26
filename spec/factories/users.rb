FactoryGirl.define do
  factory :user do
    name "John Smith"
    sequence(:email){|n| "johnsmith#{n}@gmail.com" }
    password "password"

    factory :user_with_poll do
      after(:create) do |user, evaluator|
        create_list(:poll, 5, user: user)
      end
    end
  end
end

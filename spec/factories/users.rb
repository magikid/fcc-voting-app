FactoryGirl.define do
  factory :user do
    name "John Smith"
    email "johnsmith@gmail.com"
    password "password"

    factory :user_with_poll do
      after(:create) do |user, evaluator|
        create_list(:poll, 5, user: user)
      end
    end
  end
end

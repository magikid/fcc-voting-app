FactoryGirl.define do
  factory :user do
    name "John Smith"
    email "johnsmith@gmail.com"
    factory :user_with_poll do
      after(:create) do |user, evaluator|
        create(:poll, user: user)
      end
    end
  end
end

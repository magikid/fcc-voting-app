FactoryGirl.define do
  factory :poll do
    title "Poll title"
    published false
    after(:create) do |poll, evaluator|
      create_list(:option, 5, poll: poll)
    end
  end
end

FactoryGirl.define do
  factory :poll do
    title "Poll title"
    published false
    short_id "123qwe"

    after(:create) do |poll, evaluator|
      create_list(:option, 5, poll: poll)
    end

    factory :poll_with_user do
      before(:create) do |poll|
        user = create(:user)
        poll.user = user
      end
    end
  end
end

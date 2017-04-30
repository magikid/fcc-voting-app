require 'rails_helper'

RSpec.describe Poll, "#short_url" do
  it "generates a short_url for a poll" do
    # setup
    poll = create(:poll_with_user)

    # exercise and test
    expect(poll.short_id).to match /[A-Za-z0-9]{1,10}\z/
  end
end

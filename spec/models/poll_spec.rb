require 'rails_helper'

RSpec.describe Poll, "#short_url" do
  it "generates a short_url for a poll" do
    # setup
    poll = build(:poll, short_url: "1qaz2wsx")

    # exercise and test
    expect(poll.short_url).to eq "1qaz2wsx"
  end
end

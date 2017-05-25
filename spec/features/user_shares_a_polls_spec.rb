require 'rails_helper'

RSpec.feature "User shares a polls" do
  scenario "they see a shareable link to their poll" do
    user = create(:user_with_poll)
    poll = user.polls.first
    visit poll_path(poll, as: user)
    expect(page).to have_css "a", text: "Share me!" 
  end
end

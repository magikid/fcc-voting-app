require 'rails_helper'

RSpec.feature "User shares a polls" do
  scenario "they see a shareable link to their poll" do
    poll = create(:user_with_poll).polls.first
    visit poll_path(poll)
    expect(page).to have_css ".shareable-link", text: poll.short_id
  end
end

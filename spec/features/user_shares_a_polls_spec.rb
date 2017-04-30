require 'rails_helper'

RSpec.feature "User shares a polls" do
  scenario "they see a shareable link to their poll" do
    poll = create(:poll, short_url: "1qaz2wsx")
    visit poll_path(poll)
    expect(page).to have_css ".shareable-link", "1qaz2wsx"
  end
end

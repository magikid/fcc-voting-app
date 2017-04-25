require 'rails_helper'

RSpec.feature "User creates a poll" do
  scenario "they see a poll on the page" do
    poll_title = "Foobar poll"
    user = create(:user)
    visit new_poll_path(as: user)
    fill_in "poll_title", with: poll_title
    click_button "Create poll"
    expect(page).to have_css "h1", poll_title
  end
end

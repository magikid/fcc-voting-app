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

  scenario "they log out and in and still see the poll" do
    user = create(:user_with_poll)
    visit polls_path(as: user)
    expect(page).to have_css 'td', user.polls.first.title
  end
end

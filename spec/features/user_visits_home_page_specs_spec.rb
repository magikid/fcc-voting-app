require 'rails_helper'

RSpec.feature "User visits home page" do
  scenario "they see all the published polls" do
    # setup
    create(:poll_with_user, title: "Number One Poll", published: true)

    # exercise
    visit root_path

    # verify
    expect(page).to have_css "li", text: "Number One Poll"
  end

  scenario "the polls on the page go somewhere" do
    # setup
    options_found = 0
    poll = create(:poll_with_user, title: "Number One Poll", published: true)
    visit root_path
    click_on poll.title

    # exercise
    within "#new_response" do
      options_found = all("option").count
    end

    # verify
    expect(options_found).to eq poll.options.count

  end
end

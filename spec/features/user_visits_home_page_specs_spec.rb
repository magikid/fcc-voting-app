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
end

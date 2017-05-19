require 'rails_helper'

RSpec.describe "responses/new", type: :view do
  it "renders new response form" do
    poll = build_stubbed(:poll_with_user)
    response = build_stubbed(:response, poll: poll)
    assign(:poll, poll)
    assign(:response, response)

    render

    assert_select "form[action=?][method=?]", poll_responses_path(poll), "post" do
    end
  end
end

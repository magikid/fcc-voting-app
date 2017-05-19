require 'rails_helper'

RSpec.describe "Responses", type: :request do
  describe "GET /poll/:poll_id/responses" do
    it "works!" do
      poll = create(:poll_with_user)
      
      get poll_responses_path(poll)
      expect(response).to have_http_status(200)
    end
  end
end

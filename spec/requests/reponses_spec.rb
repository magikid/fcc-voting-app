require 'rails_helper'

RSpec.describe "Reponses", type: :request do
  describe "GET /reponses" do
    it "works! (now write some real specs)" do
      get reponses_path
      expect(response).to have_http_status(200)
    end
  end
end

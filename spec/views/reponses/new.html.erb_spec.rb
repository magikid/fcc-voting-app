require 'rails_helper'

RSpec.describe "reponses/new", type: :view do
  before(:each) do
    assign(:reponse, Reponse.new())
  end

  it "renders new reponse form" do
    render

    assert_select "form[action=?][method=?]", reponses_path, "post" do
    end
  end
end

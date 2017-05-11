require 'rails_helper'

RSpec.describe "reponses/edit", type: :view do
  before(:each) do
    @reponse = assign(:reponse, Reponse.create!())
  end

  it "renders the edit reponse form" do
    render

    assert_select "form[action=?][method=?]", reponse_path(@reponse), "post" do
    end
  end
end

require 'rails_helper'

RSpec.describe "reponses/index", type: :view do
  before(:each) do
    assign(:reponses, [
      Reponse.create!(),
      Reponse.create!()
    ])
  end

  it "renders a list of reponses" do
    render
  end
end

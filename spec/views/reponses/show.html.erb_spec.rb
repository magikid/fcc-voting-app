require 'rails_helper'

RSpec.describe "reponses/show", type: :view do
  before(:each) do
    @reponse = assign(:reponse, Reponse.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

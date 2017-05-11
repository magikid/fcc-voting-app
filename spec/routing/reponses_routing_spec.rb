require "rails_helper"

RSpec.describe ReponsesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/reponses").to route_to("reponses#index")
    end

    it "routes to #new" do
      expect(:get => "/reponses/new").to route_to("reponses#new")
    end

    it "routes to #show" do
      expect(:get => "/reponses/1").to route_to("reponses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/reponses/1/edit").to route_to("reponses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/reponses").to route_to("reponses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/reponses/1").to route_to("reponses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/reponses/1").to route_to("reponses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/reponses/1").to route_to("reponses#destroy", :id => "1")
    end

  end
end

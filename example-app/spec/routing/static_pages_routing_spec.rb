require "rails_helper"

RSpec.describe StaticPagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/static_pages").to route_to("static_pages#index")
    end

    it "routes to #new" do
      expect(:get => "/static_pages/new").to route_to("static_pages#new")
    end

    it "routes to #show" do
      expect(:get => "/static_pages/1").to route_to("static_pages#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/static_pages/1/edit").to route_to("static_pages#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/static_pages").to route_to("static_pages#create")
    end

    it "routes to #update" do
      expect(:put => "/static_pages/1").to route_to("static_pages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/static_pages/1").to route_to("static_pages#destroy", :id => "1")
    end

  end
end

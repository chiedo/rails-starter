require "rails_helper"

RSpec.describe CarsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/cars").to route_to("cars#index", :format => :html)
    end

    it "routes to #new" do
      expect(:get => "/cars/new").to route_to("cars#new", :format => :html)
    end

    it "routes to #show" do
      expect(:get => "/cars/1").to route_to("cars#show", :id => "1", :format => :html)
    end

    it "routes to #edit" do
      expect(:get => "/cars/1/edit").to route_to("cars#edit", :id => "1", :format => :html)
    end

    it "routes to #create" do
      expect(:post => "/cars").to route_to("cars#create", :format => :html)
    end

    it "routes to #update" do
      expect(:put => "/cars/1").to route_to("cars#update", :id => "1", :format => :html)
    end

    it "routes to #destroy" do
      expect(:delete => "/cars/1").to route_to("cars#destroy", :id => "1", :format => :html)
    end

  end
end

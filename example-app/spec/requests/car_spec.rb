# spec/requests/cars_spec.rb
require 'rails_helper'

RSpec.describe "Cars API", :type => :request do
  describe "GET {scope}/cars" do
    it "returns all the cars" do
      # Create two cars in the test database. see spec/factories.rb to see defaults
      FactoryGirl.create(:car, name: "Toyota Supra")
      FactoryGirl.create(:car, name: "Lancer Evolution")

      # Simulate the visiting of the url /cars
      get url_for(:controller => 'cars', :action => 'index'), {}, { "Accept" => "application/json" }
      
      # The response should be 200 meaning that everything was OK
      expect(response.status).to eq 200

      # Get the content of the http response parsed as json
      body = JSON.parse(response.body)

      # Convert the json data to an array of the names
      car_names = body.map{ |m| m["name"] }

      # Make sure the data matches what is expected
      expect(car_names).to match_array(["Toyota Supra",
                                        "Lancer Evolution"])
    end
  end

  describe "GET {scope}/cars/:id" do
    it "returns a requested car" do
      m = FactoryGirl.create(:car, name: "Ford Explorer")

      get url_for(:controller => 'cars', :action => 'show', :id => m.id), {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      expect(body["name"]).to eq "Ford Explorer"
    end
  end

  describe "POST {scope}/cars" do
    it "creates a car" do
      car_params = {
        "car" => {
          "name" => "Dodge Caravan",
          "description" => "Cool car",
          "price" => 2000.00
        }
      }.to_json

      request_headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      }

      post url_for(:controller => 'cars', :action => 'create'), car_params, request_headers

      expect(response.status).to eq 201 # created
      expect(Car.first.name).to eq "Dodge Caravan"
    end
  end

end

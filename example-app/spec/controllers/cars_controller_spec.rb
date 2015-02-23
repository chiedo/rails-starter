# spec/models/cars_spec.rb
require "rails_helper"

RSpec.describe CarsController, :type => :controller do
  context "GET #index" do
    it "should list all cars" do
      car = FactoryGirl.create(:car)
      car_2 = FactoryGirl.create(:car)
      # Rails magically knows we are referring to the cars controller due to the "describe CarsController line"
      get :index
      expect(response.body).to eq([car, car_2].to_json)
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end
end

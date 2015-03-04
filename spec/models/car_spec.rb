# spec/models/cars_spec.rb
require "rails_helper"

RSpec.describe Car, :type => :model do
  context "upon basic operations" do
    it "has a valid factory" do
      expect(FactoryGirl.create(:car)).to be_valid
    end
    it "is invalid without a name" do
      expect(FactoryGirl.build(:car, name: nil)).to_not be_valid
    end
    it "is invalid without a description" do
      expect(FactoryGirl.build(:car, description: nil)).to_not be_valid
    end
    it "is invalid without a price" do
      expect(FactoryGirl.build(:car, price: nil)).to_not be_valid
    end
    it "returns the name and price as a string" do
      car = FactoryGirl.create(:car, name: "Acura", price: 100.00)
      expect(car.name_and_price).to eq "Acura - $100"
    end
    # Techincally we don't even have to test the below, since ActiveModel provides this functionality. 
    # If we had written a custom Car.all function, then we would definitely need to test the below
    it "returns all cars when Car.all is called" do
      car = FactoryGirl.create(:car, name: "Acura", price: 100.00)
      car_2 = FactoryGirl.create(:car, name: "Subaru", price: 9000.00)
      expect(Car.all).to eq [car, car_2]
    end
  end
end

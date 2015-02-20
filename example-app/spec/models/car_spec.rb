# spec/models/cars_spec.rb
require "rails_helper"

RSpec.describe Car, :type => :model do
  context "Upon creation" do
    it "is successfully created if the correct arguments are passed" do
      # We aren't using factory girl for testing the models. For models, we want to be verbose
      car = Car.create(name: "Lancer Evolution", description: "The most fancy car ever.", price: 20000)
      expect(car.new_record?).to eq false # should be false after a save is successful
      expect(car.name).to eq "Lancer Evolution"
      expect(car.description).to eq "The most fancy car ever."
      expect(car.price).to eq 20000
    end

    it "is not successfully created if no arguments are passed" do
      begin
        car = Car.create
      rescue ActiveRecord::StatementInvalid
        # Do nothing
      end
      expect(car).to eq nil #make sure that the car was not created
    end  

    it "is not successfully created if the all of the required arguments are not passed" do
      begin
        car = Car.create(name: "Lancer Evolution")
      rescue ActiveRecord::StatementInvalid
      end
      expect(car).to eq nil

      begin
        car = Car.create(description: "This is a description.")
      rescue ActiveRecord::StatementInvalid
      end
      expect(car).to eq nil

      begin
        car = Car.create(price: 20000)
      rescue ActiveRecord::StatementInvalid
      end
      expect(car).to eq nil
    end
    it "is not successfully created if the wrong types of arguments are passed" do
      begin
        car = Car.create(name: 10000)
      rescue ActiveRecord::StatementInvalid
      end
      expect(car).to eq nil

      begin
        car = Car.create(price: "Lancer Evolution")
      rescue ActiveRecord::StatementInvalid
      end
      expect(car).to eq nil

      begin
        car = Car.create(description: 99999)
      rescue ActiveRecord::StatementInvalid
      end
      expect(car).to eq nil
    end
  end
  context "When attempting to modify attributes" do
    it "updates correctly" do
      # Using factory girl here since this test isn't concerned with creation of the car.
      car = FactoryGirl.create(:car)
      car.name = "Updated name"
      expect(car.name).to eq "Updated name"
      car.description = "Updated desc"
      expect(car.description).to eq "Updated desc"
      car.price = 10000
      expect(car.price).to eq 10000
    end
  end
end

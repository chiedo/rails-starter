require 'rails_helper'

RSpec.describe Car, type: :model do
  context "upon creation" do
    it "is successfully created if the correct arguments are passed" do
      # We aren't using factory girl for testing the models. For models, we want to be verbose
      car = Car.create(name: "Lancer Evolution", description: "The most fancy car ever.", price: 20000)
      car.save
      expect(car.new_record?).to eq false # should be false after a save is successful
      expect(car.name).to eq "Lancer Evolution"
      expect(car.description).to eq "The most fancy car ever."
      expect(car.price).to eq 20000
    end

    it "is not successfully created if no arguments are passed" do
      begin
        car = Car.create
        car.save
      rescue ActiveRecord::StatementInvalid
        # Do nothing
      end
      expect(car).to eq nil #make sure that the car was not created
    end  

    it "is not successfully created if the all of the required arguments are not passed" do
      begin
        car = Car.create(name: "Lancer Evolution")
        car.save
      rescue ActiveRecord::StatementInvalid
      end
      expect(car).to eq nil

      begin
        car = Car.create(description: "This is a description.")
        car.save
      rescue ActiveRecord::StatementInvalid
      end
      expect(car).to eq nil

      begin
        car = Car.create(price: 20000)
        car.save
      rescue ActiveRecord::StatementInvalid
      end
      expect(car).to eq nil
    end
  end
end

require 'rails_helper'

RSpec.describe CarsHelper, type: :helper do
   describe "string concat" do
     it "concats two strings with spaces" do
       expect(helper.concat_strings("this","that")).to eq("this that")
     end
   end
   describe "details" do
     it "Returns all of the requested details of a car if it is not nil" do
       # Using a real car that we create, write to the database and then later have to retrieve. We also
       # Are much more limited to what we can test if we use an actual car.
       # car = FactoryGirl.create(:car)

       # Using a mock car to prevent writing and querying the database. Also, with a mock,
       # we can validate that all of the correct attributes and functions were called which is obviously
       # great for testing purposes. You could have used a stub to a similar effect but would not be able to
       # validate whether or not the correct attributes or functions were accessed. This is useful if we want
       # to ensure that validation happend or certain checks happened before doing something.
       car = mock('car')
       car.expects(:name).returns("Acura")
       car.expects(:description).returns("The best car... ever")
       car.expects(:price).returns(1000)
       car.expects(:nil?).returns(false)

       # If you uncomment the below, you will see that the test will fail since car.fake_attribute is never called
       # car.expects(:fake_attribute).returns(1000)

       expect(helper.car_details(car)).to eq("Acura - The best car... ever - $1000")
     end

     it "returns a message if the car is nil" do
       car = mock('car')
       car.expects(:nil?).returns(true)
       expect(helper.car_details(car)).to eq("No details present")
     end
   end
end

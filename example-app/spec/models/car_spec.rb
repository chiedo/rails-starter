require 'rails_helper'

RSpec.describe(Car, type: :model) do
  pending("add some examples to (or delete) #{__FILE__}")

  context("when attempted to be created") do
    it("was successful created if the correct arguments were passed") do
      # We aren't using factory girl for testing the models. For models, we want to be verbose
      car = Car.create(:name => "Lancer Evolution", :description => "The most fancy car ever.", :price => 20000)
      car.save()
      # the new_record attribute should be false after a save is successful
      expect(car.new_record?()).to(eq(false))
      expect(car.name).to(eq("Lancer Evolution"))
      expect(car.description).to(eq("The most fancy car ever."))
      expect(car.price).to(eq(20000))
    end

    it("was not successful created if the correct arguments were not passed") do
      # We aren't using factory girl for testing the models. For models, we want to be verbose
      car = Car.create()
      car.save()
      expect(car.new_record?()).to(eq(true))
    end
  end
end

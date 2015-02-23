require 'rails_helper'
require Rails.root.to_s + '/app/extras/example_custom_class.rb'

RSpec.describe "ExampleCustomClassHelper" do
   describe "trivial function execution" do
     it "returns the expected data" do
       example = ExampleCustomClass.new("Bob", 21)
       expect(example.name()).to eq("Bob")
       expect(example.age()).to eq(21)
     end
   end
end

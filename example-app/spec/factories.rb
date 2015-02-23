require 'faker'

FactoryGirl.define do
  factory :car do
    name Faker::Name.name
    description  Faker::Lorem.paragraph
    price  Faker::Commerce.price
  end
end

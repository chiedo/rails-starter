require 'faker'

FactoryGirl.define do
  # Define a basic car
  factory :car do
    name Faker::Name.name
    description  Faker::Lorem.paragraph
    price  Faker::Commerce.price
  end

  # Define a basic devise user.
  factory :user do
    email "test@test.com"
    password "testtest"
    password_confirmation "testtest"
  end
end

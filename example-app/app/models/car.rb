class Car < ActiveRecord::Base
  validates :name, presence: true, allow_nil: false
  validates :description, presence: true, allow_nil: false
  validates :price,  presence: true, allow_nil: false

  # Concatenates and returns the name and the price of the current model with some minor formatting
  def name_and_price
    [name, "$" + price.to_s].join " - "
  end
end

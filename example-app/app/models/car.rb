class Car < ActiveRecord::Base
  validates :name, presence: true, allow_nil: false
  validates :description, presence: true, allow_nil: false
  validates :price,  presence: true, allow_nil: false
end

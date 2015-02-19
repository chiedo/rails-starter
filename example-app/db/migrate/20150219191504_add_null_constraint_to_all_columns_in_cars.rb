class AddNullConstraintToAllColumnsInCars < ActiveRecord::Migration
  def up
    change_column(:cars, :name, :string, :null => false)
    change_column(:cars, :description, :text, :null => false)
    change_column(:cars, :price, :decimal, :null => false)
  end

  def down
    change_column(:cars, :name, :string, :null => true)
    change_column(:cars, :description, :text, :null => true)
    change_column(:cars, :price, :string, :null => true)
  end
end

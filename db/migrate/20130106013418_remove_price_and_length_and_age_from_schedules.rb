class RemovePriceAndLengthAndAgeFromSchedules < ActiveRecord::Migration[4.2]
  def up
    remove_column :schedules, :price
        remove_column :schedules, :length
        remove_column :schedules, :age
      end

  def down
    add_column :schedules, :age, :integer
    add_column :schedules, :length, :integer
    add_column :schedules, :price, :integer
  end
end

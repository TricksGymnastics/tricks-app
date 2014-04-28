class RemoveDayFromAbsents < ActiveRecord::Migration
  def up
    remove_column :absents, :day
  end

  def down
    add_column :absents, :day, :string
  end
end

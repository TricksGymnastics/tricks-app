class RemoveClasstypeFromSchedules < ActiveRecord::Migration
  def up
    remove_column :schedules, :class_type
  end

  def down
    add_column :schedules, :class_type, :string
  end
end

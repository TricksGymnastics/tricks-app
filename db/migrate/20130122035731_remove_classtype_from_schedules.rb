class RemoveClasstypeFromSchedules < ActiveRecord::Migration[4.2]
  def up
    remove_column :schedules, :class_type
  end

  def down
    add_column :schedules, :class_type, :string
  end
end

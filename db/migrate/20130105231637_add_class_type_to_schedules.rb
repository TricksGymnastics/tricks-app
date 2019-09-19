class AddClassTypeToSchedules < ActiveRecord::Migration[4.2]
  def change
    add_column :schedules, :class_type, :string

  end
end

class AddClassTypeToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :class_type, :string

  end
end

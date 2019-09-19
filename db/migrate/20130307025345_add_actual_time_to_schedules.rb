class AddActualTimeToSchedules < ActiveRecord::Migration[4.2]
  def change
    add_column :schedules, :actual_time, :time
  end
end

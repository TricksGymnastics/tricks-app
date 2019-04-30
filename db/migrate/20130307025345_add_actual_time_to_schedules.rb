class AddActualTimeToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :actual_time, :time
  end
end

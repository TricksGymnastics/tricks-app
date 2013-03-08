class RenameActualTimeToTimeInSchedules < ActiveRecord::Migration
  def change
    rename_column :schedules, :actual_time, :time
  end
end

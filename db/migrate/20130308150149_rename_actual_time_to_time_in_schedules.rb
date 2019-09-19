class RenameActualTimeToTimeInSchedules < ActiveRecord::Migration[4.2]
  def change
    rename_column :schedules, :actual_time, :time
  end
end

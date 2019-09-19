class DropSchedulesTable < ActiveRecord::Migration[4.2]
  def change
    drop_table :schedules
  end
end

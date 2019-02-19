class DropSchedulesTable < ActiveRecord::Migration
  def change
    drop_table :schedules
  end
end

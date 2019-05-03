class AddLevelIdToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :level_id, :integer

  end
end

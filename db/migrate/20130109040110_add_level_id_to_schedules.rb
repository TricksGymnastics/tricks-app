class AddLevelIdToSchedules < ActiveRecord::Migration[4.2]
  def change
    add_column :schedules, :level_id, :integer

  end
end

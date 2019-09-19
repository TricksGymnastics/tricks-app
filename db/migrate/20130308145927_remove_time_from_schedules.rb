class RemoveTimeFromSchedules < ActiveRecord::Migration[4.2]
 def up
    remove_column :schedules, :time
  end

  def down
    add_column :schedules, :time, :string
  end
end

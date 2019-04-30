class RemoveGenderFromSchedules < ActiveRecord::Migration
 def up
    remove_column :schedules, :gender
  end

  def down
    add_column :schedules, :gender, :string
  end
end

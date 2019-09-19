class RemoveGenderFromSchedules < ActiveRecord::Migration[4.2]
 def up
    remove_column :schedules, :gender
  end

  def down
    add_column :schedules, :gender, :string
  end
end

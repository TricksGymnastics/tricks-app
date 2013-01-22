class RemoveClasstypeFromSchedulesAndAddClasstypeToLevels < ActiveRecord::Migration
  def up
    remove_column :schedules, :class_type, :force => true
    add_column :levels, :class_type, :string, :force => true
  end

  def down
    remove_column :levels, :class_type
    add_column :schedules, :class_type, :string
  end
end

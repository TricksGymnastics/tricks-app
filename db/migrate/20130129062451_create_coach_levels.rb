class CreateCoachLevels < ActiveRecord::Migration
  def change
    create_table :coach_levels do |t|
      t.integer :level_id
      t.integer :coach_id

      t.timestamps
    end
  end
end

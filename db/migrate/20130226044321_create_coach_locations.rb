class CreateCoachLocations < ActiveRecord::Migration[4.2]
  def change
    create_table :coach_locations, :force => true do |t|
      t.integer :coach_id
      t.integer :location_id

      t.timestamps
    end
  end
end

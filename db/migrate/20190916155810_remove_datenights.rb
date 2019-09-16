class RemoveDatenights < ActiveRecord::Migration[5.2]
  def change
    drop_table :datenights
    drop_table :datenight_events
  end
end

class RemoveUnneededIdsFromTables < ActiveRecord::Migration[4.2]
  def up
    remove_column :coaches, :level_id
    remove_column :coaches, :location_id
  end

  def down
    add_column :coaches, :level_id, :integer
    add_column :coaches, :location_id, :integer
  end
end

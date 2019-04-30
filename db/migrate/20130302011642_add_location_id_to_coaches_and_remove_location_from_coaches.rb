class AddLocationIdToCoachesAndRemoveLocationFromCoaches < ActiveRecord::Migration
  def up
    remove_column :coaches, :location
    add_column :coaches, :location_id, :integer
  end

  def down
    add_column :coaches, :location, :string
    remove_column :coaches, :location_id
  end
end
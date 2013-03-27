class RemoveClasstypeIdFromCoaches < ActiveRecord::Migration
  def up
    remove_column :coaches, :classtype_id
  end

  def down
    add_column :coaches, :classtype_id, :integer
  end
end

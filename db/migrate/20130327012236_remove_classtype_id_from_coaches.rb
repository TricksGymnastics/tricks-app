class RemoveClasstypeIdFromCoaches < ActiveRecord::Migration[4.2]
  def up
    # remove_column :coaches, :classtype_id
  end

  def down
    add_column :coaches, :classtype_id, :integer
  end
end

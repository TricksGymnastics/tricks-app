class AddClasstypeIdToLevels < ActiveRecord::Migration[4.2]
  def change
    add_column :levels, :classtype_id, :integer
  end
end

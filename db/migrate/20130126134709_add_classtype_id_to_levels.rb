class AddClasstypeIdToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :classtype_id, :integer
  end
end

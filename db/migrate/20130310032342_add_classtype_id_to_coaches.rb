class AddClasstypeIdToCoaches < ActiveRecord::Migration
  def change
    add_column :coaches, :classtype_id, :integer
  end
end

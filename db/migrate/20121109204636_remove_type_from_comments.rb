class RemoveTypeFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :type
      end

  def down
    add_column :comments, :type, :string
  end
end

class RemoveTypeFromComments < ActiveRecord::Migration[4.2]
  def up
    remove_column :comments, :type
      end

  def down
    add_column :comments, :type, :string
  end
end

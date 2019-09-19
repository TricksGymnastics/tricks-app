class AddActivityToComments < ActiveRecord::Migration[4.2]
  def change
    add_column :comments, :activity, :string

  end
end

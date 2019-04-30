class AddActivityToComments < ActiveRecord::Migration
  def change
    add_column :comments, :activity, :string

  end
end

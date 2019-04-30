class AddImageToLevel < ActiveRecord::Migration
  def change
    add_column :levels, :image, :string
  end
end

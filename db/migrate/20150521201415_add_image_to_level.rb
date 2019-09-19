class AddImageToLevel < ActiveRecord::Migration[4.2]
  def change
    add_column :levels, :image, :string
  end
end

class ModifyParties < ActiveRecord::Migration[4.2]
  def change
    add_column :parties, :color, :string
    add_column :parties, :activities, :string
    add_column :parties, :sort_order, :integer
    remove_column :parties, :image, :string
    remove_column :parties, :image2, :string
    remove_column :parties, :image3, :string
  end
end

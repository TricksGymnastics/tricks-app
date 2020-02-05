class RemovePriceFromLevels < ActiveRecord::Migration[6.0]
  def change
    remove_column :levels, :price, :float
  end
end

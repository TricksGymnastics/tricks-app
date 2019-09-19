class ChangeLevelPriceFromIntegerToFloat < ActiveRecord::Migration[4.2]
  def change
    change_column :levels, :price, :float
  end
end

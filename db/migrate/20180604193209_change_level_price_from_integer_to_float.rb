class ChangeLevelPriceFromIntegerToFloat < ActiveRecord::Migration
  def change
    change_column :levels, :price, :float
  end
end

class RenameOrderToSortOrderInLevels < ActiveRecord::Migration[4.2]
  def change
    rename_column :levels, :order, :sort_order
  end
end

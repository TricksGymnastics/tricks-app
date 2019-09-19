class AddOrderToLevels < ActiveRecord::Migration[4.2]
  def change
    add_column :levels, :order, :integer

  end
end

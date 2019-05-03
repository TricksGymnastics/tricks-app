class AddOrderToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :order, :integer

  end
end

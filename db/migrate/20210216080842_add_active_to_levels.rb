class AddActiveToLevels < ActiveRecord::Migration[6.1]
  def change
    add_column :levels, :active, :boolean, default: true
  end
end

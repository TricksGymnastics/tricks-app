class AddColorToLevels < ActiveRecord::Migration[4.2]
  def change
    add_column :levels, :color, :string
  end
end

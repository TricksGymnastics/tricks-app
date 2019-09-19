class AddStrengthsToCoaches < ActiveRecord::Migration[4.2]
  def change
    add_column :coaches, :strengths, :string
  end
end

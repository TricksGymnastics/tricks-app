class AddStrengthsToCoaches < ActiveRecord::Migration
  def change
    add_column :coaches, :strengths, :string
  end
end

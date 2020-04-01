class AddTypeToMakingADifference < ActiveRecord::Migration[6.0]
  def change
    add_column :making_a_differences, :type_of_life, :string
  end
end

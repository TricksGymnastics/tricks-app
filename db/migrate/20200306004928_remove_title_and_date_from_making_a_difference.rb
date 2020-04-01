class RemoveTitleAndDateFromMakingADifference < ActiveRecord::Migration[6.0]
  def change

    remove_column :making_a_differences, :title, :string

    remove_column :making_a_differences, :date, :date
  end
end

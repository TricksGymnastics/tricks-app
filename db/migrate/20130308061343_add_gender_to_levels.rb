class AddGenderToLevels < ActiveRecord::Migration[4.2]
  def change
    add_column :levels, :gender, :string
  end
end

class AddGenderToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :gender, :string
  end
end

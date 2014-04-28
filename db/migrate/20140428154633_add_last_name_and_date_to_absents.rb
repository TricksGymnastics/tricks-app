class AddLastNameAndDateToAbsents < ActiveRecord::Migration
  def change
    add_column :absents, :last_name, :string
    add_column :absents, :date, :datetime
  end
end

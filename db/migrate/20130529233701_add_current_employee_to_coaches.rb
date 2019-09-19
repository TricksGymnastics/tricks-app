class AddCurrentEmployeeToCoaches < ActiveRecord::Migration[4.2]
  def change
    add_column :coaches, :current_employee, :boolean, :default => true
  end
end

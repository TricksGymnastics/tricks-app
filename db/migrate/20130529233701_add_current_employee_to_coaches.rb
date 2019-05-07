class AddCurrentEmployeeToCoaches < ActiveRecord::Migration
  def change
    add_column :coaches, :current_employee, :boolean, :default => true
  end
end

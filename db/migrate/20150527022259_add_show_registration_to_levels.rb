class AddShowRegistrationToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :show_registration, :boolean
  end
end

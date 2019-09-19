class AddShowRegistrationToLevels < ActiveRecord::Migration[4.2]
  def change
    add_column :levels, :show_registration, :boolean
  end
end

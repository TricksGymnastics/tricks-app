class AddShortNameToLocation < ActiveRecord::Migration[4.2]
  def change
    add_column :locations, :shortname, :string
  end
end

class AddShortNameToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :shortname, :string
  end
end

class DropWorldsTable < ActiveRecord::Migration[4.2]
  def change
    drop_table :worlds
  end
end

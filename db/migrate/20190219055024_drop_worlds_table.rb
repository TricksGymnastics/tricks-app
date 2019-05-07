class DropWorldsTable < ActiveRecord::Migration
  def change
    drop_table :worlds
  end
end

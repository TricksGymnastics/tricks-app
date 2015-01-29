class AddJackRabbitNameToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :jack_rabbit_name, :string
  end
end

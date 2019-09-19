class AddJackRabbitNameToLevels < ActiveRecord::Migration[4.2]
  def change
    add_column :levels, :jack_rabbit_name, :string
  end
end

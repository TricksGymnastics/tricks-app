class CreateWorlds < ActiveRecord::Migration[4.2]
  def change
    create_table :worlds do |t|
      t.string :image
      t.string :first_name
      t.string :last_name
      t.string :location
      t.date :date

      t.timestamps
    end
  end
end

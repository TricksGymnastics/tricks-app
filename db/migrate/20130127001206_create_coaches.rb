class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :image
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.date :birthdate
      t.string :location
      t.date :startdate
      t.integer :level_id
      t.text :experience
      t.string :fav_event
      t.string :fav_skill
      t.string :fav_food
      t.text :advice

      t.string :disney_char

      t.timestamps
    end
  end
end

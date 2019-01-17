class CreateKidsNightOuts < ActiveRecord::Migration
  def change
    create_table :kids_night_outs do |t|
      t.string :title
      t.date :date
      t.text :details
      t.time :sac_time
      t.time :fol_time
      t.time :gb_time
      t.string :image

      t.timestamps null: false
    end
  end
end

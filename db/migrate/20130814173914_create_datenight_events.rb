class CreateDatenightEvents < ActiveRecord::Migration[4.2]
  def change
    create_table :datenight_events do |t|
      t.string :title
      t.text :description
      t.integer :datenight_id
      t.date :sac_date
      t.date :gb_date
      t.date :fol_date

      t.timestamps
    end
  end
end

class CreateBffDanceParties < ActiveRecord::Migration[4.2]
  def change
    create_table :bff_dance_parties do |t|
      t.string :name
      t.date :date
      t.string :suggestion

      t.timestamps null: false
    end
  end
end

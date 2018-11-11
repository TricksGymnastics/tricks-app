class CreateBffDanceParties < ActiveRecord::Migration
  def change
    create_table :bff_dance_parties do |t|
      t.string :name
      t.date :date
      t.string :suggestion

      t.timestamps null: false
    end
  end
end

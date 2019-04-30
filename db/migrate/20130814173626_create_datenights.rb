class CreateDatenights < ActiveRecord::Migration
  def change
    create_table :datenights do |t|
      t.string :image
      t.text :about
      t.string :when_time
      t.integer :single_price
      t.integer :sibling_price
      t.string :schedule_title

      t.timestamps
    end
  end
end

class CreateAbsents < ActiveRecord::Migration
  def change
    create_table :absents do |t|
      t.string :first_name
      t.string :last_name
      t.integer :location
      t.integer :classtype_id
      t.integer :level_id
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end

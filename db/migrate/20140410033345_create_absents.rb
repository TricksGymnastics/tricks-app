class CreateAbsents < ActiveRecord::Migration
  def change
    create_table :absents do |t|
      t.string :student_name
      t.integer :location
      t.integer :classtype_id
      t.integer :level_id
      t.string :day
      t.time :time

      t.timestamps
    end
  end
end

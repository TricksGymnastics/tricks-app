class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :level
      t.string :day
      t.string :time
      t.string :teacher
      t.integer :price
      t.integer :length
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end

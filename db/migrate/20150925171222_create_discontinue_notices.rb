class CreateDiscontinueNotices < ActiveRecord::Migration
  def change
    create_table :discontinue_notices do |t|
      t.string :reason
      t.string :student_first_name
      t.string :student_last_name
      t.integer :location
      t.integer :class_day
      t.time :class_time
      t.date :last_day
      t.string :parent_name
      t.boolean :understood

      t.timestamps
    end
  end
end

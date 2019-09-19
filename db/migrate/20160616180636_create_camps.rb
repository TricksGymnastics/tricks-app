class CreateCamps < ActiveRecord::Migration[4.2]
  def change
    create_table :camps do |t|
      t.string :title
      t.date :registration_opens
      t.date :registration_closes
      t.string :image
      t.text :description

      t.timestamps null: false
    end
  end
end

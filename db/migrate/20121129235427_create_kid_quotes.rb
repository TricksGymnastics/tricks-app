class CreateKidQuotes < ActiveRecord::Migration[4.2]
  def change
    create_table :kid_quotes do |t|
      t.text :quote
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end

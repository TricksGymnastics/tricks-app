class CreateKidQuotes < ActiveRecord::Migration
  def change
    create_table :kid_quotes do |t|
      t.text :quote
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end

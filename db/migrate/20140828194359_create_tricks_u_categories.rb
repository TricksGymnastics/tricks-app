class CreateTricksUCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :tricks_u_categories do |t|
      t.string :title
      t.integer :weight
      t.boolean :hidden

      t.timestamps
    end
  end
end

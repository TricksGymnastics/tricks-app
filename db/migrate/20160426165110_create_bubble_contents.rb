class CreateBubbleContents < ActiveRecord::Migration
  def change
    create_table :bubble_contents do |t|
      t.string :link
      t.string :image
      t.string :color
      t.string :text
      t.string :text_color
      t.boolean :show_button
      t.integer :sort_order

      t.timestamps null: false
    end
  end
end

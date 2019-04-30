class CreateRecitalAdTypes < ActiveRecord::Migration
  def change
    create_table :recital_ad_types do |t|
      t.string :name
      t.integer :price
      t.integer :word_max
      t.string :actual_size
      t.boolean :image
      t.boolean :pdf_file


      t.timestamps
    end
  end
end

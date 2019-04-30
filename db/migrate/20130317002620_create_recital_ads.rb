class CreateRecitalAds < ActiveRecord::Migration
  def change
    create_table :recital_ads do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.text :message
      t.string :image
      t.string :pdf_file
      t.integer :recital_ad_type_id

      t.timestamps
    end
  end
end

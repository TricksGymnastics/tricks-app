class CreatePromoSlides < ActiveRecord::Migration
  def change
    create_table :promo_slides do |t|
      t.string :title
      t.boolean :link, :default => false
      t.boolean :live, :default => false
      t.string :data_type, :default => "Image"
      t.string :image
      t.text :html_code
      t.integer :order

      t.timestamps
    end
  end
end

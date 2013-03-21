class CreateRecitalAdFields < ActiveRecord::Migration
  def change
    create_table :recital_ad_fields do |t|
      t.string :name
      t.string :field_type
      t.boolean :required
      t.belongs_to :recital_ad_type

      t.timestamps
    end
    add_index :recital_ad_fields, :recital_ad_type_id
  end
end

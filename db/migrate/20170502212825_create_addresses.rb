class CreateAddresses < ActiveRecord::Migration[4.2]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true, index: true
      t.string :street
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps null: false
    end
  end
end

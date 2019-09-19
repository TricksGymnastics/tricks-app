class CreateRecitalSignUps < ActiveRecord::Migration[4.2]
  def change
    create_table :recital_sign_ups do |t|
      t.string :child_first_name
      t.string :child_last_name
      t.integer :location
      t.boolean :participating
      t.integer :total_recitals
      t.boolean :multiple_recitals
      t.boolean :multiple_children
      t.string :costume_fee_agreement
      t.string :recital_fee_agreement

      t.timestamps null: false
    end
  end
end

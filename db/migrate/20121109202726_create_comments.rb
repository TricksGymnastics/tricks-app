class CreateComments < ActiveRecord::Migration[4.2]
  def change
    create_table :comments do |t|
      t.text :comment
      t.string :name
      t.integer :score
      t.string :type

      t.timestamps
    end
  end
end

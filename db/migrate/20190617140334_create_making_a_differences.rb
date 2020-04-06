class CreateMakingADifferences < ActiveRecord::Migration[5.2]
  def change
    create_table :making_a_differences do |t|
      t.string :title
      t.text :comment
      t.date :date
      t.string :name

      t.timestamps null: false
    end
  end
end

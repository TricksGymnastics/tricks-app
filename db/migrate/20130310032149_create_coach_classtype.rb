class CreateCoachClasstype < ActiveRecord::Migration[4.2]
  def change
    create_table :coach_classtypes do |t|
      t.integer :classtype_id
      t.integer :coach_id

      t.timestamps
    end
  end
end

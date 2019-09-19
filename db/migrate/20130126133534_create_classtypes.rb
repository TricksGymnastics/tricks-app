class CreateClasstypes < ActiveRecord::Migration[4.2]
  def change
    create_table :classtypes do |t|
      t.string :name
      
      t.timestamps
    end
  end
end

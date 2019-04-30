class CreateClasstypes < ActiveRecord::Migration
  def change
    create_table :classtypes do |t|
      t.string :name
      
      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change

    create_table :users, :force => true do |t|
      t.string :email
      t.string :password_digest
      t.string :role, :default => "author"

      t.timestamps
    end
  end
end



# ActiveRecord::Schema.define(:version => 20080906171750) do
#   create_table "authors", :force => true do |t|
#     t.string   "name"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end
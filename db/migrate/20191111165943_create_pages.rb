class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :url
      t.string :bubbles
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end

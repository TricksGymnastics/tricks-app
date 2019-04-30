class CreateTricksUVideos < ActiveRecord::Migration
  def change
    create_table :tricks_u_videos do |t|
      t.string :url
      t.string :title
      t.integer :weight
      t.integer :category_id

      t.timestamps
    end
  end
end

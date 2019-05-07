class AddTagImageToCoaches < ActiveRecord::Migration
  def change
    add_column :coaches, :tag_image, :string
  end
end

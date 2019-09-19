class AddTagImageToCoaches < ActiveRecord::Migration[4.2]
  def change
    add_column :coaches, :tag_image, :string
  end
end

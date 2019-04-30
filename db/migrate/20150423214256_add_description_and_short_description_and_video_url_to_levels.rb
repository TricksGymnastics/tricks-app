class AddDescriptionAndShortDescriptionAndVideoUrlToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :description, :text
    add_column :levels, :short_description, :text
    add_column :levels, :video_url, :string
  end
end

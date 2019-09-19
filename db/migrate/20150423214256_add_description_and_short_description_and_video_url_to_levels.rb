class AddDescriptionAndShortDescriptionAndVideoUrlToLevels < ActiveRecord::Migration[4.2]
  def change
    add_column :levels, :description, :text
    add_column :levels, :short_description, :text
    add_column :levels, :video_url, :string
  end
end

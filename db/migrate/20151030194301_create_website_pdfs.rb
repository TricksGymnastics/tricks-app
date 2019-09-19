class CreateWebsitePdfs < ActiveRecord::Migration[4.2]
  def change
    create_table :website_pdfs do |t|
      t.string :file
      t.string :file_name

      t.timestamps
    end
  end
end

class CreateEmploymentApplicationReviews < ActiveRecord::Migration[4.2]
  def change
    create_table :employment_application_reviews do |t|
      t.integer :status
      t.text :notes
      t.string :last_edited_by
      t.references :employment_application, foreign_key: true
      t.string :location
      t.string :department
      t.boolean :archived
      
      t.timestamps null: false
    end
  end
end

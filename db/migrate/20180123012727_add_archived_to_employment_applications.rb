class AddArchivedToEmploymentApplications < ActiveRecord::Migration[4.2]
  def change
    add_column :employment_applications, :archived, :boolean
  end
end

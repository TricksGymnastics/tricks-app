class AddArchivedToEmploymentApplications < ActiveRecord::Migration
  def change
    add_column :employment_applications, :archived, :boolean
  end
end

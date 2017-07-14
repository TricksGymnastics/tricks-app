class CreateEmploymentApplications < ActiveRecord::Migration
  def change
    create_table :employment_applications do |t|
      t.string :firstname
      t.string :lastname
      t.string :middlename
      t.boolean :granite_bay
      t.boolean :folsom
      t.boolean :sacramento
      t.string :phone
      t.boolean :mornings
      t.boolean :saturdays
      t.text :previous_experience
      t.text :experience_with_children
      t.text :reason
      t.string :email
      t.string :position_desired
      t.date :birthday
      t.boolean :can_drive
      t.boolean :can_commit_one_year
      t.float :expected_pay
      t.integer :desired_hours
      t.date :date_available
      t.text :job_requirements_response
      t.string :high_school_year
      t.string :high_school_graduation_year
      t.string :high_school_name
      t.string :college_year
      t.string :college_graduation_year
      t.string :college_name
      t.string :college_degree
      t.text :hobbies
      t.boolean :continuing_education
      t.string :do_not_contact_employer
      t.text :do_not_contact_reason
      t.boolean :convicted
      t.text :convictions
      t.date :interview_date
      t.string :interviewed_by

      t.timestamps null: false
    end
  end
end

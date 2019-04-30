class CreateEmploymentApplications < ActiveRecord::Migration
  def change
    create_table :employment_applications do |t|
      t.string :firstname
      t.string :lastname
      t.string :middlename
      t.string :image
      t.string :resume
      t.boolean :granite_bay
      t.boolean :folsom
      t.boolean :sacramento
      t.boolean :gymnastics
      t.boolean :dance
      t.boolean :swim
      t.boolean :tag
      t.boolean :hospitality
      t.string :phone
      t.boolean :mornings
      t.boolean :saturdays
      t.text :previous_experience
      t.text :experience_with_children
      t.text :previous_office_experience
      t.text :customer_service_experience
      t.text :reason
      t.string :email
      t.string :position_desired
      t.boolean :over_eighteen
      t.boolean :can_drive
      t.boolean :can_commit_one_year
      t.string :expected_pay
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
      t.string :status
      t.string :comment

      t.timestamps null: false
    end
  end
end

class CreateEmploymentHistories < ActiveRecord::Migration
  def change
    create_table :employment_histories do |t|
      t.references :history, polymorphic: true, index: true
      t.string :company_name
      t.string :supervisor_name
      t.string :job_title
      t.text :description
      t.string :phone
      t.date :start_date
      t.date :end_date
      t.float :start_pay
      t.float :end_pay
      t.text :reason_for_leaving

      t.timestamps null: false
    end
  end
end

class RemoveStartPayAndEndPayFromEmploymentHistories < ActiveRecord::Migration[4.2]
  def change
    remove_column :employment_histories, :start_pay, :string
    remove_column :employment_histories, :end_pay, :string
  end
end

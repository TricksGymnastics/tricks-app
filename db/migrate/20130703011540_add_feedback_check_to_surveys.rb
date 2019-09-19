class AddFeedbackCheckToSurveys < ActiveRecord::Migration[4.2]
  def change
    add_column :surveys, :feedback_check, :boolean
  end
end

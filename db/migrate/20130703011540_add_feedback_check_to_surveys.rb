class AddFeedbackCheckToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :feedback_check, :boolean
  end
end

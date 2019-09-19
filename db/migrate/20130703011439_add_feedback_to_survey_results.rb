class AddFeedbackToSurveyResults < ActiveRecord::Migration[4.2]
  def change
    add_column :survey_results, :feedback, :string
  end
end

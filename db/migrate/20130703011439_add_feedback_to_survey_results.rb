class AddFeedbackToSurveyResults < ActiveRecord::Migration
  def change
    add_column :survey_results, :feedback, :string
  end
end

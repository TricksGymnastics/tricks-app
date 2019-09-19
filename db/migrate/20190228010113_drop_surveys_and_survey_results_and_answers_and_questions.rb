class DropSurveysAndSurveyResultsAndAnswersAndQuestions < ActiveRecord::Migration[4.2]
  def change
    drop_table :surveys
    drop_table :survey_results
    drop_table :questions
    drop_table :answers
  end
end

class DropSurveysAndSurveyResultsAndAnswersAndQuestions < ActiveRecord::Migration
  def change
    drop_table :surveys
    drop_table :survey_results
    drop_table :questions
    drop_table :answers
  end
end

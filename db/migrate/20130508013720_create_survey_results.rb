class CreateSurveyResults < ActiveRecord::Migration
  def change
    create_table :survey_results do |t|
      t.text :result
      t.integer :survey_id

      t.timestamps
    end
  end
end
